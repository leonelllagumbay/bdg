<!--- Printing NOPA --->

<cfquery name="getFilename" datasource="#session.company_dsn#" maxrows="1">
	SELECT BATCHUPLOADFILE
	  FROM ecinnopa
	 WHERE EFORMID = '#eformid#' AND PROCESSID = '#processid#'
</cfquery>

<!--- query --->

<cfset theFilename = getFilename.BATCHUPLOADFILE >
<cfset sourceFile = "../../../unDB/forms/#ucase(session.companycode)#/#thefilename#" >

<cfspreadsheet
    action="read"
    src = "#expandpath(sourceFile)#"
    columns = "1-4"
    excludeHeaderRow = "true"
    headerrow = "1"
    query = "ExcelNOPAData"
>

<cfoutput>
<table style="border-collapse: collapse; padding: 25;" border="1">
	<thead>
		<tr >
			<th style="padding: 5;">Employee ID</th>
			<th style="padding: 5;">Department</th>
			<th style="padding: 5;">Firstname</th>
			<th style="padding: 5;">Lastname</th>
			<th style="padding: 5;"></th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="ExcelNOPAData" >
			<tr>
				<td style="padding: 2 5 2 5;">#EMPLOYEENO#</td>
				<td style="padding: 2 5 2 5;">#DEPARTMENT#</td>
				<td style="padding: 2 5 2 5;">#FIRSTNAME#</td>
				<td style="padding: 2 5 2 5;">#LASTNAME#</td>
				<cfscript>
					 SaveContent variable="onclickP"
					 {
						WriteOutput("
						    var allPanels = Ext.ComponentQuery.query('panel form')[0];
							allPanels.getEl().mask('Loading data to print...');
							var htmlEdr = allPanels.down('htmleditor');
							Ext.Ajax.request({
								'url': '../../data/form/printNOPAdetails.cfm',
								'params': {eformid: '#form.eformid#',
								'processid': '#form.processid#',
								'pid': '#EMPLOYEENO#'},
								'success': function(response) {
									htmlEdr.setValue(response.responseText);
									allPanels.getEl().unmask();
									htmlEdr.getWin().print();
								}
							});");
					 }
				</cfscript>
				<td style="padding: 2 5 2 5;"><a href="##" onclick="#onclickP#">Print</a></td>
			</tr>
		</cfloop>
	</tbody>
	<tfoot>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tfoot>
</table>
</cfoutput>
<cfsetting enablecfoutputonly="false" >