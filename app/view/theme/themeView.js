var store13 = Ext.create('Ext.data.TreeStore', {
    root: {
        expanded: true,
        children: [
            { text: "detention", leaf: true },
            { text: "homework", expanded: true, children: [
                { text: "book report", leaf: true },
                { text: "algebra", leaf: true}
            ] },
            { text: "buy lottery tickets", leaf: true }
        ]
    }
});


Ext.define('Image', {
    extend: 'Ext.data.Model',
    fields: [
        { name:'src', type:'string' },
        { name:'caption', type:'string' }
    ]
});

Ext.create('Ext.data.Store', {
    id:'imagesStore14',
    model: 'Image',
    data: [
        { src:'http://', caption:'Sample Data View 1' },
        { src:'http://', caption:'Advanced Data' },
        { src:'http://', caption:'Overhauled Theme' },
        { src:'http://', caption:'Performance Tuned' }
    ]
});

var imageTpl = new Ext.XTemplate(
    '<tpl for=".">',
        '<div style="margin-bottom: 10px;" class="thumb-wrap">',
          '<img src="{src}" />',
          '<br/><span>{caption}</span>',
        '</div>',
    '</tpl>'
);

var itemsPerPage = 2;   // set the number of items you want per page

var store12 = Ext.create('Ext.data.Store', {
    id:'simpsonsStore12',
    autoLoad: false,
    fields:['name', 'email', 'phone'],
    pageSize: itemsPerPage, // items per page
    data: [
       {"name":"Lisa", "email":"lisa@simpsons.com", "phone":"555-111-1224"},
       {"name":"Bart", "email":"bart@simpsons.com", "phone":"555-222-1234"},
       {"name":"Homer", "email":"home@simpsons.com", "phone":"555-222-1244"},
       {"name":"Marge", "email":"marge@simpsons.com", "phone":"555-222-1254"}
   ]
});

// specify segment of data you want to load using params
store12.load({
    params:{
        start:0,
        limit: itemsPerPage
    }
});

Ext.define('TestResult', {
    extend: 'Ext.data.Model',
    fields: ['student', 'subject', {
        name: 'mark',
        type: 'int'
    }]
});

Ext.create('Ext.data.Store', {
    storeId:'simpsonsStore8',
    fields:['name', 'email', 'phone'],
    data: [
        {"name":"Lisa", "email":"lisa@simpsons.com", "phone":"555-111-1224"},
        {"name":"Bart", "email":"bart@simpsons.com", "phone":"555-222-1234"},
        {"name":"Homer", "email":"home@simpsons.com", "phone":"555-222-1244"},
        {"name":"Marge", "email":"marge@simpsons.com", "phone":"555-222-1254"}
    ]
});

Ext.create('Ext.data.Store', {
    storeId:'simpsonsStore7',
    fields:['name'],
    data: [["Lisa"], ["Bart"], ["Homer"], ["Marge"]],
    proxy: {
        type: 'memory',
        reader: 'array'
    }
});

Ext.create('Ext.data.Store', {
    storeId:'simpsonsStore6',
    fields:['name', 'email', 'phone'],
    data:{'items':[
        {"name":"Lisa", "email":"lisa@simpsons.com", "phone":"555-111-1224"},
        {"name":"Bart", "email":"bart@simpsons.com", "phone":"555-222-1234"},
        {"name":"Homer", "email":"home@simpsons.com", "phone":"555-222-1244"},
        {"name":"Marge", "email":"marge@simpsons.com", "phone":"555-222-1254"}
    ]},
    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            root: 'items'
        }
    }
});

Ext.define('TestResult2', {
    extend: 'Ext.data.Model',
    fields: ['student', {
        name: 'mark',
        type: 'int'
    }]
});

Ext.define('Animal', {
    extend: 'Ext.data.Model',
    fields: ['name', 'latin', 'desc']
});

var store = Ext.create('Ext.data.Store', {
    storeId:'employeeStore5',
    fields:['name', 'seniority', 'department'],
    groupField: 'department',
    data: {'employees':[
        { "name": "Michael Scott",  "seniority": 7, "department": "Management" },
        { "name": "Dwight Schrute", "seniority": 2, "department": "Sales" },
        { "name": "Jim Halpert",    "seniority": 3, "department": "Sales" },
        { "name": "Kevin Malone",   "seniority": 4, "department": "Accounting" },
        { "name": "Angela Martin",  "seniority": 5, "department": "Accounting" }
    ]},
    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            root: 'employees'
        }
    }
});

Ext.create('Ext.data.Store', {
    storeId:'employeeStore4',
    fields:['firstname', 'lastname', 'seniority', 'department'],
    groupField: 'department',
    data:[
        { firstname: "Michael", lastname: "Scott",   seniority: 7, department: "Management" },
        { firstname: "Dwight",  lastname: "Schrute", seniority: 2, department: "Sales" },
        { firstname: "Jim",     lastname: "Halpert", seniority: 3, department: "Sales" },
        { firstname: "Kevin",   lastname: "Malone",  seniority: 4, department: "Accounting" },
        { firstname: "Angela",  lastname: "Martin",  seniority: 5, department: "Accounting" }
    ]
});

Ext.create('Ext.data.Store', {
   storeId:'sampleStore3',
   fields:[
       { name: 'symbol', type: 'string' },
       { name: 'price',  type: 'number' },
       { name: 'change', type: 'number' },
       { name: 'volume', type: 'number' }
   ],
   data:[
       { symbol: "msft",   price: 25.76,  change: 2.43, volume: 61606325 },
       { symbol: "goog",   price: 525.73, change: 0.81, volume: 3053782  },
       { symbol: "apple",  price: 342.41, change: 1.35, volume: 24484858 },
       { symbol: "sencha", price: 142.08, change: 8.85, volume: 5556351  }
   ]
});

var store11 = Ext.create('Ext.data.Store', {
    fields : ['name', 'email', 'phone', 'active'],
    data   : {
        items : [
            { name : 'Lisa',  email : 'lisa@simpsons.com',  phone : '555-111-1224', active : true  },
            { name : 'Bart',  email : 'bart@simpsons.com',  phone : '555-222-1234', active : true  },
            { name : 'Homer', email : 'home@simpsons.com',  phone : '555-222-1244', active : false },
            { name : 'Marge', email : 'marge@simpsons.com', phone : '555-222-1254', active : true  }
        ]
    },
    proxy  : {
        type   : 'memory',
        reader : {
            type : 'json',
            root : 'items'
        }
    }
});

Ext.create('Ext.data.Store', {
    storeId:'sampleStore2',
    fields:[
        { name: 'symbol', type: 'string' },
        { name: 'date',   type: 'date' },
        { name: 'change', type: 'number' },
        { name: 'volume', type: 'number' },
        { name: 'topday', type: 'date' }                        
    ],
    data:[
        { symbol: "msft",   date: '2011/04/22', change: 2.43, volume: 61606325, topday: '04/01/2010' },
        { symbol: "goog",   date: '2011/04/22', change: 0.81, volume: 3053782,  topday: '04/11/2010' },
        { symbol: "apple",  date: '2011/04/22', change: 1.35, volume: 24484858, topday: '04/28/2010' },            
        { symbol: "sencha", date: '2011/04/22', change: 8.85, volume: 5556351,  topday: '04/22/2010' }            
    ]
});

Ext.create('Ext.data.Store', {
   storeId:'sampleStore1',
   fields:[
       {name: 'framework', type: 'string'},
       {name: 'rocks', type: 'boolean'}
   ],
   data:{'items':[
       { 'framework': "Ext JS 4",     'rocks': true  },
       { 'framework': "Sencha Touch", 'rocks': true  },
       { 'framework': "Ext GWT",      'rocks': true  }, 
       { 'framework': "Other Guys",   'rocks': false } 
   ]},
   proxy: {
       type: 'memory',
       reader: {
           type: 'json',
           root: 'items'
       }
   }
});

Ext.create('Ext.data.Store', {
    storeId:'employeeStore',
    fields:['firstname', 'lastname', 'seniority', 'dep', 'hired'],
    data:[
        {firstname:"Michael", lastname:"Scott"},
        {firstname:"Dwight", lastname:"Schrute"},
        {firstname:"Jim", lastname:"Halpert"},
        {firstname:"Kevin", lastname:"Malone"},
        {firstname:"Angela", lastname:"Martin"}
    ]
});

var store1 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data1', 'data2', 'data3', 'data4', 'data5'],
    data: [
        {'name':'metric one', 'data1':10, 'data2':12, 'data3':14, 'data4':8, 'data5':13},
        {'name':'metric two', 'data1':7, 'data2':8, 'data3':16, 'data4':10, 'data5':3},
        {'name':'metric three', 'data1':5, 'data2':2, 'data3':14, 'data4':12, 'data5':7},
        {'name':'metric four', 'data1':2, 'data2':14, 'data3':6, 'data4':1, 'data5':23},
        {'name':'metric five', 'data1':27, 'data2':38, 'data3':36, 'data4':13, 'data5':33}
    ]
});

var store2 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data1', 'data2', 'data3', 'data4', 'data5'],
    data: [
        {'name':'metric one', 'data1':10, 'data2':12, 'data3':14, 'data4':8, 'data5':13},
        {'name':'metric two', 'data1':7, 'data2':8, 'data3':16, 'data4':10, 'data5':3},
        {'name':'metric three', 'data1':5, 'data2':2, 'data3':14, 'data4':12, 'data5':7},
        {'name':'metric four', 'data1':2, 'data2':14, 'data3':6, 'data4':1, 'data5':23},
        {'name':'metric five', 'data1':27, 'data2':38, 'data3':36, 'data4':13, 'data5':33}
    ]
});

var store3 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data'],
    data: [
        { 'name': 'metric one',   'data':10 },
        { 'name': 'metric two',   'data': 7 },
        { 'name': 'metric three', 'data': 5 },
        { 'name': 'metric four',  'data': 2 },
        { 'name': 'metric five',  'data':27 }
    ]
});

var store4 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data'],
    data: [
        { 'name': 'metric one',   'data':10 },
        { 'name': 'metric two',   'data': 7 },
        { 'name': 'metric three', 'data': 5 },
        { 'name': 'metric four',  'data': 2 },
        { 'name': 'metric five',  'data':27 }
    ]
});

var store5 = Ext.create('Ext.data.JsonStore', {
    fields: ['value'],
    data: [
        { 'value':80 }
    ]
});

var store6 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data1', 'data2', 'data3', 'data4', 'data5'],
    data: [
        { 'name': 'metric one',   'data1': 10, 'data2': 12, 'data3': 14, 'data4': 8,  'data5': 13 },
        { 'name': 'metric two',   'data1': 7,  'data2': 8,  'data3': 16, 'data4': 10, 'data5': 3  },
        { 'name': 'metric three', 'data1': 5,  'data2': 2,  'data3': 14, 'data4': 12, 'data5': 7  },
        { 'name': 'metric four',  'data1': 2,  'data2': 14, 'data3': 6,  'data4': 1,  'data5': 23 },
        { 'name': 'metric five',  'data1': 4,  'data2': 4,  'data3': 36, 'data4': 13, 'data5': 33 }
    ]
});

var store7 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data'],
    data: [
        { 'name': 'metric one',   'data': 10 },
        { 'name': 'metric two',   'data':  7 },
        { 'name': 'metric three', 'data':  5 },
        { 'name': 'metric four',  'data':  2 },
        { 'name': 'metric five',  'data': 27 }
    ]
});

var store8 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data1', 'data2', 'data3'],
    data: [
        { 'name': 'metric one',   'data1': 14, 'data2': 12, 'data3': 13 },
        { 'name': 'metric two',   'data1': 16, 'data2':  8, 'data3':  3 },
        { 'name': 'metric three', 'data1': 14, 'data2':  2, 'data3':  7 },
        { 'name': 'metric four',  'data1':  6, 'data2': 14, 'data3': 23 },
        { 'name': 'metric five',  'data1': 36, 'data2': 38, 'data3': 33 }
    ]
});

var store9 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data1', 'data2', 'data3', 'data4', 'data5'],
    data: [
        { 'name': 'metric one',   'data1': 10, 'data2': 12, 'data3': 14, 'data4': 8,  'data5': 13 },
        { 'name': 'metric two',   'data1': 7,  'data2': 8,  'data3': 16, 'data4': 10, 'data5': 3  },
        { 'name': 'metric three', 'data1': 5,  'data2': 2,  'data3': 14, 'data4': 12, 'data5': 7  },
        { 'name': 'metric four',  'data1': 2,  'data2': 14, 'data3': 6,  'data4': 1,  'data5': 23 },
        { 'name': 'metric five',  'data1': 27, 'data2': 38, 'data3': 36, 'data4': 13, 'data5': 33 }
    ]
});

var store10 = Ext.create('Ext.data.JsonStore', {
    fields: ['name', 'data1', 'data2', 'data3', 'data4', 'data5'],
    data: [
        { 'name': 'metric one',   'data1': 10, 'data2': 12, 'data3': 14, 'data4': 8,  'data5': 13 },
        { 'name': 'metric two',   'data1': 7,  'data2': 8,  'data3': 16, 'data4': 10, 'data5': 3  },
        { 'name': 'metric three', 'data1': 5,  'data2': 2,  'data3': 14, 'data4': 12, 'data5': 7  },
        { 'name': 'metric four',  'data1': 2,  'data2': 14, 'data3': 6,  'data4': 1,  'data5': 23 },
        { 'name': 'metric five',  'data1': 27, 'data2': 38, 'data3': 36, 'data4': 13, 'data5': 33 }
    ]
});

//The data store containing the list of states
var states1 = Ext.create('Ext.data.Store', {
    fields: ['abbr', 'name'],
    data : [
        {"abbr":"AL", "name":"Alabama"},
        {"abbr":"AK", "name":"Alaska"},
        {"abbr":"AZ", "name":"Arizona"}
        //...
    ]
});



//A simple subclass of Base that creates a HTML5 search field. Redirects to the
//searchUrl when the Enter key is pressed.222
Ext.define('Ext.form.SearchField', {
 extend: 'Ext.form.field.Base',
 alias: 'widget.searchfield',

 inputType: 'search',

 // Config defining the search URL
 searchUrl: 'http://www.google.com/search?q={0}',

 // Add specialkey listener
 initComponent: function() {
     this.callParent();
     this.on('specialkey', this.checkEnterKey, this);
 },

 // Handle enter key presses, execute the search if the field has a value
 checkEnterKey: function(field, e) {
     var value = this.getValue();
     if (e.getKey() === e.ENTER && !Ext.isEmpty(value)) {
         location.href = Ext.String.format(this.searchUrl, value);
     }
 }
});

Ext.define('Ext.ux.CustomSpinner', {
    extend: 'Ext.form.field.Spinner',
    alias: 'widget.customspinner',

    // override onSpinUp (using step isn't neccessary)
    onSpinUp: function() {
        var me = this;
        if (!me.readOnly) {
            var val = parseInt(me.getValue().split(' '), 10)||0; // gets rid of " Pack", defaults to zero on parse failure
            me.setValue((val + me.step) + ' Pack');
        }
    },

    // override onSpinDown
    onSpinDown: function() {
        var me = this;
        if (!me.readOnly) {
           var val = parseInt(me.getValue().split(' '), 10)||0; // gets rid of " Pack", defaults to zero on parse failure
           if (val <= me.step) {
               me.setValue('Dry!');
           } else {
               me.setValue((val - me.step) + ' Pack');
           }
        }
    }
});


Ext.define('Ext.ux.CustomTrigger', {
    extend: 'Ext.form.field.Trigger',
    alias: 'widget.customtrigger',

    // override onTriggerClick
    onTriggerClick: function() {
        Ext.Msg.alert('Status', 'You clicked my trigger!');
    }
});








Ext.define('Form.view.theme.themeView', { 
	extend: 'Ext.panel.Panel',
	alias: 'widget.themeview',
	title: 'iBOS/e Theme Viewer',
	width: '100%', 
	layout: 'vbox',
	defaults: {
		margin: 10
	},
	autoScroll: true,
	initComponent: function() {  
	 this.items = [{
			xtype: 'button',
			text: 'Button',
		    handler: function() {
		    	Ext.Msg.alert('Status', 'You clicked the button.');
		    }
		},{
			xtype: 'button',
			text: 'Prompt',
			handler: function() {
				Ext.Msg.prompt('Name', 'Please enter your name:', function(btn, text){
				    if (btn == 'ok'){
				        // process text value and close...
				    }
				});
			}
		},{
			xtype: 'button',
			text: 'Show Dialog',
			handler: function() {
				Ext.Msg.show({
				     title:'Save Changes?',
				     msg: 'You are closing a tab that has unsaved changes. Would you like to save your changes?',
				     buttons: Ext.Msg.YESNOCANCEL,
				     icon: Ext.Msg.QUESTION
				});
			}
		},{
			xtype: 'button',
			text:'Show Window',
			handler: function() {
				Ext.create('Ext.window.Window', {
				    title: 'Hello',
				    height: 150,
				    width: 300,
				    layout: 'fit',
				    items: {  // Let's put an empty grid in just to illustrate fit layout
				        xtype: 'grid',
				        border: false,
				        columns: [{header: 'World'}],                 // One header just for show. There's no data,
				        store: Ext.create('Ext.data.ArrayStore', {}) // A dummy empty data store
				    }
				}).show();
			}
		},{
			xtype: 'button',
			text    : 'Dynamic Handler Button',
		    renderTo: Ext.getBody(),
		    handler : function() {
		        // this button will spit out a different number every time you click it.
		        // so firstly we must check if that number is already set:
		        if (this.clickCount) {
		            // looks like the property is already set, so lets just add 1 to that number and alert the user
		            this.clickCount++;
		            alert('You have clicked the button "' + this.clickCount + '" times.\n\nTry clicking it again..');
		        } else {
		            // if the clickCount property is not set, we will set it and alert the user
		            this.clickCount = 1;
		            alert('You just clicked the button for the first time!\n\nTry pressing it again..');
		        }
		    }
		},{
			xtype: 'button',
			text    : 'Large Scale',
		    scale   : 'large'
		},{
			xtype: 'button',
			text: 'Button with toggle',
		    enableToggle: true
		},{
			xtype: 'button',
			text      : 'Menu button',
		    arrowAlign: 'bottom',
		    menu      : [
		        {text: 'Item 1'},
		        {text: 'Item 2'},
		        {text: 'Item 3'},
		        {text: 'Item 4'}
		    ]
		},{
			xtype: 'button',
			text     : 'Button with Listener',
		    renderTo : Ext.getBody(),
		    listeners: {
		        click: function() {
		            // this == the button, as we are in the local scope
		            this.setText('I was clicked!');
		        },
		        mouseover: function() {
		            // set a new config which says we moused over, if not already set
		            if (!this.mousedOver) {
		                this.mousedOver = true;
		                console.log('You moused over a button!\n\nI wont do this again.');
		            }
		        }
		    }
		},{
			xtype: 'cycle',
			showText: true,
		    prependText: 'Cycle View as ',
		    menu: {
		        id: 'view-type-menu',
		        items: [{
		            text: 'text only',
		            iconCls: 'view-text',
		            checked: true
		        },{
		            text: 'HTML',
		            iconCls: 'view-html'
		        }]
		    },
		    changeHandler: function(cycleBtn, activeItem) {
		        Ext.Msg.alert('Change View', activeItem.text);
		    }
		},{
			xtype: 'splitbutton',
			text: 'Split Button Options',
		    menu: new Ext.menu.Menu({
		        items: [
		            // these will render as dropdown menu items when the arrow is clicked:
		            {text: 'Item 1', handler: function(){ alert("Item 1 clicked"); }},
		            {text: 'Item 2', handler: function(){ alert("Item 2 clicked"); }}
		        ]
		    })
		},{
			xtype: 'button',
			text: "a asd asdf asdf asdf asdf"
		},{
			xtype: 'button',
			text: "bas sadf asdf sadf sadf asdf asdf"
		},{
			xtype: 'buttongroup',
			width: 300,
		    height:200,
		    title: 'Button Group',
		    bodyPadding: 10,
		    html: 'HTML Panel Content',
		    tbar: [{
		        xtype: 'buttongroup',
		        columns: 3,
		        title: 'Clipboard',
		        items: [{
		            text: 'Paste',
		            scale: 'large',
		            rowspan: 3,
		            iconCls: 'add',
		            iconAlign: 'top',
		            cls: 'btn-as-arrow'
		        },{
		            xtype:'splitbutton',
		            text: 'Menu Button',
		            scale: 'large',
		            rowspan: 3,
		            iconCls: 'add',
		            iconAlign: 'top',
		            arrowAlign:'bottom',
		            menu: [{ text: 'Menu Item 1' }]
		        },{
		            xtype:'splitbutton', text: 'Cut', iconCls: 'add16', menu: [{text: 'Cut Menu Item'}]
		        },{
		            text: 'Copy', iconCls: 'add16'
		        },{
		            text: 'Format', iconCls: 'add16'
		        }]
		    }]
		},{
			xtype: 'button',
			text: "a asd asdf asdf asdf asdf"
		},{
			xtype: 'button',
			text: "bas sadf asdf sadf sadf asdf asdf"
		},{
			xtype: 'datefield'
		},{
			xtype: 'datefield'
		},{
			xtype: 'container',
			layout: {
		        type: 'hbox'
		    },
		    width: 400,
		    border: 1,
		    style: {borderColor:'#000000', borderStyle:'solid', borderWidth:'1px'},
		    defaults: {
		        labelWidth: 80,
		        // implicitly create Container by specifying xtype
		        xtype: 'datefield',
		        flex: 1,
		        style: {
		            padding: '10px'
		        }
		    },
		    items: [{
		        xtype: 'datefield',
		        name: 'startDate',
		        fieldLabel: 'Sample Container',
		    },{
		        xtype: 'datefield',
		        name: 'endDate',
		        fieldLabel: 'End date'
		    }]
		},{
			xtype: 'panel',
			title: 'Viewport equivalent when full screen. Inside this panel is border layout',
			layout: 'fit',
			width: 500,
			height: 300,
			items: [{
				xtype: 'panel',
				layout: 'border',
			    items: [{
			        region: 'north',
			        html: '<h1 class="x-panel-header">Page Title</h1>',
			        border: false,
			        margins: '0 0 5 0'
			    }, {
			        region: 'west',
			        collapsible: true,
			        title: 'Navigation',
			        width: 150
			        // could use a TreePanel or AccordionLayout for navigational items
			    }, {
			        region: 'south',
			        title: 'South Panel',
			        collapsible: true,
			        html: 'Information goes here',
			        split: true,
			        height: 100,
			        minHeight: 100
			    }, {
			        region: 'east',
			        title: 'East Panel',
			        collapsible: true,
			        split: true,
			        width: 150
			    }, {
			        region: 'center',
			        xtype: 'tabpanel', // TabPanel itself has no title
			        activeTab: 0,      // First tab active by default
			        items: {
			            title: 'Default Tab',
			            html: 'The first tab\'s content. Others may be added dynamically'
			        }
			    }]
			}]
		},{
			xtype: 'panel',
			title: 'Panel with VerticalTextItem',
		    width: 300,
		    height: 200,
		    lbar: {
		        layout: {
		            align: 'center'
		        },
		        items: [{
		            xtype: 'text',
		            text: 'Sample VerticalTextItem',
		            degrees: 90
		        }]
		    }
		},{
			xtype: 'form',
			title: 'Base Example',
		    bodyPadding: 5,
		    width: 250,

		    // Fields will be arranged vertically, stretched to full width
		    layout: 'anchor',
		    defaults: {
		        anchor: '100%'
		    },
		    items: [{
		        xtype: 'searchfield',
		        fieldLabel: 'Search',
		        name: 'query'
		    }]
		},{
			xtype: 'form',
			bodyPadding: 10,
		    width: 300,
		    title: 'Checkbox Pizza Order',
		    items: [
		        {
		            xtype: 'fieldcontainer',
		            fieldLabel: 'Toppings',
		            defaultType: 'checkboxfield',
		            items: [
		                {
		                    boxLabel  : 'Anchovies',
		                    name      : 'topping',
		                    inputValue: '1',
		                    id        : 'checkbox1'
		                }, {
		                    boxLabel  : 'Artichoke Hearts',
		                    name      : 'topping',
		                    inputValue: '2',
		                    checked   : true,
		                    id        : 'checkbox2'
		                }, {
		                    boxLabel  : 'Bacon',
		                    name      : 'topping',
		                    inputValue: '3',
		                    id        : 'checkbox3'
		                }
		            ]
		        }
		    ],
		    bbar: [
		        {
		            text: 'Select Bacon',
		            handler: function() {
		                Ext.getCmp('checkbox3').setValue(true);
		            }
		        },
		        '-',
		        {
		            text: 'Select All',
		            handler: function() {
		                Ext.getCmp('checkbox1').setValue(true);
		                Ext.getCmp('checkbox2').setValue(true);
		                Ext.getCmp('checkbox3').setValue(true);
		            }
		        },
		        {
		            text: 'Deselect All',
		            handler: function() {
		                Ext.getCmp('checkbox1').setValue(false);
		                Ext.getCmp('checkbox2').setValue(false);
		                Ext.getCmp('checkbox3').setValue(false);
		            }
		        }
		    ]
		},{
			xtype: 'combobox',
			fieldLabel: 'Combo Box',
		    store: states1,
		    queryMode: 'local',
		    displayField: 'name',
		    valueField: 'abbr'
		},{
			xtype: 'form',
			width: 300,
		    bodyPadding: 10,
		    title: 'Dates',
		    items: [{
		        xtype: 'datefield',
		        anchor: '100%',
		        fieldLabel: 'From',
		        name: 'from_date',
		        maxValue: new Date()  // limited to the current date or prior
		    }, {
		        xtype: 'datefield',
		        anchor: '100%',
		        fieldLabel: 'To',
		        name: 'to_date',
		        value: new Date()  // defaults to today
		    }]
		},{
			xtype: 'form',
			width: 300,
		    bodyPadding: 10,
		    title: 'Date Formats',
		    items: [{
		        xtype: 'datefield',
		        anchor: '100%',
		        fieldLabel: 'Date',
		        name: 'date',
		        // The value matches the format; will be parsed and displayed using that format.
		        format: 'm d Y',
		        value: '2 4 1978'
		    }, {
		        xtype: 'datefield',
		        anchor: '100%',
		        fieldLabel: 'Date',
		        name: 'date',
		        // The value does not match the format, but does match an altFormat; will be parsed
		        // using the altFormat and displayed using the format.
		        format: 'm d Y',
		        altFormats: 'm,d,Y|m.d.Y',
		        value: '2.4.1978'
		    }]
		},{
			xtype: 'form',
			width: 175,
		    height: 120,
		    bodyPadding: 10,
		    title: 'Final Score Display',
		    items: [{
		        xtype: 'displayfield',
		        fieldLabel: 'Home',
		        name: 'home_score',
		        value: '10'
		    }, {
		        xtype: 'displayfield',
		        fieldLabel: 'Visitor',
		        name: 'visitor_score',
		        value: '11'
		    }],
		    buttons: [{
		        text: 'Update'
		    }]
		},{
			xtype: 'form',
			width: 400,
		    bodyPadding: 10,
		    frame: true,
		    items: [{
		        xtype: 'filefield',
		        name: 'photo',
		        fieldLabel: 'Photo',
		        labelWidth: 50,
		        msgTarget: 'side',
		        allowBlank: false,
		        anchor: '100%',
		        buttonText: 'Select Photo...'
		    }],

		    buttons: [{
		        text: 'Upload',
		        handler: function() {
		            var form = this.up('form').getForm();
		            if(form.isValid()){
		                form.submit({
		                    url: 'photo-upload.php',
		                    waitMsg: 'Uploading your photo...',
		                    success: function(fp, o) {
		                        Ext.Msg.alert('Success', 'Your photo "' + o.result.file + '" has been uploaded.');
		                    }
		                });
		            }
		        }
		    }]
		},{
			xtype: 'htmleditor',
			width: 580,
		    height: 250
		},{
			xtype: 'form',
			title: 'On The Wall',
		    width: 300,
		    bodyPadding: 10,
		    renderTo: Ext.getBody(),
		    items: [{
		        xtype: 'numberfield',
		        anchor: '100%',
		        name: 'bottles',
		        fieldLabel: 'Bottles of Beer',
		        value: 99,
		        maxValue: 99,
		        minValue: 0
		    },{
		    	xtype: 'numberfield',
		        anchor: '100%',
		        name: 'age',
		        fieldLabel: 'Age',
		        minValue: 0, //prevents negative numbers

		        // Remove spinner buttons, and arrow key and mouse wheel listeners
		        hideTrigger: true,
		        keyNavEnabled: false,
		        mouseWheelEnabled: false
		    },{
		    	xtype: 'numberfield',
		        anchor: '100%',
		        name: 'evens',
		        fieldLabel: 'Even Numbers',

		        // Set step so it skips every other number
		        step: 2,
		        value: 0,

		        // Add change handler to force user-entered numbers to evens
		        listeners: {
		            change: function(field, value) {
		                value = parseInt(value, 10);
		                field.setValue(value + value % 2);
		            }
		        }
		    }],
		    buttons: [{
		        text: 'Take one down, pass it around',
		        handler: function() {
		            this.up('form').down('[name=bottles]').spinDown();
		        }
		    }]
		},{
			xtype: 'form',
			title      : 'Order Form',
		    width      : 300,
		    bodyPadding: 10,
		    renderTo   : Ext.getBody(),
		    items: [
		        {
		            xtype      : 'fieldcontainer',
		            fieldLabel : 'Size',
		            defaultType: 'radiofield',
		            defaults: {
		                flex: 1
		            },
		            layout: 'hbox',
		            items: [
		                {
		                    boxLabel  : 'M',
		                    name      : 'size',
		                    inputValue: 'm',
		                    id        : 'radio1'
		                }, {
		                    boxLabel  : 'L',
		                    name      : 'size',
		                    inputValue: 'l',
		                    id        : 'radio2'
		                }, {
		                    boxLabel  : 'XL',
		                    name      : 'size',
		                    inputValue: 'xl',
		                    id        : 'radio3'
		                }
		            ]
		        },
		        {
		            xtype      : 'fieldcontainer',
		            fieldLabel : 'Color',
		            defaultType: 'radiofield',
		            defaults: {
		                flex: 1
		            },
		            layout: 'hbox',
		            items: [
		                {
		                    boxLabel  : 'Blue',
		                    name      : 'color',
		                    inputValue: 'blue',
		                    id        : 'radio4'
		                }, {
		                    boxLabel  : 'Grey',
		                    name      : 'color',
		                    inputValue: 'grey',
		                    id        : 'radio5'
		                }, {
		                    boxLabel  : 'Black',
		                    name      : 'color',
		                    inputValue: 'black',
		                    id        : 'radio6'
		                }
		            ]
		        }
		    ],
		    bbar: [
		        {
		            text: 'Smaller Size',
		            handler: function() {
		                var radio1 = Ext.getCmp('radio1'),
		                    radio2 = Ext.getCmp('radio2'),
		                    radio3 = Ext.getCmp('radio3');

		                //if L is selected, change to M
		                if (radio2.getValue()) {
		                    radio1.setValue(true);
		                    return;
		                }

		                //if XL is selected, change to L
		                if (radio3.getValue()) {
		                    radio2.setValue(true);
		                    return;
		                }

		                //if nothing is set, set size to S
		                radio1.setValue(true);
		            }
		        },
		        {
		            text: 'Larger Size',
		            handler: function() {
		                var radio1 = Ext.getCmp('radio1'),
		                    radio2 = Ext.getCmp('radio2'),
		                    radio3 = Ext.getCmp('radio3');

		                //if M is selected, change to L
		                if (radio1.getValue()) {
		                    radio2.setValue(true);
		                    return;
		                }

		                //if L is selected, change to XL
		                if (radio2.getValue()) {
		                    radio3.setValue(true);
		                    return;
		                }

		                //if nothing is set, set size to XL
		                radio3.setValue(true);
		            }
		        },
		        '-',
		        {
		            text: 'Select color',
		            menu: {
		                indent: false,
		                items: [
		                    {
		                        text: 'Blue',
		                        handler: function() {
		                            var radio = Ext.getCmp('radio4');
		                            radio.setValue(true);
		                        }
		                    },
		                    {
		                        text: 'Grey',
		                        handler: function() {
		                            var radio = Ext.getCmp('radio5');
		                            radio.setValue(true);
		                        }
		                    },
		                    {
		                        text: 'Black',
		                        handler: function() {
		                            var radio = Ext.getCmp('radio6');
		                            radio.setValue(true);
		                        }
		                    }
		                ]
		            }
		        }
		    ]
		},{
			xtype: 'form',
			title: 'Form with SpinnerField',
		    bodyPadding: 5,
		    width: 350,
		    renderTo: Ext.getBody(),
		    items:[{
		        xtype: 'customspinner',
		        fieldLabel: 'How Much Beer?',
		        step: 6
		    }]
		},{
			xtype: 'form',
			title: 'Text Field - Contact Info',
		    width: 300,
		    bodyPadding: 10,
		    renderTo: Ext.getBody(),
		    items: [{
		        xtype: 'textfield',
		        name: 'name',
		        fieldLabel: 'Name',
		        allowBlank: false  // requires a non-empty value
		    }, {
		        xtype: 'textfield',
		        name: 'email',
		        fieldLabel: 'Email Address',
		        vtype: 'email'  // requires value to be a valid email address format
		    }]
		},{
			xtype: 'form',
			title      : 'Sample TextArea',
		    width      : 400,
		    bodyPadding: 10,
		    renderTo   : Ext.getBody(),
		    items: [{
		        xtype     : 'textareafield',
		        grow      : true,
		        name      : 'message',
		        fieldLabel: 'Message',
		        anchor    : '100%'
		    }]
		},{
			xtype: 'form',
			title: 'Time Card',
		    width: 300,
		    bodyPadding: 10,
		    renderTo: Ext.getBody(),
		    items: [{
		        xtype: 'timefield',
		        name: 'in',
		        fieldLabel: 'Time In',
		        minValue: '6:00 AM',
		        maxValue: '8:00 PM',
		        increment: 30,
		        anchor: '100%'
		    }, {
		        xtype: 'timefield',
		        name: 'out',
		        fieldLabel: 'Time Out',
		        minValue: '6:00 AM',
		        maxValue: '8:00 PM',
		        increment: 30,
		        anchor: '100%'
		   }]
		},{
			xtype: 'form',
			title: 'Form with TriggerField',
		    bodyPadding: 5,
		    width: 350,
		    renderTo: Ext.getBody(),
		    items:[{
		        xtype: 'customtrigger',
		        fieldLabel: 'Sample Trigger',
		        emptyText: 'click the trigger'
		    }]
		},{
			xtype: 'grid',
			title: 'Action Column Demo',
		    store: Ext.data.StoreManager.lookup('employeeStore'),
		    columns: [
		        {text: 'First Name',  dataIndex:'firstname'},
		        {text: 'Last Name',  dataIndex:'lastname'},
		        {
		            xtype:'actioncolumn',
		            width:50,
		            items: [{
		                icon: 'extjs/examples/shared/icons/fam/cog_edit.png',  // Use a URL in the icon config
		                tooltip: 'Edit',
		                handler: function(grid, rowIndex, colIndex) {
		                    var rec = grid.getStore().getAt(rowIndex);
		                    alert("Edit " + rec.get('firstname'));
		                }
		            },{
		                icon: 'extjs/examples/restful/images/delete.png',
		                tooltip: 'Delete',
		                handler: function(grid, rowIndex, colIndex) {
		                    var rec = grid.getStore().getAt(rowIndex);
		                    alert("Terminate " + rec.get('firstname'));
		                }
		            }]
		        }
		    ],
		    width: 250
		},{
			xtype: 'grid',
			title: 'Boolean Column Demo',
		    store: Ext.data.StoreManager.lookup('sampleStore1'),
		    columns: [
		        { text: 'Framework',  dataIndex: 'framework', flex: 1 },
		        {
		            xtype: 'booleancolumn', 
		            text: 'Rocks',
		            trueText: 'Yes',
		            falseText: 'No', 
		            dataIndex: 'rocks'
		        }
		    ],
		    height: 100,
		    width: 400
		},{
			xtype: 'grid',
			title    : 'CheckColumn Simpsons',
		    height   : 150,
		    width    : 300,
		    store    : store11,
		    columns  : [
		        { text : 'Name', dataIndex : 'name' },
		        { text : 'Email', dataIndex : 'email', flex : 1 },
		        { text : 'Phone', dataIndex : 'phone' },
		        { xtype : 'checkcolumn', text : 'Active', dataIndex : 'active' }
		    ]
		},{
			xtype: 'grid',
			title: 'Date Column Demo',
		    store: Ext.data.StoreManager.lookup('sampleStore2'),
		    columns: [
		        { text: 'Symbol',   dataIndex: 'symbol', flex: 1 },
		        { text: 'Date',     dataIndex: 'date',   xtype: 'datecolumn',   format:'Y-m-d' },
		        { text: 'Change',   dataIndex: 'change', xtype: 'numbercolumn', format:'0.00' },
		        { text: 'Volume',   dataIndex: 'volume', xtype: 'numbercolumn', format:'0,000' },
		        { text: 'Top Day',  dataIndex: 'topday', xtype: 'datecolumn',   format:'l' }            
		    ],
		    height: 150,
		    width: 450
		},{
			xtype: 'grid',
			title: 'Number Column Demo',
		    store: Ext.data.StoreManager.lookup('sampleStore3'),
		    columns: [
		        {xtype: 'rownumberer'},
		        { text: 'Symbol',         dataIndex: 'symbol', flex: 1 },
		        { text: 'Current Price',  dataIndex: 'price',  renderer: Ext.util.Format.usMoney },
		        { text: 'Change',         dataIndex: 'change', xtype: 'numbercolumn', format:'0.00' },
		        { text: 'Volume',         dataIndex: 'volume', xtype: 'numbercolumn', format:'0,000' }
		    ],
		    height: 150,
		    width: 400
		},{
			xtype: 'grid',
			title: 'Column Template Demo',
		    store: Ext.data.StoreManager.lookup('employeeStore4'),
		    columns: [
		        { text: 'Full Name',       xtype: 'templatecolumn', tpl: '{firstname} {lastname}', flex:1 },
		        { text: 'Department (Yrs)', xtype: 'templatecolumn', tpl: '{department} ({seniority})' }
		    ],
		    height: 160,
		    width: 300
		},{
			xtype: 'grid',
			title: 'Grouping Employees',
		    store: Ext.data.StoreManager.lookup('employeeStore5'),
		    columns: [
		        { text: 'Name',     dataIndex: 'name' },
		        { text: 'Seniority', dataIndex: 'seniority' }
		    ],
		    features: [{ftype:'grouping'}],
		    width: 160,
		    height: 275
		},{
			xtype: 'grid',
			width: 200,
		    height: 240,
		    title: 'Grouping Summary',
		    features: [{
		        groupHeaderTpl: 'Subject: {name}',
		        ftype: 'groupingsummary'
		    }],
		    store: {
		        model: 'TestResult',
		        groupField: 'subject',
		        data: [{
		            student: 'Student 1',
		            subject: 'Math',
		            mark: 84
		        },{
		            student: 'Student 1',
		            subject: 'Science',
		            mark: 72
		        },{
		            student: 'Student 2',
		            subject: 'Math',
		            mark: 96
		        },{
		            student: 'Student 2',
		            subject: 'Science',
		            mark: 68
		        }]
		    },
		    columns: [{
		        dataIndex: 'student',
		        text: 'Name',
		        summaryType: 'count',
		        summaryRenderer: function(value){
		            return Ext.String.format('{0} student{1}', value, value !== 1 ? 's' : '');
		        }
		    }, {
		        dataIndex: 'mark',
		        text: 'Mark',
		        summaryType: 'average'
		    }]
		},{
			xtype: 'grid',
			title: 'Row Body',
			width: 400,
		    height: 150,
		    store: {
		        model: 'Animal',
		        data: [
		            {name: 'Tiger', latin: 'Panthera tigris',
		             desc: 'The largest cat species, weighing up to 306 kg (670 lb).'},
		            {name: 'Roman snail', latin: 'Helix pomatia',
		             desc: 'A species of large, edible, air-breathing land snail.'},
		            {name: 'Yellow-winged darter', latin: 'Sympetrum flaveolum',
		             desc: 'A dragonfly found in Europe and mid and Northern China.'},
		            {name: 'Superb Fairy-wren', latin: 'Malurus cyaneus',
		             desc: 'Common and familiar across south-eastern Australia.'}
		        ]
		    },
		    columns: [{
		        dataIndex: 'name',
		        text: 'Common name',
		        width: 125
		    }, {
		        dataIndex: 'latin',
		        text: 'Scientific name',
		        flex: 1
		    }],
		    features: [{
		        ftype: 'rowbody',
		        setupRowData: function(record, rowIndex, rowValues) {
		            var headerCt = this.view.headerCt,
		                colspan = headerCt.getColumnCount();
		            // Usually you would style the my-body-class in CSS file
		            return {
		                rowBody: '<div style="padding: 1em">'+record.get("desc")+'</div>',
		                rowBodyCls: "my-body-class",
		                rowBodyColspan: colspan
		            };
		        }
		    }]
		},{
			xtype: 'grid',
			width: 400,
		    height: 150,
		    title: 'Summary Test',
		    style: 'padding: 20px',
		    features: [{
		        ftype: 'summary'
		    }],
		    store: {
		        model: 'TestResult2',
		        data: [{
		            student: 'Student 1',
		            mark: 84
		        },{
		            student: 'Student 2',
		            mark: 72
		        },{
		            student: 'Student 3',
		            mark: 96
		        },{
		            student: 'Student 4',
		            mark: 68
		        }]
		    },
		    columns: [{
		        dataIndex: 'student',
		        text: 'Name',
		        summaryType: 'count',
		        summaryRenderer: function(value, summaryData, dataIndex) {
		            return Ext.String.format('{0} student{1}', value, value !== 1 ? 's' : ''); 
		        }
		    }, {
		        dataIndex: 'mark',
		        text: 'Mark',
		        summaryType: 'average'
		    }]
		},{
			xtype: 'grid',
			title: 'Cell Editing Simpsons',
		    store: Ext.data.StoreManager.lookup('simpsonsStore6'),
		    columns: [
		        {header: 'Name',  dataIndex: 'name', editor: 'textfield'},
		        {header: 'Email', dataIndex: 'email', flex:1,
		            editor: {
		                xtype: 'textfield',
		                allowBlank: false
		            }
		        },
		        {header: 'Phone', dataIndex: 'phone'}
		    ],
		    selType: 'cellmodel',
		    plugins: [
		        Ext.create('Ext.grid.plugin.CellEditing', {
		            clicksToEdit: 1
		        })
		    ],
		    height: 200,
		    width: 400
		},{
			xtype: 'grid',
			title: 'Drag Drop',
			store: 'simpsonsStore7',
		    columns: [
		        {header: 'Name',  dataIndex: 'name', flex: true}
		    ],
		    viewConfig: {
		        plugins: {
		            ptype: 'gridviewdragdrop',
		            dragText: 'Drag and drop to reorganize'
		        }
		    },
		    height: 200,
		    width: 400
		},{
			xtype: 'grid',
			title: 'Row editor Simpsons',
		    store: Ext.data.StoreManager.lookup('simpsonsStore8'),
		    columns: [
		        {header: 'Name',  dataIndex: 'name', editor: 'textfield'},
		        {header: 'Email', dataIndex: 'email', flex:1,
		            editor: {
		                xtype: 'textfield',
		                allowBlank: false
		            }
		        },
		        {header: 'Phone', dataIndex: 'phone'}
		    ],
		    selType: 'rowmodel',
		    plugins: [
		        Ext.create('Ext.grid.plugin.RowEditing', {
		            clicksToEdit: 1
		        })
		    ],
		    height: 200,
		    width: 400
		},{
			xtype: 'form',
			title: 'Absolute Layout',
		    width: 300,
		    height: 275,
		    layout: {
		        type: 'absolute'
		        // layout-specific configs go here
		        //itemCls: 'x-abs-layout-item',
		    },
		    url:'save-form.php',
		    defaultType: 'textfield',
		    items: [{
		        x: 10,
		        y: 10,
		        xtype:'label',
		        text: 'Send To:'
		    },{
		        x: 80,
		        y: 10,
		        name: 'to',
		        anchor:'90%'  // anchor width by percentage
		    },{
		        x: 10,
		        y: 40,
		        xtype:'label',
		        text: 'Subject:'
		    },{
		        x: 80,
		        y: 40,
		        name: 'subject',
		        anchor: '90%'  // anchor width by percentage
		    },{
		        x:0,
		        y: 80,
		        xtype: 'textareafield',
		        name: 'msg',
		        anchor: '100% 100%'  // anchor width and height
		    }]
		},{
			xtype: 'panel',
			title: 'Accordion Layout',
		    width: 300,
		    height: 300,
		    defaults: {
		        // applied to each contained panel
		        bodyStyle: 'padding:15px'
		    },
		    layout: {
		        // layout-specific configs go here
		        type: 'accordion',
		        titleCollapse: false,
		        animate: true,
		        activeOnTop: true
		    },
		    items: [{
		        title: 'Panel 1',
		        html: 'Panel content!'
		    },{
		        title: 'Panel 2',
		        html: 'Panel content!'
		    },{
		        title: 'Panel 3',
		        html: 'Panel content!'
		    }]
		},{
			xtype: 'panel',
			width: 500,
		    height: 400,
		    title: "AnchorLayout Panel",
		    layout: 'anchor',
		    items: [
		        {
		            xtype: 'panel',
		            title: '75% Width and 20% Height',
		            anchor: '75% 20%'
		        },
		        {
		            xtype: 'panel',
		            title: 'Offset -300 Width & -200 Height',
		            anchor: '-300 -200'     
		        },
		        {
		            xtype: 'panel',
		            title: 'Mixed Offset and Percent',
		            anchor: '-250 20%'
		        }
		    ]
		},{
			xtype: 'panel',
			width: 500,
		    height: 280,
		    title: "AutoLayout Panel",
		    layout: 'auto',
		    items: [{
		        xtype: 'panel',
		        title: 'Top Inner Panel',
		        width: '75%',
		        height: 90
		    },
		    {
		        xtype: 'panel',
		        title: 'Bottom Inner Panel',
		        width: '75%',
		        height: 90
		    }]
		},{
			xtype: 'panel',
			width: 500,
		    height: 300,
		    title: 'Border Layout',
		    layout: 'border',
		    items: [{
		        title: 'South Region is resizable',
		        region: 'south',     // position for region
		        xtype: 'panel',
		        height: 100,
		        split: true,         // enable resizing
		        margins: '0 5 5 5'
		    },{
		        // xtype: 'panel' implied by default
		        title: 'West Region is collapsible',
		        region:'west',
		        xtype: 'panel',
		        margins: '5 0 0 5',
		        width: 200,
		        collapsible: true,   // make collapsible
		        id: 'west-region-container',
		        layout: 'fit'
		    },{
		        title: 'Center Region',
		        region: 'center',     // center region is required, no width/height specified
		        xtype: 'panel',
		        layout: 'fit',
		        margins: '5 5 0 0'
		    }]
		},{
			xtype: 'panel',
			title: 'Card Layout',
			layout: 'card',
		    items: [
		        { html: 'Card 1' },
		        { html: 'Card 2' }
		    ]
		},{
			xtype: 'panel',
			title: 'Column Layout - Percentage Only',
		    width: 350,
		    height: 250,
		    layout:'column',
		    items: [{
		        title: 'Column 1',
		        columnWidth: 0.25
		    },{
		        title: 'Column 2',
		        columnWidth: 0.55
		    },{
		        title: 'Column 3',
		        columnWidth: 0.20
		    }]
		},{
			xtype: 'panel',
			title: 'Column Layout - Mixed',
		    width: 350,
		    height: 250,
		    layout:'column',
		    items: [{
		        title: 'Column 1',
		        width: 120
		    },{
		        title: 'Column 2',
		        columnWidth: 0.7
		    },{
		        title: 'Column 3',
		        columnWidth: 0.3
		    }]
		},{
			xtype: 'panel',
			title: 'Fit Layout',
		    width: 300,
		    height: 150,
		    layout:'fit',
		    items: {
		        title: 'Inner Panel',
		        html: 'This is the inner panel content',
		        bodyPadding: 20,
		        border: false
		    }
		},{
			xtype: 'panel',
			width: 500,
		    height: 300,
		    title: "FormLayout Panel",
		    layout: 'form',
		    renderTo: Ext.getBody(),
		    bodyPadding: 5,
		    defaultType: 'textfield',
		    items: [{
		       fieldLabel: 'First Name',
		        name: 'first',
		        allowBlank:false
		    },{
		        fieldLabel: 'Last Name',
		        name: 'last'
		    },{
		        fieldLabel: 'Company',
		        name: 'company'
		    }, {
		        fieldLabel: 'Email',
		        name: 'email',
		        vtype:'email'
		    }, {
		        fieldLabel: 'DOB',
		        name: 'dob',
		        xtype: 'datefield'
		    }, {
		        fieldLabel: 'Age',
		        name: 'age',
		        xtype: 'numberfield',
		        minValue: 0,
		        maxValue: 100
		    }, {
		        xtype: 'timefield',
		        fieldLabel: 'Time',
		        name: 'time',
		        minValue: '8:00am',
		        maxValue: '6:00pm'
		    }]
		},{
			xtype: 'panel',
			width: 500,
		    height: 300,
		    title: "HBoxLayout Panel",
		    layout: {
		        type: 'hbox',
		        align: 'stretch'
		    },
		    renderTo: document.body,
		    items: [{
		        xtype: 'panel',
		        title: 'Inner Panel One',
		        flex: 2
		    },{
		        xtype: 'panel',
		        title: 'Inner Panel Two',
		        flex: 1
		    },{
		        xtype: 'panel',
		        title: 'Inner Panel Three',
		        flex: 1
		    }]
		},{
			xtype: 'panel',
			title: 'Table Layout',
		    width: 300,
		    height: 150,
		    layout: {
		        type: 'table',
		        // The total column count must be specified here
		        columns: 3
		    },
		    defaults: {
		        // applied to each contained panel
		        bodyStyle: 'padding:20px'
		    },
		    items: [{
		        html: 'Cell A content',
		        rowspan: 2
		    },{
		        html: 'Cell B content',
		        colspan: 2
		    },{
		        html: 'Cell C content',
		        cellCls: 'highlight'
		    },{
		        html: 'Cell D content'
		    }]
		},{
			xtype: 'panel',
			width: 500,
		    height: 400,
		    title: "VBoxLayout Panel",
		    layout: {
		        type: 'vbox',
		        align: 'center'
		    },
		    renderTo: document.body,
		    items: [{
		        xtype: 'panel',
		        title: 'Inner Panel One',
		        width: 250,
		        flex: 2
		    },
		    {
		        xtype: 'panel',
		        title: 'Inner Panel Two',
		        width: 250,
		        flex: 4
		    },
		    {
		        xtype: 'panel',
		        title: 'Inner Panel Three',
		        width: '50%',
		        flex: 4
		    }]
		},{
			xtype: 'menu',
			width: 200,
		    height: 110,
		    floating: false,  // usually you want this set to True (default)
		    items: [{
			        xtype: 'menucheckitem',
			        text: 'select all'
			    },{
			        xtype: 'menucheckitem',
			        text: 'select specific'
			    },{
			        iconCls: 'add16',
			        text: 'icon item'
			    },{
			        text: 'regular item'
			}]
		},{
			xtype: 'menu',
			width: 200,
		    height: 90,
		    floating: false,  // usually you want this set to True (default)
		    items: [{
		        text: 'choose a color',
		        menu: Ext.create('Ext.menu.ColorPicker', {
		            value: '000000'
		        })
		    },{
		        iconCls: 'add16',
		        text: 'icon item'
		    },{
		        text: 'regular item'
		    }]
		},{
			xtype: 'menu',
			width: 200,
		    height: 90,
		    floating: false,  // usually you want this set to True (default)
		    items: [{
		        text: 'choose a date',
		        menu: Ext.create('Ext.menu.DatePicker', {
		            handler: function(dp, date){
		                Ext.Msg.alert('Date Selected', 'You selected ' + Ext.Date.format(date, 'M j, Y'));
		            }
		        })
		    },{
		        iconCls: 'add16',
		        text: 'icon item'
		    },{
		        text: 'regular item'
		    }]
		},{
			xtype: 'menu',
			width: 200,
		    height: 100,
		    floating: false,  // usually you want this set to True (default)
		    items: [{
		        text: 'icon item',
		        iconCls: 'add16'
		    },{
		        text: 'text item'
		    },{
		        text: 'plain item',
		        plain: true
		    }]
		},{
			xtype: 'menu',
			width: 200,
		    height: 100,
		    floating: false,  // usually you want this set to True (default)
		    items: [{
		        text: 'icon item',
		        iconCls: 'add16'
		    },{
		        xtype: 'menuseparator'
		    },{
		       text: 'separator above'
		    },{
		       text: 'regular item'
		    }]
		},{
			xtype: 'panel',
			width: 200,
		    height: 200,
		    title: 'A Panel',
		    tools: [{
		        type: 'help',
		        callback: function() {
		            // show help here
		        }
		    }, {
		        itemId: 'refresh',
		        type: 'refresh',
		        hidden: true,
		        callback: function() {
		            // do refresh
		        }
		    }, {
		        type: 'search',
		        callback: function (panel) {
		            // do search
		            panel.down('#refresh').show();
		        }
		    }]
		},{
			xtype: 'colorpicker',
			value: '993300',  // initial selected color
		    listeners: {
		        select: function(picker, selColor) {
		            alert(selColor);
		        }
		    }
		},{
			xtype: 'datepicker',
	        handler: function(picker, date) {
	            // do something with the selected date
	        }
		},{
			xtype: 'timepicker',
			width: 60,
		   minValue: Ext.Date.parse('04:30:00 AM', 'h:i:s A'),
		   maxValue: Ext.Date.parse('08:00:00 AM', 'h:i:s A')
		},{
			xtype: 'multislider',
			width: 200,
		    values: [25, 50, 75],
		    increment: 5,
		    minValue: 0,
		    maxValue: 100,

		    // this defaults to true, setting to false allows the thumbs to pass each other
		    constrainThumbs: false
		},{
			xtype: 'sliderfield',
			width: 200,
		    value: 50,
		    increment: 10,
		    minValue: 0,
		    maxValue: 100
		},{
			xtype: 'sliderfield',
			width: 214,
		    minValue: 0,
		    maxValue: 100,
		    useTips: true
		},{
			xtype: 'sliderfield',
			width: 214,
		    minValue: 0,
		    maxValue: 100,
		    useTips: true,
		    tipText: function(thumb){
		        return Ext.String.format('**{0}% complete**', thumb.value);
		    }
		},{
			xtype: 'tabpanel',
			width: 400,
		    height: 100,
		    items: [{
		        title: 'Foo'
		    }, {
		        title: 'Bar',
		        tabConfig: {
		            title: 'Custom Title',
		            tooltip: 'A button tooltip'
		        }
		    }]
		},{
			xtype: 'panel',
			title: 'Toolbar Fill Example',
		     width: 300,
		     height: 100,
		     tbar : [
		         'Item 1',
		         { xtype: 'tbfill' },
		         'Item 2',
		         { xtype: 'tbseparator' },
		         'Item 3'
		     ]
		},{
			xtype: 'grid',
			title: 'Paging Toolbar',
		    store: store12,
		    columns: [
		        { header: 'Name',  dataIndex: 'name' },
		        { header: 'Email', dataIndex: 'email', flex: 1 },
		        { header: 'Phone', dataIndex: 'phone' }
		    ],
		    width: 400,
		    height: 125,
		    dockedItems: [{
		        xtype: 'pagingtoolbar',
		        store: store,   // same store GridPanel is using
		        dock: 'bottom',
		        displayInfo: true
		    }]
		},{
			title: 'Toolbar Spacer Example',
		    width: 300,
		    height: 100,
		    tbar : [
		        'Item 1',
		        { xtype: 'tbspacer' }, // or ' '
		        'Item 2',
		        // space width is also configurable via javascript
		        { xtype: 'tbspacer', width: 50 }, // add a 50px space
		        'Item 3'
		    ]
		},{
			xtype: 'toolbar',
			width   : 500,
		    items: [
		        {
		            // xtype: 'button', // default for Toolbars
		            text: 'Button'
		        },
		        {
		            xtype: 'splitbutton',
		            text : 'Split Button'
		        },
		        // begin using the right-justified button container
		        '->', // same as { xtype: 'tbfill' }
		        {
		            xtype    : 'textfield',
		            name     : 'field1',
		            emptyText: 'enter search term'
		        },
		        // add a vertical separator bar between toolbar items
		        '-', // same as {xtype: 'tbseparator'} to create Ext.toolbar.Separator
		        'text 1', // same as {xtype: 'tbtext', text: 'text1'} to create Ext.toolbar.TextItem
		        { xtype: 'tbspacer' },// same as ' ' to create Ext.toolbar.Spacer
		        'text 2',
		        { xtype: 'tbspacer', width: 50 }, // add a 50px space
		        'text 3'
		    ]
		},{
			xtype: 'treepanel',
			title: 'Simple Tree',
		    width: 200,
		    height: 150,
		    store: store13,
		    rootVisible: false
		},{
			xtype: 'dataview',
			store: Ext.data.StoreManager.lookup('imagesStore14'),
		    tpl: imageTpl,
		    itemSelector: 'div.thumb-wrap',
		    emptyText: 'No images available'
		},{
			xtype: 'chart',
			width: 500,
		    height: 300,
		    store: store1,
		    axes: [{
		        type: 'Numeric',
		        position: 'left',
		        fields: ['data1', 'data2', 'data3', 'data4', 'data5'],
		        title: 'Sample Values',
		        grid: {
		            odd: {
		                opacity: 1,
		                fill: '#ddd',
		                stroke: '#bbb',
		                'stroke-width': 1
		            }
		        },
		        minimum: 0,
		        adjustMinimumByMajorUnit: 0
		    }, {
		        type: 'Category',
		        position: 'bottom',
		        fields: ['name'],
		        title: 'Sample Metrics (Axis: category)',
		        grid: true,
		        label: {
		            rotate: {
		                degrees: 315
		            }
		        }
		    }],
		    series: [{
		        type: 'area',
		        highlight: false,
		        axis: 'left',
		        xField: 'name',
		        yField: ['data1', 'data2', 'data3', 'data4', 'data5'],
		        style: {
		            opacity: 0.93
		        }
		    }]
		},{
			xtype: 'chart',
			width: 500,
		    height: 300,
		    store: store2,
		    axes: [{
		        type: 'Numeric',
		        position: 'left',
		        fields: ['data1', 'data2', 'data3', 'data4', 'data5'],
		        title: 'Sample Values',
		        grid: {
		            odd: {
		                opacity: 1,
		                fill: '#ddd',
		                stroke: '#bbb',
		                'stroke-width': 1
		            }
		        },
		        minimum: 0,
		        adjustMinimumByMajorUnit: 0
		    }, {
		        type: 'Category',
		        position: 'bottom',
		        fields: ['name'],
		        title: 'Sample Metrics (Axis: Numeric)',
		        grid: true,
		        label: {
		            rotate: {
		                degrees: 315
		            }
		        }
		    }],
		    series: [{
		        type: 'area',
		        highlight: false,
		        axis: 'left',
		        xField: 'name',
		        yField: ['data1', 'data2', 'data3', 'data4', 'data5'],
		        style: {
		            opacity: 0.93
		        }
		    }]
		},{
			xtype: 'chart',
			width: 500,
		    height: 300,
		    animate: true,
		    store: store3,
		    axes: [{
		        type: 'Numeric',
		        position: 'bottom',
		        fields: ['data'],
		        label: {
		            renderer: Ext.util.Format.numberRenderer('0,0')
		        },
		        title: 'Sample Values',
		        grid: true,
		        minimum: 0
		    }, {
		        type: 'Category',
		        position: 'left',
		        fields: ['name'],
		        title: 'Sample Metrics (Series: Bar)'
		    }],
		    series: [{
		        type: 'bar',
		        axis: 'bottom',
		        highlight: true,
		        tips: {
		          trackMouse: true,
		          width: 140,
		          height: 28,
		          renderer: function(storeItem, item) {
		            this.setTitle(storeItem.get('name') + ': ' + storeItem.get('data') + ' views');
		          }
		        },
		        label: {
		          display: 'insideEnd',
		            field: 'data',
		            renderer: Ext.util.Format.numberRenderer('0'),
		            orientation: 'horizontal',
		            color: '#333',
		            'text-anchor': 'middle'
		        },
		        xField: 'name',
		        yField: 'data'
		    }]
		},{
			xtype: 'chart',
			width: 300,
		    height: 300,
		    animate: true,
		    store: store4,
		    axes: [
		        {
		            type: 'Numeric',
		            position: 'left',
		            fields: ['data'],
		            label: {
		                renderer: Ext.util.Format.numberRenderer('0,0')
		            },
		            title: 'Sample Values',
		            grid: true,
		            minimum: 0
		        },
		        {
		            type: 'Category',
		            position: 'bottom',
		            fields: ['name'],
		            title: 'Sample Metrics (Series: column)'
		        }
		    ],
		    series: [
		        {
		            type: 'column',
		            axis: 'left',
		            highlight: true,
		            tips: {
		              trackMouse: true,
		              width: 140,
		              height: 28,
		              renderer: function(storeItem, item) {
		                this.setTitle(storeItem.get('name') + ': ' + storeItem.get('data') + ' $');
		              }
		            },
		            label: {
		              display: 'insideEnd',
		              'text-anchor': 'middle',
		                field: 'data',
		                renderer: Ext.util.Format.numberRenderer('0'),
		                orientation: 'vertical',
		                color: '#333'
		            },
		            xField: 'name',
		            yField: 'data'
		        }
		    ]
		},{
			xtype: 'chart',
			store: store5,
		    width: 300,
		    height: 250,
		    animate: true,
		    insetPadding: 30,
		    axes: [{
		        type: 'gauge',
		        position: 'gauge',
		        minimum: 0,
		        maximum: 100,
		        steps: 10,
		        margin: 10
		    }],
		    series: [{
		        type: 'gauge',
		        field: 'value',
		        donut: 30,
		        colorSet: ['#F49D10', '#ddd']
		    }]
		},{
			xtype: 'chart',
			width: 400,
		    height: 300,
		    animate: true,
		    store: store6,
		    axes: [
		        {
		            type: 'Numeric',
		            position: 'left',
		            fields: ['data1', 'data2'],
		            label: {
		                renderer: Ext.util.Format.numberRenderer('0,0')
		            },
		            title: 'Sample Values',
		            grid: true,
		            minimum: 0
		        },
		        {
		            type: 'Category',
		            position: 'bottom',
		            fields: ['name'],
		            title: 'Sample Metrics'
		        }
		    ],
		    series: [
		        {
		            type: 'line',
		            highlight: {
		                size: 7,
		                radius: 7
		            },
		            axis: 'left',
		            xField: 'name',
		            yField: 'data1',
		            markerConfig: {
		                type: 'cross',
		                size: 4,
		                radius: 4,
		                'stroke-width': 0
		            }
		        },
		        {
		            type: 'line',
		            highlight: {
		                size: 7,
		                radius: 7
		            },
		            axis: 'left',
		            fill: true,
		            xField: 'name',
		            yField: 'data2',
		            markerConfig: {
		                type: 'circle',
		                size: 4,
		                radius: 4,
		                'stroke-width': 0
		            }
		        }
		    ]
		},{
			xtype: 'chart',
			width: 400,
		    height: 300,
		    animate: true,
		    store: store7,
		    theme: 'Base:gradients',
		    series: [{
		        type: 'pie',
		        angleField: 'data',
		        showInLegend: true,
		        tips: {
		            trackMouse: true,
		            width: 140,
		            height: 28,
		            renderer: function(storeItem, item) {
		                // calculate and display percentage on hover
		                var total = 0;
		                store.each(function(rec) {
		                    total += rec.get('data');
		                });
		                this.setTitle(storeItem.get('name') + ': ' + Math.round(storeItem.get('data') / total * 100) + '%');
		            }
		        },
		        highlight: {
		            segment: {
		                margin: 20
		            }
		        },
		        label: {
		            field: 'name',
		            display: 'rotate',
		            contrast: true,
		            font: '18px Arial'
		        }
		    }]
		},{
			xtype: 'chart',
			width: 400,
		    height: 300,
		    animate: true,
		    theme:'Category2',
		    store: store8,
		    axes: [{
		        type: 'Radial',
		        position: 'radial',
		        label: {
		            display: true
		        }
		    }],
		    series: [{
		        type: 'radar',
		        xField: 'name',
		        yField: 'data1',
		        showInLegend: true,
		        showMarkers: true,
		        markerConfig: {
		            radius: 5,
		            size: 5
		        },
		        style: {
		            'stroke-width': 2,
		            fill: 'none'
		        }
		    },{
		        type: 'radar',
		        xField: 'name',
		        yField: 'data2',
		        showMarkers: true,
		        showInLegend: true,
		        markerConfig: {
		            radius: 5,
		            size: 5
		        },
		        style: {
		            'stroke-width': 2,
		            fill: 'none'
		        }
		    },{
		        type: 'radar',
		        xField: 'name',
		        yField: 'data3',
		        showMarkers: true,
		        showInLegend: true,
		        markerConfig: {
		            radius: 5,
		            size: 5
		        },
		        style: {
		            'stroke-width': 2,
		            fill: 'none'
		        }
		    }]
		},{
			xtype: 'chart',
			width: 400,
		    height: 300,
		    animate: true,
		    theme:'Category2',
		    store: store9,
		    axes: [{
		        type: 'Numeric',
		        position: 'left',
		        fields: ['data2', 'data3'],
		        title: 'Sample Values',
		        grid: true,
		        minimum: 0
		    }, {
		        type: 'Category',
		        position: 'bottom',
		        fields: ['name'],
		        title: 'Sample Metrics (Series: scatter)'
		    }],
		    series: [{
		        type: 'scatter',
		        markerConfig: {
		            radius: 5,
		            size: 5
		        },
		        axis: 'left',
		        xField: 'name',
		        yField: 'data2'
		    }, {
		        type: 'scatter',
		        markerConfig: {
		            radius: 5,
		            size: 5
		        },
		        axis: 'left',
		        xField: 'name',
		        yField: 'data3'
		    }]
		},{
			xtype: 'chart',
			width: 400,
		    height: 300,
		    animate: true,
		    store: store10,
		    shadow: true,
		    theme: 'Category1',
		    legend: {
		        position: 'top'
		    },
		    axes: [
		        {
		            type: 'Numeric',
		            position: 'left',
		            fields: ['data1', 'data2', 'data3', 'data4', 'data5'],
		            title: 'Sample Values',
		            grid: {
		                odd: {
		                    opacity: 1,
		                    fill: '#ddd',
		                    stroke: '#bbb',
		                    'stroke-width': 1
		                }
		            },
		            minimum: 0,
		            adjustMinimumByMajorUnit: 0
		        },
		        {
		            type: 'Category',
		            position: 'bottom',
		            fields: ['name'],
		            title: 'Sample Metrics (Sample Legend)',
		            grid: true,
		            label: {
		                rotate: {
		                    degrees: 315
		                }
		            }
		        }
		    ],
		    series: [{
		        type: 'area',
		        highlight: false,
		        axis: 'left',
		        xField: 'name',
		        yField: ['data1', 'data2', 'data3', 'data4', 'data5'],
		        style: {
		            opacity: 0.93
		        }
		    }]
		},{
			xtype: 'panel',
			title: 'Draw',
			layout: 'hbox',
			items: [{
				xtype: 'draw',
				width: 200,
			    height: 200,
			    items: [{
			        type: 'circle',
			        radius: 90,
			        x: 100,
			        y: 100,
			        fill: 'blue'
			    }]
			},{
				xtype: 'draw',
				width: 200,
				height: 200,
				items: [{
			        type: 'rect',
			        width: 100,
			        height: 50,
			        radius: 10,
			        fill: 'green',
			        opacity: 0.5,
			        stroke: 'red',
			        'stroke-width': 2
			    }]
			},{
				xtype: 'draw',
				width: 200,
			    height: 200,
			    items: [{
			        type: "ellipse",
			        radiusX: 100,
			        radiusY: 50,
			        x: 100,
			        y: 100,
			        fill: 'red'
			    }]
			},{
				xtype: 'draw',
				width: 200,
			    height: 200,
			    items: [{
			        type: "path",
			        path: "M-66.6 26C-66.6 26 -75 22 -78.2 18.4C-81.4 14.8 -80.948 19.966 " +
			              "-85.8 19.6C-91.647 19.159 -90.6 3.2 -90.6 3.2L-94.6 10.8C-94.6 " +
			              "10.8 -95.8 25.2 -87.8 22.8C-83.893 21.628 -82.6 23.2 -84.2 " +
			              "24C-85.8 24.8 -78.6 25.2 -81.4 26.8C-84.2 28.4 -69.8 23.2 -72.2 " +
			              "33.6L-66.6 26z",
			        fill: "purple"
			    }]
			},{
				xtype: 'draw',
				width: 200,
			    height: 200,
			    items: [{
			        type: "text",
			        text: "Hello, Sprite!",
			        fill: "green",
			        font: "18px monospace"
			    }]
			},{
				xtype: 'draw',
				width: 200,
			    height: 200,
			    items: [{
			        type: "image",
			        src: "../../../resource/image/companylogo/mnnga.png",
			        width: 200,
			        height: 200
			    }]
			}]
		}]
		this.callParent(arguments);
	}
});



Ext.create('Ext.fx.Animator', {
    target: Ext.getBody().createChild({
        style: {
            width: '100px',
            height: '100px',
            'background-color': 'red'
        }
    }),
    duration: 10000, // 10 seconds
    keyframes: {
        0: {
            opacity: 1,
            backgroundColor: 'FF0000'
        },
        20: {
            x: 30,
            opacity: 0.5
        },
        40: {
            x: 130,
            backgroundColor: '0000FF'
        },
        60: {
            y: 80,
            opacity: 0.3
        },
        80: {
            width: 200,
            y: 200
        },
        100: {
            opacity: 0,
            backgroundColor: 'FFFFFF'
        }
    }
});