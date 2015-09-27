component accessors=true output=false persistent=false {

public string function prepareGridFeature(required string querycode, querygrid) {

		SaveContent variable="gridfeatures" {

		qrygridfeatures = EntityLoad("EGRGQRYFEATURE",{EQRYCODE="#trim(querycode)#"},true);

		WriteOutput("[");
		WriteOutput("{
		ftype: 'filters',
		encode: true,
		local: false
	}");

		feat = trim(querygrid.getFEATURES());

		var remoteRoot = stringColumn("remoteRoot","REMOTEROOT",qrygridfeatures);
		var showSummaryRow = numberColumn("showSummaryRow","SHOWSUMMARYROW",qrygridfeatures);
		var collapsible = numberColumn("collapsible","FCOLLAPSIBLE",qrygridfeatures);
		var depthToIndent = numberColumn("depthToIndent","DEPTHTOINDENT",qrygridfeatures);
		var enableGroupingMenu = numberColumn("enableGroupingMenu","ENABLEGROUPINGMENU",qrygridfeatures);
		var enableNoGroups = numberColumn("enableNoGroups","ENABLENOGROUPS",qrygridfeatures);
		var groupByText = stringColumn("groupByText","GROUPBYTEXT",qrygridfeatures);
		var groupHeaderTpl = stringOrObjectOrFunction("groupHeaderTpl","GROUPHEADERTPL",qrygridfeatures);
		var hideGroupedHeader = numberColumn("hideGroupedHeader","HIDEGROUPEDHEADER",qrygridfeatures);
		var listeners = numberColumn("listeners","GROUPINGLISTENERS",qrygridfeatures);
		var showGroupsText = stringColumn("showGroupsText","SHOWGROUPSTEXT",qrygridfeatures);
		var startCollapsed = numberColumn("startCollapsed","STARTCOLLAPSED",qrygridfeatures);

		var fe = ArrayNew(1);

		if (feat eq "summary") {
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "listeners");

			WriteOutput(",{");
			WriteOutput("	ftype: 'summary',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");
		} else if (feat eq "grouping") {
			ArrayAppend(fe, "collapsible");
			ArrayAppend(fe, "depthToIndent");
			ArrayAppend(fe, "enableGroupingMenu");
			ArrayAppend(fe, "enableNoGroups");
			ArrayAppend(fe, "groupByText");
			ArrayAppend(fe, "groupHeaderTpl");
			ArrayAppend(fe, "hideGroupedHeader");
			ArrayAppend(fe, "listeners");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "showGroupsText");
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "startCollapsed");

			WriteOutput(",{");
			WriteOutput("	ftype: 'grouping',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (feat eq "groupingsummary") {
			ArrayAppend(fe, "collapsible");
			ArrayAppend(fe, "depthToIndent");
			ArrayAppend(fe, "enableGroupingMenu");
			ArrayAppend(fe, "enableNoGroups");
			ArrayAppend(fe, "groupByText");
			ArrayAppend(fe, "groupHeaderTpl");
			ArrayAppend(fe, "hideGroupedHeader");
			ArrayAppend(fe, "listeners");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "showGroupsText");
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "startCollapsed");

			WriteOutput(",{");
			WriteOutput("	ftype: 'groupingsummary',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (feat eq "rowbody") {
			ArrayAppend(fe, "listeners");

			WriteOutput(",{");
			WriteOutput("	ftype: 'rowbody',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (feat eq "summary-grouping") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "listeners");

			WriteOutput(",{");
			WriteOutput("	ftype: 'summary',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			WriteOutput("	ftype: 'grouping',");

			fe = ArrayNew(1);
			ArrayAppend(fe, "collapsible");
			ArrayAppend(fe, "depthToIndent");
			ArrayAppend(fe, "enableGroupingMenu");
			ArrayAppend(fe, "enableNoGroups");
			ArrayAppend(fe, "groupByText");
			ArrayAppend(fe, "groupHeaderTpl");
			ArrayAppend(fe, "hideGroupedHeader");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "showGroupsText");
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "startCollapsed");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (feat eq "summary-rowbody") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "listeners");

			WriteOutput(",{");
			WriteOutput("	ftype: 'summary',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			WriteOutput("	ftype: 'rowbody',");

			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (feat eq "grouping-rowbody") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "listeners");

			WriteOutput(",{");
			WriteOutput("	ftype: 'grouping',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			WriteOutput("	ftype: 'rowbody',");
			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");
		} else if (feat eq "summary-groupingsummary") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "listeners");

			WriteOutput(",{");
			WriteOutput("	ftype: 'summary',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			WriteOutput("	ftype: 'groupingsummary',");

			fe = ArrayNew(1);
			ArrayAppend(fe, "collapsible");
			ArrayAppend(fe, "depthToIndent");
			ArrayAppend(fe, "enableGroupingMenu");
			ArrayAppend(fe, "enableNoGroups");
			ArrayAppend(fe, "groupByText");
			ArrayAppend(fe, "groupHeaderTpl");
			ArrayAppend(fe, "hideGroupedHeader");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "showGroupsText");
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "startCollapsed");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");
		} else if (feat eq "groupingsummary-rowbody") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "listeners");
			ArrayAppend(fe, "collapsible");
			ArrayAppend(fe, "depthToIndent");
			ArrayAppend(fe, "enableGroupingMenu");
			ArrayAppend(fe, "enableNoGroups");
			ArrayAppend(fe, "groupByText");
			ArrayAppend(fe, "groupHeaderTpl");
			ArrayAppend(fe, "hideGroupedHeader");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "showGroupsText");
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "startCollapsed");

			WriteOutput(",{");
			WriteOutput("	ftype: 'groupingsummary',");



			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			WriteOutput("	ftype: 'rowbody',");

			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");
		} else if (feat eq "summary-groupingsummary-rowbody") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "listeners");

			WriteOutput(",{");
			WriteOutput("	ftype: 'summary',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			WriteOutput("	ftype: 'groupingsummary',");

			fe = ArrayNew(1);
			ArrayAppend(fe, "collapsible");
			ArrayAppend(fe, "depthToIndent");
			ArrayAppend(fe, "enableGroupingMenu");
			ArrayAppend(fe, "enableNoGroups");
			ArrayAppend(fe, "groupByText");
			ArrayAppend(fe, "groupHeaderTpl");
			ArrayAppend(fe, "hideGroupedHeader");
			ArrayAppend(fe, "remoteRoot");
			ArrayAppend(fe, "showGroupsText");
			ArrayAppend(fe, "showSummaryRow");
			ArrayAppend(fe, "startCollapsed");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			WriteOutput("	ftype: 'rowbody',");

			if (trim(qrygridfeatures.getFEATUREEXTRA()) neq "") {
				WriteOutput("#qrygridfeatures.getFEATUREEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");
		} else {

		}

				WriteOutput("]");

		}

		return gridfeatures;
}


public string function prepareGridPlugin(required string querycode, querygrid) {

		SaveContent variable="gridplugins" {

		qrygridplugins = EntityLoad("EGRGQRYPLUGIN",{EQRYCODE="#trim(querycode)#"},true);

		WriteOutput("[");

		plug = trim(querygrid.getPLUGINS());
		var leadingBufferZone = numberColumn("leadingBufferZone","BLEADINGBUFFERZONE",qrygridplugins);
		var numFromEdge = numberColumn("numFromEdge","BNUMFROMEDGE",qrygridplugins);
		var pluginId = stringColumn("pluginId","BPLUGINID",qrygridplugins);
		var scrollToLoadBuffer = numberColumn("scrollToLoadBuffer","BSCROLLTOLOADBUFFER",qrygridplugins);
		var synchronousRender = numberColumn("synchronousRender","BSYNCHRONOUSRENDER",qrygridplugins);
		var trailingBufferZone = numberColumn("trailingBufferZone","BTRAILINGBUFFERZONE",qrygridplugins);
		var variableRowHeight = numberColumn("variableRowHeight","BVARIABLEROWHEIGHT",qrygridplugins);
		var clicksToEdit = numberColumn("clicksToEdit","CELLEDITINGCLICKSTOEDIT",qrygridplugins);
		var listeners = numberColumn("listeners","CELLEDITINGLISTENER",qrygridplugins);
		var triggerEvent = stringColumn("triggerEvent","TRIGGEREVENT",qrygridplugins);
		var ddGroup = stringColumn("ddGroup","DDGROUP",qrygridplugins);
		var dragGroup = stringColumn("dragGroup","DDDRAGGROUP",qrygridplugins);
		var dragText = stringColumn("dragText","DDDRAGTEXT",qrygridplugins);
		var dropGroup = stringColumn("dropGroup","DDDROPGROUP",qrygridplugins);
		var enableDrag = numberColumn("enableDrag","DDENABLEDRAG",qrygridplugins);
		var containerScroll = numberColumn("containerScroll","DDCONTAINERSCROLL",qrygridplugins);
		var enableDrop = numberColumn("enableDrop","DDENABLEDROP",qrygridplugins);
		var dynamic = numberColumn("dynamic","HEADERRESIZER",qrygridplugins);
		var autoCancel = numberColumn("autoCancel","ROWAUTOCANCEL",qrygridplugins);
		var clicksToMoveEditor = numberColumn("clicksToMoveEditor","ROWCLICKSTOMOVEEDITOR",qrygridplugins);
		var errorSummary = numberColumn("errorSummary","ROWERRORSUMMARY",qrygridplugins);
		var expandOnDblClick = numberColumn("expandOnDblClick","ROWEXPANDONDBLCLICK",qrygridplugins);
		var expandOnEnter = numberColumn("expandOnEnter","ROWEXPANDONENTER",qrygridplugins);
		var selectRowOnExpand = numberColumn("selectRowOnExpand","ROWSELECTROWONEXPAND",qrygridplugins);

		var fe = ArrayNew(1);
		if (plug eq "bufferedrenderer") {
			ArrayAppend(fe, "leadingBufferZone");
			ArrayAppend(fe, "numFromEdge");
			ArrayAppend(fe, "pluginId");
			ArrayAppend(fe, "scrollToLoadBuffer");
			ArrayAppend(fe, "synchronousRender");
			ArrayAppend(fe, "trailingBufferZone");
			ArrayAppend(fe, "variableRowHeight");
			ArrayAppend(fe, "pluginId");

			WriteOutput("{");
			WriteOutput("	ptype: 'bufferedrenderer',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridplugins.getPLUGINEXTRA()) neq "") {
				WriteOutput("#qrygridplugins.getPLUGINEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");
		} else if (plug eq "cellediting") {
			ArrayAppend(fe, "clicksToEdit");
			ArrayAppend(fe, "listeners");
			ArrayAppend(fe, "pluginId");
			ArrayAppend(fe, "triggerEvent");

			WriteOutput("{");
			WriteOutput("	ptype: 'cellediting',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridplugins.getPLUGINEXTRA()) neq "") {
				WriteOutput("#qrygridplugins.getPLUGINEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (plug eq "gridviewdragdrop") {
			ArrayAppend(fe, "containerScroll");
			ArrayAppend(fe, "ddGroup");
			ArrayAppend(fe, "dragGroup");
			ArrayAppend(fe, "dragText");
			ArrayAppend(fe, "dropGroup");
			ArrayAppend(fe, "enableDrag");
			ArrayAppend(fe, "enableDrop");
			ArrayAppend(fe, "pluginId");

			WriteOutput("{");
			WriteOutput("	ptype: 'gridviewdragdrop',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridplugins.getPLUGINEXTRA()) neq "") {
				WriteOutput("#qrygridplugins.getPLUGINEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (plug eq "gridheaderresizer") {
			ArrayAppend(fe, "pluginId");
			ArrayAppend(fe, "dynamic");

			WriteOutput("{");
			WriteOutput("	ptype: 'gridheaderresizer',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridplugins.getPLUGINEXTRA()) neq "") {
				WriteOutput("#qrygridplugins.getPLUGINEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (plug eq "rowediting") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "autoCancel");
			ArrayAppend(fe, "clicksToEdit");
			ArrayAppend(fe, "clicksToMoveEditor");
			ArrayAppend(fe, "errorSummary");
			ArrayAppend(fe, "listeners");
			ArrayAppend(fe, "pluginId");
			ArrayAppend(fe, "triggerEvent");

			WriteOutput("{");
			WriteOutput("	ptype: 'rowediting',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridplugins.getPLUGINEXTRA()) neq "") {
				WriteOutput("#qrygridplugins.getPLUGINEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (plug eq "rowexpander") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "expandOnDblClick");
			ArrayAppend(fe, "expandOnEnter");
			ArrayAppend(fe, "pluginId");
			ArrayAppend(fe, "selectRowOnExpand");

			WriteOutput("{");
			WriteOutput("	ptype: 'rowexpander',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}
			if (trim(qrygridplugins.getPLUGINEXTRA()) neq "") {
				WriteOutput("#qrygridplugins.getPLUGINEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");

		} else if (plug eq "cellediting-rowexpander") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "clicksToEdit");
			ArrayAppend(fe, "listeners");
			ArrayAppend(fe, "pluginId");
			ArrayAppend(fe, "triggerEvent");

			WriteOutput("{");
			WriteOutput("	ptype: 'cellediting',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			fe = ArrayNew(1);
			ArrayAppend(fe, "expandOnDblClick");
			ArrayAppend(fe, "expandOnEnter");
			ArrayAppend(fe, "selectRowOnExpand");

			WriteOutput("	ptype: 'rowexpander',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			if (trim(qrygridplugins.getPLUGINEXTRA()) neq "") {
				WriteOutput("#qrygridplugins.getPLUGINEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");
		} else if (plug eq "bufferedrenderer-rowexpander") {
			fe = ArrayNew(1);
			ArrayAppend(fe, "leadingBufferZone");
			ArrayAppend(fe, "numFromEdge");
			ArrayAppend(fe, "pluginId");
			ArrayAppend(fe, "scrollToLoadBuffer");
			ArrayAppend(fe, "synchronousRender");
			ArrayAppend(fe, "trailingBufferZone");
			ArrayAppend(fe, "variableRowHeight");
			ArrayAppend(fe, "pluginId");

			WriteOutput("{");
			WriteOutput("	ptype: 'bufferedrenderer',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			WriteOutput("actionend: ''");
			WriteOutput("	},{");

			fe = ArrayNew(1);
			ArrayAppend(fe, "expandOnDblClick");
			ArrayAppend(fe, "expandOnEnter");
			ArrayAppend(fe, "selectRowOnExpand");

			WriteOutput("	ptype: 'rowexpander',");

			for (b = 1; b <= ArrayLen(fe); b++) {
			if (trim(evaluate("#fe[b]#")) neq "") {
				WriteOutput("	" & evaluate("#fe[b]#") & "
			");
			}
			}

			if (trim(qrygridplugins.getPLUGINEXTRA()) neq "") {
				WriteOutput("#qrygridplugins.getPLUGINEXTRA()#,");
			}
			WriteOutput("actionend: ''");
			WriteOutput("	}");
		} else {

		}

				WriteOutput("]");

		}

		return gridplugins;
}


public string function numberColumn( numberfield, fieldname, resultobj ) {
	"#numberfield#" = evaluate("resultobj.get#fieldname#()");
	if(Isdefined("#numberfield#")) {
		if(trim(evaluate("#numberfield#")) eq "") {
			return "";
		} else {
			return "#numberfield#: " & evaluate("#numberfield#") & ",";
		}
	} else {
		return "";
	}
}

public string function numberOrStringColumn( numberOrStringfield, fieldname, resultobj ) {
	"#numberOrStringfield#" = evaluate("resultobj.get#fieldname#()");
	if(Isdefined("#numberOrStringfield#")) {
		if(trim(evaluate("#numberOrStringfield#")) eq "") {
			return "";
		} else {
			if(IsNumeric(evaluate("#numberOrStringfield#"))) {
				// a number
				return "#numberOrStringfield#: " & evaluate("#numberOrStringfield#") & ",";
			} else {
				if(trim(evaluate("#numberOrStringfield#")) eq "true" or trim(evaluate("#numberOrStringfield#")) eq "false") {
					// a boolean
					return "#numberOrStringfield#: " & evaluate("#numberOrStringfield#") & ",";
				} else {
					// a string
					return "#numberOrStringfield#: '" & evaluate("#numberOrStringfield#") & "',";
				}
			}
		}
	} else {
		return "";
	}
}

public string function stringColumn( stringfield, fieldname, resultobj ) {
	"#stringfield#" = evaluate("resultobj.get#fieldname#()");
	if(Isdefined("#stringfield#")) {
		if(trim(evaluate("#stringfield#")) eq "") {
			return "";
		} else {
			return "#stringfield#: '" & evaluate("#stringfield#") & "',";
		}
	} else {
		return "";
	}
}


public string function stringOrObjectOrFunction( stringobjectfunctionboolint, fieldname, resultobj ) {
	"#stringobjectfunctionboolint#" = evaluate("resultobj.get#fieldname#()");
	if(Isdefined("#stringobjectfunctionboolint#")) {
		if(trim(evaluate("#stringobjectfunctionboolint#")) eq "") {
			return "";
		} else {
			if(IsNumeric(evaluate("#stringobjectfunctionboolint#"))) {
				// a number
				return "#stringobjectfunctionboolint#: " & evaluate("#stringobjectfunctionboolint#") & ",";
			} else {
				if(trim(evaluate("#stringobjectfunctionboolint#")) eq "true" or trim(evaluate("#stringobjectfunctionboolint#")) eq "false") {
					// a boolean
					return "#stringobjectfunctionboolint#: " & evaluate("#stringobjectfunctionboolint#") & ",";
				} else {
					// a string, an object, or function
					if((left(trim(evaluate("#stringobjectfunctionboolint#")),1) eq "{" and right(trim(evaluate("#stringobjectfunctionboolint#")),1) eq "}") or (left(trim(evaluate("#stringobjectfunctionboolint#")),1) eq "[" and right(trim(evaluate("#stringobjectfunctionboolint#")),1) eq "]") or left(trim(evaluate("#stringobjectfunctionboolint#")),4) eq "Ext.") {
						// an object, array, Ext.* app
						return "#stringobjectfunctionboolint#: " & evaluate("#stringobjectfunctionboolint#") & ",";
					} else if(left(trim(evaluate("#stringobjectfunctionboolint#")),8) eq "function" and right(trim(evaluate("#stringobjectfunctionboolint#")),1) eq "}" ) {
						// a function
						return "#stringobjectfunctionboolint#: " & evaluate("#stringobjectfunctionboolint#") & ",";
					} else {
						// a string
						return "#stringobjectfunctionboolint#: '" & evaluate("#stringobjectfunctionboolint#") & "',";
					}
				}
			}
		}
	} else {
		return "";
	}

}


public array function prepareGridPanelArray() {

	var fa = ArrayNew(1);

	ArrayAppend(fa, "titleAlign");
	ArrayAppend(fa, "title");
	ArrayAppend(fa, "activeItem");
	ArrayAppend(fa, "allowDeselect");
	ArrayAppend(fa, "columnWidth");
	ArrayAppend(fa, "width");
	ArrayAppend(fa, "height");
	ArrayAppend(fa, "maxHeight");
	ArrayAppend(fa, "maxWidth");
	ArrayAppend(fa, "minHeight");
	ArrayAppend(fa, "minWidth");
	ArrayAppend(fa, "minButtonWidth");
	ArrayAppend(fa, "margin");
	ArrayAppend(fa, "padding");
	ArrayAppend(fa, "border");
	ArrayAppend(fa, "bodyBorder");
	ArrayAppend(fa, "bodyPadding");
	ArrayAppend(fa, "bodyStyle");
	ArrayAppend(fa, "shadow");
	ArrayAppend(fa, "shadowOffset");
	ArrayAppend(fa, "ui");
	ArrayAppend(fa, "autoScroll");
	ArrayAppend(fa, "autoDestroy");
	ArrayAppend(fa, "autoRender");
	ArrayAppend(fa, "autoShow");
	ArrayAppend(fa, "closable");
	ArrayAppend(fa, "collapsible");
	ArrayAppend(fa, "draggable");
	ArrayAppend(fa, "resizable");
	ArrayAppend(fa, "floatable");
	ArrayAppend(fa, "toFrontOnShow");
	ArrayAppend(fa, "placeholder");
	ArrayAppend(fa, "saveDelay");
	ArrayAppend(fa, "collapseFirst");
	ArrayAppend(fa, "collapsed");
	ArrayAppend(fa, "disabled");
	ArrayAppend(fa, "animCollapse");
	ArrayAppend(fa, "collapseDirection");
	ArrayAppend(fa, "collapseMode");
	ArrayAppend(fa, "disableSelection");
	ArrayAppend(fa, "fixed");
	ArrayAppend(fa, "floating");
	ArrayAppend(fa, "resizeHandles");
	ArrayAppend(fa, "titleCollapse");
	ArrayAppend(fa, "hidden");
	ArrayAppend(fa, "hideCollapseTool");
	ArrayAppend(fa, "hideHeaders");
	ArrayAppend(fa, "hideMode");
	ArrayAppend(fa, "rowLines");
	ArrayAppend(fa, "simpleDrag");
	ArrayAppend(fa, "enableColumnHide");
	ArrayAppend(fa, "enableColumnMove");
	ArrayAppend(fa, "enableColumnResize");
	ArrayAppend(fa, "enableLocking");
	ArrayAppend(fa, "placeholderCollapseHideMode");
	ArrayAppend(fa, "overlapHeader");
	ArrayAppend(fa, "manageHeight");
	ArrayAppend(fa, "syncRowHeight");
	ArrayAppend(fa, "buttonAlign");
	ArrayAppend(fa, "headerPosition");
	ArrayAppend(fa, "scroll");
	ArrayAppend(fa, "overflowX");
	ArrayAppend(fa, "overflowY");
	ArrayAppend(fa, "emptyText");
	ArrayAppend(fa, "columnLines");
	ArrayAppend(fa, "constrain");
	ArrayAppend(fa, "constrainHeader");
	ArrayAppend(fa, "dockedItems");
	ArrayAppend(fa, "constrainTo");
	ArrayAppend(fa, "constraintInsets");
	ArrayAppend(fa, "frame");
	ArrayAppend(fa, "frameHeader");
	ArrayAppend(fa, "glyph");
	ArrayAppend(fa, "header");
	ArrayAppend(fa, "items");
	ArrayAppend(fa, "itemId");
	ArrayAppend(fa, "sealedColumns");
	ArrayAppend(fa, "selModel");
	ArrayAppend(fa, "selType");
	ArrayAppend(fa, "shrinkWrap");
	ArrayAppend(fa, "shrinkWrapDock");
	ArrayAppend(fa, "sortableColumns");
	ArrayAppend(fa, "tpl");
	ArrayAppend(fa, "data");
	ArrayAppend(fa, "tplWriteMode");
	ArrayAppend(fa, "contentEl");
	ArrayAppend(fa, "renderData");
	ArrayAppend(fa, "scrollDelta");
	ArrayAppend(fa, "html");
	ArrayAppend(fa, "verticalScroller");
	ArrayAppend(fa, "tbar");
	ArrayAppend(fa, "rbar");
	ArrayAppend(fa, "bbar");
	ArrayAppend(fa, "lbar");
	ArrayAppend(fa, "fbar");
	ArrayAppend(fa, "tools");
	ArrayAppend(fa, "buttons");
	ArrayAppend(fa, "icon");
	ArrayAppend(fa, "closeAction");
	ArrayAppend(fa, "bubbleEvents");
	ArrayAppend(fa, "deferRowRender");
	ArrayAppend(fa, "detachOnRemove");
	ArrayAppend(fa, "focusOnToFront");
	ArrayAppend(fa, "forceFit");
	ArrayAppend(fa, "formBind");
	ArrayAppend(fa, "loader");
	ArrayAppend(fa, "baseCls");
	ArrayAppend(fa, "cls");
	ArrayAppend(fa, "bodyCls");
	ArrayAppend(fa, "childEls");
	ArrayAppend(fa, "collapsedCls");
	ArrayAppend(fa, "componentCls");
	ArrayAppend(fa, "disabledCls");
	ArrayAppend(fa, "headerOverCls");
	ArrayAppend(fa, "iconCls");
	ArrayAppend(fa, "overCls");
	ArrayAppend(fa, "firstCls");
	ArrayAppend(fa, "lastCls");
	ArrayAppend(fa, "loadingCls");
	ArrayAppend(fa, "overItemCls");
	ArrayAppend(fa, "selectedItemCls");
	ArrayAppend(fa, "lockedGridConfig");
	ArrayAppend(fa, "lockedViewConfig");
	ArrayAppend(fa, "normalGridConfig");
	ArrayAppend(fa, "normalViewConfig");
	ArrayAppend(fa, "viewConfig");
	ArrayAppend(fa, "blockRefresh");
	ArrayAppend(fa, "deferEmptyText");
	ArrayAppend(fa, "deferInitialRefresh");
	ArrayAppend(fa, "enableTextSelection");
	ArrayAppend(fa, "itemTpl");
	ArrayAppend(fa, "loadMask");
	ArrayAppend(fa, "loadingHeight");
	ArrayAppend(fa, "loadingText");
	ArrayAppend(fa, "markDirty");
	ArrayAppend(fa, "mouseOverOutBuffer");
	ArrayAppend(fa, "preserveScrollOnRefresh");
	ArrayAppend(fa, "stripeRows");
	ArrayAppend(fa, "trackOver");
	ArrayAppend(fa, "stateEvents");
	ArrayAppend(fa, "stateId");
	ArrayAppend(fa, "stateful");
	ArrayAppend(fa, "layout");
	ArrayAppend(fa, "id");
	ArrayAppend(fa, "defaults");
	ArrayAppend(fa, "defaultType");
	ArrayAppend(fa, "defaultAlign");
	ArrayAppend(fa, "defaultDockWeights");
	ArrayAppend(fa, "rtl");
	ArrayAppend(fa, "xtype");
	ArrayAppend(fa, "componentLayout");
	ArrayAppend(fa, "suspendLayout");
	ArrayAppend(fa, "subGridXType");
	ArrayAppend(fa, "renderSelectors");
	ArrayAppend(fa, "renderTo");
	ArrayAppend(fa, "listeners");

	return fa;

}  // end prepareGridPanelArray


public array function prepareGridColumnArray() {
	var ca = ArrayNew(1);
	ArrayAppend(ca, "activeItem");
	ArrayAppend(ca, "align");
	ArrayAppend(ca, "altText");
	ArrayAppend(ca, "flex");
	ArrayAppend(ca, "autoDestroy");
	ArrayAppend(ca, "autoRender");
	ArrayAppend(ca, "autoScroll");
	ArrayAppend(ca, "autoShow");
	ArrayAppend(ca, "baseCls");
	ArrayAppend(ca, "border");
	ArrayAppend(ca, "bubbleEvents");
	ArrayAppend(ca, "childEls");
	ArrayAppend(ca, "cls");
	ArrayAppend(ca, "width");
	ArrayAppend(ca, "columns");
	ArrayAppend(ca, "componentCls");
	ArrayAppend(ca, "constrain");
	ArrayAppend(ca, "constrainTo");
	ArrayAppend(ca, "constraintInsets");
	ArrayAppend(ca, "contentEl");
	ArrayAppend(ca, "data");
	ArrayAppend(ca, "dataIndex");
	ArrayAppend(ca, "defaultAlign");
	ArrayAppend(ca, "defaultType");
	ArrayAppend(ca, "defaultWidth");
	ArrayAppend(ca, "defaults");
	ArrayAppend(ca, "detachOnRemove");
	ArrayAppend(ca, "disabled");
	ArrayAppend(ca, "disabledCls");
	ArrayAppend(ca, "height");
	ArrayAppend(ca, "hidden");
	ArrayAppend(ca, "draggable");
	ArrayAppend(ca, "sortable");
	ArrayAppend(ca, "lockable");
	ArrayAppend(ca, "hideable");
	ArrayAppend(ca, "resizable");
	ArrayAppend(ca, "editor");
	ArrayAppend(ca, "emptyCellText");
	ArrayAppend(ca, "hideMode");
	ArrayAppend(ca, "html");
	ArrayAppend(ca, "icon");
	ArrayAppend(ca, "locked");
	ArrayAppend(ca, "margin");
	ArrayAppend(ca, "maxHeight");
	ArrayAppend(ca, "maxWidth");
	ArrayAppend(ca, "menuText");
	ArrayAppend(ca, "menuDisabled");
	ArrayAppend(ca, "minHeight");
	ArrayAppend(ca, "minWidth");
	ArrayAppend(ca, "padding");
	ArrayAppend(ca, "resizeHandles");
	ArrayAppend(ca, "sealed");
	ArrayAppend(ca, "shadow");
	ArrayAppend(ca, "shadowOffset");
	ArrayAppend(ca, "shrinkWrap");
	ArrayAppend(ca, "tooltip");
	ArrayAppend(ca, "tooltipType");
	ArrayAppend(ca, "editRenderer");
	ArrayAppend(ca, "enableColumnHide");
	ArrayAppend(ca, "floating");
	ArrayAppend(ca, "focusOnToFront");
	ArrayAppend(ca, "formBind");
	ArrayAppend(ca, "frame");
	ArrayAppend(ca, "groupable");
	ArrayAppend(ca, "handler");
	ArrayAppend(ca, "iconCls");
	ArrayAppend(ca, "id");
	ArrayAppend(ca, "itemId");
	ArrayAppend(ca, "items");
	ArrayAppend(ca, "layout");
	ArrayAppend(ca, "listeners");
	ArrayAppend(ca, "loader");
	ArrayAppend(ca, "overflowX");
	ArrayAppend(ca, "overCls");
	ArrayAppend(ca, "overflowY");
	ArrayAppend(ca, "plugins");
	ArrayAppend(ca, "region");
	ArrayAppend(ca, "renderData");
	ArrayAppend(ca, "renderSelectors");
	ArrayAppend(ca, "renderTo");
	ArrayAppend(ca, "renderer");
	ArrayAppend(ca, "rtl");
	ArrayAppend(ca, "saveDelay");
	ArrayAppend(ca, "scope");
	ArrayAppend(ca, "stateEvents");
	ArrayAppend(ca, "stateId");
	ArrayAppend(ca, "stateful");
	ArrayAppend(ca, "stopSelection");
	ArrayAppend(ca, "style");
	ArrayAppend(ca, "suspendLayout");
	ArrayAppend(ca, "tdCls");
	ArrayAppend(ca, "toFrontOnShow");
	ArrayAppend(ca, "tpl");
	ArrayAppend(ca, "tplWriteMode");
	ArrayAppend(ca, "ui");
	ArrayAppend(ca, "undefinedText");
	ArrayAppend(ca, "weight");
	ArrayAppend(ca, "xtype");
	ArrayAppend(ca, "format");
	ArrayAppend(ca, "summaryType");
	ArrayAppend(ca, "summaryRenderer");
	return ca;
}

public string function prepareGridColumn(tablecolumnArr, ca) {

var colItemsArr = ArrayNew(1);
var groupItemsArr = ArrayNew(1);
var tempXArr = ArrayNew(1);
var statusArr = ArrayNew(1);
var colIndexArr = ArrayNew(1);
var resultingArr = ArrayNew(1);


for(a = 1; a <= ArrayLen(tablecolumnArr); a++) {
	SaveContent variable="columnStringItems" {
	if(trim(tablecolumnArr[a][4]) eq "") {
		WriteOutput("{
		text: '#trim(tablecolumnArr[a][2])##trim(tablecolumnArr[a][3])#',
		");
	} else {
		WriteOutput("{
		text: '#tablecolumnArr[a][4]#',
		");
	}

		columndef = EntityLoad("EGRGQRYCOLUMN",tablecolumnArr[a][1],true);
		WriteOutput("dataIndex: '#trim(tablecolumnArr[a][2])#-#trim(tablecolumnArr[a][3])#',
		filterable: true,
		sortable: true,
		");

			if(isdefined("columndef")) {
				// column extra properties
				var activeItem = numberOrStringColumn("activeItem","COLUMNACTIVEITEM",columndef);
				var align = stringColumn("align","COLUMNALIGN",columndef);
				var altText = stringColumn("altText","CACTIONALTTEXT",columndef);
				var flex = numberColumn("flex","COLUMNANCHORSIZE",columndef);
				var autoDestroy = numberColumn("autoDestroy","COLUMNAUTODESTROY",columndef);
				var autoRender = stringOrObjectOrFunction("autoRender","COLUMNAUTORENDER",columndef);
				var autoScroll = numberColumn("autoScroll","COLUMNAUTOSCROLL",columndef);
				var autoShow = numberColumn("autoShow","COLUMNAUTOSHOW",columndef);
				var baseCls = stringColumn("baseCls","COLUMNBASECLS",columndef);
				var border = numberOrStringColumn("border","COLUMNBORDER",columndef);
				var bubbleEvents = stringOrObjectOrFunction("bubbleEvents","COLUMNBUBBLEEVENTS",columndef);
				var childEls = numberColumn("childEls","COLUMNCHILDELS",columndef);
				var cls = stringColumn("cls","COLUMNCLS",columndef);
				var width = numberOrStringColumn("width","COLUMNWIDTH",columndef);
				var columns = numberColumn("columns","COLUMNCOLUMNS",columndef);
				var componentCls = stringColumn("componentCls","COLUMNCOMPONENTCLS",columndef);
				var constrain = numberColumn("constrain","COLUMNCONSTRAIN",columndef);
				var constrainTo = stringOrObjectOrFunction("constrainTo","COLUMNCONSTRAINTO",columndef);
				var constraintInsets = stringOrObjectOrFunction("constraintInsets","COLUMNCONSTRAINTINSETS",columndef);
				var contentEl = stringColumn("contentEl","COLUMNCONTENTEL",columndef);
				var data = numberColumn("data","COLUMNDATA",columndef);
				var dataIndex = stringColumn("dataIndex","COLUMNDATAINDEX",columndef);
				var defaultAlign = stringColumn("defaultAlign","COLUMNDEFAULTALIGN",columndef);
				var defaultType = stringColumn("defaultType","COLUMNDEFAULTTYPE",columndef);
				var defaultWidth = numberColumn("defaultWidth","COLUMNDEFAULTWIDTH",columndef);
				var defaults = numberColumn("defaults","COLUMNDEFAULTS",columndef);
				var detachOnRemove = numberColumn("detachOnRemove","COLUMNDETACHONREMOVE",columndef);
				var disabled = numberColumn("disabled","COLUMNDISABLED",columndef);
				var disabledCls = stringColumn("disabledCls","COLUMNDISABLEDCLS",columndef);
				var height = numberColumn("height","COLUMNHEIGHT",columndef);
				var hidden = numberColumn("hidden","COLUMNHIDDEN",columndef);
				var draggable = numberColumn("draggable","COLUMNDRAGGABLE",columndef);
				var sortable = numberColumn("sortable","COLUMNSORTABLE",columndef);
				var lockable = numberColumn("lockable","COLUMNLOCKABLE",columndef);
				var hideable = numberColumn("hideable","COLUMNHIDEABLE",columndef);
				var resizable = numberColumn("resizable","COLUMNRESIZABLE",columndef);
				var editor = stringOrObjectOrFunction("editor","COLUMNEDITOR",columndef);
				var emptyCellText = stringColumn("emptyCellText","COLUMNEMPTYCELLTEXT",columndef);
				var hideMode = stringColumn("hideMode","COLUMNHIDEMODE",columndef);
				var html = stringOrObjectOrFunction("html","COLUMNHTML",columndef);
				var icon = stringColumn("icon","COLUMNICON",columndef);
				var locked = numberColumn("locked","COLUMNLOCKED",columndef);
				var margin = numberOrStringColumn("margin","COLUMNMARGIN",columndef);
				var maxHeight = numberColumn("maxHeight","COLUMNMAXHEIGHT",columndef);
				var maxWidth = numberColumn("maxWidth","COLUMNMAXWIDTH",columndef);
				var menuText = stringColumn("menuText","COLUMNMENUTEXT",columndef);
				var menuDisabled = numberColumn("menuDisabled","CACTIONMENUDISABLED",columndef);
				var minHeight = numberColumn("minHeight","COLUMNMINHEIGHT",columndef);
				var minWidth = numberColumn("minWidth","COLUMNMINWIDTH",columndef);
				var padding = numberOrStringColumn("padding","COLUMNPADDING",columndef);
				var resizeHandles = stringColumn("resizeHandles","COLUMNRESIZEHANDLES",columndef);
				var sealed = numberColumn("sealed","COLUMNSEALED",columndef);
				var shadow = stringOrObjectOrFunction("shadow","COLUMNSHADOW",columndef);
				var shadowOffset = numberColumn("shadowOffset","COLUMNSHADOWOFFSET",columndef);
				var shrinkWrap = numberColumn("shrinkWrap","COLUMNSHRINKWRAP",columndef);
				var tooltip = stringColumn("tooltip","COLUMNTOOLTIP",columndef);
				var tooltipType = stringColumn("tooltipType","COLUMNTOOLTIPTYPE",columndef);
				var editRenderer = stringOrObjectOrFunction("editRenderer","COLUMNEDITRENDERER",columndef);
				var enableColumnHide = numberColumn("enableColumnHide","COLUMNENABLECOLUMNHIDE",columndef);
				var floating = numberColumn("floating","COLUMNFLOATING",columndef);
				var focusOnToFront = numberColumn("focusOnToFront","COLUMNFOCUSONTOFRONT",columndef);
				var formBind = numberColumn("formBind","COLUMNFORMBIND",columndef);
				var frame = numberColumn("frame","COLUMNFRAME",columndef);
				var groupable = numberColumn("groupable","COLUMNGROUPABLE",columndef);
				var handler = stringOrObjectOrFunction("handler","COLUMNHANDLER",columndef);
				var iconCls = stringColumn("iconCls","COLUMNICONCLS",columndef);
				var id = stringColumn("id","COLUMNID",columndef);
				var itemId = stringColumn("itemId","COLUMNITEMID",columndef);
				var items = numberColumn("items","COLUMNITEMS",columndef);
				var layout = stringOrObjectOrFunction("layout","COLUMNLAYOUT",columndef);
				var listeners = numberColumn("listeners","COLUMNLISTENERS",columndef);
				var loader = numberColumn("loader","COLUMNLOADER",columndef);
				var overflowX = stringColumn("overflowX","COLUMNOVERFLOWX",columndef);
				var overCls = stringColumn("overCls","COLUMNOVERCLS",columndef);
				var overflowY = stringColumn("overflowY","COLUMNOVERFLOWY",columndef);
				var plugins = stringOrObjectOrFunction("plugins","COLUMNPLUGINS",columndef);
				var region = stringColumn("region","COLUMNREGION",columndef);
				var renderData = numberColumn("renderData","COLUMNRENDERDATA",columndef);
				var renderSelectors = numberColumn("renderSelectors","COLUMNRENDERSELECTORS",columndef);
				var renderTo = stringOrObjectOrFunction("renderTo","COLUMNRENDERTO",columndef);
				var renderer = stringOrObjectOrFunction("renderer","COLUMNRENDERER",columndef);
				var rtl = numberColumn("rtl","COLUMNRTL",columndef);
				var saveDelay = numberColumn("saveDelay","COLUMNSAVEDELAY",columndef);
				var scope = numberColumn("scope","CACTIONSCOPE",columndef);
				var stateEvents = stringOrObjectOrFunction("stateEvents","COLUMNSTATEEVENTS",columndef);
				var stateId = stringColumn("stateId","COLUMNSTATEID",columndef);
				var stateful = numberColumn("stateful","COLUMNSTATEFUL",columndef);
				var stopSelection = numberColumn("stopSelection","CACTIONSTOPSELECTION",columndef);
				var style = stringOrObjectOrFunction("style","COLUMNSTYLE",columndef);
				var suspendLayout = numberColumn("suspendLayout","COLUMNSUSPENDLAYOUT",columndef);
				var tdCls = stringColumn("tdCls","COLUMNTDCLS",columndef);
				var toFrontOnShow = numberColumn("toFrontOnShow","COLUMNTOFRONTONSHOW",columndef);
				var tpl = stringOrObjectOrFunction("tpl","COLUMNTPL",columndef);
				var tplWriteMode = stringColumn("tplWriteMode","COLUMNTPLWRITEMODE",columndef);
				var ui = stringColumn("ui","COLUMNUI",columndef);
				var undefinedText = stringColumn("undefinedText","CBOOLEANUNDEFINEDTEXT",columndef);
				var weight = numberColumn("weight","COLUMNWEIGHT",columndef);
				var xtype  = stringOrObjectOrFunction("xtype","COLUMNXTYPE",columndef);
				var format = stringColumn("format","COLUMNFORMAT",columndef);
				var summaryType = stringOrObjectOrFunction("summaryType","SUMMARYTYPE",columndef);
				var summaryRenderer = numberColumn("summaryRenderer","SUMMARYRENDERER",columndef);

				var dwidth = "width: 150,";
				if (IsDefined("width")) {
					if (trim(width) == "" || width < 0) width = dwidth;
				} else {
					width = dwidth;
				}

				for (b = 1; b <= ArrayLen(ca); b++) {
					if (trim(evaluate("#ca[b]#")) neq "") {
						WriteOutput(evaluate("#ca[b]#") & "
		");
					}
				}

				if (trim(columndef.getOUTPUTTYPE()) eq "" || trim(columndef.getOUTPUTTYPE()) eq "string") {
					//... do nothing for now
				}
				else if (trim(columndef.getOUTPUTTYPE()) eq "boolean")
					WriteOutput("xtype: 'booleancolumn',
		");
				else if (trim(columndef.getOUTPUTTYPE()) eq "checkcolumn")
					WriteOutput("xtype: 'checkcolumn',
		");
				else if (trim(columndef.getOUTPUTTYPE()) eq "date")
					WriteOutput("xtype: 'datecolumn',
		");
				else if (trim(columndef.getOUTPUTTYPE()) eq "int")
					if (!IsDefined("format")) {
						WriteOutput("xtype: 'numbercolumn', format: '0',
		");
					} else {
						if (trim(format) == "") {
							WriteOutput("xtype: 'numbercolumn', format: '0',
		");
						} else {
							WriteOutput("xtype: 'numbercolumn',
		");
						}
					}
				else if (trim(columndef.getOUTPUTTYPE()) eq "float")
					WriteOutput("xtype: 'numbercolumn',
		");
				else if (trim(columndef.getOUTPUTTYPE()) eq "actioncolumn")
					WriteOutput("xtype: 'actioncolumn',
		");
				else if (trim(columndef.getOUTPUTTYPE()) eq "templatecolumn")
					WriteOutput("xtype: 'templatecolumn',
		");

				if (trim(columndef.getCOLUMNEXTRA()) neq "") {
					WriteOutput("#trim(columndef.getCOLUMNEXTRA())#,
		");
				}
				var di = trim(tablecolumnArr[a][2]) & "-" & trim(tablecolumnArr[a][3]);
				WriteOutput("action: '#Hash(di)#'
	");
				WriteOutput("}");
			} else {
				WriteOutput("cls: ''}");
			}

	} // end save content
		ArrayAppend(colItemsArr,columnStringItems);
		var cg = columndef.getCOLUMNGROUP();
		if (IsDefined("cg") && trim(cg) != "") {
			ArrayAppend(groupItemsArr, cg);
			ArrayAppend(statusArr, "NOTDONE");
			ArrayAppend(colIndexArr, a);
		} else {
			ArrayAppend(statusArr, "UNUSED");
			ArrayAppend(groupItemsArr, "");
		}

} // end of loop

for (d = 1; d <= ArrayLen(colItemsArr); d++) {
	// Is this d index in the group
	if (Arraycontains(colIndexArr, d) && statusArr[d] == "NOTDONE") { // process group items
		// get the group name
		var disgroup = groupItemsArr[d];
		// loop over group
		for (e = 1; e <= ArrayLen(colIndexArr); e++) {
			if (disgroup == groupItemsArr[colIndexArr[e]]) { // only matching groups
				ArrayAppend(tempXArr, colItemsArr[colIndexArr[e]]);
				statusArr[colIndexArr[e]] = "DONE";
			}
		}
		var subcolitems = "{text: '#disgroup#', columns: [" & ArrayToList(tempXArr,",") & "]}";
		ArrayAppend(resultingArr, subcolitems);
		ArrayClear(tempXArr);
	} else if (statusArr[d] == "UNUSED") { // process single column items
		ArrayAppend(resultingArr, colItemsArr[d]);
	}
}

	var finalStr = "[" & ArrayToList(resultingArr, ",") & "]";
  	return finalStr;
} // end function

}