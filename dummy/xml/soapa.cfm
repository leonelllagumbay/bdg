<!---
    We are going to subscribe to Campaing Monitor using the
    AddAndResubscribe actions. This is a SOAP-based method that
    requires the following XML body.
--->
<cfsavecontent variable="soapBody">
    <cfoutput>

        <?xml version="1.0" encoding="utf-8"?>
        <soap:Envelope
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">

            <soap:Body>

                <Subscriber.AddAndResubscribe
                    xmlns="http://api.createsend.com/api/">

                    <ApiKey>sasdf</ApiKey>
                    <ListID>f</ListID>
                    <Email>kim@sweet-n-sassy.com</Email>
                    <Name></Name>

                </Subscriber.AddAndResubscribe>

            </soap:Body>

        </soap:Envelope>

    </cfoutput>
</cfsavecontent>


<!---
    Now that we have our SOAP body defined, we need to post it as
    a SOAP request to the Campaign Monitor website. Notice that
    when I POST the SOAP request, I am NOT required to append the
    "WSDL" flag to the target URL (this is only required when you
    actually want to get the web service definition).
--->
<cfhttp
    url="http://api.createsend.com/api/api.asmx"
    method="post"
    result="httpResponse">

    <!---
        Most SOAP action require some sort of SOAP Action header
        to be used.
    --->
    <cfhttpparam
        type="header"
        name="SOAPAction"
        value="http://api.createsend.com/api/Subscriber.AddAndResubscribe"
        />

    <!---
        I typically use this header because CHTTP cannot handle
        GZIP encoding. This "no-compression" directive tells the
        server not to pass back GZIPed content.
    --->
    <cfhttpparam
        type="header"
        name="accept-encoding"
        value="no-compression"
        />

    <!---
        When posting the SOAP body, I use the CFHTTPParam type of
        XML. This does two things: it posts the XML as a the BODY
        and sets the mime-type to be XML.

        NOTE: Be sure to Trim() your XML since XML data cannot be
        parsed with leading whitespace.
    --->
    <cfhttpparam
        type="xml"
        value="#trim( soapBody )#"
        />

</cfhttp>


<!---
    When the HTTP response comes back, our SOAP response will be
    in the FileContent atribute. SOAP always returns valid XML,
    even if there was an error (assuming the error was NOT in the
    communication, but rather in the data).
--->
<cfif find( "200", httpResponse.statusCode )>

    <!--- Parse the XML SOAP response. --->
    <cfset soapResponse = xmlParse( httpResponse.fileContent ) />

    <!---
        Query for the response nodes using XPath. Because the
        SOAP XML document has name spaces, querying the document
        becomes a little funky. Rather than accessing the node
        name directly, we have to use its local-name().
    --->
    <cfset responseNodes = xmlSearch(
        soapResponse,
        "//*[ local-name() = 'Subscriber.AddAndResubscribeResult' ]"
        ) />

    <!---
        Once we have the response node, we can use our typical
        ColdFusion struct-style XML node access.
    --->
    <cfoutput>

        Code: #responseNodes[ 1 ].Code.xmlText#
        <br />
        Success: #responseNodes[ 1 ].Message.xmlText#

    </cfoutput>

</cfif>