<cfscript>
SaveContent variable="gridfeatures" {

qrygridfeatures = EntityLoad("EGRGQRYFEATURE",querycode,true);

WriteOutput("[");

feat = trim(qrygridfeatures.getFEATURES());

stringColumn("remoteRoot","REMOTEROOT","qrygridfeatures");
numberColumn("showSummaryRow","SHOWSUMMARYROW","qrygridfeatures");
numberColumn("collapsible","FCOLLAPSIBLE","qrygridfeatures");
numberColumn("depthToIndent","DEPTHTOINDENT","qrygridfeatures");
numberColumn("enableGroupingMenu","ENABLEGROUPINGMENU","qrygridfeatures");
numberColumn("enableNoGroups","ENABLENOGROUPS","qrygridfeatures");
stringColumn("groupByText","GROUPBYTEXT","qrygridfeatures");
stringOrObjectOrFunction("groupHeaderTpl","GROUPHEADERTPL","qrygridfeatures");
numberColumn("hideGroupedHeader","HIDEGROUPEDHEADER","qrygridfeatures");
numberColumn("listeners","GROUPINGLISTENERS","qrygridfeatures");
stringColumn("showGroupsText","SHOWGROUPSTEXT","qrygridfeatures");
numberColumn("startCollapsed","STARTCOLLAPSED","qrygridfeatures");

fe = ArrayNew(1);
if (feat eq "summary") {
	WriteOutput("{");
	WriteOutput("	ftype: 'summary',");
	ArrayAppend(fe, "showSummaryRow");
	ArrayAppend(fe, "remoteRoot");
	ArrayAppend(fe, "listeners");
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
} else if (feat eq "rowbody") {
	ArrayAppend(fe, "listeners");
} else if (feat eq "summary-grouping") {
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
} else if (feat eq "summary-rowbody") {
	ArrayAppend(fe, "showSummaryRow");
	ArrayAppend(fe, "remoteRoot");
	ArrayAppend(fe, "listeners");
} else if (feat eq "grouping-rowbody") {
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
} else if (feat eq "summary-groupingsummary") {
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
} else if (feat eq "groupingsummary-rowbody") {
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
} else if (feat eq "summary-groupingsummary-rowbody") {
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
} else {

}

		WriteOutput("]");

}

</cfscript>