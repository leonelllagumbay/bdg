
<!--- Configure API Namespace and Description variable names --->
<cfset args = StructNew() />
<cfset args['ns'] = 'Ext.NS_7F83CD85B0B7BB82976759BDED104907' />
<cfset args['desc'] = 'APIDesc' />
<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
<cfcontent reset='true' />
<cfoutput>#apiScript#</cfoutput>

<cfsetting showdebugoutput='false' />