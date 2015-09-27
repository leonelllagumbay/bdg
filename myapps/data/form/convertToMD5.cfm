<cfif len(trim(form.pvalue)) lt 31 OR len(trim(form.pvalue)) gt 34 >
	<cfoutput>#Hash(form.pvalue)#</cfoutput>
<cfelse>
    <cfoutput>#trim(form.pvalue)#</cfoutput>
</cfif>
<cfsetting enablecfoutputonly="false" >