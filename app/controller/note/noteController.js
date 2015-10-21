Ext.define('Form.controller.note.noteController', {
    extend: 'Ext.app.Controller',
	views: [
        'note.noteView',
        'note.noteShareView'
    ],
	models: [
	    'note.noteTitleModel',
	    'note.noteShareModel'
	],
	stores: [
	    'note.noteTitleStore',
	    'note.noteShareStore'
	],
	
	onLaunch: function() {
	    var noteStore = this.getNoteNoteTitleStoreStore();
	    noteStore.on('load', this.noteAfterLoad);
	},
	
	init: function() {
        this.control({
            
			'noteview': {  
				select: 'noteViewSelected'
			},
			'noteshareview': {
				select: 'noteViewSelected'
			}
		});
     },
     
     noteViewSelected: function(thisview, rec, ind) {
    	 var content = Ext.getCmp('center-region-note-content');
		 var insertc = {
				 html: rec.data['ecrgnotesdtl-NOTECONTENT'],
				 padding: 8
		 };
		 content.setTitle(rec.data['ecrgnotesdtl-NOTETITLE']);
		 content.removeAll();
		 content.add(insertc); 
	 },
     
     
     noteAfterLoad: function(s, r) {
    	 var bookView = Ext.ComponentQuery.query("noteview")[0];
		 if (!bookView.getSelectionModel().hasSelection()) {
			 bookView.getSelectionModel().select(0);
		 }
     }
     
 
});