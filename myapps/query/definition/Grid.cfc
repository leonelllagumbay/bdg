/**
 * Preview
 *
 * @author LEONELL
 * @date 3/31/15
 **/
component accessors=true output=false persistent=false ExtDirect="true" {
	public struct function getGridDefinition(required string querycode, required any qrygrid) ExtDirect="true" {
		var ret = structNew();
		querygrid = qrygrid;
		try {
			querycode = trim(querycode);

			tablecolumnArr = OrmExecuteQuery("SELECT EVIEWFIELDCODE, TABLENAME, FIELDNAME, FIELDALIAS FROM EGRGEVIEWFIELDS WHERE EQRYCODEFK = '#querycode#' ORDER BY COLUMNORDER ASC",false);

			querycodeAsNameSpace = ucase("NS_" & rereplace(querycode, "\W", "", "all"));
			session.companycode = ucase(session.companycode);
			setModel(querycode, tablecolumnArr, querycodeAsNameSpace, querygrid);
			setStore(querycode);
			setView(querycode);
			setController(querycode);
			var jsfile = setRequiredFiles();
			setApp(querycode, jsfile, querycodeAsNameSpace);
			setData(querycode);

			ret["success"] = true;
			ret["message"] = "Successful operation!";
		} catch(Any e) {
			ret["success"] = false;
			ret["message"] = e.message & " - " & e.detail;
		}
		return ret;
	}

public void function setModel(required string querycode, array tablecolumnArr, string querycodeAsNameSpace, querygrid) {
/* query egrgeviewfields => tablename, fieldname
 query egrgqrycolumn => outputtype */

/* Save content */
SaveContent variable="model" {
WriteOutput("Ext.define('Form.model.queryoutput.#session.companycode#.#querycodeAsNameSpace#.Model', {
	extend: 'Ext.data.Model',
");
var mapfield = querygrid.getSTOREFIELDS();
if (!IsDefined("mapfield")) var mapfield = "";
WriteOutput("	fields: [");
for(a=1; a<=ArrayLen(tablecolumnArr); a++) {
	var type = OrmExecuteQuery("SELECT OUTPUTTYPE FROM EGRGQRYCOLUMN WHERE EVIEWFIELDCODE = '#tablecolumnArr[a][1]#'",true);
	if(Isdefined("type")) {
		if(trim(type) eq "") {
			type = "string";
		} else if (trim(type) eq "checkcolumn") {
			type = "boolean";
		} else if (trim(type) eq "rownumberer") {
			type = "int";
		} else if (trim(type) eq "actioncolumn" || trim(type) eq "templatecolumn") {
			type = "string";
		} // else use the real value
	} else {
		type = "string";
	}
	if (ListLen(mapfield,",") >= a) {
		WriteOutput("{
			name: '#trim(tablecolumnArr[a][2])#-#trim(tablecolumnArr[a][3])#',
			mapping: '#ListGetAt(mapfield,a,',')#',
			type: '#type#'
		}");
	} else {
		WriteOutput("{
			name: '#trim(tablecolumnArr[a][2])#-#trim(tablecolumnArr[a][3])#',
			type: '#type#'
		}");
	}

	if (ArrayLen(tablecolumnArr) != a) WriteOutput(",");
}
WriteOutput("]");
WriteOutput("
});");

} /* End save content */

	var dpath = ExpandPath("../../../app/model/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "Model.js", model, "utf-8");
}

private void function setStore(required string querycode) {

	var timeout = querygrid.getSTORETIMEOUT();
	if(Isdefined("timeout")) {
		if(trim(timeout) eq "") timeout = 300000;
	} else {
		timeout = 300000;
	}

	var sautoload = querygrid.getSTOREAUTOLOAD();
	if(Isdefined("sautoload")) {
		if(trim(sautoload) eq "") sautoload = "true";
	} else {
		sautoload = "true";
	}

	var pagesize = querygrid.getSTOREPAGESIZE();
	if(Isdefined("pagesize")) {
		if(trim(pagesize) eq "") pagesize = 25;
	} else {
		pagesize = 25;
	}

	var sorters = querygrid.getSTORESORTERS();
	if(Isdefined("sorters")) {
		if(trim(sorters) eq "") {
			/* Get the first column by default */
			var sortersArray = ArrayNew(1);
			for(a=1; a<=1; a++) {
				nametypeStruct = StructNew();
				nametypeStruct["property"] = trim(tablecolumnArr[a][2]) & "-" & trim(tablecolumnArr[a][3]);
				nametypeStruct["direction"] = "ASC";
				ArrayAppend(sortersArray, nametypeStruct);
			}
			sorters = Serializejson(sortersArray);
		} else {
			/* Detect string from array */
			sorters = trim(sorters);
			if(left(sorters,1) neq "[" && right(sorters,1) neq "]") {
				sorters = "[{ property: '#sorters#', direction: 'ASC'}]";
			}
		}
	} else {
		/* Get the first column by default */
		var sortersArray = ArrayNew(1);
		for(a=1; a<=1; a++) {
			nametypeStruct = StructNew();
			nametypeStruct["property"] = trim(tablecolumnArr[a][2]) & "-" & trim(tablecolumnArr[a][3]);
			nametypeStruct["direction"] = "ASC";
			ArrayAppend(sortersArray, nametypeStruct);
		}
		sorters = Serializejson(sortersArray);
	}

	var filters = querygrid.getSTOREFILTERS();
	if(Isdefined("filters")) {
		if(trim(filters) eq "") {
			/* Get the first column by default */
			var filtersArray = ArrayNew(1);
			for(a=1; a<=1; a++) {
				nametypeStruct = StructNew();
				nametypeStruct["dataIndex"] = trim(tablecolumnArr[a][2]) & "-" & trim(tablecolumnArr[a][3]);
				var type = OrmExecuteQuery("SELECT OUTPUTTYPE FROM EGRGQRYCOLUMN WHERE EVIEWFIELDCODE = '#tablecolumnArr[a][1]#'",true);
				if(Isdefined("type")) {
					if(trim(type) eq "") {
						type = "string";
					}
				} else {
					type = "string";
				}
				nametypeStruct["type"] = type;
				ArrayAppend(filtersArray, nametypeStruct);
			}
			filters = Serializejson(filtersArray);
		} else {
			/* detect string from array */
			filters = trim(filters);
			if(left(filters,1) neq "[" && right(filters,1) neq "]") {
				filters = "[{ dataIndex: '#filters#', type: 'string'}]";
			}
		}
	} else {
		/* Get the first column by default */
		var filtersArray = ArrayNew(1);
		for(a=1; a<=1; a++) {
			nametypeStruct = StructNew();
			nametypeStruct["dataIndex"] = trim(tablecolumnArr[a][2]) & "-" & trim(tablecolumnArr[a][3]);
			var type = OrmExecuteQuery("SELECT OUTPUTTYPE FROM EGRGQRYCOLUMN WHERE EVIEWFIELDCODE = '#tablecolumnArr[a][1]#'",true);
				if(Isdefined("type")) {
					if(trim(type) eq "") {
						type = "string";
					}
				} else {
					type = "string";
				}
				nametypeStruct["type"] = type;
			ArrayAppend(filtersArray, nametypeStruct);
		}
		filters = Serializejson(filtersArray);
	}

	var storegroupfield = querygrid.getGROUPFIELD();
	if(Isdefined("storegroupfield")) {
		if(trim(storegroupfield) eq "") storegroupfield = "";
		else storegroupfield = "groupField: '#storegroupfield#',";
	} else {
		storegroupfield = "";
	}

	/* Store Extra -------------------------------- */
		var storeextradefault = "remoteFilter: true,
	remoteSort: true,
	simpleSortMode: true,
	autoLoad: #sautoload#,
	autoSave: true,
	autoSync: true,
	#storegroupfield#
	sorters: #sorters#,
	filters: #filters#,
	pageSize: #pagesize#,";
		var storeextra = querygrid.getSTOREEXTRA();
		if(Isdefined("storeextra")) {
			if(trim(storeextra) eq "") {
				storeextra = storeextradefault;
			} else {
				storeextra = "#storeextra#,";
			}
		} else {
			storeextra = storeextradefault;
		}
		/* End Store Extra*/

		/* Proxy Type -------------*/
		var proxytypedefault = "direct";
		var proxytype = querygrid.getPROXYTYPE();
		if(Isdefined("proxytype")) {
			if(trim(proxytype) eq "") {
				proxytype = proxytypedefault;
			}
		} else {
			proxytype = proxytypedefault;
		}
		/* End Proxy Type ---------*/

		/* Proxy Reader -------------*/
		var proxyreaderdefault = "{
					root: 'topics',
					totalProperty: 'totalCount'
				}";
		var proxyreader = querygrid.getPROXYREADER();
		if(Isdefined("proxyreader")) {
			if(trim(proxyreader) eq "") {
				proxyreader = proxyreaderdefault;
			}
		} else {
			proxyreader = proxyreaderdefault;
		}
		/* End Proxy Reader ---------*/

		/* Proxy Writer -------------*/
		var proxywriterdefault = "";
		var proxywriter = querygrid.getPROXYWRITER();
		if(Isdefined("proxywriter")) {
			if(trim(proxywriter) eq "") {
				proxywriter = proxywriterdefault;
			} else {
				proxywriter = "writer: #proxywriter#,";
			}
		} else {
			proxywriter = proxywriterdefault;
		}
		/* End Proxy Writer ---------*/

		/* Proxy Url -------------*/
		var proxyurldefault = "";
		var proxyurl = querygrid.getPROXYURL();
		if(Isdefined("proxyurl")) {
			if(trim(proxyurl) eq "") {
				proxyurl = proxyurldefault;
			} else {
				proxyurl = "url: '#proxyurl#',";
			}
		} else {
			proxyurl = proxyurldefault;
		}
		/* End Proxy Url ---------*/

		/* Proxy Extra ----------------------------------------------------------------------------------------*/
		var storeproxyextradefault = "timeout: #timeout#,
				extraParams: {
					querycode: '#querycode#',
					extraparams: {}
				},
				paramOrder: ['page', 'start', 'limit', 'sort', 'filter', 'querycode', 'extraparams'],
				api: {
					create:  Ext.#querycodeAsNameSpace#.Data.Create,
					read:    Ext.#querycodeAsNameSpace#.Data.Read,
					update:  Ext.#querycodeAsNameSpace#.Data.Update,
					destroy: Ext.#querycodeAsNameSpace#.Data.Destroy
				},
				paramsAsHash: false,
				filterParam: 'filter',
				sortParam: 'sort',
				limitParam: 'limit',
				idParam: 'ID',
				pageParam: 'page',";
		var storeproxyextra = querygrid.getSTOREPROXYEXTRA();
		if(Isdefined("storeproxyextra")) {
			if(trim(storeproxyextra) eq "") {
				storeproxyextra = storeproxyextradefault;
			}
		} else {
			storeproxyextra = storeproxyextradefault;
		}
		/* End Proxy Extra ----------------------------------------------------------------------------------------*/

SaveContent variable="store" {
WriteOutput("Ext.define('Form.store.queryoutput.#session.companycode#.#querycodeAsNameSpace#.Store', {
	extend: 'Ext.data.Store',
	model: 'Form.model.queryoutput.#session.companycode#.#querycodeAsNameSpace#.Model',
	#storeextra#
	constructor : function(config) {
		Ext.applyIf(config, {
			proxy  : {
				type: '#proxytype#',
				reader: #proxyreader#,
				#proxywriter#
				#proxyurl#
				#storeproxyextra#
			}
		});
	this.callParent([config]);
	}
});");

} // End save content

	var dpath = ExpandPath("../../../app/store/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "Store.js", store, "utf-8");
}

private void function setView(required string querycode) {

	var dgrid = CreateObject("component", "GridHelper");
	var ca = dgrid.prepareGridColumnArray();
	var columnStringItems = dgrid.prepareGridColumn(tablecolumnArr, ca);

	var title = dgrid.stringColumn("title","QRYTITLE",querygrid);
	var titleAlign = dgrid.stringColumn("titleAlign","TITLEALIGN",querygrid);
	var activeItem = dgrid.numberOrStringColumn("activeItem","ACTIVEITEM",querygrid);
	var allowDeselect = dgrid.numberColumn("allowDeselect","ALLOWDESELECT",querygrid);
	var anchorSize = dgrid.numberColumn("anchorSize","ANCHORSIZE",querygrid);
	var columnWidth = dgrid.numberOrStringColumn("columnWidth","COLUMNWIDTH",querygrid);
	var width = dgrid.numberColumn("width","WIDTH",querygrid);
	var height = dgrid.numberColumn("height","HEIGHT",querygrid);
	var maxHeight = dgrid.numberColumn("maxHeight","MAXHEIGHT",querygrid);
	var maxWidth = dgrid.numberColumn("maxWidth","MAXWIDTH",querygrid);
	var minHeight = dgrid.numberColumn("minHeight","MINHEIGHT",querygrid);
	var minWidth = dgrid.numberColumn("minWidth","MINWIDTH",querygrid);
	var minButtonWidth = dgrid.numberColumn("minButtonWidth","MINBUTTONWIDTH",querygrid);
	var margin = dgrid.numberOrStringColumn("margin","MARGIN",querygrid);
	var padding = dgrid.numberOrStringColumn("padding","PADDING",querygrid);
	var border = dgrid.numberOrStringColumn("border","BORDER",querygrid);
	var bodyBorder = dgrid.numberColumn("bodyBorder","BODYBORDER",querygrid);
	var bodyPadding = dgrid.numberOrStringColumn("bodyPadding","BODYPADDING",querygrid);
	var bodyStyle = dgrid.stringOrObjectOrFunction("bodyStyle","BODYSTYLE",querygrid);
	var shadow = dgrid.stringOrObjectOrFunction("shadow","SHADOW",querygrid);
	var shadowOffset = dgrid.numberColumn("shadowOffset","SHADOWOFFSET",querygrid);
	var style = dgrid.stringOrObjectOrFunction("style","STYLE",querygrid);
	var ui = dgrid.stringColumn("ui","QRYUI",querygrid);
	var autoScroll = dgrid.numberColumn("autoScroll","AUTOSCROLL",querygrid);
	var autoDestroy = dgrid.numberColumn("autoDestroy","AUTODESTROY",querygrid);
	var autoRender = dgrid.stringOrObjectOrFunction("autoRender","AUTORENDER",querygrid);
	var autoShow = dgrid.numberColumn("autoShow","AUTOSHOW",querygrid);
	var closable = dgrid.numberColumn("closable","CLOSABLE",querygrid);
	var collapsible = dgrid.numberColumn("collapsible","COLLAPSIBLE",querygrid);
	var draggable = dgrid.stringOrObjectOrFunction("draggable","DRAGGABLE",querygrid);
	var resizable = dgrid.stringOrObjectOrFunction("resizable","RESIZABLE",querygrid);
	var floatable = dgrid.numberColumn("floatable","FLOATABLE",querygrid);
	var toFrontOnShow = dgrid.numberColumn("toFrontOnShow","TOFRONTONSHOW",querygrid);
	var placeholder = dgrid.stringOrObjectOrFunction("placeholder","PLACEHOLDER",querygrid);
	var saveDelay = dgrid.numberColumn("saveDelay","SAVEDELAY",querygrid);
	var collapseFirst = dgrid.numberColumn("collapseFirst","COLLAPSEDFIRST",querygrid);
	var collapsed = dgrid.numberColumn("collapsed","COLLAPSED",querygrid);
	var disabled = dgrid.numberColumn("disabled","DISABLED",querygrid);
	var animCollapse = dgrid.numberColumn("animCollapse","ANIMCOLLAPSE",querygrid);
	var collapseDirection = dgrid.stringColumn("collapseDirection","COLLAPSEDIRECTION",querygrid);
	var collapseMode = dgrid.stringColumn("collapseMode","COLLAPSEMODE",querygrid);
	var disableSelection = dgrid.numberColumn("disableSelection","DISABLESELECTION",querygrid);
	var fixed = dgrid.numberColumn("fixed","FIXED",querygrid);
	var floating = dgrid.numberColumn("floating","FLOATING",querygrid);
	var resizeHandles = dgrid.stringColumn("resizeHandles","RESIZEHANDLES",querygrid);
	var titleCollapse = dgrid.numberColumn("titleCollapse","TITLECOLLAPSE",querygrid);
	var hidden = dgrid.numberColumn("hidden","HIDDEN",querygrid);
	var hideCollapseTool = dgrid.numberColumn("hideCollapseTool","HIDECOLLAPSETOOL",querygrid);
	var hideHeaders = dgrid.numberColumn("hideHeaders","HIDEHEADER",querygrid);
	var hideMode = dgrid.stringColumn("hideMode","HIDEMODE",querygrid);
	var rowLines = dgrid.numberColumn("rowLines","ROWLINES",querygrid);
	var simpleDrag = dgrid.numberColumn("simpleDrag","SIMPLEDRAG",querygrid);
	var enableColumnHide = dgrid.numberColumn("enableColumnHide","ENABLECOLUMNHIDE",querygrid);
	var enableColumnMove = dgrid.numberColumn("enableColumnMove","ENABLECOLUMNMOVE",querygrid);
	var enableColumnResize = dgrid.numberColumn("enableColumnResize","ENABLECOLUMNRESIZE",querygrid);
	var enableLocking = dgrid.numberColumn("enableLocking","ENABLELOCKING",querygrid);
	var placeholderCollapseHideMode = dgrid.numberColumn("placeholderCollapseHideMode","PLACEHOLDERCOLLAPSEHIDEMODE",querygrid);
	var overlapHeader = dgrid.numberColumn("overlapHeader","OVERLAPHEADER",querygrid);
	var manageHeight = dgrid.numberColumn("manageHeight","MANAGEHEIGHT",querygrid);
	var syncRowHeight = dgrid.numberColumn("syncRowHeight","SYNCROWHEIGHT",querygrid);
	var buttonAlign = dgrid.stringColumn("buttonAlign","BUTTONALIGN",querygrid);
	var headerPosition = dgrid.stringColumn("headerPosition","HEADERPOSITION",querygrid);
	var region = dgrid.stringColumn("region","REGION",querygrid);
	var scroll = dgrid.stringOrObjectOrFunction("scroll","SCROLL",querygrid);
	var overflowX = dgrid.stringColumn("overflowX","OVERFLOWX",querygrid);
	var overflowY = dgrid.stringColumn("overflowY","OVERFLOWY",querygrid);
	var emptyText = dgrid.stringColumn("emptyText","EMPTYTEXT",querygrid);
	var columnLines = dgrid.numberColumn("columnLines","COLUMNLINES",querygrid);
	var constrain = dgrid.numberColumn("constrain","QRYCONSTRAIN",querygrid);
	var constrainHeader = dgrid.numberColumn("constrainHeader","CONSTRAINHEADER",querygrid);
	var constrainTo = dgrid.stringOrObjectOrFunction("constrainTo","QRYCONSTRAINTO",querygrid);
	var constraintInsets = dgrid.stringOrObjectOrFunction("constraintInsets","CONSTRAINTINSETS",querygrid);
	var frame = dgrid.numberColumn("frame","FRAME",querygrid);
	var frameHeader = dgrid.numberColumn("frameHeader","FRAMEHEADER",querygrid);
	var glyph = dgrid.numberOrStringColumn("glyph","GLYPH",querygrid);
	var header = dgrid.stringOrObjectOrFunction("header","HEADER",querygrid);
	var items = dgrid.stringOrObjectOrFunction("items","ITEMS",querygrid);
	var dockedItems = dgrid.stringOrObjectOrFunction("dockedItems","DOCKEDITEMS",querygrid);
	var itemId = dgrid.stringColumn("itemId","ITEMID",querygrid);
	var sealedColumns = dgrid.numberColumn("sealedColumns","SEALEDCOLUMNS",querygrid);
	var selModel = dgrid.stringOrObjectOrFunction("selModel","SELMODEL",querygrid);
	var selType = dgrid.stringColumn("selType","SELTYPE",querygrid);
	var shrinkWrap = dgrid.numberColumn("shrinkWrap","SHRINKWRAP",querygrid);
	var shrinkWrapDock = dgrid.numberColumn("shrinkWrapDock","SHRINKWRAPDOCK",querygrid);
	var sortableColumns = dgrid.numberColumn("sortableColumns","SORTABLECOLUMNS",querygrid);
	var tpl = dgrid.stringOrObjectOrFunction("tpl","TPL",querygrid);
	var data = dgrid.numberColumn("data","QRYDATA",querygrid);
	var tplWriteMode = dgrid.stringColumn("tplWriteMode","TPLWRITEMODE",querygrid);
	var contentEl = dgrid.stringColumn("contentEl","CONTENTEL",querygrid);
	var renderData = dgrid.numberColumn("renderData","RENDERDATA",querygrid);
	var scrollDelta = dgrid.numberColumn("scrollDelta","SCROLLDELTA",querygrid);
	var html = dgrid.stringOrObjectOrFunction("html","HTML",querygrid);
	var verticalScroller = dgrid.numberColumn("verticalScroller","VERTICALSCROLLER",querygrid);
	var tbar = dgrid.numberColumn("tbar","TBAR",querygrid);
	var rbar = dgrid.numberColumn("rbar","RBAR",querygrid);
	var bbar = dgrid.numberColumn("bbar","BBAR",querygrid);
	var lbar = dgrid.numberColumn("lbar","LBAR",querygrid);
	var fbar = dgrid.numberColumn("fbar","FBAR",querygrid);
	var tools = dgrid.numberColumn("tools","TOOLS",querygrid);
	var buttons = dgrid.numberColumn("buttons","BUTTONS",querygrid);
	var icon = dgrid.stringColumn("icon","ICON",querygrid);
	var closeAction = dgrid.stringColumn("closeAction","CLOSEACTION",querygrid);
	var bubbleEvents = dgrid.stringOrObjectOrFunction("bubbleEvents","BUBBLEEVENTS",querygrid);
	var deferRowRender = dgrid.numberColumn("deferRowRender","DEFERROWRENDER",querygrid);
	var detachOnRemove = dgrid.numberColumn("detachOnRemove","DETACHONREMOVE",querygrid);
	var focusOnToFront = dgrid.numberColumn("focusOnToFront","FOCUSONTOFRONT",querygrid);
	var forceFit = dgrid.numberColumn("forceFit","FORCEFIT",querygrid);
	var formBind = dgrid.numberColumn("formBind","FORMBIND",querygrid);
	var loader = dgrid.numberColumn("loader","LOADER",querygrid);
	var baseCls = dgrid.stringColumn("baseCls","BASECLS",querygrid);
	var cls = dgrid.stringColumn("cls","CLS",querygrid);
	var bodyCls = dgrid.stringOrObjectOrFunction("bodyCls","BODYCLS",querygrid);
	var childEls = dgrid.numberColumn("childEls","CHILDELS",querygrid);
	var collapsedCls = dgrid.stringColumn("collapsedCls","COLLAPSEDCLS",querygrid);
	var componentCls = dgrid.stringColumn("componentCls","COMPONENTCLS",querygrid);
	var disabledCls = dgrid.stringColumn("disabledCls","DISABLEDCLS",querygrid);
	var headerOverCls = dgrid.stringColumn("headerOverCls","HEADEROVERCLS",querygrid);
	var iconCls = dgrid.stringColumn("iconCls","ICONCLS",querygrid);
	var overCls = dgrid.stringColumn("overCls","OVERCLS",querygrid);
	var firstCls = dgrid.stringColumn("firstCls","GVIEWFIRSTCLS",querygrid);
	var lastCls = dgrid.stringColumn("lastCls","GVIEWLASTCLS",querygrid);
	var loadingCls = dgrid.stringColumn("loadingCls","GVIEWLOADINGCLS",querygrid);
	var overItemCls = dgrid.stringColumn("overItemCls","GVIEWOVERITEMCLS",querygrid);
	var selectedItemCls = dgrid.stringColumn("selectedItemCls","GVIEWSELECTEDITEMCLS",querygrid);
	var lockedGridConfig = dgrid.numberColumn("lockedGridConfig","LOCKEDGRIDCONFIG",querygrid);
	var lockedViewConfig = dgrid.numberColumn("lockedViewConfig","LOCKEDVIEWCONFIG",querygrid);
	var normalGridConfig = dgrid.numberColumn("normalGridConfig","NORMALGRIDCONFIG",querygrid);
	var normalViewConfig = dgrid.numberColumn("normalViewConfig","NORMALVIEWCONFIG",querygrid);
	var view = dgrid.numberColumn("view","QRYVIEW",querygrid);
	var viewConfig = dgrid.numberColumn("viewConfig","VIEWCONFIG",querygrid);
	var blockRefresh = dgrid.numberColumn("blockRefresh","GVIEWBLOCKREFRESH",querygrid);
	var deferEmptyText = dgrid.numberColumn("deferEmptyText","GVIEWDEFEREMPTYTEXT",querygrid);
	var deferInitialRefresh = dgrid.numberColumn("deferInitialRefresh","GVIEWDEFERINITIALREFRESH",querygrid);
	var enableTextSelection = dgrid.numberColumn("enableTextSelection","GVIEWENABLETEXTSELECTION",querygrid);
	var itemTpl = dgrid.stringOrObjectOrFunction("itemTpl","GVIEWITEMTPL",querygrid);
	var loadMask = dgrid.numberColumn("loadMask","GVIEWLOADMASK",querygrid);
	var loadingHeight = dgrid.numberColumn("loadingHeight","GVIEWLOADINGHEIGHT",querygrid);
	var loadingText = dgrid.stringColumn("loadingText","GVIEWLOADINGTEXT",querygrid);
	var markDirty = dgrid.numberColumn("markDirty","GVIEWMARKDIRTY",querygrid);
	var mouseOverOutBuffer = dgrid.numberColumn("mouseOverOutBuffer","GVIEWMOUSEOVEROUTBUFFER",querygrid);
	var preserveScrollOnRefresh = dgrid.numberColumn("preserveScrollOnRefresh","GVIEWPRESERVESCROLLONREFRESH",querygrid);
	var stripeRows = dgrid.numberColumn("stripeRows","GVIEWSTRIPEROWS",querygrid);
	var trackOver = dgrid.numberColumn("trackOver","GVIEWTRACKOVER",querygrid);
	var stateEvents = dgrid.stringOrObjectOrFunction("stateEvents","STATEEVENTS",querygrid);
	var stateId = dgrid.stringColumn("stateId","STATEID",querygrid);
	var stateful = dgrid.numberColumn("stateful","STATEFUL",querygrid);
	var layout = dgrid.stringOrObjectOrFunction("layout","STATEEVENTS",querygrid);
	var id = dgrid.stringColumn("id","QRYID",querygrid);
	var defaults = dgrid.numberColumn("defaults","DEFAULTS",querygrid);
	var defaultType = dgrid.stringColumn("defaultType","DEFAULTTYPE",querygrid);
	var defaultAlign = dgrid.stringColumn("defaultAlign","DEFAULTALIGN",querygrid);
	var defaultDockWeights = dgrid.numberColumn("defaultDockWeights","DEFAULTDOCKWEIGHTS",querygrid);
	var rtl = dgrid.numberColumn("rtl","RTL",querygrid);
	var xtype = dgrid.stringOrObjectOrFunction("xtype","XTYPE",querygrid);
	var componentLayout = dgrid.stringOrObjectOrFunction("componentLayout","COMPONENTLAYOUT",querygrid);
	var suspendLayout = dgrid.numberColumn("suspendLayout","SUSPENDLAYOUT",querygrid);
	var subGridXType = dgrid.stringColumn("subGridXType","SUBGRIDXTYPE",querygrid);
	var renderSelectors = dgrid.numberColumn("renderSelectors","RENDERSELECTORS",querygrid);
	var renderTo = dgrid.stringOrObjectOrFunction("renderTo","RENDERTO",querygrid);
	var listeners = dgrid.numberColumn("listeners","LISTENERS",querygrid);

SaveContent variable="view" {
WriteOutput("Ext.define('Form.view.queryoutput.#session.companycode#.#querycodeAsNameSpace#.View', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.#querycodeAsNameSpace#',
	loadMask: true,
	multiSelect: true,
");


var gridf = CreateObject("component", "GridHelper");
var fa = gridf.prepareGridPanelArray();

for (b = 1; b <= ArrayLen(fa); b++) {
if (trim(evaluate("#fa[b]#")) neq "") {
	WriteOutput("	" & evaluate("#fa[b]#") & "
");
}
}

var gridfeatures = gridf.prepareGridFeature(querycode, querygrid);
var gridplugins = gridf.prepareGridPlugin(querycode, querygrid);



WriteOutput("
	store    : 'queryoutput.#session.companycode#.#querycodeAsNameSpace#.Store',
	#querygrid.getGRIDEXTRA()#
    features: #gridfeatures#,
    plugins: #gridplugins#,
    columns: #columnStringItems#,
    initComponent: function() {
    	this.fbar = Ext.create('Ext.toolbar.Paging', {
		        store: 'queryoutput.#session.companycode#.#querycodeAsNameSpace#.Store',
		        displayInfo: true,
		        emptyMsg: 'No query to display'
		});
		this.callParent(arguments);
    }
});");
}

	var dpath = ExpandPath("../../../app/view/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "View.js", view, "utf-8");

}

private void function setController(required string querycode) {

	// For toolbars view
	var coge = CreateObject("component", "GridExtension");
	var topbar = coge.setTopBarButtonClicked(tablecolumnArr,querycode,querygrid,querycodeAsNameSpace);

Savecontent variable="controller" {
WriteOutput("Ext.define('Form.controller.queryoutput.#session.companycode#.#querycodeAsNameSpace#.Controller', {
   	extend: 'Ext.app.Controller',
   	views: ['queryoutput.#session.companycode#.#querycodeAsNameSpace#.View'],
   	models: ['queryoutput.#session.companycode#.#querycodeAsNameSpace#.Model'],
   	stores: ['queryoutput.#session.companycode#.#querycodeAsNameSpace#.Store'],
   		init: function() {
   			this.control({
   				'panel': {
   					render: this.initPanel
   				},
   				'#querycodeAsNameSpace# button': {
   					click: this.topBarButtonClicked
   				},
   				'#querycodeAsNameSpace#': {
   					afterrender: this.gridRenderingComplete,
   					select: this.gridRecordedSelected
   				}
   			})
   		},
   		initPanel: function(b) {

   		},
   		#topbar#
   		gridRenderingComplete: function(dis, eopts) {
   			var qc = '#querycode#';
   			Ext.#querycodeAsNameSpace#.Data.getUserToolbars(qc, function(res) {
   				if (res.success) {
   					dis.addDocked(res);
   				}
   			});
   		},
   		gridRecordedSelected: function(dis, rec, ind) {
   			var formCmp = Ext.getCmp('viewform#tablecolumnArr[1][1]#') || Ext.getCmp('autoeformididid');
   			if (formCmp) {
   				formCmp.getForm().setValues(rec.data);
   			}
   		}
})");
}

	var dpath = ExpandPath("../../../app/controller/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "Controller.js", controller, "utf-8");
}

private string function setRequiredFiles() {
	SaveContent variable="jsfiles" {
		WriteOutput("[
			'Ext.container.Viewport',
			'Ext.direct.*',
		    'Ext.data.*',
			'Ext.panel.*',
			'Ext.layout.container.Card',
			'Ext.ux.grid.FiltersFeature',
			'Ext.grid.plugin.BufferedRenderer',
			'Ext.toolbar.Paging',
			'Ext.ux.ajax.JsonSimlet',
		    'Ext.ux.ajax.SimManager',
			'Ext.util.*',
			'Ext.grid.*',
			'Ext.form.*',
			'Ext.layout.container.Form',
			'Ext.ux.grid.Printer'
		]");
	}
	return jsfiles;
}

public void function setApp(required string querycode, required string jsfiles, required string querycodeAsNameSpace) {

SaveContent variable="app" {
WriteOutput("
Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../../../scripts/ext-4.2.2/examples/ux');

Ext.application({
	requires: #jsfiles#,
	name: 'Form',
	controllers: ['queryoutput.#session.companycode#.#querycodeAsNameSpace#.Controller'],
	appFolder: '../../../../app',
	init: function(app) {
		Ext.direct.Manager.addProvider(Ext.#querycodeAsNameSpace#.APIDesc);
		GLOBAL_VARS_DIRECT = {
			USERID : '#session.userid#',
			PID : '#session.chapa#',
			FIRSTNAME : '#session.firstname#',
			LASTNAME : '#session.lastname#',
			MIDDLENAME : '#session.middlename#',
			MYMESSAGE : '#rereplace(session.mymessage,"[\r\n]"," ","all")#',
			MYPROFILEPIC : '../../../../resource/image/pics201/#lcase(session.companycode)#/#session.avatar#',
			COMPANYLOGO : '../../../.#session.icon_path##session.site_bannerlogo#',
			COMPANYCODE: '#session.companycode#',
			COMPANYNAME: '#session.companyname#',
			SITE: '#session.domain#'
		};
	},
	launch: function(){
		console.log('app launched');
		Ext.create('Ext.container.Viewport', {
			layout: {
				type: 'card'
			},
			items: [{
				xtype: '#querycodeAsNameSpace#'
			}],
			renderTo: Ext.getBody()

		});
	}
});");

}

var qry = EntityLoad("EGRGQUERY",querycode,true);

SaveContent variable="Index" {
	var cmp = "component";
	var cmpname = "GridExtension";
	var gext = CreateObject(cmp, cmpname);
	var dstyle = gext.prepareGridIcons();

WriteOutput("
<cfscript>
	appAccess = CreateObject(""component"",""IBOSE.security.Access"");
	resp = appAccess.checkUserQueryAccess(""#querycode#"",""##session.userid##"");
	if(resp == ""false"") {
		throw (detail=""eQuery Access Not Allowed"", message=""eQuery Access Not Allowed"");
	}
</cfscript>

<html>
	<head>
	    <title>#qry.getEQRYNAME()#</title>
		<link rel='icon' type='image/ico' href='../../../../resource/image/appicon/diginfologo.ico'>
		<cfoutput><link rel='stylesheet' type='text/css' href='../../../../scripts/ext-4.2.2/resources/css/##session.companycsstheme##.css'></cfoutput>
	    <script type='text/javascript' src='../../../../scripts/ext-4.2.2/ext-all.js'></script>
		<script src='Api.cfm'></script>
	    <script type='text/javascript' src='app.js'>
	    </script>
		#dstyle#
	</head>
<body>
</body>
</html>
<cfsetting showdebugoutput='false'>");
}

SaveContent variable="Api" {
WriteOutput("
<!--- Configure API Namespace and Description variable names --->
<cfset args = StructNew() />
<cfset args['ns'] = 'Ext.#querycodeAsNameSpace#' />
<cfset args['desc'] = 'APIDesc' />
<cfinvoke component='Direct' method='getAPIScript' argumentcollection='##args##' returnVariable='apiScript' />
<cfcontent reset='true' />
<cfoutput>##apiScript##</cfoutput>

<cfsetting showdebugoutput='false' />");
}

SaveContent variable="Router" {
WriteOutput("
<!--- Determine if this is a field post. --->
<cfif NOT StructIsEmpty(form)>
	<cfset jsonPacket = StructNew() />
	<cfset jsonPacket['tid'] = form.extTID />
	<cfset jsonPacket['action'] = form.extAction />
	<cfset jsonPacket['method'] = form.extMethod />
	<cfset jsonPacket['type'] = 'rpc' />

	<cftry>
            <cfinvoke component='##form.extAction##' method='##form.extMethod##' argumentcollection='##form##' returnVariable='result' />
            <cfcatch type='any'>
                <cfset jsonPacket['type'] = 'exception' />
                <cfset jsonPacket['message'] = cfcatch.Message & ' ' & cfcatch.Detail />
               <!--- <cfset jsonPacket['where'] = cfcatch.TagContext.Line/> --->
                <cfcontent reset='true' /><cfoutput>##SerializeJson(jsonPacket)##</cfoutput><cfabort/>
            </cfcatch>
        </cftry>
	<cfset jsonPacket['result'] = result />

	<cfset json = SerializeJson(jsonPacket) />
	<cfif form.extUpload eq 'true'>
		<cfoutput>
		<cfsavecontent variable='output'><html><body><textarea>##json##</textarea></body></html></cfsavecontent>
		</cfoutput>
	<cfelse>
		<cfset output = json />
	</cfif>
	<cfcontent reset='true' /><cfoutput>##output##</cfoutput>
<!--- must have been JSON posted in form body --->
<cfelse>
	<cfset direct = CreateObject('component', 'Direct') />
	<cfset postBody = direct.getPostBody() />
	<cfset requests = DeserializeJSON(postBody) />
	<cfif NOT IsArray(requests)>
		<cfset tmp = requests />
		<cfset requests = ArrayNew(1) />
		<cfset requests[1] = tmp />
	</cfif>
	<cfset requestLn = ArrayLen(requests) />
	<cfloop from='1' to='##requestLn##' index='i'>
		<cfset curReq = requests[i] />
                <cftry>
                    <cfset result = direct.invokeCall(curReq) />
                    <cfcatch type='any'>
                        <cfset jsonPacket = StructNew() />
                        <cfset jsonPacket['type'] = 'exception' />
                        <cfset jsonPacket['tid'] = curReq['tId'] />
                        <cfset jsonPacket['message'] = cfcatch.Message & ' Details: ' & cfcatch.Detail />
                       <!--- <cfset jsonPacket['where'] = cfcatch.TagContext.Line/> --->
                        <cfcontent reset='true' /><cfoutput>##SerializeJson(jsonPacket)##</cfoutput>
						<cfsetting showdebugoutput='false'  />
                    </cfcatch>
                </cftry>
		<cfif IsStruct(result) AND StructKeyExists(result, 'name') AND StructKeyExists(result, 'result')>
			<cfset curReq['name'] = result.name />
			<cfset curReq['result'] = result.result />
		<cfelse>
			<cfset curReq['result'] = result />
		</cfif>

		<cfset StructDelete(curReq, 'data') />
	</cfloop>
	<cfcontent reset='true' /><cfoutput>##SerializeJson(requests)##</cfoutput>
</cfif>

<cfsetting showdebugoutput='false'  />");
}

SaveContent variable="Direct" {
WriteOutput("
<cfcomponent name='Direct'>
	<cfif findNoCase(cgi.SERVER_PROTOCOL, 'https') >
		<cfset sProt = 'https://' >
	<cfelse>
		<cfset sProt = 'http://' >
	</cfif>
	<cfset variables.routerUrl = '##sProt####cgi.SERVER_NAME##:##cgi.SERVER_PORT##/myapps/queryoutput/#session.companycode#/#querycodeAsNameSpace#/Router.cfm' />
	<cfset variables.remotingType = 'remoting' />

	<cffunction name='getPostBody' returnType='string' output='false'>
	   <cfscript>
	      var size=GetPageContext().getRequest().getContentLength();
	      var emptyByteArray = createObject('java', 'java.io.ByteArrayOutputStream').init().toByteArray();
	      var byteClass = createObject('java', 'java.lang.Byte').TYPE;
	      var byteArray = createObject('java','java.lang.reflect.Array').newInstance(byteClass, size);
	      GetPageContext().getRequest().getInputStream().readLine(byteArray, 0, size);
	      createObject('java', 'java.lang.System').out.println('{GetJSONRequest} ByteArray.ToString=' &ToString( byteArray ) );
	      return ToString( byteArray );
	   </cfscript>
	</cffunction>

	<cffunction name='invokeCall'>
		<cfargument name='request' />
		<cfset var idx = 1 />
		<cfset var mthIdx = 1 />
		<cfset var result = '' />
		<cfset var args = StructNew() />

		<!--- find the methods index in the metadata --->
		<cfset newCfComponentMeta = GetComponentMetaData(request.action) />

		<cfloop from='1' to='##arrayLen(newCfComponentMeta.Functions)##' index='idx'>
			<cfif newCfComponentMeta.Functions[idx]['name'] eq request.method>
				<cfset mthIdx = idx />
				<cfbreak />
			</cfif>
		</cfloop>

	    <cfif isdefined('request.data') >

			<cfif NOT IsArray(request.data)>
				<cfset maxParams = 0 />
			<cfelseif ArrayLen(request.data) lt ArrayLen(newCfComponentMeta.Functions[mthIdx].parameters)>
				<cfset maxParams = ArrayLen(request.data) />
			<cfelse>
				<cfset maxParams = ArrayLen(newCfComponentMeta.Functions[mthIdx].parameters) />
			</cfif>
			<!--- marry the parameters in the metadata to params passed in the request. --->
			<cfloop from='0' to='##maxParams - 1##' index='idx'>
				<cfset args[newCfComponentMeta['Functions'][mthIdx].parameters[idx+1].name] = request.data[idx+1] />
			</cfloop>

			<cfinvoke component='##request.Action##' method='##request.method##' argumentcollection='##args##' returnvariable='result'>

		<cfelse>
			<cfinvoke component='##request.Action##' method='##request.method##' returnvariable='result'>
		</cfif>

		<cfreturn result />
	</cffunction>

	<cffunction name='getAPIScript'>
		<cfargument name='ns' />
		<cfargument name='desc' />

		<cfset var totalCFCs = '' />
		<cfset var cfcName = '' />
		<cfset var CFCApi = '' />
		<cfset var fnLen = '' />
		<cfset var Fn = '' />
		<cfset var currFn = '' />
		<cfset var newCfComponentMeta = '' />
		<cfset var script = '' />
		<cfset var jsonPacket = StructNew() />
		<cfset jsonPacket['url'] = variables.routerUrl />
		<cfset jsonPacket['type'] = variables.remotingType />
		<cfset jsonPacket['namespace'] = 'Ext.#querycodeAsNameSpace#' />
		<cfset jsonPacket['actions'] = StructNew() />
		<cfset jsonPacket['timeout'] = 300000 />

		<cfdirectory action='list' directory='##expandPath('.')##' name='totalCFCs' filter='*.cfc' recurse='false' />

		<cfloop	query='totalCFCs'>
			<cfset cfcName = ListFirst(totalCFCs.name, '.') />
			<cfset newCfComponentMeta = GetComponentMetaData(cfcName) />
			<cfif StructKeyExists(newCfComponentMeta, 'ExtDirect')>
				<cfset CFCApi = ArrayNew(1) />

				<cfset fnLen = ArrayLen(newCFComponentMeta.Functions) />
				<cfloop from='1' to='##fnLen##' index='i'>
					<cfset currFn = newCfComponentMeta.Functions[i] />
					<cfif StructKeyExists(currFn, 'ExtDirect')>
						<cfset Fn = StructNew() />
						<cfset Fn['name'] = currFn.Name/>
						<cfset Fn['len'] = ArrayLen(currFn.Parameters) />
						<cfif StructKeyExists(currFn, 'ExtFormHandler')>
							<cfset Fn['formHandler'] = true />
						</cfif>
						<cfset ArrayAppend(CFCApi, Fn) />
					</cfif>
				</cfloop>
				<cfset jsonPacket['actions'][cfcName] = CFCApi />
			</cfif>
		</cfloop>

		<cfoutput><cfsavecontent variable='script'>Ext.ns('##arguments.ns##');##arguments.ns##.##desc## = ##SerializeJson(jsonPacket)##;</cfsavecontent></cfoutput>
		<cfreturn script />
	</cffunction>
</cfcomponent>
");
}


	var dpath = ExpandPath("../../../myapps/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "app.js", app, "utf-8");

	var dpath = ExpandPath("../../../myapps/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "index.cfm", Index, "utf-8");

	var dpath = ExpandPath("../../../myapps/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "Api.cfm", Api, "utf-8");

	var dpath = ExpandPath("../../../myapps/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "Router.cfm", Router, "utf-8");

	var dpath = ExpandPath("../../../myapps/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "Direct.cfc", Direct, "utf-8");

}



private void function setData(querycode) {

SaveContent variable="Data" {
WriteOutput("
component  output=false persistent=false ExtDirect=true {
public struct function Read(required string page,
							required string start,
							required string limit,
							required any sort,
							required any filter,
							required string querycode,
							required struct extraparams)
ExtDirect=true
{
	var theargs = StructNew();
	theargs[""page""] = page;
    theargs[""start""] = start;
    theargs[""limit""] = limit;
    theargs[""sort""] = sort;
    theargs[""filter""] = filter;

    bcObj = Createobject(""component"",""IBOSE.application.GridQuery"");
    dresult = bcObj.buildConditionDash(argumentCollection=""##theargs##"");
	WHERE = dresult[""where""];
    ORDERBY = dresult[""orderby""];


");

	/* SELECT part > DISPLAY & FIELDALIAS */
	selectArr = ArrayNew(1);
	columnStruct = StructNew();
	selectObj = EntityLoad("EGRGEVIEWFIELDS", {EQRYCODEFK = "#querycode#"}, false);
	for (a = 1; a <= ArrayLen(selectObj); a++) {
		if(trim(selectObj[a].getFIELDALIAS()) eq "") {
			ArrayAppend(selectArr, selectObj[a].getDISPLAY());
			columnStruct["#selectObj[a].getFIELDNAME()#"] = "#selectObj[a].getTABLENAME()#-#selectObj[a].getFIELDNAME()#";
		} else {
			ArrayAppend(selectArr, selectObj[a].getDISPLAY() & " AS '" & selectObj[a].getFIELDALIAS() & "'");
			columnStruct["#selectObj[a].getFIELDALIAS()#"] = "#selectObj[a].getTABLENAME()#-#selectObj[a].getFIELDNAME()#";
		}

	}
	selectStr = ArrayToList(selectArr, ", ");

	/* FROM part */
	dfirsttable = "";
	fromArr = ArrayNew(1);
	fromObj = EntityLoad("EGRGEVIEWJOINEDTABLES", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
	if (ArrayLen(fromObj) > 0) {
		for (a = 1; a <= ArrayLen(fromObj); a++) {
			ArrayAppend(fromArr, fromObj[a].getDISPLAY());
		}
		fromStr = ArrayToList(fromArr, " ");
		dfirsttable = ListGetAt(fromObj[1].getTABLENAME(),1," ");
	} else {
		fromObj = EntityLoad("EGRGEVIEWTABLES", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
		for (a = 1; a <= ArrayLen(fromObj); a++) {
			ArrayAppend(fromArr, fromObj[a].getTEMPTABLE() & " " & fromObj[a].getTABLEALIAS());
		}
		fromStr = ArrayToList(fromArr, ", ");
		dfirsttable = fromObj[1].getTEMPTABLE();
	}


	/* WHERE part */
	whereArr = ArrayNew(1);
	whereObj = EntityLoad("EGRGEVIEWCONDITION", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
	for (a = 1; a <= ArrayLen(whereObj); a++) {
		ArrayAppend(whereArr, whereObj[a].getCONJUNCTIVEOPERATOR() & " " & whereObj[a].getONCOLUMN() & " " & whereObj[a].getCONDITIONOPERATOR() & " " & whereObj[a].getCOLUMNVALUE());
	}
	whereStr = ArrayToList(whereArr, " ");

	/* GROUP BY part */
	groupbyArr = ArrayNew(1);
	groupbyObj = EntityLoad("EGRGEVIEWGROUPBY", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
	for (a = 1; a <= ArrayLen(groupbyObj); a++) {
		ArrayAppend(groupbyArr, groupbyObj[a].getGROUPBYCOLUMN());
	}
	groupbyStr = ArrayToList(groupbyArr, ", ");

	/* HAVING part */
	havingArr = ArrayNew(1);
	havingObj = EntityLoad("EGRGEVIEWHAVING", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
	for (a = 1; a <= ArrayLen(havingObj); a++) {
		ArrayAppend(havingArr, havingObj[a].getDISPLAY());
	}
	havingStr = ArrayToList(havingArr, " ");

	/* ORDER BY part */
	orderbyArr = ArrayNew(1);
	orderbyObj = EntityLoad("EGRGEVIEWORDERBY", {EQRYCODEFK = "#querycode#"}, "COLUMNORDER ASC");
	for (a = 1; a <= ArrayLen(orderbyObj); a++) {
		ArrayAppend(orderbyArr, orderbyObj[a].getDISPLAY() & " " & orderbyObj[a].getASCORDESC());
	}
	orderbyStr = ArrayToList(orderbyArr, ", ");

	if(trim(selectStr) eq "") {
		selectStr = "SELECT * ";
	} else {
		selectStr = "SELECT " & selectStr;
	}

	if(trim(fromStr) eq "") {
		throw(message="Table not specified", detail="Table not specified");
	} else {
		fromStr = "FROM " & fromStr;
	}

	if(trim(whereStr) eq "") {
		whereStr = "";
		wStr = "";
	} else {
		wStr = " AND " & whereStr;
		whereStr = "WHERE " & whereStr;
	}

	if(trim(groupbyStr) eq "") {
		groupbyStr = "";
	} else {
		groupbyStr = "GROUP BY " & groupbyStr;
	}

	if(trim(havingStr) eq "") {
		havingStr = "";
	} else {
		havingStr = "HAVING " & havingStr;
	}


	if(trim(orderbyStr) eq "") {
		orderbyStr = "";
		oStr = "";
	} else {
		oStr = "," & orderbyStr;
		orderbyStr = "ORDER BY " & orderbyStr;
	}

	/* replace {PERSONNELIDNO}, {USERID}, {GUID}, {COMPANYCODE} to their corresponding values*/
	Dsql = "#selectStr#
			 #fromStr#
			 #whereStr#
			 #groupbyStr#
			 #havingStr#
			 #orderbyStr#";

	selectStr = replaceUserParam(selectStr);
	fromStr = replaceUserParam(fromStr);
	wStr = replaceUserParam(wStr);
	whereStr = replaceUserParam(whereStr);
	groupbyStr = replaceUserParam(groupbyStr);
	havingStr = replaceUserParam(havingStr);
	oStr = replaceUserParam(oStr);
	orderbyStr = replaceUserParam(orderbyStr);
	Dsql = replaceUserParamTest(Dsql);

WriteOutput("
	if (trim(WHERE) == """") {
		WHERE = ""#whereStr#"";
	} else {
		WHERE = ""##WHERE## #wStr#"";
	}

	/* Dynamically processes extra parameters */
	if (!StructIsEmpty(extraparams)) {
		var extraparamKeys = StructKeyArray(extraparams);
		var extraCondArr = ArrayNew(1);
		for (var b=1; b <= ArrayLen(extraparamKeys); b++) {
			var excond = ""##replace(extraparamKeys[b],'_','.')## = '"" & extraparams[""##extraparamKeys[b]##""] & ""'"";
			ArrayAppend(extraCondArr, excond);
		}
		var excondition = ArrayToList(extraCondArr, "" AND "");
		if (WHERE == """") {
			WHERE = ""WHERE "" & excondition;
		} else {
			WHERE = WHERE & "" AND "" & excondition;
		}
	}



	if (trim(ORDERBY) == """") {
		ORDERBY = ""#orderbyStr#"";
	} else {
		ORDERBY = ""ORDER BY ##ORDERBY## #oStr#"";
	}

	Usql = ""#selectStr#
			 #fromStr#
			 ##WHERE##
			 #groupbyStr#
			 #havingStr#
			 ##ORDERBY##"";

	queryService = new query();
	queryService.setDatasource(""##session.global_dsn##"");
  		queryService.setName(""dqueryname"");
	queryService.setSQL(Usql);
	theResultSet = queryService.execute();
	dquery = theResultSet.getResult();

	resultArr = ArrayNew(1);
	rootstuct = StructNew();
    rootstuct[""totalCount""] = dquery.recordCount;

	if (dquery.recordCount < limit) {
    	limit = dquery.recordCount;
    }
    /*Creates an array of structure to be converted to JSON using serializeJSON*/
	for (var b = start+1; b <= start+limit; b++) {
    	tmpresult = StructNew();
 ");

	Usql = "#Dsql#";
	queryService = new query();
	queryService.setDatasource(session.global_dsn);
  	queryService.setName("DQUERY");
	queryService.setSQL(Usql);
	theResultSet = queryService.execute();
	dquery = theResultSet.getResult();
	collistArr = dquery.getColumnList();
    		for (c = 1; c <= ArrayLen(collistArr); c++) {
    			gridDataIndex = columnStruct["#collistArr[c]#"];
   			WriteOutput("
    			tmpresult[""#gridDataIndex#""] = dquery[""#collistArr[c]#""][b];");
    		}

WriteOutput("
		ArrayAppend(resultArr, tmpresult);
    }
    rootstuct[""topics""] = resultArr;
	return rootstuct;
}");

	/** get the first table
	 loop over the columns where the table is the first table
	 add to array the column list
	 add to another array the column value list
	 convert the array into a list of string delimited according to the required format
	**/


	var colArr = ArrayNew(1);
	var colVarArr = ArrayNew(1);
	var validIndexArr = ArrayNew(1);
	var dstype = "CF_SQL_VARCHAR";
	var ColumnObj = EntityLoad("EGRGEVIEWFIELDS", {EQRYCODEFK = "#querycode#", TABLENAME = "#tablecolumnArr[1][2]#"}, false);
	for (a = 1; a <= ArrayLen(ColumnObj); a++) {
		var columnd = EntityLoad("EGRGQRYCOLUMN",ColumnObj[a].getEVIEWFIELDCODE(),true); /*tablecolumnArr[a][1] is eviewfieldcode*/
		if (columnd.getCOLUMNDISABLED() == true) {
			continue; /*Disabled column must not be included in the insert query*/
		}

		ArrayAppend(colArr, ColumnObj[a].getFIELDNAME());
		ArrayAppend(colVarArr, "args[b]['#tablecolumnArr[1][2]#-#ColumnObj[a].getFIELDNAME()#']");
		var dstype = getCFValidOutput(trim(columnd.getOUTPUTTYPE()));
		ArrayAppend(validIndexArr, dstype);
	}

	var colList = ArrayToList(colArr, ",");
	var colListParamVal = ":" & ArrayToList(colArr, ", :");
	var paramstr = "";

	for (var c = 1; c <= ArrayLen(colArr); c++) {
		if (validIndexArr[c] == "CF_SQL_TIMESTAMP") {
			paramstr = paramstr & "queryService.addParam(name=""#colArr[c]#"",value=""##rereplace(#colVarArr[c]#,'[a-zA-Z]',' ')##"",cfsqltype=""#validIndexArr[c]#"");
				";
		} else {
			paramstr = paramstr & "queryService.addParam(name=""#colArr[c]#"",value=""###colVarArr[c]###"",cfsqltype=""#validIndexArr[c]#"");
			";
		}
	}

	var dquery = "INSERT INTO #replaceUserParam(dfirsttable)# (#colList#)
		          VALUES (#colListParamVal#)";

WriteOutput("

public struct function Create(required any args) ExtDirect=true {
	var retVal = StructNew();
	if (!isArray(args)) {
		var ar = ArrayNew(1);
		ar[1] = args;
		args = ArrayNew(1);
		args = ar;
	}

	for (b = 1; b <= ArrayLen(args); b++) {
		queryService = new query();
		#paramstr#
		Usql = '#dquery#';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal[""message""] = args;
	retVal[""success""] = true;
	return retVal;
}
");

	var colArr = ArrayNew(1);
	var colUpd = ArrayNew(1);
	var colVarArr = ArrayNew(1);
	var validIndexArr = ArrayNew(1);

	var ColumnObj = EntityLoad("EGRGEVIEWFIELDS", {EQRYCODEFK = "#querycode#", TABLENAME = "#tablecolumnArr[1][2]#"}, false);
	for (a = 1; a <= ArrayLen(ColumnObj); a++) {
		var columnd = EntityLoad("EGRGQRYCOLUMN",ColumnObj[a].getEVIEWFIELDCODE(),true);
		ArrayAppend(colArr, ColumnObj[a].getFIELDNAME());
		ArrayAppend(colUpd, ColumnObj[a].getFIELDNAME() & " = :" &  ColumnObj[a].getFIELDNAME());
		ArrayAppend(colVarArr, "args[b]['#tablecolumnArr[1][2]#-#ColumnObj[a].getFIELDNAME()#']");
		var dstype = getCFValidOutput(trim(columnd.getOUTPUTTYPE()));
		ArrayAppend(validIndexArr, dstype);
	}
	var colList = ArrayToList(colUpd, ",");

	var paramstr = "";
	var dstype = "CF_SQL_VARCHAR";
	for (var c = 1; c <= ArrayLen(colVarArr); c++) {
		if (validIndexArr[c] == "CF_SQL_TIMESTAMP") {
			paramstr = paramstr & "queryService.addParam(name=""#colArr[c]#"",value=""##rereplace(#colVarArr[c]#,'[a-zA-Z]',' ')##"",cfsqltype=""#validIndexArr[c]#"");
				";
		} else {
			paramstr = paramstr & "queryService.addParam(name=""#colArr[c]#"",value=""###colVarArr[c]###"",cfsqltype=""#validIndexArr[c]#"");
			";
		}
	}

	var updcond = "#tablecolumnArr[1][3]# = :#tablecolumnArr[1][3]#";

	var dqueryupd = "UPDATE #replaceUserParam(dfirsttable)#
						SET #colList#
			          WHERE #updcond#";

WriteOutput("

public struct function Update(required any args)
ExtDirect=true
{
	var retVal = StructNew();
	if (!isArray(args)) {
		var ar = ArrayNew(1);
		ar[1] = args;
		args = ArrayNew(1);
		args = ar;
	}

	for (b = 1; b <= ArrayLen(args); b++) {
		queryService = new query();
		#paramstr#
		Usql = '#dqueryupd#';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal[""message""] = args;
	retVal[""success""] = true;
	return retVal;
}
");

	var colArr = ArrayNew(1);
	var colUpd = ArrayNew(1);
	var colVarArr = ArrayNew(1);
	var ColumnObj = EntityLoad("EGRGEVIEWFIELDS", {EQRYCODEFK = "#querycode#", TABLENAME = "#tablecolumnArr[1][2]#"}, false);
	for (a = 1; a <= ArrayLen(ColumnObj); a++) {
		var columnd = EntityLoad("EGRGQRYCOLUMN",tablecolumnArr[a][1],true);
		ArrayAppend(colArr, ColumnObj[a].getFIELDNAME());
		ArrayAppend(colUpd, ColumnObj[a].getFIELDNAME() & " = :" &  ColumnObj[a].getFIELDNAME());
		ArrayAppend(colVarArr, "args[b]['#tablecolumnArr[1][2]#-#ColumnObj[a].getFIELDNAME()#']");
	}
	var colList = ArrayToList(colUpd, " AND ");

	var paramstr = "";
	var dstype = "CF_SQL_VARCHAR";
	for (var c = 1; c <= ArrayLen(colVarArr); c++) {
		var columndef = EntityLoad("EGRGQRYCOLUMN",tablecolumnArr[c][1],true);
		if (trim(columndef.getOUTPUTTYPE()) eq "" || trim(columndef.getOUTPUTTYPE()) eq "string") dstype = "CF_SQL_VARCHAR";
		else if (trim(columndef.getOUTPUTTYPE()) eq "boolean") dstype = "CF_SQL_VARCHAR";
		else if (trim(columndef.getOUTPUTTYPE()) eq "checkcolumn") dstype = "CF_SQL_VARCHAR";
		else if (trim(columndef.getOUTPUTTYPE()) eq "date") {
			dstype = "CF_SQL_TIMESTAMP";
			paramstr = paramstr & "queryService.addParam(name=""#colArr[c]#"",value=""##rereplace(#colVarArr[c]#,'[a-zA-Z]',' ')##"",cfsqltype=""#dstype#"");
			";
			continue;
		}
		else if (trim(columndef.getOUTPUTTYPE()) eq "int") dstype = "CF_SQL_INTEGER";
		else if (trim(columndef.getOUTPUTTYPE()) eq "float") dstype = "CF_SQL_FLOAT";
		else if (trim(columndef.getOUTPUTTYPE()) eq "actioncolumn") dstype = "CF_SQL_VARCHAR";
		else if (trim(columndef.getOUTPUTTYPE()) eq "templatecolumn") dstype = "CF_SQL_VARCHAR";
		paramstr = paramstr & "queryService.addParam(name=""#colArr[c]#"",value=""###colVarArr[c]###"",cfsqltype=""#dstype#"");
		";
	}

	var updcond = "#tablecolumnArr[1][3]# = :#tablecolumnArr[1][3]#";

	var dquerydlt = "DELETE FROM #replaceUserParam(dfirsttable)#
					  WHERE #colList#";

WriteOutput("

public struct function Destroy(required any args) ExtDirect=true {
	var retVal = StructNew();
	if (!isArray(args)) {
		var ar = ArrayNew(1);
		ar[1] = args;
		args = ArrayNew(1);
		args = ar;
	}

	for (b = 1; b <= ArrayLen(args); b++) {
		queryService = new query();
		#paramstr#
		Usql = '#dquerydlt#';
		queryService.setDatasource(session.global_dsn);
	  	queryService.setName('qryname');
		queryService.setSQL(Usql);
		var theResultSet = queryService.execute();
	}

	retVal[""message""] = args;
	retVal[""success""] = true;
	return retVal;
}


public struct function getUserToolbars(required string querycode) ExtDirect=true {
	var dockitems = StructNew();
	try {
		dockitems[""xtype""] = ""toolbar"";
	   	dockitems[""dock""] = ""top"";
	   	var itemArray = ArrayNew(1);
		var qryres = ORMExecuteQuery(""SELECT SHOWPRINT,
											 SHOWVIEW,
											 SHOWADD,
											 SHOWEDIT,
											 SHOWCOPY,
											 SHOWDELETE,
											 SHOWEXPORT,
											 SHOWEMAIL
										FROM EGRTQUERY
										WHERE EQRYCODE = '##trim(querycode)##' AND userid = '##session.userid##'"", false);
		actionlist = ""Print,View,Add,Edit,Copy,Delete,Export,Email"";
		actionlistimg = ""print-icon,view-icon,add-icon,edit-icon,copy-icon,delete-icon,export-icon,email-icon"";
		if (ArrayLen(qryres) > 0) { /* if assigned to a user */
			for (b = 1; b <= ListLen(actionlist); b++) {
				if (qryres[1][b] == true) {
					var xtypeS = StructNew();
				   	xtypeS[""xtype""] = ""button"";
				   	xtypeS[""action""] = ""##ListGetAt(actionlist,b,',')##"";
				   	xtypeS[""tooltip""] = ""##ListGetAt(actionlist,b,',')##"";
				   	xtypeS[""iconCls""] = ""##ListGetAt(actionlistimg,b,',')##"";
				   	ArrayAppend(itemArray, xtypeS);
				}
			}
			if (ArrayLen(itemArray) == 0) itemArray = setItemArrayWithGroup(itemArray, querycode);
		} else { /* if assigned to a group*/
			itemArray = setItemArrayWithGroup(itemArray, querycode);
		}

		if (ArrayLen(itemArray) > 0) {
			dockitems[""items""] = itemArray;
			dockitems[""success""] = true;
		} else {
			dockitems[""false""] = true;
			dockitems[""message""] = ""No tools assigned to this user."";
		}

	return dockitems;

	} catch (Any e) {
		dockitems[""false""] = true;
		dockitems[""message""] = e.message & "" ,"" & e.detail;
	}
}

private array function setItemArrayWithGroup(itemArray,querycode) {
	var qryresg = ORMExecuteQuery(""SELECT SHOWPRINT,
										 SHOWVIEW,
										 SHOWADD,
										 SHOWEDIT,
										 SHOWCOPY,
										 SHOWDELETE,
										 SHOWEXPORT,
										 SHOWEMAIL
									FROM EGRTQUERYGROUP
								   WHERE EQRYCODE = '##trim(querycode)##'
										 AND USERGRPID IN (SELECT USERGRPIDFK FROM EGRGROLEINDEX
														    WHERE USERGRPMEMBERSIDX = '##session.userid##')"", false);
		if (ArrayLen(qryresg) > 0) {
			for (b = 1; b <= ListLen(actionlist); b++) {
				if (qryresg[1][b] == true) {
					var xtypeS = StructNew();
				   	xtypeS[""xtype""] = ""button"";
				   	xtypeS[""action""] = ""##ListGetAt(actionlist,b,',')##"";
				   	xtypeS[""tooltip""] = ""##ListGetAt(actionlist,b,',')##"";
				   	xtypeS[""iconCls""] = ""##ListGetAt(actionlistimg,b,',')##"";
				   	ArrayAppend(itemArray, xtypeS);
				}
			}
		}
	return itemArray;
}

remote struct function exportGridToExcel(required String querycode, required String querytitle) ExtDirect=true {
	var retVal = StructNew();
	var qrydef = CreateObject(""component"", ""myapps.query.definition.QueryDefinition"");
	Usql = ""#selectStr#
			 #fromStr#
			 #whereStr#
			 #groupbyStr#
			 #havingStr#
			 #orderbyStr#"";
	var res = qrydef.exportQueryToExcel(querytitle,Usql.trim());
	retVal[""result""] = res;
	return retVal;
}

remote struct function emailSelGridQuery(required String fromvalue,
										 required String tovalue,
										 required String subjectvalue,
										 required String bodyvalue) ExtDirect=true {
	var retVal = StructNew();
	retVal[""success""] = true;
	try {
		var dmailObj = CreateObject(""component"", ""mail"");
		if (trim(session.ms) != """") {
			dmailObj.setServer(Decrypt(session.ms,""mailmng""));
			dmailObj.setUsername(Decrypt(session.mu,""mailmng""));
			dmailObj.setPassword(Decrypt(session.mp,""mailmng""));
		}
		if (trim(session.mt) != """") dmailObj.setTimeout(session.mt);
		if (trim(session.mpt) != """") dmailObj.setPort(session.mpt);
		if (trim(session.mtls) != """") dmailObj.setUseTLS(session.mtls);
		if (trim(session.mssl) != """") dmailObj.setUseSSL(session.mssl);
		dmailObj.setFrom(fromvalue);
		dmailObj.setTo(tovalue);
		dmailObj.setSubject(subjectvalue);
		dmailObj.setType(""html"");
		dmailObj.setBody(bodyvalue);
		dmailObj.send();
	} catch (Any e) {
		retVal[""success""] = false;
		retVal[""message""] = e.message & "" - "" & e.detail;
	}

	return retVal;
}

}");

} /* End SaveContent */

	var dpath = ExpandPath("../../../myapps/queryoutput/#session.companycode#/#querycodeAsNameSpace#/");
	var utilO = CreateObject("component", "IBOSE.application.Util");
	utilO.createDirectoryIfDoesNotExist(dpath);
	FileWrite(dpath & "Data.cfc", Data, "utf-8");

	} /* End setData */

	public String function replaceUserParam(String sourceStr) {
			var tempStr = replace(sourceStr, "{PERSONNELIDNO}", "##session.chapa##", "all");
			tempStr = replace(tempStr, "{USERID}", "##session.userid##", "all");
			tempStr = replace(tempStr, "{GUID}", "##session.guid##", "all");
			tempStr = replace(tempStr, "{COMPANYCODE}", "##session.companycode##", "all");
		return tempStr;
	}

	public String function replaceUserParamTest(String sourceStr) {
			var tempStr = replace(sourceStr, "{PERSONNELIDNO}", "#session.chapa#", "all");
			tempStr = replace(tempStr, "{USERID}", "#session.userid#", "all");
			tempStr = replace(tempStr, "{GUID}", "#session.guid#", "all");
			tempStr = replace(tempStr, "{COMPANYCODE}", "#session.companycode#", "all");
		return tempStr;
	}

	private String function getCFValidOutput(outputtype) {
		if (outputtype == "" || outputtype == "string") dstype = "CF_SQL_VARCHAR";
		else if (outputtype == "boolean") dstype = "CF_SQL_VARCHAR";
		else if (outputtype == "checkcolumn") dstype = "CF_SQL_VARCHAR";
		else if (outputtype == "date") dstype = "CF_SQL_TIMESTAMP";
		else if (outputtype == "int") dstype = "CF_SQL_INTEGER";
		else if (outputtype == "float") dstype = "CF_SQL_FLOAT";
		else if (outputtype == "actioncolumn") dstype = "CF_SQL_VARCHAR";
		else if (outputtype == "templatecolumn") dstype = "CF_SQL_VARCHAR";
		return dstype;
	}

}