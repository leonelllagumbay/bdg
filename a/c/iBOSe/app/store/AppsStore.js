Ext.define('iBOSe.store.AppsStore', {
    extend: 'Ext.data.Store',

    alias: 'store.iboseappstore',

    fields: [
        'appgroup', 'appname'
    ],

    data: { 
    	items: [{ 
    		appgroup: 'KnowledgeWARE', 
    		appname: "eFiles"
    	},{ 
    		appgroup: 'KnowledgeWARE', 
    		appname: "eForums"
    	},{ 
    		appgroup: 'KnowledgeWARE', 
    		appname: "eBooks"
    	},{ 
    		appgroup: 'KnowledgeWARE', 
    		appname: "eNotes"
    	},{ 
    		appgroup: 'KnowledgeWARE', 
    		appname: "eGallery"
    	},{ 
    		appgroup: 'KnowledgeWARE', 
    		appname: "eRooms"
    	}]
    },

    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            rootProperty: 'items'
        }
    }
});
