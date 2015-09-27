<!--- Generation of Payslip into text file format --->
<!--- Create by: Winston 20050315 --->
<CFQUERY NAME="GetPyFile" DATASOURCE="#session.company_dsn#">
	SELECT PYFILE, SUBCOMPANYDSN, TRANSACTIONDSN
	FROM ECRGPYSLIP
	WHERE PYSLIPID = '#url.slip#'
</CFQUERY>

<CFQUERY NAME="GetPosted" DATASOURCE="#GetPyFile.SUBCOMPANYDSN#">
	SELECT POSTED
	FROM SRGPYFILES
	WHERE PYFILENAME = '#GetPyFile.PYFILE#'
</CFQUERY>

<CFQUERY NAME="GetPayrollDate" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
	SELECT PYPERIODFROM AS PYDATE
	FROM #GetPyFile.PYFILE#C
</CFQUERY>

<CFSET nBasic = 0>
<CFSET nTaxableIncome = 0>
<CFSET nTaxwheld = 0>
<CFIF #GetPosted.POSTED# EQ "N">
	<CFQUERY NAME="GetAdditionalValue" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
		SELECT
		BASICPAY AS BASICPAY,
		TAXWHELD AS TAXWHELD
		FROM #GetPyFile.PYFILE#R
		WHERE (PERSONNELIDNO = '#session.chapa#')
	</CFQUERY>

	<CFSET nBasic = #GetAdditionalValue.BASICPAY#>
	<!--- <CFSET nTaxableIncome = nBasic> --->
	<CFIF GetAdditionalValue.TAXWHELD NEQ "">
		<CFSET nTaxwheld = #GetAdditionalValue.TAXWHELD#>
	</CFIF>
	<CFIF nTaxwheld EQ "">
		<CFSET nTaxwheld = 0>
	</CFIF>
	<CFQUERY NAME="GetPyItemForAddentance" DATASOURCE=#session.company_dsn#>
		SELECT PYITEMCODE
		FROM CLKPYITEMS
		WHERE
			(PYITEMTYPE = 'E' AND SUBJECTTOTAX = '1' AND INCLUDED = 'Y')
		AND
			PYITEMCLASS IN ('LEAVE','ATTD','ND','SD','OVTM')
	</CFQUERY>
	<CFSET sCount = 0>
	<CFQUERY NAME="GetAttendanceValue" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
		SELECT SUM(PYATTVALUE) AS PYATTVALUE
		FROM #GetPyFile.PYFILE#A
		WHERE PYATTCODE IN (
				<CFOUTPUT QUERY="GetPyItemForAddentance">
					<CFSET sCount = sCount + 1>
					<CFIF sCount EQ GetPyItemForAddentance.Recordcount>
						'#PYITEMCODE#'
					<CFELSE>
						'#PYITEMCODE#',
					</CFIF>
				</CFOUTPUT>
				) AND
		PERSONNELIDNO = '#session.chapa#'
	</CFQUERY>
	 <CFIF GetAttendanceValue.PYATTVALUE NEQ "">
		<CFSET nTaxableIncome = nTaxableIncome + #GetAttendanceValue.PYATTVALUE#>
	 </CFIF>

	<CFQUERY NAME="GetOneTimeEarnings" DATASOURCE=#session.company_dsn#>
		SELECT PYITEMCODE
		FROM CLKPYITEMS
		WHERE
			(PYITEMTYPE = 'E' AND SUBJECTTOTAX = '1' AND INCLUDED = 'Y')
		AND
			(PYITEMCLASS = 'E&D'
			OR PYITEMCLASS = 'E&D_A')
	</CFQUERY>
	<CFSET sCount = 0>
	<CFSET arrayLst = ArrayNew(1)>
	<CFSET tmp = ArraySet(arrayLst,1,GetOneTimeEarnings.Recordcount,"")>

	<CFQUERY NAME="GetOneTimeValue" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
		SELECT
			<CFOUTPUT QUERY="GetOneTimeEarnings">
				<CFSET sCount = sCount + 1>
				<CFSET arrayLst[sCount] = #PYITEMCODE#>
				<CFIF sCount EQ GetOneTimeEarnings.Recordcount>
					#PYITEMCODE#
				<CFELSE>
					#PYITEMCODE#,
				</CFIF>
			</CFOUTPUT>
		FROM #GetPyFile.PYFILE#R
		WHERE
		PERSONNELIDNO = '#session.chapa#'
	</CFQUERY>


	<CFLOOP INDEX="x" FROM="1" TO="#sCount#">
		<CFSET sTimevalueArray =  evaluate("GetOneTimeValue." & arrayLst[x])>
		<CFIF sTimevalueArray NEQ "">
			<CFSET nTaxableIncome =  nTaxableIncome + sTimevalueArray>
		</CFIF>
	</CFLOOP>

	<CFQUERY NAME="GetOtherEarnings" DATASOURCE=#session.company_dsn#>
		SELECT PYITEMCODE
		FROM CLKPYITEMS
		WHERE
			(PYITEMTYPE = 'E' AND SUBJECTTOTAX = '1' AND INCLUDED = 'Y')
		AND
			PYITEMCLASS NOT IN ('LEAVE','ATTD','ND','SD','OVTM','E&D','E&D_A')
	</CFQUERY>

	<CFSET sCount = 0>
	<CFSET arrayLst1 = ArrayNew(1)>
	<CFSET tmp = ArraySet(arrayLst1,1,GetOtherEarnings.Recordcount,"")>

	<CFQUERY NAME="GetOtherEarningsValues" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
		SELECT
			<CFOUTPUT QUERY="GetOtherEarnings">
				<CFSET sCount = sCount + 1>
				<CFSET arrayLst1[sCount] = #PYITEMCODE#>
				<CFIF sCount EQ GetOtherEarnings.Recordcount>
					#PYITEMCODE#
				<CFELSE>
					#PYITEMCODE#,
				</CFIF>
			</CFOUTPUT>
		FROM #GetPyFile.PYFILE#R
		WHERE
		PERSONNELIDNO = '#session.chapa#'
	</CFQUERY>

	<CFLOOP INDEX="x" FROM="1" TO="#sCount#">
		<CFSET sTimevalueArray =  evaluate("GetOtherEarningsValues." & arrayLst1[x])>
		<CFIF sTimevalueArray NEQ "">
			<CFSET nTaxableIncome =  nTaxableIncome + sTimevalueArray>
		</CFIF>
	</CFLOOP>
</CFIF>


<CFSET sPyName = "#GetPyFile.PYFILE#" & "R">
<CFSET sPyCFile = "#GetPyFile.PYFILE#" & "C">
<CFSET sPyTFile = "#GetPyFile.PYFILE#" & "T">
<CFSET sPyAFile = "#GetPyFile.PYFILE#" & "A">

<CFSET sStartYear = "01/01/" & Year(#GetPayrollDate.PYDATE#)>

<CFQUERY NAME="GetEmployee" DATASOURCE="#session.company_dsn#">
	SELECT * FROM CMFPA
	WHERE PERSONNELIDNO = '#session.chapa#'
</CFQUERY>

<CFQUERY NAME="GetRegister" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
    SELECT * FROM #sPyName#
	WHERE PERSONNELIDNO = '#session.chapa#'
</CFQUERY>

<CFQUERY NAME="GetCFile" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
	SELECT * FROM #sPyCFile#
</CFQUERY>

<CFQUERY NAME="GetEarnItems" DATASOURCE="#session.company_dsn#">
	SELECT * FROM CLKPYITEMS
	WHERE INCLUDED = 'Y'
		  AND PYITEMTYPE = 'E'
</CFQUERY>

<CFQUERY NAME="GetDeductItems" DATASOURCE="#session.company_dsn#">
	SELECT * FROM CLKPYITEMS
	WHERE INCLUDED = 'Y'
		  AND PYITEMTYPE = 'D'
		  AND PYITEMCODE NOT IN('SSSER','ECC','MEDER','PAGIBIG1ER','PAGIBIG2ER')
</CFQUERY>

<CFMODULE TEMPLATE="cfm_DBdateFormat.cfm" dateConvert="#sStartYear#">
<CFSET vVar1 = dateResult>
<CFMODULE TEMPLATE="cfm_DBdateFormat.cfm" dateConvert="#GetCFile.PYPERIODTO#">
<CFSET vVar2 = dateResult>

<CFIF nTaxableIncome EQ "">
	<CFSET nTaxableIncome = 0>
</CFIF>
<CFIF nTaxwheld EQ "">
	<CFSET nTaxwheld = 0>
</CFIF>
<CFIF nBasic EQ "">
	<CFSET nBasic = 0>
</CFIF>

<CFQUERY NAME="GetYTDGross" DATASOURCE="#GetPyFile.SUBCOMPANYDSN#">
	SELECT SUM(PYITEMVALUE) + #nTaxableIncome# AS PYITEMVALUE  FROM SINPYPOSTEDTRANS
	WHERE PERSONNELIDNO = '#session.chapa#'
	AND ((W2COLUMNNO >= 1) AND (W2COLUMNNO <= 15) ) <!--- OR (W2COLUMNNO = 17) --->
	AND (PYDATE BETWEEN #preserveSingleQuotes(vVar1)#
	AND #preserveSingleQuotes(vVar2)#)
</CFQUERY>

<CFQUERY NAME="GetYTDTax" DATASOURCE="#GetPyFile.SUBCOMPANYDSN#">
	SELECT SUM(PYITEMVALUE) + #nTaxwheld# PYITEMVALUE  FROM SINPYSTATUTORYDED <!---SINPYPOSTEDTRANS --->
	WHERE PERSONNELIDNO = '#session.chapa#'
	AND (STATUTORYITEMCODE = 'TAXWHELD') <!--- PYITEMCODE --->
	AND (PYDATE BETWEEN #preserveSingleQuotes(vVar1)#
	AND #preserveSingleQuotes(vVar2)#)
</CFQUERY>

<CFQUERY NAME="GetYTDBasic" DATASOURCE="#GetPyFile.SUBCOMPANYDSN#">
	SELECT SUM(PYITEMVALUE) + #nBasic# PYITEMVALUE   FROM SINPYPOSTEDTRANS
	WHERE PERSONNELIDNO = '#session.chapa#'
	AND (PYITEMCODE = 'BASICPAY')
	AND (PYDATE BETWEEN #preserveSingleQuotes(vVar1)#
	AND #preserveSingleQuotes(vVar2)#)
</CFQUERY>

<CFQUERY NAME="GetYTDHW" DATASOURCE="#GetPyFile.SUBCOMPANYDSN#">
	SELECT SUM(PYATTVALUE) PYATTVALUE FROM SINPYYTDATTENDANCE
	WHERE PERSONNELIDNO = '#session.chapa#'
	AND (PYATTCODE = 'HRWK')
	AND (PYATTDATE BETWEEN #preserveSingleQuotes(vVar1)#
	AND #preserveSingleQuotes(vVar2)#)
</CFQUERY>

<CFMODULE TEMPLATE="cfm_DBdateFormat.cfm" dateConvert="#GetCFile.PYPERIODFROM#">
<CFSET vVar1 = dateResult>
<CFMODULE TEMPLATE="cfm_DBdateFormat.cfm" dateConvert="#GetCFile.PYPERIODTO#">
<CFSET vVar2 = dateResult>

<CFQUERY NAME="GetHW" DATASOURCE="#GetPyFile.SUBCOMPANYDSN#">
	SELECT SUM(PYATTVALUE) PYATTVALUE FROM SINPYYTDATTENDANCE
	WHERE PERSONNELIDNO = '#session.chapa#'
	AND (PYATTCODE = 'HRWK')
	AND (PYATTDATE BETWEEN #preserveSingleQuotes(vVar1)#
	AND #preserveSingleQuotes(vVar2)#)
</CFQUERY>

<CFQUERY NAME="GetLeaveBalanceSL" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
	SELECT NEWBALANCE FROM #sPyTFile#
	WHERE PERSONNELIDNO = '#session.chapa#' AND LEAVETYPE = 'SL'
</CFQUERY>

<CFQUERY NAME="GetLeaveBalancevL" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
	SELECT NEWBALANCE FROM #sPyTFile#
	WHERE PERSONNELIDNO = '#session.chapa#' AND LEAVETYPE = 'VL'
</CFQUERY>

<CFQUERY NAME="GetHWRK" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
	SELECT PERSONNELIDNO, PYATTCODE, SUM(PYATTVALUE) AS PYATTVALUE
	FROM #sPyAFile#
	WHERE PERSONNELIDNO = '#session.chapa#'
	GROUP BY PERSONNELIDNO, PYATTCODE
</CFQUERY>

<CFQUERY NAME='GetPosition' DATASOURCE="#session.company_dsn#">
	SELECT POSITIONCODE,DESCRIPTION FROM CLKPOSITION
	WHERE POSITIONCODE = '#GetEmployee.POSITIONCODE#'
</CFQUERY>

<!--- Printer Headers supports Dot Matrix Printers as of now. 03/17/2005 - winston --->
<CFSET sPrinterHeaders = CHR(27) & CHR(64)>
<CFSET sPrinterHeaders = sPrinterHeaders & CHR(27) & CHR(15)><!--- set Condensed on --->
<CFSET sPrinterHeaders = sPrinterHeaders & CHR(27) & CHR(70)><!--- Normal Letters --->
<CFSET sPrinterHeaders = sPrinterHeaders & CHR(27) & CHR(80)><!--- 10 cpi pa rin --->

<CFSET sUprLayout = "----------------------------------------------------------------------------------------------------#CHR(13)##CHR(10)#" &
CHR(124) & LJustify("iBOS/e WebShell 2005 - #session.companyname#",98) & CHR(124) & "#CHR(13)##CHR(10)#" &
CHR(124) & RJustify(CHR(124), 99) & "#CHR(13)##CHR(10)#" &
CHR(124) & LJustify("EMPLOYEE NUMBER: " & Left(session.chapa, 31), 49) 	  & LJustify("TAX CODE: " & Left(GetEmployee.TAXEXEMPTIONCODE,38),49) & CHR(124) & "#CHR(13)##CHR(10)#" &
CHR(124) & LJustify("EMPLOYEE NAME: " & Left(session.myname, 33), 49) 	  & LJustify("PAYROLL PERIOD: " & Left(DateFormat(GetCFILE.PYPERIODFROM,"mm/dd/yyyy") & " - " & DateFormat(GetCFile.PYPERIODTO,"mm/dd/yyyy"),33),49) & CHR(124) & "#CHR(13)##CHR(10)#" &
CHR(124) & LJustify("STATUS: " & Left(GetEmployee.EMPLOYMENTSTATUS, 40), 49) & LJustify("POSITION: " & Left(GetPosition.DESCRIPTION,38),49) & CHR(124) & "#CHR(13)##CHR(10)#" &
"----------------------------------------------------------------------------------------------------#CHR(13)##CHR(10)#" &
CHR(124) & RJustify("EARNINGS", 27) & RJustify(CHR(124),22) & RJustify("DEDUCTIONS", 28) & RJustify(CHR(124), 22) &
"">

<!--- EARNINGS --->
<CFSET sEarnings = "">
<CFSET lstEarnings = "">
<CFLOOP QUERY="GetEarnItems">
	<CFIF ListFind(#GetRegister.COLUMNLIST#,#GetEarnItems.PYITEMCODE#) NEQ 0>
		<CFIF Evaluate("GetRegister." & #GetEarnItems.PYITEMCODE#) NEQ "">
			<CFIF #GetEarnItems.PYITEMDESCRIPTION# EQ "BASIC PAY" OR #GetEarnItems.PYITEMDESCRIPTION# EQ "COLA">
				<CFSET ITEMCODE = 'HRWK'>
			<CFELSE>
				<CFSET ITEMCODE = #GetEarnItems.PYITEMCODE#>
			</CFIF>
			<CFQUERY DBTYPE="query" NAME="GetHours">
				SELECT PYATTVALUE,PYATTCODE
				FROM GetHWRK
				WHERE PYATTCODE = '#ITEMCODE#'
			</CFQUERY>
<CFSET sEarnings =
LJustify(Left(GetEarnItems.PYITEMDESCRIPTION,34),25) & RJustify(NumberFormat(GetHours.PYATTVALUE,"99,999.99"),9) & RJustify(NumberFormat(Evaluate("GetRegister." & GetEarnItems.PYITEMCODE),"999,999.99"),13)
>
			<CFSET lstEarnings = listAppend(lstEarnings, sEarnings, "@")>
		</CFIF>
	</CFIF>
</CFLOOP>

<!--- DEDUCTIONS --->
<CFSET sDeductions = "">
<CFSET lstDeductions = "">
<CFLOOP QUERY="GetDeductItems">
	<CFIF ListFind(#GetRegister.COLUMNLIST#,#GetDeductItems.PYITEMCODE#) NEQ 0>
		<CFIF Evaluate("GetRegister." & #GetDeductItems.PYITEMCODE#) NEQ "">
<CFSET sDeductions =
RJustify(LJustify(GetDeductItems.PYITEMDESCRIPTION,34),1) & RJustify(NumberFormat(Evaluate("GetRegister." & GetDeductItems.PYITEMCODE),"999,999.99"),14)>
			<CFSET lstDeductions = listAppend(LstDeductions, sDeductions, "@")>
		</CFIF>
	</CFIF>
</CFLOOP>

<!--- Determine w/c is more record --->
<CFSET lstMoreTransact = "">
<CFSET lstLessTransact = "">
<CFIF listLen(lstEarnings, "@") GTE listLen(lstDeductions, "@")>
	<CFSET lstMoreTransact = lstEarnings>
	<CFSET lstLessTransact = lstDeductions>
<CFELSE>
	<CFSET lstMoreTransact = lstDeductions>
	<CFSET lstLessTransact = lstEarnings>
</CFIF>

<!--- Combining the 2 --->
<CFSET lstTransaction = "">
<CFSET sTemp = "">
<CFSET sSpace = "">
<CFSET nCtr = 1>
<CFLOOP INDEX="x" LIST="#lstMoreTransact#" DELIMITERS="@">
	<CFIF listLen(lstLessTransact, "@") GTE nCtr>
		<CFSET sTemp = listGetAt(lstLessTransact, nCtr,"@")>
	<CFELSE>
		<CFSET sSpace = LJustify("", 48)>
	</CFIF>
	<CFSET x = CHR(124) & x & " #CHR(124)#" & sTemp>
	<CFSET lstTransaction = lstTransaction & x & " #sSpace##CHR(124)##CHR(13)##CHR(10)#">
	<CFSET nCtr = nCtr + 1>
	<CFSET sTemp = "">
</CFLOOP>

<CFSET sExtraSpace = "">
<cfset session.temp = nctr>
<CFIF nCtr LTE 15>
	<CFLOOP INDEX="y" FROM="#nCtr#" TO="15">
		<CFSET sExtraSpace = sExtraSpace & LJustify(CHR(124), 49) & LJustify(CHR(124), 50) & CHR(124) & "#CHR(13)##CHR(10)#">
		<CFSET nCtr = nCtr + 1>
	</CFLOOP>
</CFIF>


<CFSET sLwrLayout = CHR(124) &
LJustify(Left("TOTAL EARNINGS",34),25) & RJustify(NumberFormat(GetRegister.GROSSPAY,"999,999.99"),22) & " #CHR(124)#" &
RJustify("TOTAL DEDUCTIONS",15) & RJustify(NumberFormat(GetRegister.TOTLDEDN,"999,999.99"),32) & " #CHR(124)#" & "#CHR(13)##CHR(10)#" &
"----------------------------------------------------------------------------------------------------#CHR(13)##CHR(10)#" &
CHR(124) & LJustify("YTD GROSS",10) & RJustify(NumberFormat(GetYTDGross.PYITEMVALUE,"9,999,999.99"), 13) & " #CHR(124)# " &
"SL" & RJustify(NumberFormat(GetLeaveBalanceSL.NEWBALANCE,"999.99"), 5) & " #CHR(124)# " &
LJustify("YTD BASIC",10) & RJustify(NumberFormat(GetYTDBasic.PYITEMVALUE,"999,999.99"), 12) & " #CHR(124)# " &
LJustify("NET PAY",10) & RJustify(NumberFormat(GetRegister.NETPAY,"99,999.99"), 12) & " #CHR(124)# " &
"HOURLYRATE" & " #CHR(124)#" & "#CHR(13)##CHR(10)#" &
CHR(124) & LJustify("YTD TAX",10) & RJustify(NumberFormat(GetYTDTax.PYITEMVALUE,"99,999.99"), 13) & " #CHR(124)# " &
"VL" & RJustify(NumberFormat(GetLeaveBalanceVL.NEWBALANCE,"999.99"), 5) & " #CHR(124)# " &
LJustify("YTD HW",10) & RJustify(NumberFormat(GetYTDHW.PYATTVALUE,"99,999.99"), 12) & " #CHR(124)# " &
LJustify("BASIC RATE",10) & RJustify(DecimalFormat(val(GetRegister.BASICPAY) * 2), 12) & " #CHR(124)# " &
RJustify(NumberFormat(GetRegister.HOURLYRATE,"99,999.99"),10) & " #CHR(124)#" & "#CHR(13)##CHR(10)#" &
"----------------------------------------------------------------------------------------------------"
>

<CFSET sPrinterFooter = CHR(12)><!--- Eject page --->

<CFSET txtFile = CreateUUID()>
<CFSET tmpFolder = "./tmppytxtfile/">

<!--- Temporary folder where PY Text File Slips are created. (can be deleted anytime) - winston--->
<CFIF NOT DirectoryExists("#expandpath(tmpFolder)#")>
	<CFDIRECTORY ACTION="Create" DIRECTORY="#expandpath(tmpFolder)#">
	<CFSET sMess = "Temporary PY Text File Folder Created">
</CFIF>

<CFFILE ACTION="Write" FILE="#expandPATH(tmpFolder)##txtFile#.txt" OUTPUT="#sPrinterHeaders##sUprLayout##CHR(13)##CHR(10)##lstTransaction##sExtraSpace##sLwrLayout##sPrinterFooter#">

<!--- This is the first and old solution used, you could try it. - winston 20050318 --->
<!--- showslip ]- createpayslip ]- framepayslip ]- (viewpay & deletepay) --->
<!---<CFLOCATION URL="framepayslip.cfm?CreatedTxtFile=#txtFile#.txt">--->

<!--- This (Force Download) is the current and effient way as of now in terms of features and security issues --->
<!--- showslip ]- createpayslip ]- viewpay --->
<CFLOCATION URL="viewpay.cfm?CreatedTxtFile=#txtFile#.txt">


