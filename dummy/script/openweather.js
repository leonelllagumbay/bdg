rowBodyTpl : [
	'<p><b>Day:</b>{list.dt}</h1></p>',
    '<p><b>Pressure:</b> {pressure}</p></br>',
    '<p><b>Humidity:</b> {humidity}</p>']

listeners: {
	expandbody: function( rowNode, record, expandRow, eOpts ) {
		console.log('on expand', rowNode, record, expandRow);
	}
}
	
	listeners: {
		afterrender: function(disgrid) {
			var expand = typeof expand !== 'undefined' ? expand : true;
			var grid = disgrid,
		        store = grid.getStore(),
		        rowExpander = grid.plugins[0],
		        nodes = rowExpander.view.getNodes();
	
		    for (var i = 0; i < nodes.length; i++) {
		        var node = Ext.fly(nodes[i]);
	
		        if (node.hasCls(rowExpander.rowCollapsedCls) === expand) {
		            rowExpander.toggleRow(i, store.getAt(i));
		        }
		    }
		}
	}

function(value,metaData,record,rind,cind,dstore){
    console.log('the real value',value,metaData,record,rind,cind,dstore);
    return value;
}

function(value) {
	var d = new Date(value*1000);
	var newd = d.toDateString();
    return newd;
}

function(value) {
	return value + ' m/s';
}





setupRowData: function(record, rowIndex, rowValues) {
    var headerCt = this.view.headerCt,
        colspan = headerCt.getColumnCount();
    var ro = {
        	rowBody : '<b>Leonell Lagumbay</b>',
        	rowBodyCls : '',
        	rowBodyColspan : colspan
        };
    console.log('Ro',ro, colspan);
    return ro;
}


getAdditionalData: function(record, rowIndex, rowValues) {
    var headerCt = this.view.headerCt,
        colspan = headerCt.getColumnCount();
    var ro = {
        	rowBody : '<p>' + record['egintestquery~S6'] + '</p>',
        	rowBodyCls : (rowIndex % 2) ? 'bg-snow' : this.rowBodyCls,
        	rowBodyColspan : colspan
        };
    return ro;
}

function renderTopic(value, p, record) {     
	var dcontent = record.data['egintestquery-S2']; 	
	return Ext.String.format('<strong><a href="' + dcontent + '" target="_blank">{0}</a></strong>',value); 
}