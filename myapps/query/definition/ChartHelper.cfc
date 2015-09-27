component accessors=true output=false persistent=false {

	public array function prepareChartColumnArray() {
	var ca = ArrayNew(1);

	ArrayAppend(ca, "animate");
	ArrayAppend(ca, "constrain");
	ArrayAppend(ca, "constrainTo");
	ArrayAppend(ca, "constraintInsets");
	ArrayAppend(ca, "defaultAlign");
	ArrayAppend(ca, "formBind");
	ArrayAppend(ca, "width");
	ArrayAppend(ca, "columnWidth");
	ArrayAppend(ca, "height");
	ArrayAppend(ca, "maxHeight");
	ArrayAppend(ca, "maxWidth");
	ArrayAppend(ca, "margin");
	ArrayAppend(ca, "padding");
	ArrayAppend(ca, "border");
	ArrayAppend(ca, "shadow");
	ArrayAppend(ca, "shadowOffset");
	ArrayAppend(ca, "style");
	ArrayAppend(ca, "ui");
	ArrayAppend(ca, "autoScroll");
	ArrayAppend(ca, "autoRender");
	ArrayAppend(ca, "autoShow");
	ArrayAppend(ca, "draggable");
	ArrayAppend(ca, "resizable");
	ArrayAppend(ca, "toFrontOnShow");
	ArrayAppend(ca, "disabled");
	ArrayAppend(ca, "fixed");
	ArrayAppend(ca, "floating");
	ArrayAppend(ca, "resizeHandles");
	ArrayAppend(ca, "hidden");
	ArrayAppend(ca, "hideMode");
	ArrayAppend(ca, "overflowX");
	ArrayAppend(ca, "overflowY");
	ArrayAppend(ca, "frame");
	ArrayAppend(ca, "shrinkWrap");
	ArrayAppend(ca, "tpl");
	ArrayAppend(ca, "data");
	ArrayAppend(ca, "tplWriteMode");
	ArrayAppend(ca, "contentEl");
	ArrayAppend(ca, "renderData");
	ArrayAppend(ca, "focusOnToFront");
	ArrayAppend(ca, "loader");
	ArrayAppend(ca, "baseCls");
	ArrayAppend(ca, "cls");
	ArrayAppend(ca, "componentCls");
	ArrayAppend(ca, "disabledCls");
	ArrayAppend(ca, "overCls");
	ArrayAppend(ca, "saveDelay");
	ArrayAppend(ca, "stateEvents");
	ArrayAppend(ca, "stateId");
	ArrayAppend(ca, "stateful");
	ArrayAppend(ca, "id");
	ArrayAppend(ca, "rtl");
	ArrayAppend(ca, "renderSelectors");
	ArrayAppend(ca, "items");
	ArrayAppend(ca, "listeners");
	ArrayAppend(ca, "title");

	return ca;
}

	public string function prepareChartPanel(ca, querygrid, dgrid) {

		SaveContent variable="chartPDef" {
			chartpdef = querygrid;

			var animate = dgrid.numberOrStringColumn("animate","ANIMCOLLAPSE",chartpdef);
			var constrain = dgrid.numberColumn("constrain","QRYCONSTRAIN",chartpdef);
			var constrainTo = dgrid.stringOrObjectOrFunction("constrainTo","QRYCONSTRAINTO",chartpdef);
			var constraintInsets = dgrid.stringOrObjectOrFunction("constraintInsets","CONSTRAINTINSETS",chartpdef);
			var defaultAlign = dgrid.stringColumn("defaultAlign","DEFAULTALIGN",chartpdef);
			var formBind = dgrid.numberColumn("formBind","FORMBIND",chartpdef);
			var width = dgrid.numberColumn("width","WIDTH",chartpdef);
			var columnWidth = dgrid.numberOrStringColumn("columnWidth","COLUMNWIDTH",chartpdef);
			var height = dgrid.numberColumn("height","HEIGHT",chartpdef);
			var maxHeight = dgrid.numberColumn("maxHeight","MAXHEIGHT",chartpdef);
			var maxWidth = dgrid.numberColumn("maxWidth","MAXWIDTH",chartpdef);
			var margin = dgrid.numberOrStringColumn("margin","MARGIN",chartpdef);
			var padding = dgrid.numberOrStringColumn("padding","PADDING",querygrid);
			var border = dgrid.numberOrStringColumn("border","BORDER",chartpdef);
			var shadow = dgrid.stringOrObjectOrFunction("shadow","SHADOW",chartpdef);
			var shadowOffset = dgrid.numberColumn("shadowOffset","SHADOWOFFSET",chartpdef);
			var style = dgrid.stringOrObjectOrFunction("style","STYLE",chartpdef);
			var ui = dgrid.stringColumn("ui","QRYUI",chartpdef);
			var autoScroll = dgrid.numberColumn("autoScroll","AUTOSCROLL",chartpdef);
			var autoRender = dgrid.stringOrObjectOrFunction("autoRender","AUTORENDER",chartpdef);
			var autoShow = dgrid.numberColumn("autoShow","AUTOSHOW",chartpdef);
			var draggable = dgrid.stringOrObjectOrFunction("draggable","DRAGGABLE",chartpdef);
			var resizable = dgrid.stringOrObjectOrFunction("resizable","RESIZABLE",chartpdef);
			var toFrontOnShow = dgrid.numberColumn("toFrontOnShow","TOFRONTONSHOW",chartpdef);
			var disabled = dgrid.numberColumn("disabled","DISABLED",chartpdef);
			var fixed = dgrid.numberColumn("fixed","FIXED",chartpdef);
			var floating = dgrid.numberColumn("floating","FLOATING",chartpdef);
			var resizeHandles = dgrid.stringColumn("resizeHandles","RESIZEHANDLES",chartpdef);
			var hidden = dgrid.numberColumn("hidden","HIDDEN",chartpdef);
			var hideMode = dgrid.stringColumn("hideMode","HIDEMODE",chartpdef);
			var overflowX = dgrid.stringColumn("overflowX","OVERFLOWX",chartpdef);
			var overflowY = dgrid.stringColumn("overflowY","OVERFLOWY",chartpdef);
			var frame = dgrid.numberColumn("frame","FRAME",chartpdef);
			var shrinkWrap = dgrid.numberColumn("shrinkWrap","SHRINKWRAP",chartpdef);
			var tpl = dgrid.stringOrObjectOrFunction("tpl","TPL",chartpdef);
			var data = dgrid.numberColumn("data","QRYDATA",chartpdef);
			var tplWriteMode = dgrid.stringColumn("tplWriteMode","TPLWRITEMODE",chartpdef);
			var contentEl = dgrid.stringColumn("contentEl","CONTENTEL",chartpdef);
			var renderData = dgrid.numberColumn("renderData","RENDERDATA",chartpdef);
			var focusOnToFront = dgrid.numberColumn("focusOnToFront","FOCUSONTOFRONT",chartpdef);
			var loader = dgrid.numberColumn("loader","LOADER",chartpdef);
			var baseCls = dgrid.stringColumn("baseCls","BASECLS",chartpdef);
			var cls = dgrid.stringColumn("cls","CLS",chartpdef);
			var componentCls = dgrid.stringColumn("componentCls","COMPONENTCLS",chartpdef);
			var disabledCls = dgrid.stringColumn("disabledCls","DISABLEDCLS",chartpdef);
			var overCls = dgrid.stringColumn("overCls","OVERCLS",chartpdef);
			var saveDelay = dgrid.numberColumn("saveDelay","SAVEDELAY",chartpdef);
			var stateEvents = dgrid.stringOrObjectOrFunction("stateEvents","STATEEVENTS",chartpdef);
			var stateId = dgrid.stringColumn("stateId","STATEID",chartpdef);
			var stateful = dgrid.numberColumn("stateful","STATEFUL",chartpdef);
			var id = dgrid.stringColumn("id","QRYID",chartpdef);
			var rtl = dgrid.numberColumn("rtl","RTL",chartpdef);
			var renderSelectors = dgrid.numberColumn("renderSelectors","RENDERSELECTORS",chartpdef);
			var items = dgrid.numberColumn("items","ITEMS",chartpdef);
			var listeners = dgrid.numberColumn("listeners","LISTENERS",chartpdef);
			var title = dgrid.stringColumn("title","QRYTITLE",chartpdef);

			for (b = 1; b <= ArrayLen(ca); b++) {
				if (trim(evaluate("#ca[b]#")) neq "") {
					WriteOutput(evaluate("#ca[b]#") & "
	");
				}
			}


		}

		return chartPDef;

	}


	public string function prepareChartMask(querychart, dgrid) {
		var ca = ArrayNew(1);
		ArrayAppend(ca, "mask");

		SaveContent variable="labeldef" {
			var mask = dgrid.stringOrObjectOrFunction("mask","MASK",querychart);
			for (b = 1; b <= ArrayLen(ca); b++) {
				if (trim(evaluate("#ca[b]#")) neq "") {
					WriteOutput(evaluate("#ca[b]#") & "
	");
				}
			}

		}

		return labeldef;
	}


	public string function prepareChartLegend(querychart, dgrid) {
		var ca = ArrayNew(1);
		ArrayAppend(ca, "boxFill");
		ArrayAppend(ca, "boxStroke");
		ArrayAppend(ca, "boxStrokeWidth");
		ArrayAppend(ca, "boxZIndex");
		ArrayAppend(ca, "itemSpacing");
		ArrayAppend(ca, "labelColor");
		ArrayAppend(ca, "labelFont");
		ArrayAppend(ca, "position");
		ArrayAppend(ca, "update");
		ArrayAppend(ca, "visible");
		ArrayAppend(ca, "x");
		ArrayAppend(ca, "y");
		ArrayAppend(ca, "allowFunctions");
		ArrayAppend(ca, "defaultSortDirection");
		ArrayAppend(ca, "listeners");
		ArrayAppend(ca, "sortRoot");
		ArrayAppend(ca, "sorters");

		SaveContent variable="legenddef" {
			var boxFill = dgrid.stringColumn("boxFill","BOXFILL",querychart);
			var boxStroke = dgrid.stringColumn("boxStroke","BOXSTROKE",querychart);
			var boxStrokeWidth = dgrid.stringColumn("boxStrokeWidth","BOXSTROKEWIDTH",querychart);
			var boxZIndex = dgrid.numberColumn("boxZIndex","BOXZINDEX",querychart);
			var itemSpacing = dgrid.numberColumn("itemSpacing","ITEMSPACING",querychart);
			var labelColor = dgrid.stringColumn("labelColor","LABELCOLOR",querychart);
			var labelFont = dgrid.stringColumn("labelFont","LABELFONT",querychart);
			var position = dgrid.stringColumn("position","LEGENDPOSITION",querychart);
			var update = dgrid.numberColumn("update","CHARTUPDATE",querychart);
			var visible = dgrid.numberColumn("visible","VISIBLE",querychart);
			var x = dgrid.numberColumn("x","X",querychart);
			var y = dgrid.numberColumn("y","Y",querychart);
			var allowFunctions = dgrid.numberColumn("allowFunctions","ALLOWFUNCTIONS",querychart);
			var defaultSortDirection = dgrid.stringColumn("defaultSortDirection","DEFAULTSORTDIRECTION",querychart);
			var listeners = dgrid.numberColumn("listeners","LEGENDITEMLISTENERS",querychart);
			var sortRoot = dgrid.stringColumn("sortRoot","SORTROOT",querychart);
			var sorters = dgrid.stringOrObjectOrFunction("sorters","SORTERS",querychart);

			if (querychart.getVISIBLE() == true) {
				WriteOutput("legend: {");
				for (b = 1; b <= ArrayLen(ca); b++) {
					if (trim(evaluate("#ca[b]#")) neq "") {
						WriteOutput(evaluate("#ca[b]#") & "
		");
					}
				}
				WriteOutput("action: 'legend'},");
			} else {
				return "";
			}

		}

		return legenddef;
	}


	public string function prepareChartAxis(querychartaxis, dgrid) {

		SaveContent variable="axesdef" {
			WriteOutput("[");
			for (var a = 1; a <= ArrayLen(querychartaxis); a++) {
				WriteOutput("{");
				if (trim(querychartaxis[a].getAXISTYPE()) == "Numeric" || trim(querychartaxis[a].getAXISTYPE()) == "Radial") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "position");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "fields");
					ArrayAppend(ca, "grid");
					ArrayAppend(ca, "adjustEnd");
					ArrayAppend(ca, "dashSize");
					ArrayAppend(ca, "hidden");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "length");
					ArrayAppend(ca, "majorTickSteps");
					ArrayAppend(ca, "minorTickSteps");
					ArrayAppend(ca, "width");
					ArrayAppend(ca, "maximum");
					ArrayAppend(ca, "minimum");
					ArrayAppend(ca, "adjustMaximumByMajorUnit");
					ArrayAppend(ca, "adjustMinimumByMajorUnit");
					ArrayAppend(ca, "constrain");
					ArrayAppend(ca, "decimals");

					var type = dgrid.stringColumn("type","AXISTYPE",querychartaxis[a]);
					var position = dgrid.stringColumn("position","POSITION",querychartaxis[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartaxis[a]);
					var fields = dgrid.numberColumn("fields","FIELDS",querychartaxis[a]);
					var grid = dgrid.numberColumn("grid","GRID",querychartaxis[a]);
					var adjustEnd = dgrid.numberColumn("adjustEnd","ADJUSTEND",querychartaxis[a]);
					var dashSize = dgrid.numberColumn("dashSize","DASHSIZE",querychartaxis[a]);
					var hidden = dgrid.numberColumn("hidden","HIDDEN",querychartaxis[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartaxis[a]);
					var length = dgrid.numberColumn("length","LENGTH",querychartaxis[a]);
					var majorTickSteps = dgrid.numberColumn("majorTickSteps","MAJORTICKSTEPS",querychartaxis[a]);
					var minorTickSteps = dgrid.numberColumn("minorTickSteps","MINORTICKSTEPS",querychartaxis[a]);
					var width = dgrid.numberColumn("width","WIDTH",querychartaxis[a]);
					var maximum = dgrid.numberColumn("maximum","MAXIMUM",querychartaxis[a]);
					var minimum = dgrid.numberColumn("minimum","MINIMUM",querychartaxis[a]);
					var adjustMaximumByMajorUnit = dgrid.numberColumn("adjustMaximumByMajorUnit","ADJUSTMAXIMUMBYMAJORUNIT",querychartaxis[a]);
					var adjustMinimumByMajorUnit = dgrid.numberColumn("adjustMinimumByMajorUnit","ADJUSTMINIMUMBYMAJORUNIT",querychartaxis[a]);
					var constrain = dgrid.numberColumn("constrain","CONSTRAIN",querychartaxis[a]);
					var decimals = dgrid.numberColumn("decimals","DECIMALS",querychartaxis[a]);

				} else if (trim(querychartaxis[a].getAXISTYPE()) == "Category") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "position");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "fields");
					ArrayAppend(ca, "grid");
					ArrayAppend(ca, "adjustEnd");
					ArrayAppend(ca, "dashSize");
					ArrayAppend(ca, "hidden");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "length");
					ArrayAppend(ca, "majorTickSteps");
					ArrayAppend(ca, "minorTickSteps");
					ArrayAppend(ca, "width");
					ArrayAppend(ca, "calculateCategoryCount");
					ArrayAppend(ca, "categoryNames");

					var type = dgrid.stringColumn("type","AXISTYPE",querychartaxis[a]);
					var position = dgrid.stringColumn("position","POSITION",querychartaxis[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartaxis[a]);
					var fields = dgrid.numberColumn("fields","FIELDS",querychartaxis[a]);
					var grid = dgrid.numberColumn("grid","GRID",querychartaxis[a]);
					var adjustEnd = dgrid.numberColumn("adjustEnd","ADJUSTEND",querychartaxis[a]);
					var dashSize = dgrid.numberColumn("dashSize","DASHSIZE",querychartaxis[a]);
					var hidden = dgrid.numberColumn("hidden","HIDDEN",querychartaxis[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartaxis[a]);
					var length = dgrid.numberColumn("length","LENGTH",querychartaxis[a]);
					var majorTickSteps = dgrid.numberColumn("majorTickSteps","MAJORTICKSTEPS",querychartaxis[a]);
					var minorTickSteps = dgrid.numberColumn("minorTickSteps","MINORTICKSTEPS",querychartaxis[a]);
					var width = dgrid.numberColumn("width","WIDTH",querychartaxis[a]);
					var calculateCategoryCount = dgrid.numberColumn("calculateCategoryCount","CALCULATECATEGORYCOUNT",querychartaxis[a]);
					var categoryNames = dgrid.stringColumn("categoryNames","CATEGORYNAMES",querychartaxis[a]);

				} else if (trim(querychartaxis[a].getAXISTYPE()) == "gauge") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "position");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "fields");
					ArrayAppend(ca, "grid");
					ArrayAppend(ca, "adjustEnd");
					ArrayAppend(ca, "dashSize");
					ArrayAppend(ca, "hidden");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "length");
					ArrayAppend(ca, "majorTickSteps");
					ArrayAppend(ca, "minorTickSteps");
					ArrayAppend(ca, "width");
					ArrayAppend(ca, "margin");
					ArrayAppend(ca, "maximum");
					ArrayAppend(ca, "minimum");
					ArrayAppend(ca, "steps");

					var type = dgrid.stringColumn("type","AXISTYPE",querychartaxis[a]);
					var position = dgrid.stringColumn("position","POSITION",querychartaxis[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartaxis[a]);
					var fields = dgrid.numberColumn("fields","FIELDS",querychartaxis[a]);
					var grid = dgrid.numberColumn("grid","GRID",querychartaxis[a]);
					var adjustEnd = dgrid.numberColumn("adjustEnd","ADJUSTEND",querychartaxis[a]);
					var dashSize = dgrid.numberColumn("dashSize","DASHSIZE",querychartaxis[a]);
					var hidden = dgrid.numberColumn("hidden","HIDDEN",querychartaxis[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartaxis[a]);
					var length = dgrid.numberColumn("length","LENGTH",querychartaxis[a]);
					var majorTickSteps = dgrid.numberColumn("majorTickSteps","MAJORTICKSTEPS",querychartaxis[a]);
					var minorTickSteps = dgrid.numberColumn("minorTickSteps","MINORTICKSTEPS",querychartaxis[a]);
					var width = dgrid.numberColumn("width","WIDTH",querychartaxis[a]);
					var margin = dgrid.numberColumn("margin","MARGIN",querychartaxis[a]);
					var maximum = dgrid.numberColumn("maximum","MAXIMUM",querychartaxis[a]);
					var minimum = dgrid.numberColumn("minimum","MINIMUM",querychartaxis[a]);
					var steps = dgrid.numberColumn("steps","STEPS",querychartaxis[a]);

				} else if (trim(querychartaxis[a].getAXISTYPE()) == "Time") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "position");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "fields");
					ArrayAppend(ca, "grid");
					ArrayAppend(ca, "adjustEnd");
					ArrayAppend(ca, "dashSize");
					ArrayAppend(ca, "hidden");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "length");
					ArrayAppend(ca, "majorTickSteps");
					ArrayAppend(ca, "minorTickSteps");
					ArrayAppend(ca, "width");
					ArrayAppend(ca, "maximum");
					ArrayAppend(ca, "minimum");
					ArrayAppend(ca, "steps");
					ArrayAppend(ca, "adjustMaximumByMajorUnit");
					ArrayAppend(ca, "adjustMinimumByMajorUnit");
					ArrayAppend(ca, "constrain");
					ArrayAppend(ca, "decimals");
					ArrayAppend(ca, "fromDate");
					ArrayAppend(ca, "toDate");
					ArrayAppend(ca, "dateFormat");

					var type = dgrid.stringColumn("type","AXISTYPE",querychartaxis[a]);
					var position = dgrid.stringColumn("position","POSITION",querychartaxis[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartaxis[a]);
					var fields = dgrid.numberColumn("fields","FIELDS",querychartaxis[a]);
					var grid = dgrid.numberColumn("grid","GRID",querychartaxis[a]);
					var adjustEnd = dgrid.numberColumn("adjustEnd","ADJUSTEND",querychartaxis[a]);
					var dashSize = dgrid.numberColumn("dashSize","DASHSIZE",querychartaxis[a]);
					var hidden = dgrid.numberColumn("hidden","HIDDEN",querychartaxis[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartaxis[a]);
					var length = dgrid.numberColumn("length","LENGTH",querychartaxis[a]);
					var majorTickSteps = dgrid.numberColumn("majorTickSteps","MAJORTICKSTEPS",querychartaxis[a]);
					var minorTickSteps = dgrid.numberColumn("minorTickSteps","MINORTICKSTEPS",querychartaxis[a]);
					var width = dgrid.numberColumn("width","WIDTH",querychartaxis[a]);
					var maximum = dgrid.numberColumn("maximum","MAXIMUM",querychartaxis[a]);
					var minimum = dgrid.numberColumn("minimum","MINIMUM",querychartaxis[a]);
					var steps = dgrid.numberColumn("steps","STEPS",querychartaxis[a]);
					var adjustMaximumByMajorUnit = dgrid.numberColumn("adjustMaximumByMajorUnit","ADJUSTMAXIMUMBYMAJORUNIT",querychartaxis[a]);
					var adjustMinimumByMajorUnit = dgrid.numberColumn("adjustMinimumByMajorUnit","ADJUSTMINIMUMBYMAJORUNIT",querychartaxis[a]);
					var constrain = dgrid.numberColumn("constrain","CONSTRAIN",querychartaxis[a]);
					var decimals = dgrid.numberColumn("decimals","DECIMALS",querychartaxis[a]);
					var fromDate = dgrid.stringOrObjectOrFunction("fromDate","FROMDATE",querychartaxis[a]);
					var toDate = dgrid.stringOrObjectOrFunction("toDate","TODATE",querychartaxis[a]);
					var dateFormat = dgrid.stringOrObjectOrFunction("dateFormat","DATEFORMAT",querychartaxis[a]);

				} // end if statement

				// --------------------------------------------------- //start loop over chart axis properties and define their corresponding variables
				for (b = 1; b <= ArrayLen(ca); b++) {
					if (trim(evaluate("#ca[b]#")) neq "") {
						WriteOutput(evaluate("#ca[b]#") & "
		");
					}
				}
				// ---------------------------------------------------- // end chart axis variable declaration

				//_________________________________________________________Code terminating extra
				if (trim(querychartaxis[a].getAXISEXTRA()) neq "") {
					WriteOutput("#trim(querychartaxis[a].getAXISEXTRA())#,
		");
				}
				var di = trim(querychartaxis[a].getCHARTAXISCODE());
				WriteOutput("action: '#Hash(di)#'
	");
				WriteOutput("}");
				if (a != ArrayLen(querychartaxis)) WriteOutput(",");
				//_________________________________________________________End code terminating extra

			} // end for loop
			WriteOutput("]");

		}

		return axesdef;
	}


	public string function prepareChartSeries(querychartseries, dgrid) {

		SaveContent variable="seriesdef" {
			WriteOutput("[");
			for (var a = 1; a <= ArrayLen(querychartseries); a++) {
				WriteOutput("{");
				if (trim(querychartseries[a].getTYPE()) == "area") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "highlight");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "listeners");
					ArrayAppend(ca, "renderer");
					ArrayAppend(ca, "shadowAttributes");
					ArrayAppend(ca, "showInLegend");
					ArrayAppend(ca, "tips");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "axis");
					ArrayAppend(ca, "xField");
					ArrayAppend(ca, "yField");
					ArrayAppend(ca, "style");

					var type = dgrid.stringColumn("type","TYPE",querychartseries[a]);
					var highlight = dgrid.numberColumn("highlight","HIGHLIGHT",querychartseries[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartseries[a]);
					var listeners = dgrid.numberColumn("listeners","LISTENERS",querychartseries[a]);
					var renderer = dgrid.stringOrObjectOrFunction("renderer","RENDERER",querychartseries[a]);
					var shadowAttributes = dgrid.numberColumn("shadowAttributes","SHADOWATTRIBUTES",querychartseries[a]);
					var showInLegend = dgrid.numberColumn("showInLegend","SHOWINLEGEND",querychartseries[a]);
					var tips = dgrid.numberColumn("tips","TIPS",querychartseries[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartseries[a]);
					var axis = dgrid.stringOrObjectOrFunction("axis","AXIS",querychartseries[a]);
					var xField = dgrid.stringOrObjectOrFunction("xField","XFIELD",querychartseries[a]);
					var yField = dgrid.stringOrObjectOrFunction("yField","YFIELD",querychartseries[a]);
					var style = dgrid.numberColumn("style","STYLE",querychartseries[a]);

				} else if (trim(querychartseries[a].getTYPE()) == "bar") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "highlight");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "listeners");
					ArrayAppend(ca, "renderer");
					ArrayAppend(ca, "shadowAttributes");
					ArrayAppend(ca, "showInLegend");
					ArrayAppend(ca, "tips");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "axis");
					ArrayAppend(ca, "xField");
					ArrayAppend(ca, "yField");
					ArrayAppend(ca, "style");
					ArrayAppend(ca, "column");
					ArrayAppend(ca, "groupGutter");
					ArrayAppend(ca, "gutter");
					ArrayAppend(ca, "stacked");
					ArrayAppend(ca, "xPadding");
					ArrayAppend(ca, "yPadding");

					var type = dgrid.stringColumn("type","TYPE",querychartseries[a]);
					var highlight = dgrid.numberColumn("highlight","HIGHLIGHT",querychartseries[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartseries[a]);
					var listeners = dgrid.numberColumn("listeners","LISTENERS",querychartseries[a]);
					var renderer = dgrid.stringOrObjectOrFunction("renderer","RENDERER",querychartseries[a]);
					var shadowAttributes = dgrid.numberColumn("shadowAttributes","SHADOWATTRIBUTES",querychartseries[a]);
					var showInLegend = dgrid.numberColumn("showInLegend","SHOWINLEGEND",querychartseries[a]);
					var tips = dgrid.numberColumn("tips","TIPS",querychartseries[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartseries[a]);
					var axis = dgrid.stringOrObjectOrFunction("axis","AXIS",querychartseries[a]);
					var xField = dgrid.stringOrObjectOrFunction("xField","XFIELD",querychartseries[a]);
					var yField = dgrid.stringOrObjectOrFunction("yField","YFIELD",querychartseries[a]);
					var style = dgrid.numberColumn("style","STYLE",querychartseries[a]);
					var column = dgrid.numberColumn("column","COLUMN",querychartseries[a]);
					var groupGutter = dgrid.numberColumn("groupGutter","GROUPGUTTER",querychartseries[a]);
					var gutter = dgrid.numberColumn("gutter","GUTTER",querychartseries[a]);
					var stacked = dgrid.numberColumn("stacked","STACKED",querychartseries[a]);
					var xPadding = dgrid.numberColumn("xPadding","XPADDING",querychartseries[a]);
					var yPadding = dgrid.numberColumn("yPadding","YPADDING",querychartseries[a]);

				} else if (trim(querychartseries[a].getTYPE()) == "column") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "highlight");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "listeners");
					ArrayAppend(ca, "renderer");
					ArrayAppend(ca, "shadowAttributes");
					ArrayAppend(ca, "showInLegend");
					ArrayAppend(ca, "tips");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "axis");
					ArrayAppend(ca, "xField");
					ArrayAppend(ca, "yField");
					ArrayAppend(ca, "style");
					ArrayAppend(ca, "column");
					ArrayAppend(ca, "groupGutter");
					ArrayAppend(ca, "gutter");
					ArrayAppend(ca, "stacked");
					ArrayAppend(ca, "xPadding");
					ArrayAppend(ca, "yPadding");

					var type = dgrid.stringColumn("type","TYPE",querychartseries[a]);
					var highlight = dgrid.numberColumn("highlight","HIGHLIGHT",querychartseries[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartseries[a]);
					var listeners = dgrid.numberColumn("listeners","LISTENERS",querychartseries[a]);
					var renderer = dgrid.stringOrObjectOrFunction("renderer","RENDERER",querychartseries[a]);
					var shadowAttributes = dgrid.numberColumn("shadowAttributes","SHADOWATTRIBUTES",querychartseries[a]);
					var showInLegend = dgrid.numberColumn("showInLegend","SHOWINLEGEND",querychartseries[a]);
					var tips = dgrid.numberColumn("tips","TIPS",querychartseries[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartseries[a]);
					var axis = dgrid.stringOrObjectOrFunction("axis","AXIS",querychartseries[a]);
					var xField = dgrid.stringOrObjectOrFunction("xField","XFIELD",querychartseries[a]);
					var yField = dgrid.stringOrObjectOrFunction("yField","YFIELD",querychartseries[a]);
					var style = dgrid.numberColumn("style","STYLE",querychartseries[a]);
					var column = dgrid.numberColumn("column","COLUMN",querychartseries[a]);
					var groupGutter = dgrid.numberColumn("groupGutter","GROUPGUTTER",querychartseries[a]);
					var gutter = dgrid.numberColumn("gutter","GUTTER",querychartseries[a]);
					var stacked = dgrid.numberColumn("stacked","STACKED",querychartseries[a]);
					var xPadding = dgrid.numberColumn("xPadding","XPADDING",querychartseries[a]);
					var yPadding = dgrid.numberColumn("yPadding","YPADDING",querychartseries[a]);

				} else if (trim(querychartseries[a].getTYPE()) == "gauge") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "highlight");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "listeners");
					ArrayAppend(ca, "renderer");
					ArrayAppend(ca, "shadowAttributes");
					ArrayAppend(ca, "showInLegend");
					ArrayAppend(ca, "tips");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "style");
					ArrayAppend(ca, "angleField");
					ArrayAppend(ca, "donut");
					ArrayAppend(ca, "highlightDuration");
					ArrayAppend(ca, "needle");
					ArrayAppend(ca, "field");
					ArrayAppend(ca, "colorSet");
					ArrayAppend(ca, "lengthField");

					var type = dgrid.stringColumn("type","TYPE",querychartseries[a]);
					var highlight = dgrid.numberColumn("highlight","HIGHLIGHT",querychartseries[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartseries[a]);
					var listeners = dgrid.numberColumn("listeners","LISTENERS",querychartseries[a]);
					var renderer = dgrid.stringOrObjectOrFunction("renderer","RENDERER",querychartseries[a]);
					var shadowAttributes = dgrid.numberColumn("shadowAttributes","SHADOWATTRIBUTES",querychartseries[a]);
					var showInLegend = dgrid.numberColumn("showInLegend","SHOWINLEGEND",querychartseries[a]);
					var tips = dgrid.numberColumn("tips","TIPS",querychartseries[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartseries[a]);
					var style = dgrid.numberColumn("style","STYLE",querychartseries[a]);
					var angleField = dgrid.stringColumn("angleField","ANGLEFIELD",querychartseries[a]);
					var donut = dgrid.numberColumn("donut","DONUT",querychartseries[a]);
					var highlightDuration = dgrid.numberColumn("highlightDuration","HIGHLIGHTDURATION",querychartseries[a]);
					var needle = dgrid.numberColumn("needle","NEEDLE",querychartseries[a]);
					var colorSet = dgrid.numberColumn("colorSet","COLORSET",querychartseries[a]);
					var field = dgrid.stringColumn("field","FIELD",querychartseries[a]);
					var lengthField = dgrid.stringColumn("lengthField","LENGTHFIELD",querychartseries[a]);

				} else if (trim(querychartseries[a].getTYPE()) == "line") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "highlight");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "listeners");
					ArrayAppend(ca, "renderer");
					ArrayAppend(ca, "shadowAttributes");
					ArrayAppend(ca, "showInLegend");
					ArrayAppend(ca, "tips");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "axis");
					ArrayAppend(ca, "xField");
					ArrayAppend(ca, "yField");
					ArrayAppend(ca, "style");
					ArrayAppend(ca, "fill");
					ArrayAppend(ca, "markerConfig");
					ArrayAppend(ca, "selectionTolerance");
					ArrayAppend(ca, "showMarkers");
					ArrayAppend(ca, "smooth");

					var type = dgrid.stringColumn("type","TYPE",querychartseries[a]);
					var highlight = dgrid.numberColumn("highlight","HIGHLIGHT",querychartseries[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartseries[a]);
					var listeners = dgrid.numberColumn("listeners","LISTENERS",querychartseries[a]);
					var renderer = dgrid.stringOrObjectOrFunction("renderer","RENDERER",querychartseries[a]);
					var shadowAttributes = dgrid.numberColumn("shadowAttributes","SHADOWATTRIBUTES",querychartseries[a]);
					var showInLegend = dgrid.numberColumn("showInLegend","SHOWINLEGEND",querychartseries[a]);
					var tips = dgrid.numberColumn("tips","TIPS",querychartseries[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartseries[a]);
					var axis = dgrid.stringOrObjectOrFunction("axis","AXIS",querychartseries[a]);
					var xField = dgrid.stringOrObjectOrFunction("xField","XFIELD",querychartseries[a]);
					var yField = dgrid.stringOrObjectOrFunction("yField","YFIELD",querychartseries[a]);
					var style = dgrid.numberColumn("style","STYLE",querychartseries[a]);
					var fill = dgrid.numberColumn("fill","FILL",querychartseries[a]);
					var markerConfig = dgrid.numberColumn("markerConfig","MARKERCONFIG",querychartseries[a]);
					var selectionTolerance = dgrid.numberColumn("selectionTolerance","SELECTIONTOLERANCE",querychartseries[a]);
					var showMarkers = dgrid.numberColumn("showMarkers","SHOWMARKERS",querychartseries[a]);
					var smooth = dgrid.numberColumn("smooth","SMOOTH",querychartseries[a]);

				} else if (trim(querychartseries[a].getTYPE()) == "pie") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "highlight");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "listeners");
					ArrayAppend(ca, "renderer");
					ArrayAppend(ca, "shadowAttributes");
					ArrayAppend(ca, "showInLegend");
					ArrayAppend(ca, "tips");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "xField");
					ArrayAppend(ca, "style");
					ArrayAppend(ca, "angleField");
					ArrayAppend(ca, "donut");
					ArrayAppend(ca, "highlightDuration");
					ArrayAppend(ca, "colorSet");
					ArrayAppend(ca, "field");
					ArrayAppend(ca, "lengthField");

					var type = dgrid.stringColumn("type","TYPE",querychartseries[a]);
					var highlight = dgrid.numberColumn("highlight","HIGHLIGHT",querychartseries[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartseries[a]);
					var listeners = dgrid.numberColumn("listeners","LISTENERS",querychartseries[a]);
					var renderer = dgrid.stringOrObjectOrFunction("renderer","RENDERER",querychartseries[a]);
					var shadowAttributes = dgrid.numberColumn("shadowAttributes","SHADOWATTRIBUTES",querychartseries[a]);
					var showInLegend = dgrid.numberColumn("showInLegend","SHOWINLEGEND",querychartseries[a]);
					var tips = dgrid.numberColumn("tips","TIPS",querychartseries[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartseries[a]);
					var xField = dgrid.stringOrObjectOrFunction("xField","XFIELD",querychartseries[a]);
					var style = dgrid.numberColumn("style","STYLE",querychartseries[a]);
					var angleField = dgrid.stringColumn("angleField","ANGLEFIELD",querychartseries[a]);
					var donut = dgrid.numberColumn("donut","DONUT",querychartseries[a]);
					var highlightDuration = dgrid.numberColumn("highlightDuration","HIGHLIGHTDURATION",querychartseries[a]);
					var colorSet = dgrid.numberColumn("colorSet","COLORSET",querychartseries[a]);
					var field = dgrid.stringColumn("field","FIELD",querychartseries[a]);
					var lengthField = dgrid.stringColumn("lengthField","LENGTHFIELD",querychartseries[a]);

				} else if (trim(querychartseries[a].getTYPE()) == "radar") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "highlight");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "listeners");
					ArrayAppend(ca, "renderer");
					ArrayAppend(ca, "shadowAttributes");
					ArrayAppend(ca, "showInLegend");
					ArrayAppend(ca, "tips");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "xField");
					ArrayAppend(ca, "yField");
					ArrayAppend(ca, "style");
					ArrayAppend(ca, "markerConfig");
					ArrayAppend(ca, "showMarkers");

					var type = dgrid.stringColumn("type","TYPE",querychartseries[a]);
					var highlight = dgrid.numberColumn("highlight","HIGHLIGHT",querychartseries[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartseries[a]);
					var listeners = dgrid.numberColumn("listeners","LISTENERS",querychartseries[a]);
					var renderer = dgrid.stringOrObjectOrFunction("renderer","RENDERER",querychartseries[a]);
					var shadowAttributes = dgrid.numberColumn("shadowAttributes","SHADOWATTRIBUTES",querychartseries[a]);
					var showInLegend = dgrid.numberColumn("showInLegend","SHOWINLEGEND",querychartseries[a]);
					var tips = dgrid.numberColumn("tips","TIPS",querychartseries[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartseries[a]);
					var xField = dgrid.stringOrObjectOrFunction("xField","XFIELD",querychartseries[a]);
					var yField = dgrid.stringOrObjectOrFunction("yField","YFIELD",querychartseries[a]);
					var style = dgrid.numberColumn("style","STYLE",querychartseries[a]);
					var markerConfig = dgrid.numberColumn("markerConfig","MARKERCONFIG",querychartseries[a]);
					var showMarkers = dgrid.numberColumn("showMarkers","SHOWMARKERS",querychartseries[a]);

				} else if (trim(querychartseries[a].getTYPE()) == "scatter") {
					var ca = ArrayNew(1);
					ArrayAppend(ca, "type");
					ArrayAppend(ca, "highlight");
					ArrayAppend(ca, "label");
					ArrayAppend(ca, "listeners");
					ArrayAppend(ca, "renderer");
					ArrayAppend(ca, "shadowAttributes");
					ArrayAppend(ca, "showInLegend");
					ArrayAppend(ca, "tips");
					ArrayAppend(ca, "title");
					ArrayAppend(ca, "axis");
					ArrayAppend(ca, "xField");
					ArrayAppend(ca, "yField");
					ArrayAppend(ca, "style");
					ArrayAppend(ca, "markerConfig");

					var type = dgrid.stringColumn("type","TYPE",querychartseries[a]);
					var highlight = dgrid.numberColumn("highlight","HIGHLIGHT",querychartseries[a]);
					var label = dgrid.numberColumn("label","LABEL",querychartseries[a]);
					var listeners = dgrid.numberColumn("listeners","LISTENERS",querychartseries[a]);
					var renderer = dgrid.stringOrObjectOrFunction("renderer","RENDERER",querychartseries[a]);
					var shadowAttributes = dgrid.numberColumn("shadowAttributes","SHADOWATTRIBUTES",querychartseries[a]);
					var showInLegend = dgrid.numberColumn("showInLegend","SHOWINLEGEND",querychartseries[a]);
					var tips = dgrid.numberColumn("tips","TIPS",querychartseries[a]);
					var title = dgrid.stringColumn("title","TITLE",querychartseries[a]);
					var axis = dgrid.stringOrObjectOrFunction("axis","AXIS",querychartseries[a]);
					var xField = dgrid.stringOrObjectOrFunction("xField","XFIELD",querychartseries[a]);
					var yField = dgrid.stringOrObjectOrFunction("yField","YFIELD",querychartseries[a]);
					var style = dgrid.numberColumn("style","STYLE",querychartseries[a]);
					var markerConfig = dgrid.numberColumn("markerConfig","MARKERCONFIG",querychartseries[a]);

				} // end if statement

				// --------------------------------------------------- //start loop over chart series properties and define their corresponding variables
				for (b = 1; b <= ArrayLen(ca); b++) {
					if (trim(evaluate("#ca[b]#")) neq "") {
						WriteOutput(evaluate("#ca[b]#") & "
		");
					}
				}
				// ---------------------------------------------------- // end chart series variable declaration

				//_________________________________________________________Code terminating extra
				if (trim(querychartseries[a].getSERIESEXTRA()) neq "") {
					WriteOutput("#trim(querychartseries[a].getSERIESEXTRA())#,
				");
				}
				var di = trim(querychartseries[a].getCHARTSERIESCODE());
				WriteOutput("action: '#Hash(di)#'
	");
				WriteOutput("}");
				if (a != ArrayLen(querychartseries)) WriteOutput(",");
				//_________________________________________________________End code terminating extra

			} // end for loop
			WriteOutput("]");

		}

		return seriesdef;
	}

}