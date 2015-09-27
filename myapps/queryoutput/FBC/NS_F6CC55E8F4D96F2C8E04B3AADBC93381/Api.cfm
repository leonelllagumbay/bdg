
<!--- Configure API Namespace and Description variable names --->
<cfset args = StructNew() />
<cfset args['ns'] = 'Ext.NS_F6CC55E8F4D96F2C8E04B3AADBC93381' />
<cfset args['desc'] = 'APIDesc' />
<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
<cfcontent reset='true' />
<cfoutput>#apiScript#</cfoutput>

<cfsetting showdebugoutput='false' />