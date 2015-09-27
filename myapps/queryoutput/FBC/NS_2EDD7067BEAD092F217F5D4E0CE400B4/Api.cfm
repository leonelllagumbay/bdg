
<!--- Configure API Namespace and Description variable names --->
<cfset args = StructNew() />
<cfset args['ns'] = 'Ext.NS_2EDD7067BEAD092F217F5D4E0CE400B4' />
<cfset args['desc'] = 'APIDesc' />
<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
<cfcontent reset='true' />
<cfoutput>#apiScript#</cfoutput>

<cfsetting showdebugoutput='false' />