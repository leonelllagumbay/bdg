
		component  output=false persistent=false ExtDirect=true {
		public struct function Read(required string page,
									required string start,
									required string limit,
									required struct chartparams)
		ExtDirect=true
		{
		
		    var whereStr = '';
			/* Dynamically processes extra parameters */
			if (!StructIsEmpty(chartparams)) {
				var extraparamKeys = StructKeyArray(chartparams);
				var extraCondArr = ArrayNew(1);
				for (var b=1; b <= ArrayLen(extraparamKeys); b++) {
					var excond = "#replace(extraparamKeys[b],'_','.')# = '" & chartparams["#extraparamKeys[b]#"] & "'";
					ArrayAppend(extraCondArr, excond);
				}
				var excondition = ArrayToList(extraCondArr, " AND ");
				if (whereStr == "") {
					whereStr = "WHERE " & excondition;
				} else {
					whereStr = whereStr & " AND " & excondition;
				}
			}
		

			Usql = "SELECT egintestchart.DATA1, egintestchart.DATA10, egintestchart.DATA2, egintestchart.DATA3, egintestchart.DATA4, egintestchart.DATA5, egintestchart.DATA6, egintestchart.DATA7, egintestchart.DATA8, egintestchart.DATA9, egintestchart.NAMEA, egintestchart.NAMEB, egintestchart.NAMEC, egintestchart.NAMED, egintestchart.NAMEE, egintestchart.NAMEF, egintestchart.NAMEG, egintestchart.NAMEH, egintestchart.NAMEI, egintestchart.NAMEJ
					 FROM ibose_global.egintestchart egintestchart
					 #whereStr#
					 
					 
					 ";

			queryService = new query();
			queryService.setDatasource("#session.global_dsn#");
		  	queryService.setName("dqueryname");
			queryService.setSQL(Usql);
			theResultSet = queryService.execute();
			dquery = theResultSet.getResult();

			resultArr = ArrayNew(1);
			rootstuct = StructNew();
		    rootstuct["totalCount"] = dquery.recordCount;

			if (dquery.recordCount < limit) {
		    	limit = dquery.recordCount;
		    }
		    /*Creates an array of structure to be converted to JSON using serializeJSON*/
			for (var b = start+1; b <= start+limit; b++) {
		    	tmpresult = StructNew();
		 
		    			tmpresult["egintestchart-DATA1"] = dquery["DATA1"][b];
		    			tmpresult["egintestchart-DATA10"] = dquery["DATA10"][b];
		    			tmpresult["egintestchart-DATA2"] = dquery["DATA2"][b];
		    			tmpresult["egintestchart-DATA3"] = dquery["DATA3"][b];
		    			tmpresult["egintestchart-DATA4"] = dquery["DATA4"][b];
		    			tmpresult["egintestchart-DATA5"] = dquery["DATA5"][b];
		    			tmpresult["egintestchart-DATA6"] = dquery["DATA6"][b];
		    			tmpresult["egintestchart-DATA7"] = dquery["DATA7"][b];
		    			tmpresult["egintestchart-DATA8"] = dquery["DATA8"][b];
		    			tmpresult["egintestchart-DATA9"] = dquery["DATA9"][b];
		    			tmpresult["egintestchart-NAMEA"] = dquery["NAMEA"][b];
		    			tmpresult["egintestchart-NAMEB"] = dquery["NAMEB"][b];
		    			tmpresult["egintestchart-NAMEC"] = dquery["NAMEC"][b];
		    			tmpresult["egintestchart-NAMED"] = dquery["NAMED"][b];
		    			tmpresult["egintestchart-NAMEE"] = dquery["NAMEE"][b];
		    			tmpresult["egintestchart-NAMEF"] = dquery["NAMEF"][b];
		    			tmpresult["egintestchart-NAMEG"] = dquery["NAMEG"][b];
		    			tmpresult["egintestchart-NAMEH"] = dquery["NAMEH"][b];
		    			tmpresult["egintestchart-NAMEI"] = dquery["NAMEI"][b];
		    			tmpresult["egintestchart-NAMEJ"] = dquery["NAMEJ"][b];
				ArrayAppend(resultArr, tmpresult);
		    }
		    rootstuct["topics"] = resultArr;
			return rootstuct;
		}


	}