
<!--- Configure API Namespace and Description variable names --->
<cfset args = StructNew() />
<cfset args['ns'] = 'Ext.NS_7EB34A22FDC309F7646770F411235A84' />
<cfset args['desc'] = 'APIDesc' />
<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
<cfcontent reset='true' />
<cfoutput>#apiScript#</cfoutput>

<cfsetting showdebugoutput='false' />