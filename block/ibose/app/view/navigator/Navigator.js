Ext.define('Ibose.view.navigator.Navigator', {
	extend: 'Ext.panel.Panel',
	xtype: 'navigator',
	
	requires: [
	     'Ibose.view.navigator.NavigatorController'
	],
	
	controller: 'nav',
	
    flex: 1,
    margin: 5,
    autoScroll: true,
    height: '100%',
    defaults: {
        bodyStyle: 'padding:7px'
    },
    layout: {
        type: 'accordion',
        titleCollapse: false,
        animate: true,
        activeOnTop: false,
        multi: true,
        wrapOver: true
    },
    collapsible: true,
    collapseDirection: 'left',
    items: [{
        title: 'My Worklist',
        xtype: 'panel',
        items: [{
        	xtype: 'menu',
	    	name: 'myworklist',
	    	floating: false,
		    items: [{
		    	text: 'Regular Item 1'
		    },{
		    	text: 'Regular Item 2'
		    },{
		    	text: 'Regular Item 3'
		    }]
        }]
    },{
    	title: 'My LiveBoard',
        xtype: 'panel',
        items: [{
        	xtype: 'menu',
	    	name: 'myworklist',
	    	
	    	floating: false,
		    items: [{
		        text: 'Regular Item 1',
		    	menu: [{
			    	text: 'Sub item 1'
			    },{
			    	text: 'Sub item 2',
			    	menu: [{
			    		text: 'Sub sub item 1'
			    	},{
			    		text: 'Sub sub item 2'
			    	},{
			    		text: 'Sub sub item 3'
			    	},{
			    		text: 'Sub sub item 4'
			    	}]
			    }]
		    },{
		    	text: 'Regular Item 2'
		    },{
		    	text: 'Regular Item 4'
		    },{
		    	text: 'Regular Item 5'
		    },{
		    	text: 'Regular Item 6'
		    },{
		    	text: 'Regular Item 7'
		    },{
		    	text: 'Regular Item 8'
		    },{
		    	text: 'Regular Item 9'
		    },{
		    	text: 'Regular Item 10'
		    },{
		    	text: 'Regular Item 11'
		    },{
		    	text: 'Regular Item 12'
		    },{
		    	text: 'Regular Item 13'
		    },{
		    	text: 'Regular Item 14'
		    }]
        }]
    },{
        title: 'My Apps',
        html: 'Panel content 4!'
    },{
        title: 'My Calendar',
        xtype: 'panel',
        items: [{
        	xtype: 'datemenu',
	    	name: 'simpleCal',
	    	showToday: false,
		    floating: false
        }]
    },{
        title: 'My Network',
        html: '<tr role="presentation" id="displayfield-1012-inputRow" class="x-form-item-input-row"><td role="presentation" id="displayfield-1012-labelCell" style="display:none;" valign="top" halign="left" width="105" class="x-field-label-cell"><label id="displayfield-1012-labelEl" for="displayfield-1012-inputEl" class="x-form-item-label x-unselectable x-form-item-label-left" style="width:100px;margin-right:5px;" unselectable="on"></label></td><td role="presentation" class="x-form-item-body x-form-display-field-body " id="displayfield-1012-bodyEl" colspan="3" style="width: 100%;"><div id="displayfield-1012-inputEl" role="textbox" class="x-form-display-field" data-errorqtip="" style="width: 100%;"><img title="Filinvest Baseline Company" height="35" width="150" src="./resource/image/companylogo/DIGINFO 2013 Logo white background.jpg"></div></td></tr>'
    },{
        title: 'My Shortcuts',
        html: 'Panel content 6!'
    }]
});