Ext.define('Form.controller.book.bookController', {
    extend: 'Ext.app.Controller',
	views: [
        'book.bookView',
        'book.bookSectionView'
    ],
	models: [
	    'book.bookTitleModel',
	    'book.bookSectionModel'
	],
	stores: [
	    'book.bookTitleStore',
	    'book.bookSectionStore'
	],
	
	onLaunch: function() {
	    var bookStore = this.getBookBookTitleStoreStore();
	    bookStore.on('load', this.bookAfterLoad);
	    
	    var bookSectionStore = this.getBookBookSectionStoreStore();
	    bookSectionStore.on('load', this.bookSectionAfterLoad);
	},
	
	init: function() {
        this.control({
            
			'bookview': {  
				select: 'bookViewSelected'
			},
			'booksectionview': {
				cellclick: 'sectionClicked'
			}
		});
     },
     
     bookViewSelected: function(thisview, rec, ind) {
		var bookSectionViewStore = Ext.ComponentQuery.query("booksectionview")[0].getStore();
		var ep = {
			ecinebookscontent_BOOKCODE: rec.data['ecinebooks-BOOKCODE']
		};
		 bookSectionViewStore.load({
			 params: {
				 extraparams: ep
			 }
		 });
		 
		 bookSectionViewStore.proxy.extraParams.extraparams = ep;
		 
		 var dcardL = Ext.getCmp('center-region-book-content');
		 dcardL.setTitle(rec.data['ecinebooks-BOOKTITLE']);
		 
		 var iscardexist = Ext.getCmp(rec.data['ecinebooks-BOOKCODE']);
		 if(iscardexist) {
			 dcardL.getLayout().setActiveItem(rec.data['ecinebooks-BOOKCODE']);
		 } else {
			 var itm = {
		        id: rec.data['ecinebooks-BOOKCODE'],
		        xtype: 'container',
		        autoScroll: true,
		        layout: {
		        	name: 'fit'
		        },
		        items: []
		     };
			 dcardL.add(itm);
			 dcardL.getLayout().setActiveItem(rec.data['ecinebooks-BOOKCODE']);
		 }

	 },
     
	 sectionClicked: function(thiscell, td, cellIndex, record, tr, rowIndex) {
		 window.location.hash = "_" + record.data['ecinebookscontent-CONTENTCODE'];
	 },
     
     bookAfterLoad: function(s, r) {
    	 var bookView = Ext.ComponentQuery.query("bookview")[0];
		 if (!bookView.getSelectionModel().hasSelection()) {
			 bookView.getSelectionModel().select(0);
		 }
     },
     
     bookSectionAfterLoad: function(s, r) {
    	 var sData = s.data.items;
    	 for (var a = 0; a < sData.length; a++) {
    		 var iscontentexist = Ext.getCmp(sData[a].data['ecinebookscontent-CONTENTCODE']);
    		 if (iscontentexist) {
    			 return true;
    		 } else {
    			 var htmlpanelitem = Ext.getCmp(sData[a].data['ecinebookscontent-BOOKCODE']);
    			 var dhead = sData[a].data['ecinebookscontent-CONTENTHEADER'];
    			 var dfoot = sData[a].data['ecinebookscontent-CONTENTFOOTER'];
    			 if (dhead) {
    				 dhead = "<fieldset><legend>Header</legend>" + dhead + "</fieldset>";
    			 } else {
    				 dhead = "";
    			 }
    			 if (dfoot) {
    				 dfoot = "<fieldset><legend>Footer</legend>" + dfoot + "</fieldset>";
    			 } else {
    				 dfoot = "";
    			 }
    			 htmlpanelitem.add({
        			 html: dhead + '<p id="_' + sData[a].data['ecinebookscontent-CONTENTCODE'] +'"</p><p>&nbsp;</p><p>' + sData[a].data['ecinebookscontent-THECONTENT'] + '</p>' + dfoot,
        			 id: sData[a].data['ecinebookscontent-CONTENTCODE'],
        			 padding: 5,
        			 border: false
        		 }); 
    		 }	 
    	 } 	 
     },
 
});