<cfcomponent name="File" ExtDirect="true">
	<cffunction name="readMyFolder" ExtDirect="true">
		<cfargument name="dquery">
		<cfargument name="dorder">
		<cfargument name="dorderdirection">

		<cfif trim(dquery) neq "">
			<cfset extraCondition = "AND FOLDERNAME like '%#dquery#%'">
		<cfelse>
			<cfset extraCondition = "">
		</cfif>

		<cfif trim(dorder) neq "">
			<cfset extraOrder = " A.#dorder# #dorderdirection#">
		<cfelse>
			<cfset extraOrder = " A.DATELASTUPDATE DESC">
		</cfif>

		<cftry>
			<cfset topLevel = 1 >
		    <cfquery name="qryFolders" datasource="#session.global_dsn#">
				SELECT  A.FOLDERID AS FOLDERID,
						A.OBJECTIDFK AS OBJECTIDFK,
						A.FOLDERNAME AS FOLDERNAME,
						A.FOLDERHINT AS FOLDERHINT,
						A.PARENTFOLDERID AS PARENTFOLDERID,
						A.FOLDERORDER AS FOLDERORDER,
						A.FOLDERDEPTH AS FOLDERDEPTH,
						A.REMOVABLE AS REMOVABLE,
						A.FOLDERURL AS FOLDERURL,
						A.EXTRAS AS EXTRAS,
						A.ACTIONBY AS ACTIONBY,
						A.APPROVED AS APPROVED,
						A.DATEACTIONWASDONE AS DATEACTIONWASDONE,
						A.DATELASTUPDATE AS DATELASTUPDATE,
						A.EFORMID AS EFORMID,
						A.PERSONNELIDNO AS PERSONNELIDNO,
						A.PROCESSID AS PROCESSID,
						A.RECDATECREATED AS RECDATECREATED,
						B.OBJECTNAME AS OBJECTNAME,
						B.OBJECTLOGO AS OBJECTLOGO
				  FROM  EGRGFOLDER A LEFT JOIN EGRGOBJECTTYPE B ON (A.OBJECTIDFK = B.OBJECTID)
				 WHERE  A.PERSONNELIDNO = '#session.chapa#' #preserveSingleQuotes(extraCondition)#
				ORDER BY A.FOLDERDEPTH DESC, #extraOrder#
			</cfquery>

			<cfif trim(dquery) neq "">
				<cfinvoke method="getFoldersFromFilter" returnvariable="retitem" qryFolders="#qryFolders#">
				<cfreturn retitem />
			</cfif>

			<cfloop query="qryFolders" > <!---prepare ItemNo array for no. of menus and array map/link to this query results--->
				<cfif Not IsDefined("Item#qryFolders.FOLDERDEPTH#") >
					<cfset "Item#qryFolders.FOLDERDEPTH#" = 0 >
				</cfif>
				<cfif Not IsDefined("QueryRef#qryFolders.FOLDERDEPTH#") >
					<cfset "QueryRef#qryFolders.FOLDERDEPTH#" = ArrayNew(1) >
				</cfif>
				<cfif qryFolders.CurrentRow eq 1>
					<cfset topLevel = qryFolders.FOLDERDEPTH >
				</cfif>

				<cfset "Item#qryFolders.FOLDERDEPTH#" = Evaluate("Item#qryFolders.FOLDERDEPTH#") + 1>
				<cfset ArrayAppend(Evaluate("QueryRef#qryFolders.FOLDERDEPTH#"), qryFolders.CurrentRow ) >
			</cfloop> <!---end prepare--->

			<cfset itemName = ArrayNew(1) >
			<cfloop from="#topLevel#" to="1" step="-1" index="menuno" >
				<cfif Not IsDefined("Item#menuno#") > <!---is not directly linked--->
					<cfcontinue>
				</cfif>
				<cfloop from="1" to="#Evaluate('Item#menuno#')#" index="x">

					<cfset parentid = replace(qryFolders.PARENTFOLDERID[Evaluate("QueryRef#menuno#")[x]],"-","_","all") >
					<cfif Not IsDefined("Item#menuno#_#parentid#") >
						<cfset "Item#menuno#_#parentid#" = ArrayNew(1) >
					</cfif>

					<cfset uniqueid = replace(qryFolders.FOLDERID[Evaluate("QueryRef#menuno#")[x]],"-","_","all") >
					<cfset data = StructNew() >
					<cfset dtext = trim(qryFolders.FOLDERNAME[Evaluate('QueryRef#menuno#')[x]]) >
					<cfif dtext eq "" >
						<cfset dtext = "{Empty String}" >
					</cfif>
					<cfset data['text'] = dtext >
					<cfset data['FOLDERID'] = qryFolders.FOLDERID[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['id'] = qryFolders.FOLDERID[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['ACTIONBY'] = qryFolders.ACTIONBY[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['APPROVED'] = qryFolders.APPROVED[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['DATEACTIONWASDONE'] = qryFolders.DATEACTIONWASDONE[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['DATELASTUPDATE'] = qryFolders.DATELASTUPDATE[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['EFORMID'] = qryFolders.EFORMID[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['FOLDERHINT'] = qryFolders.FOLDERHINT[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['FOLDERNAME'] = qryFolders.FOLDERNAME[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['FOLDERORDER'] = qryFolders.FOLDERORDER[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['FOLDERDEPTH'] = qryFolders.FOLDERDEPTH[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['REMOVABLE'] = qryFolders.REMOVABLE[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['OBJECTIDFK'] = qryFolders.OBJECTIDFK[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['PARENTFOLDERID'] = qryFolders.PARENTFOLDERID[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['PERSONNELIDNO'] = qryFolders.PERSONNELIDNO[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['PROCESSID'] = qryFolders.PROCESSID[Evaluate('QueryRef#menuno#')[x]] >
					<cfset data['RECDATECREATED'] = qryFolders.RECDATECREATED[Evaluate('QueryRef#menuno#')[x]] >

					<cfset diconcls = trim(qryFolders.OBJECTLOGO[Evaluate('QueryRef#menuno#')[x]]) >
					<cfif diconcls neq "" >
						<cfset data['iconCls'] = diconcls >
					</cfif>

					<cfset dhint = trim(qryFolders.FOLDERHINT[Evaluate('QueryRef#menuno#')[x]]) >
					<cfif dhint neq "" >
						<cfset data['qtip'] = dhint >
					</cfif>

					<cfset dlink = trim(qryFolders.FOLDERURL[Evaluate('QueryRef#menuno#')[x]]) >
					<cfif dlink neq "" >
						<cfset data['href'] = dlink>
					</cfif>
					<cfset data['leaf'] = "false">
					<cfset data['expanded'] = "false">

					<cfloop list="#qryFolders.EXTRAS[Evaluate('QueryRef#menuno#')[x]]#" delimiters=";" index="Litem" >
						<cfif ListLen(Litem,",") eq 2 >
							<cfset data['#ListGetAt(Litem,1,",")#'] = "#ListGetAt(Litem,2,",")#">
						</cfif>
					</cfloop>


					<cfif qryFolders.FOLDERDEPTH[Evaluate("QueryRef#menuno#")[x]] lt topLevel > <!---top level has no menu structure--->
						<cfif IsDefined("Item#menuno+1#_#uniqueid#") >
							<cfset data['children'] = Evaluate("Item#menuno+1#_#uniqueid#") >
						</cfif>
					</cfif>

					<cfset ArrayAppend(Evaluate("Item#menuno#_#parentid#"), data) >

					<cfif menuno eq 1 AND x eq Evaluate('Item#menuno#') > <!---is the last item--->
						<cfset itemName = Evaluate("Item#menuno#_#parentid#") >
					</cfif>

				</cfloop>

			</cfloop>

			<!--- Node for shared files --->
			<cfset s = StructNew() />
			<cfset s['text'] = "Shared Files" >
			<cfset s['FOLDERID'] = "SHAREDFILES" >
			<cfset s['id'] = "SHAREDFILES" >
			<cfset s['ACTIONBY'] = session.chapa >
			<cfset s['APPROVED'] = "N" >
			<cfset s['DATEACTIONWASDONE'] = "" >
			<cfset s['DATELASTUPDATE'] = "" >
			<cfset s['EFORMID'] = "">
			<cfset s['FOLDERNAME'] = "Shared Files" >
			<cfset s['FOLDERORDER'] = 1 >
			<cfset s['FOLDERDEPTH'] = 1 >
			<cfset s['REMOVABLE'] = "" >
			<cfset s['OBJECTIDFK'] = "" >
			<cfset s['PARENTFOLDERID'] = "" >
			<cfset s['PERSONNELIDNO'] = "" >
			<cfset s['PROCESSID'] = "" >
			<cfset s['RECDATECREATED'] = "" >
			<cfset s['iconCls'] = "" >
			<cfset s['qtip'] = "" >
			<cfset s['href'] = "">
			<cfset s['leaf'] = "false">
			<cfset s['expanded'] = "false">
			<cfset ArrayAppend(itemName, s) />

			<cfreturn itemName >

		<cfcatch>
			<cfreturn cfcatch.detail & ' ' & cfcatch.message >
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="getFoldersFromFilter" access="public" returntype="array">
		<cfargument name="qryFolders" />
		<cfset itemName = ArrayNew(1) />
		<cfloop query="qryFolders">
			<cfset fdata = StructNew() >
			<cfset fdata["ACTIONBY"] = qryFolders.ACTIONBY >
			<cfset fdata["APPROVED"] = qryFolders.APPROVED >
			<cfset fdata["DATEACTIONWASDONE"] = qryFolders.DATEACTIONWASDONE >
			<cfset fdata["DATELASTUPDATE"] = qryFolders.DATELASTUPDATE >
			<cfset fdata["EFORMID"] = qryFolders.EFORMID >
			<cfset fdata["FOLDERDEPTH"] = qryFolders.FOLDERDEPTH >
			<cfset fdata["FOLDERHINT"] = qryFolders.FOLDERHINT >
			<cfset fdata["FOLDERID"] = qryFolders.FOLDERID >
			<cfset fdata["FOLDERNAME"] = qryFolders.FOLDERNAME >
			<cfset fdata["FOLDERORDER"] = qryFolders.FOLDERORDER >
			<cfset fdata["OBJECTIDFK"] = qryFolders.OBJECTIDFK >
			<cfset fdata["PARENTFOLDERID"] = qryFolders.PARENTFOLDERID >
			<cfset fdata["PERSONNELIDNO"] = qryFolders.PERSONNELIDNO >
			<cfset fdata["PROCESSID"] = qryFolders.PROCESSID >
			<cfset fdata["RECDATECREATED"] = qryFolders.RECDATECREATED >
			<cfset fdata["REMOVABLE"] = qryFolders.REMOVABLE >
			<cfset fdata["expanded"] = false >
			<cfset diconcls = trim(qryFolders.OBJECTLOGO) >
			<cfif diconcls neq "" >
				<cfset fdata['iconCls'] = diconcls >
			</cfif>
			<cfset fdata["id"] = qryFolders.FOLDERID >
			<cfset fdata["leaf"] = false >
			<cfset dtext = qryFolders.FOLDERNAME & " ( " & qryFolders.FOLDERDEPTH & " )" >
			<cfif dtext eq "" >
				<cfset dtext = "{Empty String}" >
			</cfif>
			<cfset fdata["text"] = dtext >
			<cfset dhint = trim(qryFolders.FOLDERHINT) >
			<cfif dhint neq "" >
				<cfset fdata['qtip'] = dhint >
			</cfif>

			<cfset dlink = trim(qryFolders.FOLDERURL) >
			<cfif dlink neq "" >
				<cfset fdata['href'] = dlink>
			</cfif>

			<cfset ArrayAppend(itemName, fdata) >
		</cfloop>

		<cfreturn itemName />
	</cffunction>

	<cffunction name="renameMyFolder" ExtDirect="true" ExtFormHandler="true">
		<cftry>
			<cfquery name="updateFolderName" datasource="#session.global_dsn#">
				UPDATE EGRGFOLDER
				   SET FOLDERNAME = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(form.FOLDERNAME)#" >
				 WHERE FOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(form.FOLDERID)#" >
				 	   AND PERSONNELIDNO = '#session.chapa#';
			</cfquery>
			<cfset retStruct = StructNew() >
			<cfset retStruct["success"] = "true" />
			<cfset retStruct["message"] = form.FOLDERID />
			<cfreturn retStruct >
		<cfcatch>
			<cfset retStruct = StructNew() >
			<cfset retStruct["success"] = "false" />
			<cfset retStruct["message"] = cfcatch.detail & ' ' & cfcatch.message />
			<cfreturn retStruct >
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="createMyFolder" ExtDirect="true" ExtFormHandler="true">
		<cftry>
			<cfif trim(form.FOLDERTYPE) eq "PARENT">
				<cfset retStruct = StructNew() >
				<cfset parentfolderid = '' />
				<cfset childfolderid = createUuid() />
				<cfset folderdepth = 1>
				<cfset childfoldername = trim(form.FOLDERNAME)>
				<cfset childfolderhint = trim(form.FOLDERHINT)>
				<cfquery name="QryTopFolder" datasource="#session.global_dsn#">
					SELECT FOLDERID
					  FROM EGRGFOLDER
					 WHERE FOLDERNAME = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(form.FOLDERNAME)#" >
					       AND (PARENTFOLDERID = '' OR PARENTFOLDERID IS NULL)
				</cfquery>
				<cfif IsDefined("QryTopFolder")>
					<cfif QryTopFolder.recordCount gt 0>
						<cfset folderName = form.FOLDERNAME & "_#dateFormat(now(),'YYYY MM DD')#">
					<cfelse>
						<cfset folderName = trim(form.FOLDERNAME)>
					</cfif>

					<cfquery name="QryMax" datasource="#session.global_dsn#">
						SELECT MAX(FOLDERORDER) AS CURRENTMAXORDER
						  FROM EGRGFOLDER
						 WHERE PARENTFOLDERID = '' OR PARENTFOLDERID IS NULL
					</cfquery>
					<cfif trim(QryMax.CURRENTMAXORDER) eq "">
						<cfset currentOrder = 1>
					<cfelse>
						<cfset currentOrder = QryMax.CURRENTMAXORDER + 1>
					</cfif>


					<cfquery name="createFolder" datasource="#session.global_dsn#">
						INSERT INTO EGRGFOLDER (FOLDERID, PARENTFOLDERID, OBJECTIDFK, FOLDERDEPTH, FOLDERNAME,
												FOLDERHINT, FOLDERORDER, PERSONNELIDNO, APPROVED, EFORMID, PROCESSID,
												RECDATECREATED, DATELASTUPDATE, REMOVABLE)
						VALUES (
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#childfolderid#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="FOLDER" >,
							<cfqueryparam cfsqltype="cf_sql_integer" value="1" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#folderName#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#childfolderhint#" >,
							<cfqueryparam cfsqltype="cf_sql_integer" value="#currentOrder#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.chapa#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="N" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="529D9D64-EFE4-C08C-8867D28072DC9DD7" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#createUuid()#" >,
							<cfqueryparam cfsqltype="cf_sql_timestamp" value="#createODBCDatetime(now())#" >,
							<cfqueryparam cfsqltype="cf_sql_timestamp" value="#createODBCDatetime(now())#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="true" >
						)
					</cfquery>

				</cfif>

			<cfelseif trim(form.FOLDERTYPE) eq "CHILD">
				<cfset parentfolderid = trim(form.PARENTFOLDERID) />
				<cfset childfolderid = createUuid() />
				<cfset folderdepth = trim(form.FOLDERDEPTH) + 1>
				<cfset childfoldername = trim(form.FOLDERNAME)>
				<cfset childfolderhint = trim(form.FOLDERHINT)>

				<cfset retStruct = StructNew() >
				<cfquery name="QryTopFolder" datasource="#session.global_dsn#">
					SELECT FOLDERID
					  FROM EGRGFOLDER
					 WHERE FOLDERNAME = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.FOLDERNAME#" >
					       AND PARENTFOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#parentfolderid#" >
				</cfquery>
				<cfif IsDefined("QryTopFolder")>
					<cfif QryTopFolder.recordCount gt 0>
						<cfset folderName = form.FOLDERNAME & "_#dateFormat(now(),'YYYY MM DD')#">
					<cfelse>
						<cfset folderName = trim(form.FOLDERNAME)>
					</cfif>

					<cfquery name="QryMax" datasource="#session.global_dsn#">
						SELECT MAX(FOLDERORDER) AS CURRENTMAXORDER
						  FROM EGRGFOLDER
						 WHERE PARENTFOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#parentfolderid#" >
					</cfquery>
					<cfif trim(QryMax.CURRENTMAXORDER) eq "">
						<cfset currentOrder = 1>
					<cfelse>
						<cfset currentOrder = QryMax.CURRENTMAXORDER + 1>
					</cfif>


					<cfquery name="createFolder" datasource="#session.global_dsn#">
						INSERT INTO EGRGFOLDER (FOLDERID, PARENTFOLDERID, OBJECTIDFK, FOLDERDEPTH, FOLDERNAME,
												FOLDERHINT, FOLDERORDER, PERSONNELIDNO, APPROVED, EFORMID, PROCESSID,
												RECDATECREATED, DATELASTUPDATE, REMOVABLE)
						VALUES (
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#childfolderid#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#parentfolderid#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="FOLDER" >,
							<cfqueryparam cfsqltype="cf_sql_integer" value="#folderdepth#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#folderName#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(form.FOLDERHINT)#" >,
							<cfqueryparam cfsqltype="cf_sql_integer" value="#currentOrder#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.chapa#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="N" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="529D9D64-EFE4-C08C-8867D28072DC9DD7" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#createUuid()#" >,
							<cfqueryparam cfsqltype="cf_sql_timestamp" value="#createODBCDatetime(now())#" >,
							<cfqueryparam cfsqltype="cf_sql_timestamp" value="#createODBCDatetime(now())#" >,
							<cfqueryparam cfsqltype="cf_sql_varchar" value="true" >
						)
					</cfquery>

				</cfif>

			<cfelse>
				<cfset folderName = "NA" >
			</cfif>

			<cfset retStruct["success"] = "true" />
			<cfset retStruct["message"] = folderName />

			<cfset folderNode = StructNew() >
			<cfset folderNode["text"] = folderName >
			<cfset folderNode["left"] = "false" >
			<cfset folderNode["expanded"] = "false" >
			<cfset folderNode["id"] = childfolderid >
			<cfset folderNode["FOLDERID"] = childfolderid >
			<cfset folderNode["FOLDERDEPTH"] = folderdepth >

			<cfset retStruct["newfolder"] = folderNode />

			<cfreturn retStruct >

			<cfcatch>
				<cfset retStruct = StructNew() >
				<cfset retStruct["success"] = "false" />
				<cfset retStruct["message"] = cfcatch.detail & ' ' & cfcatch.message />
				<cfreturn retStruct >
			</cfcatch>
		</cftry>
	</cffunction>


	<cffunction name="updateMyFolder" ExtDirect="true" >
		<cfargument name="arg1" required="true" type="string" >

		<cftry>
			<cfset retArray = ArrayNew(1) >
			<cfreturn retArray >
		<cfcatch>
			<cfreturn cfcatch.detail & ' ' & cfcatch.message >
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="destroyMyFolder" ExtDirect="true" >
		<cfargument name="dfolderid" required="true" type="string" >

		<cftry>
			<cfquery name="QryRemovable" datasource="#session.global_dsn#">
				SELECT REMOVABLE
				  FROM EGRGFOLDER
				 WHERE REMOVABLE = 'false' AND PARENTFOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#dfolderid#" >
			</cfquery>
			<cfif isDefined("QryRemovable")>
				<cfif QryRemovable.recordCount eq 0>
					<cfinvoke method="deleteFoldersAndFiles" dfolderid="#dfolderid#">
				</cfif>
			<cfelse>
				<cfinvoke method="deleteFoldersAndFiles">
			</cfif>
			<cfset retStruct = StructNew() >
			<cfset retStruct["success"] = "true" />
			<cfset retStruct["message"] = dfolderid />
			<cfreturn retStruct >
		<cfcatch>
			<cfset retStruct = StructNew() >
			<cfset retStruct["success"] = "false" />
			<cfset retStruct["message"] = cfcatch.detail & ' ' & cfcatch.message />
			<cfreturn retStruct >
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="getFolderDestination" ExtDirect="true">
		<cfargument name="inputargs" >
		<cfset page = inputargs.page />
		<cfset limit= inputargs.limit />
		<cfset start= inputargs.start />
		<cfif isdefined("inputargs.query") >
			<cfset query= "AND FOLDERNAME LIKE '%#trim(inputargs.query)#%'"  />
			<cfelse>
			<cfset query= "" />
		</cfif>

		<cfset rootstruct = StructNew() />
		<cfset tmpresult = StructNew() />
		<cfset resultArr = ArrayNew(1) />
		<cfset qryLookup = ORMExecuteQuery("FROM EGRGFOLDER WHERE PERSONNELIDNO = '#session.chapa#' #PreserveSingleQuotes(query)#
			                           ORDER BY DATELASTUPDATE ASC", false, {maxResults=#limit#, offset=#start#, timeout=500}) />


		<cfloop from="1" to="#ArrayLen(qryLookup)#" index="i">
			<cfset tmpresult = StructNew() >
			<cfset tmpresult['folderdestinationcode']  = qryLookup[i].getFOLDERID() />
			<cfset tmpresult['folderdestinationname']  = qryLookup[i].getFOLDERNAME() />
			<cfset ArrayAppend(resultArr, tmpresult) >
		</cfloop>

		<cfset dsourceCount = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGFOLDER WHERE PERSONNELIDNO = '#session.chapa#' #PreserveSingleQuotes(query)#
		                           ORDER BY DATELASTUPDATE ASC",true) />
		<cfset rootstuct['totalCount'] = dsourceCount />
		<cfset rootstuct['topics'] = resultArr />
		<cfset rootstuct['success']    = "true" >
		<cfreturn rootstuct />

	</cffunction>

	<cffunction name="refreshMyFolder" ExtDirect="true">
		<cfargument name="FOLDERID">
		<cfargument name="FOLDERDEPTH">
		<cfset sourcefolderid = trim(FOLDERID) />
		<cfset sourcefolderdepth = trim(FOLDERDEPTH) />

		<cfinvoke method="getAllChildrenFolderId"
						startingFolderId="#sourcefolderid#"
						returnvariable="childrenStruct"/>

		<cfset firstFolderDepth = sourcefolderdepth>

		<cfset childrenArray = StructKeyArray(childrenStruct) >
		<cfloop array="#childrenArray#" index="childIndex" >
			<cfquery name="updateChildFolder" datasource="#session.global_dsn#">
				UPDATE EGRGFOLDER
				   SET FOLDERDEPTH = #val(firstFolderDepth) + val(childrenStruct[childIndex])#
				 WHERE FOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#childIndex#" >
				 		AND PERSONNELIDNO = '#session.chapa#'
			</cfquery>
		</cfloop>

		<cfset retStruct = StructNew() >
		<cfset retStruct["success"] = "true" />
		<cfset retStruct["message"] = "Folder code: " & sourcefolderid & " , New folder depth: " & sourcefolderdepth />
		<cfreturn retStruct >

	</cffunction>

	<cffunction name="moveMyFolder" ExtDirect="true" ExtFormHandler="true">
		<cftry>

			<cfif len(trim(form.FILEID)) gt 0 >
				<cfinvoke component="FileDefinition" method="moveFile" returnvariable="s">
				<cfreturn s >
			</cfif>

			<cfset destinationfolderid = trim(form.FOLDERDESTINATION) />
			<cfset sourcefolderid = trim(form.FOLDERID) />
			<cfset sourcefolderdepth = trim(form.FOLDERDEPTH) />
			<cfif destinationfolderid eq sourcefolderid >
				<cfset retStruct = StructNew() >
				<cfset retStruct["success"] = "true" />
				<cfset retStruct["message"] = "Destination: " & destinationfolderid & " ,Folder code: " & sourcefolderid & " , New folder depth: " & sourcefolderdepth />
				<cfreturn retStruct >
			</cfif>
			<!--- Query destination folder depthness --->
			<cfquery name="QryFolderDepth" datasource="#session.global_dsn#" maxrows="1">
				SELECT FOLDERDEPTH
				  FROM EGRGFOLDER
				 WHERE FOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#destinationfolderid#" >
				       AND PERSONNELIDNO = '#session.chapa#'
			</cfquery>

			<cfinvoke method="getAllChildrenFolderId"
							startingFolderId="#sourcefolderid#"
							returnvariable="childrenStruct"/>

			<cfif Not StructKeyExists(childrenStruct, destinationfolderid) >
				<cfset firstFolderDepth = QryFolderDepth.FOLDERDEPTH + 1>
				<cfquery name="updateFolderParent" datasource="#session.global_dsn#">
					UPDATE EGRGFOLDER
					   SET PARENTFOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#destinationfolderid#" >,
					       FOLDERDEPTH = #firstFolderDepth#
					 WHERE FOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#sourcefolderid#" >
					 		AND PERSONNELIDNO = '#session.chapa#'
				</cfquery>
				<cfset childrenArray = StructKeyArray(childrenStruct) >
				<cfloop array="#childrenArray#" index="childIndex" >
					<cfquery name="updateChildFolder" datasource="#session.global_dsn#">
						UPDATE EGRGFOLDER
						   SET FOLDERDEPTH = #val(firstFolderDepth) + val(childrenStruct[childIndex])#
						 WHERE FOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#childIndex#" >
						 		AND PERSONNELIDNO = '#session.chapa#'
					</cfquery>
				</cfloop>
			<cfelse>
				<!--- Destination is its child is not allowed --->
			</cfif>


			<cfset retStruct = StructNew() >
			<cfset retStruct["success"] = "true" />
			<cfset retStruct["message"] = "Destination: " & destinationfolderid & " ,Folder code: " & sourcefolderid & " , New folder depth: " & QryFolderDepth.FOLDERDEPTH />
			<cfreturn retStruct >
		<cfcatch>
			<cfset retStruct = StructNew() >
			<cfset retStruct["success"] = "false" />
			<cfset retStruct["message"] = "Detail: " & cfcatch.detail & " , Message: " & cfcatch.message />
			<cfreturn retStruct >
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="getAllChildrenFolderId" returntype="struct">
		<cfset startingFolderId = startingFolderId />

		<cfset childrenStruct = StructNew() />
		<cfset oddFolderIdArr = ArrayNew(1) />
		<cfset evenFolderIdArr = ArrayNew(1) />
		<cfset hLevelDepthCount = 1 />

		<cfquery name="QueryChildren" datasource="#session.global_dsn#">
			SELECT FOLDERID
			  FROM EGRGFOLDER
			 WHERE PARENTFOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#startingFolderId#" >
			       AND PERSONNELIDNO = '#session.chapa#'
		</cfquery>


		<cfif isDefined("QueryChildren")>
			<cfif QueryChildren.recordCount gt 0>
				<cfloop query="QueryChildren">
					<cfset ArrayAppend(oddFolderIdArr, QueryChildren.FOLDERID) />
					<cfset childrenStruct[QueryChildren.FOLDERID] = hLevelDepthCount />
				</cfloop>
			</cfif>
		</cfif>



		<cfif ArrayLen(oddFolderIdArr) gt 0>
			<cfset evenFolderIdArr = ArrayNew(1) />
			<cfset hLevelDepthCount = hLevelDepthCount + 1 />
			<cfinvoke method="doOddHLevel">
		</cfif>

		<cfreturn childrenStruct />

	</cffunction>

	<cffunction name="doOddHLevel" access="public" returntype="void">
		<cfloop array="#oddFolderIdArr#" index="oddIndex">
			<cfquery name="QueryChildrenOdd" datasource="#session.global_dsn#">
				SELECT FOLDERID
				  FROM EGRGFOLDER
				 WHERE PARENTFOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#oddIndex#" >
				       AND PERSONNELIDNO = '#session.chapa#'
			</cfquery>
			<cfif isDefined("QueryChildrenOdd")>
				<cfif QueryChildrenOdd.recordCount gt 0>
					<cfloop query="QueryChildrenOdd">
						<cfset ArrayAppend(evenFolderIdArr, QueryChildrenOdd.FOLDERID) />
						<cfset childrenStruct[QueryChildrenOdd.FOLDERID] = hLevelDepthCount />
					</cfloop>
				</cfif>
			</cfif>
		</cfloop>


		<cfif ArrayLen(evenFolderIdArr) gt 0>
			<cfset oddFolderIdArr = ArrayNew(1) />
			<cfset hLevelDepthCount = hLevelDepthCount + 1 />
			<cfinvoke method="doEvenHLevel">
		</cfif>
	</cffunction>

	<cffunction name="doEvenHLevel" access="public" returntype="void">
		<cfloop array="#evenFolderIdArr#" index="evenIndex">
			<cfquery name="QueryChildrenEven" datasource="#session.global_dsn#">
				SELECT FOLDERID
				  FROM EGRGFOLDER
				 WHERE PARENTFOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#evenIndex#" >
				       AND PERSONNELIDNO = '#session.chapa#'
			</cfquery>
			<cfif isDefined("QueryChildrenEven")>
				<cfif QueryChildrenEven.recordCount gt 0>
					<cfloop query="QueryChildrenEven">
						<cfset ArrayAppend(oddFolderIdArr, QueryChildrenEven.FOLDERID) />
						<cfset childrenStruct[QueryChildrenEven.FOLDERID] = hLevelDepthCount />
					</cfloop>
				</cfif>
			</cfif>
		</cfloop>
		<cfif ArrayLen(oddFolderIdArr) gt 0>
			<cfset evenFolderIdArr = ArrayNew(1) />
			<cfset hLevelDepthCount = hLevelDepthCount + 1 />
			<cfinvoke method="doOddHLevel">
		</cfif>
	</cffunction>

	<cffunction name="deleteFoldersAndFiles" access="public" returntype="void">
		<cfquery name="QryDel" datasource="#session.global_dsn#">
			DELETE
			  FROM EGRGFOLDER
			 WHERE (REMOVABLE = 'true' OR REMOVABLE IS NULL) AND (FOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#dfolderid#"> OR PARENTFOLDERID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#dfolderid#"> )
		</cfquery>
		<cfquery name="qryFiles" datasource="#session.global_dsn#">
			SELECT FILEID
			  FROM EGRGFILE
			 WHERE FOLDERIDFK = <cfqueryparam cfsqltype="cf_sql_varchar" value="#dfolderid#">
			       AND PERSONNELIDNO = <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.chapa#">
		</cfquery>
		<cfquery name="QryDelFiles" datasource="#session.global_dsn#">
			DELETE
			  FROM EGRGFILE
			 WHERE FOLDERIDFK = <cfqueryparam cfsqltype="cf_sql_varchar" value="#dfolderid#">
			       AND PERSONNELIDNO = <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.chapa#">
		</cfquery>
		<cfset dpath = "../../unDB/document/#ucase(session.companycode)#/#ucase(session.userid)#/">
		<cfset ar = ArrayNew(1) />
		<cfloop query="qryFiles">
			<cfset ArrayAppend(ar, qryFiles.FILEID) />
			<cftry>
				<cffile action="delete" file="#ExpandPath(dpath)##qryFiles.FILEID#">
				<cfcatch type="any">
				</cfcatch>
			</cftry>
		</cfloop>
		<cfset fileids = ArrayToList(ar, "','") />
		<cfquery name="QryDelFiles" datasource="#session.global_dsn#">
			DELETE
			  FROM EGRTSHAREDFILE
			 WHERE FILEID IN ('#PreserveSingleQuotes(fileids)#') AND OWNERUID = '#session.userid#'
		</cfquery>
		<cfquery name="QryDelFiles" datasource="#session.global_dsn#">
			DELETE
			  FROM EGRTGROUPSHAREDFILE
			 WHERE FILEID IN ('#PreserveSingleQuotes(fileids)#') AND OWNERUID = '#session.userid#'
		</cfquery>

	</cffunction>

	<cffunction access="public" name="getSharedFileId" returntype="string">
		<cfargument name="duserid" type="string" >

		<cfquery name="qryFileIds" datasource="#session.global_dsn#">
			SELECT A.FILEID AS FILEIDA
			  FROM EGRGFILE A LEFT JOIN egrtsharedfile B ON (A.FILEID=B.FILEID)
			       LEFT JOIN EGRTGROUPSHAREDFILE C ON (A.FILEID=C.FILEID)
			       LEFT JOIN EGRGUSERGROUPS D ON (C.USERGRPID=D.USERGRPID)
			 WHERE B.SHARETOUID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#duserid#">
			       OR '#duserid#' IN (SELECT USERGRPMEMBERSIDX  FROM EGRGROLEINDEX WHERE USERGRPIDFK = D.USERGRPID)
		</cfquery>
		<cfset a = ArrayNew(1) />
		<cfloop query="qryFileIds">
			<cfset ArrayAppend(a, qryFileIds.FILEIDA) />
		</cfloop>

		<cfset r = ArrayToList(a,"','")>
		<cfreturn "'#r#'">
	</cffunction>

	<cffunction access="public" name="checkMyDriveSize" returntype="boolean">
		<cfdirectory action="list"
					directory="#Expandpath('../../unDB/document/#ucase(session.companycode)#/#ucase(session.userid)#/')#"
					listinfo="all"
					name="myfolder"
					type="file" />
		<cfset dsum = 0 />
		<cfloop query="myfolder">
			<cfset dsum += myfolder.Size >
		</cfloop>
		<cfset currentDriveSizeKb = dsum / 1024 />
		<cfset limitDriveSizeKb = session.maxdrivesize>
		<cfif limitDriveSizeKb gt currentDriveSizeKb>
			<cfreturn "true">
		<cfelse>
			<cfreturn "false">
		</cfif>
	</cffunction>

</cfcomponent>