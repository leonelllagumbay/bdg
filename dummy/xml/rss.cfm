<!--- <cfcontent type="text/xml">
<cfsetting showdebugoutput="false" enablecfoutputonly="true">
<cffeed
    source = "https://news.google.com/?output=rss"
    name = "structure"
    properties = "item"
    query = "qr"
	overwrite = "true"
    outputFile = "#ExpandPath('./result.xml')#"
    xmlVar = "res">

<!--- <cfoutput>#trim(res)#"</cfoutput> --->
<cflocation url="./result.xml"> --->


<cfset rssUrl = "http://rss.cnn.com/rss/cnn_topstories.rss">

<cffeed action="read" source="#rssUrl#" query="entries" properties="info"
    xmlVar = "res" >

<cfdump var="#info#">
<cfdump var="#entries#">

