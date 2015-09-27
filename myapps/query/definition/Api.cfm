<!--- Configure API Namespace and Description variable names --->
<cfset args = StructNew() />
<cfset args['ns'] = "Ext.qd" />
<cfset args['desc'] = "APIDesc" />
<cfinvoke component="Direct" method="getAPIScript" argumentcollection="#args#" returnVariable="apiScript" />
<cfcontent reset="true" />
<cfoutput>#apiScript#</cfoutput>
<!--- Extra --->
<cfoutput>Ext.ns('Ext.ss');Ext.ss.APIDesc = {"url":"\/myapps\/form\/usermanager\/Router.cfm","namespace":"Ext.ss","type":"remoting","timeout":300000,"actions":{"lookup":[{"len":1,"name":"getRole"}]}};</cfoutput>
<cfoutput>Ext.ns('Ext.ibose');Ext.ibose.APIDesc = {"url":"\/IBOSE\/application\/Router.cfm","namespace":"Ext.ibose","type":"remoting","timeout":300000,"actions":{"Lookup":[{"len":4,"name":"getMasterUserId"}]}};</cfoutput>

<cfsetting showdebugoutput="false"  />