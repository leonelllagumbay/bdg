/**
 * Preview
 *
 * @author LEONELL
 * @date 3/31/15
 **/
component accessors=true output=false persistent=false ExtDirect="true" {
	public struct function generateOutput(required string querycode) ExtDirect="true" {

		var disquery = EntityLoad("EGRGQRYGRID",{EQRYCODE="#trim(querycode)#"},true);
		var returnedStruct = StructNew();
		var outputtype = "";
		if(Isdefined("disquery")) {
			outputtype = disquery.getOUTPUTTYPE();

			if(outputtype == "grid") {
				var gridObject = CreateObject("component","Grid");
				returnedStruct = gridObject.getGridDefinition(querycode, disquery);
			} else if(outputtype == "chart") {
				var chartObject = CreateObject("component","Chart");
				returnedStruct = chartObject.getChartDefinition(querycode, disquery);
			} else if(outputtype == "tree") {
				var treeObject = CreateObject("component","Tree");
				returnedStruct = treeObject.getTreeDefinition(querycode);
			} else { // Defaults to grid
				var gridObject = CreateObject("component","Grid");
				returnedStruct = gridObject.getGridDefinition(querycode);
			}
		}
		return returnedStruct;
	}


	public struct function eraseQueryCodes(required string querycode) ExtDirect="true" {
		var returnedStruct = StructNew();
		var lbitem = EntityLoad("EGRGLIVEBOARDITEM", {XTYPE=#trim(querycode)#}, false);
		if (IsDefined("lbitem")) {
			if (ArrayLen(lbitem) > 0) {
				returnedStruct["success"] = false;
				returnedStruct["message"] = "Cannot erase query codes when the query is part of liveboard.";
				return returnedStruct;
			}
		}

		var o = CreateObject("component", "myapps.query.manager.QueryManager");
		o.removeQueryCodesGenerated(querycode);
		returnedStruct["success"] = true;
		return returnedStruct;

	}
}
