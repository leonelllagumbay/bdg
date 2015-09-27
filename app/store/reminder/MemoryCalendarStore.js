Ext.define('Form.store.reminder.MemoryCalendarStore', {
    extend: 'Ext.data.Store',
    model: 'Form.model.reminder.CalendarModel',
    autoLoad: true,
	proxy: {
        type: 'ajax',
        url: './myapps/data/calendar.cfm',
        noCache: false,
        
        reader: {
            type: 'json',
            root: 'calendars'
        }
    }

});
