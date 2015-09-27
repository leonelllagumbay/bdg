
<!--- Configure API Namespace and Description variable names --->
<cfset args = StructNew() />
<cfset args['ns'] = 'Ext.NS_2EB36DCDD5008766558EB666CD0ABA99' />
<cfset args['desc'] = 'APIDesc' />
<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
<cfcontent reset='true' />
<cfoutput>#apiScript#</cfoutput>

<cfsetting showdebugoutput='false' />