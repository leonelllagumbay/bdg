/**
 * This class is the controller for the main view for the application. It is specified as
 * the "controller" of the Main view class.
 *
 * TODO - Replace this content of this view to suite the needs of your application.
 */
Ext.define('Manager.view.main.MainController', {
    extend: 'Ext.app.ViewController',

    alias: 'controller.main',

    routes: {
    	'home': 'onHome',
    	'users/:id/:isactive': {
    		before: 'onBeforeUser',
    		action: 'onUsers'
    	},
    	'administrator': 'onAdministrator',
    	'book': 'onBook',
    	'hrm': 'onHrm',
    	'dashboard': 'onDashboard',
    	'email': 'onEmail',
    	'file': 'onFile',
    	'form': 'onForm',
    	'payroll': 'onPayroll',
    	'accounting': 'onAccounting',
    	'inventory': 'onInventory',
    	'ecommerce': 'onEcommerce',
    	'analytics': 'onAnalytics',
    	'data': 'onData',
    	'company': 'onCompany',
    	'role': 'onRole',
    	'permission': 'onPermission',
    	'folder': 'onFolder',
    	'forum': 'onForum',
    	'gallery': 'onGallery',
    	'note': 'onNote',
    	'plugin': 'onPlugin',
    	'query': 'onQuery',
    	'reminder': 'onReminder',
    	'calendar': 'onCalendar',
    	'service': 'onService',
    	'gateway': 'onGateway',
    	'sms': 'onSms',
    	'websocket': 'onWebsocket',
    	'chat': 'onChat',
    	'time': 'onTime',
    	'work': 'onWork',
    	'lookup': 'onLookup',
    	'config': 'onConfig',
    	'simulator': 'onSimulator',
    	'social': 'onSocial'
    },
    
    onHome: function() {
    	Ext.Msg.alert('onHome','Home');
    },
    
    onBeforeUser: function(id, isactive, action) {
    	Ext.Msg.alert('Before', 'Before action');
    	// action.resume();
    	 action.stop(true);
    },
    
    onUsers: function(id, isactive) {
    	Ext.Msg.alert('User app here','Users ' + id + ' ' + isactive);
    },
    
    onAdministrator: function() {
    	Ext.Msg.alert('onAdministrator','Administrator');
    },
    
    onBook: function() {
    	Ext.Msg.alert('onBook','onBook');
    },
    
    onHrm: function() {
    	Ext.Msg.alert('onHrm','Home sweet home');
    },
    
    onDashboard: function() {
    	Ext.Msg.alert('onDashboard','Home');
    },
    
    onEmail: function() {
    	Ext.Msg.alert('onEmail','Home');
    },
    
    onFile: function() {
    	Ext.Msg.alert('onFile','Home');
    },
    
    onForm: function() {
    	Ext.Msg.alert('onForm','Home');
    },
    
    onPayroll: function() {
    	Ext.Msg.alert('onPayroll','Home');
    },
    
    onAccounting: function() {
    	Ext.Msg.alert('onAccounting','Home');
    },
    
    onInventory: function() {
    	Ext.Msg.alert('onInventory','Home');
    },
    
    onEcommerce: function() {
    	Ext.Msg.alert('onEcommerce','Home');
    },
    
    onAnalytics: function() {
    	Ext.Msg.alert('onAnalytics','Home');
    },
    
    onData: function() {
    	Ext.Msg.alert('onData','Home');
    },
    
    onCompany: function() {
    	Ext.Msg.alert('onCompany','Home');
    },
    
    onRole: function() {
    	Ext.Msg.alert('onRole','Home');
    },
    
    onPermission: function() {
    	Ext.Msg.alert('onPermission','Home');
    },
    
    onFolder: function() {
    	Ext.Msg.alert('onFolder','Home');
    },
    
    onForum: function() {
    	Ext.Msg.alert('onForum','Home');
    },
    
    onGallery: function() {
    	Ext.Msg.alert('onGallery','Home');
    },
    
    onNote: function() {
    	Ext.Msg.alert('onNote','Home');
    },
    
    onPlugin: function() {
    	Ext.Msg.alert('onPlugin','Home');
    },
    
    onQuery: function() {
    	Ext.Msg.alert('onQuery','Home');
    },
    
    onReminder: function() {
    	Ext.Msg.alert('onReminder','Home');
    },
    
    onCalendar: function() {
    	Ext.Msg.alert('onCalendar','Home');
    },
    
    onService: function() {
    	Ext.Msg.alert('onService','Home');
    },
    
    onGateway: function() {
    	Ext.Msg.alert('onGateway','Home');
    },
    
    onSms: function() {
    	Ext.Msg.alert('onSms','Home');
    },
    
    onWebsocket: function() {
    	Ext.Msg.alert('onWebsocket','Home');
    },
    
    onChat: function() {
    	Ext.Msg.alert('onChat','Home');
    },
    
    onTime: function() {
    	Ext.Msg.alert('onTime','Home');
    },
    
    onWork: function() {
    	Ext.Msg.alert('onWork','Home');
    },
    
    onLookup: function() {
    	Ext.Msg.alert('onLookup','Home');
    },
    
    onConfig: function() {
    	Ext.Msg.alert('onConfig','Home');
    },
    
    onSimulator: function() {
    	Ext.Msg.alert('onSimulator','Home');
    },
    
    onSocial: function() {
    	Ext.Msg.alert('onSocial','Home');
    },
    
    onItemSelected: function (sender, record) {
        Ext.Msg.confirm('Confirm', 'Are you sure?', 'onConfirm', this);
    },

    onConfirm: function (choice) {
        if (choice === 'yes') {
            //
        }
    }
});
