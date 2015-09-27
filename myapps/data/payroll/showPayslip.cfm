<CFHEADER NAME = "Expires" VALUE = "#Now()#">
<CFHEADER NAME="Pragma" VALUE="no-cache">
<CFHEADER NAME="cache-control" VALUE="no-cache, no-store, must-revalidate">

<CFQUERY NAME="GetPyFile" DATASOURCE="#session.company_dsn#">
	SELECT PYFILE, SUBCOMPANYDSN, TRANSACTIONDSN, GENTYPE
	FROM ECRGPYSLIP
	WHERE PYSLIPID = '#url.slip#'
</CFQUERY>

<CFIF GetPyFile.GENTYPE EQ "TEXT">
	<CFLOCATION URL="createpayslip.cfm?slip=#url.slip#">
</CFIF>

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
	 <CFQUERY NAME="qryGetGross" DATASOURCE="#GetPyFile.TRANSACTIONDSN#">
		SELECT GROSSPAY
		FROM #GetPyFile.PYFILE#R
		WHERE
		PERSONNELIDNO = '#session.chapa#'
	 </CFQUERY>
	 <CFIF qryGetGross.GROSSPAY NEQ "">
	 	<CFSET nTaxableIncome = nTaxableIncome + qryGetGross.GROSSPAY>
	 </CFIF>
	<!---
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
	--->
</CFIF>


<CFSET sPyName = "#GetPyFile.PYFILE#" & "R">
<CFSET sPyCFile = "#GetPyFile.PYFILE#" & "C">
<CFSET sPyTFile = "#GetPyFile.PYFILE#" & "T">
<CFSET sPyAFile = "#GetPyFile.PYFILE#" & "A">

<!---  <CFSET sStartYear = "01/01/" & Year(Now())> --->
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


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<TITLE>iBOS/e ePaySlip</TITLE>
<CFOUTPUT>
	<LINK REL="StyleSheet" HREF="#session.wstheme_path##session.empcolor#.css" TYPE="text/css">
</HEAD>

<BODY LEFTMARGIN=10 RIGHTMARGIN=5 TOPMARGIN=10>

<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH="100%">
   <TR VALIGN="bottom">
	<TD ALIGN="right"><IMG SRC="#session.image_path##session.site_ibose#"></TD>
	<TD>&nbsp;&nbsp;&nbsp;&nbsp;</TD>
	<TD NOWRAP CLASS="bold14" WIDTH="100%"><FONT FACE="Impact" SIZE="+2">#session.companyname#</FONT><BR></TD>
   </TR>
   <TR><TD COLSPAN=8><HR></TD></TR>
</TABLE>

<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="100%">
   <TR>
  	<TD WIDTH="50%">
		<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH="100%">
  		   <TR>
			<TD CLASS="regular11" NOWRAP>
				&nbsp;<B>EMPLOYEE NUMBER:</B>&nbsp;
			</TD>
			<TD CLASS="regular11" NOWRAP>
				#session.chapa#
			</TD>
		   </TR>
		   <TR>
			<TD CLASS="regular11" NOWRAP>
				&nbsp;<B>EMPLOYEE NAME:</b>
			</TD>
			<TD CLASS="regular11" NOWRAP>
				#session.myname#
			</TD>
		   </TR>
		   <TR>
			<TD CLASS="regular11" NOWRAP>
				&nbsp;<B>STATUS:</b>
			</TD>
			<TD>
				#GetEmployee.EMPLOYMENTSTATUS#
			</TD>
		   </TR>
		</TABLE>
	</TD>
	<TD WIDTH="50%">
		<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH="100%">
  		   <TR>
			<TD CLASS="regular11" NOWRAP>
				&nbsp;<B>TAX CODE:</B>
			</TD>
			<TD CLASS="regular11" NOWRAP>
				#GetEmployee.TAXEXEMPTIONCODE#
			</TD>
		   </TR>
		   <TR>
			<TD CLASS="regular11" NOWRAP>
				&nbsp;<B>PAYROLL PERIOD:</B>&nbsp;
			</TD>
			<TD CLASS="regular11" NOWRAP>
				#DateFormat(GetCFILE.PYPERIODFROM,"mm/dd/yyyy")# - #DateFormat(GetCFile.PYPERIODTO,"mm/dd/yyyy")#
			</TD>
		   </TR>
		   <TR>
			<TD CLASS="regular11" NOWRAP>
				&nbsp;<B>POSITION:</b>
			</TD>
			<TD><!--- added by cel 03.11.04 --->
				<CFQUERY NAME='GetPosition' DATASOURCE="#session.company_dsn#">
					SELECT POSITIONCODE,DESCRIPTION FROM CLKPOSITION
					WHERE POSITIONCODE = '#GetEmployee.POSITIONCODE#'
				</CFQUERY>
				#GetPosition.DESCRIPTION#
			</TD>
		   </TR>
		</TABLE>
	</TD>
   </TR>
   <TR><TD COLSPAN=2><HR></td></tr>
   <TR>
   	<TD COLSPAN=2>
		<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH="100%">
		   <TR BGCOLOR="##COCOCO">
			<TD CLASS="bold11" align="center">EARNINGS</td>
  			<TD CLASS="bold11" align="center">DEDUCTIONS</td>
		   </TR>
		   <TR valign="top">
		   	<!---Earnings--->
		   	<TD WIDTH="50%" HEIGHT="110">
			    <TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH="100%">
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
							<TR>
								<TD CLASS="regular11" width="55%" NOWRAP>
									&nbsp;#GetEarnItems.PYITEMDESCRIPTION#
								</TD>

								<!---added by cel 03.22.04 --->
								<TD CLASS="regular11" width="15%" NOWRAP align="right">
									#NumberFormat(GetHours.PYATTVALUE,"99,999.99")#
								</TD>

								<TD CLASS="regular11" width="25%" NOWRAP align="right">
									#NumberFormat(Evaluate("GetRegister." & GetEarnItems.PYITEMCODE),"999,999,999.99")#
								</TD>
								<TD CLASS="regular11" width="5%">&nbsp;</TD>
							</TR>
						</CFIF>
					</CFIF>
				</CFLOOP>
			   </TABLE>
			</TD>
			<!---Deductions--->
			<TD WIDTH="50%">
			   <TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH="100%">
		  		<CFLOOP QUERY="GetDeductItems">
		  			<CFIF ListFind(#GetRegister.COLUMNLIST#,#GetDeductItems.PYITEMCODE#) NEQ 0>
		 				<CFIF Evaluate("GetRegister." & #GetDeductItems.PYITEMCODE#) NEQ "">
			  				<TR>
								<TD CLASS="regular11" width="55%" NOWRAP>
									&nbsp;#GetDeductItems.PYITEMDESCRIPTION#
								</TD>
								<TD CLASS="regular11" width="15%" align="right" NOWRAP>&nbsp;</TD>
								<TD CLASS="regular11" width="25%" align="right">
									#NumberFormat(Evaluate("GetRegister." & GetDeductItems.PYITEMCODE),"9,999,999.99")#
								</TD>
								<TD CLASS="regular11" width="5%">&nbsp;</TD>
			 				</TR>

						</CFIF>
					</CFIF>
			 	</CFLOOP>
			</TABLE>
		  </TD>
	   </TR>
	   <TR bgcolor="##COCOCO"><TD COLSPAN=4 HEIGHT="12"></td></tr>
	   <TR>
	   	<TD WIDTH="50%">
		     	<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="100%">
			   <TR>
				<TD CLASS="regular11" width="55%" NOWRAP>&nbsp;TOTAL EARNINGS</td>
				<TD CLASS="regular11" width="15%">&nbsp;</TD>
				<TD CLASS="regular11" width="25%" NOWRAP align="right">#NumberFormat(GetRegister.GROSSPAY,"999,999,999.99")#</td>
				<TD CLASS="regular11" width="5%">&nbsp;</TD>
			   </TR>
			</TABLE>
		</TD>
		<TD WIDTH="50%">
			<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="100%">
			   <TR>
				<TD CLASS="regular11" width="55%" NOWRAP>&nbsp;TOTAL DEDUCTIONS</td>
				<TD CLASS="regular11" width="15%">&nbsp;</TD>
				<TD CLASS="regular11" width="25%" NOWRAP align="right">#NumberFormat(GetRegister.TOTLDEDN,"999,999,999.99")#</td>
				<TD CLASS="regular11" width="5%">&nbsp;</TD>
			   </TR>
			</TABLE>
		</TD>
	   </TR>
	   <TR><TD COLSPAN=2><HR></td></tr>
	   <TR>
		<TD CLASS="regular11" WIDTH="50%">
			<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH="100%">
			   <TR>
				<TD CLASS="regular11" WIDTH="">
					&nbsp;<B>YTD GROSS</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#NumberFormat(GetYTDGross.PYITEMVALUE,"999,999,999.99")#
				</TD>
				<TD CLASS="regular11" WIDTH="">
					&nbsp;<B>SL</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#NumberFormat(GetLeaveBalanceSL.NEWBALANCE,"99,999.99")#
				</TD>
				<TD CLASS="regular11" WIDTH="">
					&nbsp;<B>YTD BASIC</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#NumberFormat(GetYTDBasic.PYITEMVALUE,"999,999,999.99")#
				</TD>
			   </TR>
			   <TR>
				<TD CLASS="regular11">
					&nbsp;<B>YTD TAX</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#NumberFormat(GetYTDTax.PYITEMVALUE,"999,999,999.99")#
				</TD>
				<TD CLASS="regular11">
					&nbsp;<B>VL</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#NumberFormat(GetLeaveBalanceVL.NEWBALANCE,"99,999.99")#
				</TD>
				<TD CLASS="regular11">
					&nbsp;<B>YTD HW</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#NumberFormat(GetYTDHW.PYATTVALUE,"999,999,999.99")#
				</TD>
			   </TR>
			</TABLE>
		</TD>
		<TD CLASS="regular11" WIDTH="50%">
			<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=1 WIDTH="100%">
			   <TR>
				<TD CLASS="regular11">
					&nbsp;<B>NET PAY</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#NumberFormat(GetRegister.NETPAY,"999,999,999.99")#
				</TD>
				<TD CLASS="regular11">
					&nbsp;<B>HOURLY RATE</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#NumberFormat(GetRegister.HOURLYRATE,"99,999.99")#
				</TD>
			   </TR>
			   <TR>
				<TD CLASS="regular11">
					&nbsp;<B>BASIC RATE</B>&nbsp;
				</TD>
				<TD CLASS="regular11" align="right">
					#DecimalFormat(val(GetRegister.BASICPAY) * 2)#
				</TD>
			   </TR>
			</TABLE>
		</TD>
	   </TR>
	   <TR><TD COLSPAN=2><HR></td></tr>
	   <TR>
		<TD>
			<INPUT TYPE="button" CLASS="bitbtn" VALUE="Print Page" onclick="window.print()" CLASS="regular11">
		</TD>
	   </TR>
	 </TABLE>
	 </TD>
</TR>
</TABLE>
</CFOUTPUT>
</BODY>
</HTML>
