<cfheader name="Content-type" value="text/xml">
<cfheader name="Pragma" value="public">
<cfheader name="Cache-control" value="private">
<cfheader name="Expires" value="-1">

<cfsetting enablecfoutputonly="false" showdebugoutput="false">

<cftry>
	<cffeed
	    source = "#trim(url.rssurl)#"
	    overwrite = "true"
	    outputFile = "#ExpandPath('./result.xml')#"
	    xmlVar = "res">

		<cflocation url="./result.xml">

<cfcatch type="any">

     <cffeed
	    source = "#trim(url.rssurl)#"
	    properties = "info"
	    query = "qryXml">

<cfsavecontent variable="xmlfile"><?xml version="1.0" encoding="utf-8"?>
<rss xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:taxo="http://purl.org/rss/1.0/modules/taxonomy/" version="2.0">
<channel>
    <title><cftry><cfoutput>#info.title#</cfoutput><cfcatch></cfcatch></cftry></title>
    <link><cftry><cfoutput>#info.link#</cfoutput><cfcatch></cfcatch></cftry></link>
    <description><cftry><cfoutput>#info.description#</cfoutput><cfcatch></cfcatch></cftry></description>
    <language><cftry><cfoutput>#info.language#</cfoutput><cfcatch></cfcatch></cftry></language>
    <copyright><cftry><cfoutput>#info.copyright#</cfoutput><cfcatch></cfcatch></cftry></copyright>
    <pubDate><cftry><cfoutput>#info.pubDate#</cfoutput><cfcatch></cfcatch></cftry></pubDate>
	<encoding><cftry><cfoutput>#info.encoding#</cfoutput><cfcatch></cfcatch></cftry></encoding>
	<ttl><cftry><cfoutput>#info.ttl#</cfoutput><cfcatch></cfcatch></cftry></ttl>
	<version><cftry><cfoutput>#info.version#</cfoutput><cfcatch></cfcatch></cftry></version>
    <image>
		<description><cftry><cfoutput>#info.image.description#</cfoutput><cfcatch></cfcatch></cftry></description>
		<height><cftry><cfoutput>#info.image.height#</cfoutput><cfcatch></cfcatch></cftry></height>
		<link><cftry><cfoutput>#info.image.link#</cfoutput><cfcatch></cfcatch></cftry></link>
		<title><cftry><cfoutput>#info.image.title#</cfoutput><cfcatch></cfcatch></cftry></title>
		<url><cftry><cfoutput>#info.image.url#</cfoutput><cfcatch></cfcatch></cftry></url>
		<width><cftry><cfoutput>#info.image.width#</cfoutput><cfcatch></cfcatch></cftry></width>
    </image>
	<cfloop query="qryXml"><item>
			<description><cfoutput>#qryXml.CONTENT#</cfoutput></description>
			<title><cfoutput>#qryXml.TITLE#</cfoutput></title>
			<link><cfoutput>#qryXml.RSSLINK#</cfoutput></link>
			<category><cfoutput>#qryXml.CATEGORYLABEL#</cfoutput></category>
			<pubDate><cfoutput>#qryXml.PUBLISHEDDATE#</cfoutput></pubDate>
			<guid isPermaLink="false"><cfoutput>#qryXml.ID#</cfoutput></guid>
	    </item></cfloop>
</channel>
</rss></cfsavecontent>
<cfoutput>#xmlfile#</cfoutput>
</cfcatch>
</cftry>