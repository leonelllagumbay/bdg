Ext.define('iBOSe.store.AppsStore', {
    extend: 'Ext.data.Store',

    alias: 'store.iboseappstore',

    fields: [
        'name', 'email', 'phone'
    ],

    data: { items: [
        { name: 'Jean Luc', email: "jeanluc.picard@enterprise.com", phone: "555-111-1111" },
        { name: 'Worf',     email: "worf.moghsson@enterprise.com",  phone: "555-222-2222" }
    ]},

    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            rootProperty: 'items'
        }
    }
});
