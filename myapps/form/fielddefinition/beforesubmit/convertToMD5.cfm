<cfif len(form.G__EGRGUSERMASTER__PASSWORD) neq 32 >
	<cfset form.G__EGRGUSERMASTER__PASSWORD = Hash(form.G__EGRGUSERMASTER__PASSWORD) >
</cfif>
<cfif len(form.G__EGRGUSERMASTER__PASSANSWER) neq 32 >
	<cfset form.G__EGRGUSERMASTER__PASSANSWER = Hash(form.G__EGRGUSERMASTER__PASSANSWER) >
</cfif>