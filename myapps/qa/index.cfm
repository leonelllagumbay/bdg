<html>  
<head>
    <title>iBOS/e QA File</title>
	<link rel="icon" type="image/ico" href="../../../diginfologo.ico">
	<link rel="stylesheet" type="text/css" href="../../../scripts/extjs/resources/css/ext-all.css"> 
    <script type="text/javascript" src="../../../scripts/extjs/ext-all-debug.js"></script>
    <script type="text/javascript">
    	Ext.onReady(function() {
    		Ext.define('Ext.form.field.Month', {
        extend: 'Ext.form.field.Date',
        alias: 'widget.monthfield',
        requires: ['Ext.picker.Month'],
        alternateClassName: ['Ext.form.MonthField', 'Ext.form.Month'],
        selectMonth: null,
        createPicker: function () {
            var me = this,
                format = Ext.String.format;
            return Ext.create('Ext.picker.Month', {
                pickerField: me,
                ownerCt: me.ownerCt,
                renderTo: document.body,
                floating: true,
                hidden: true,
                focusOnShow: true,
                height: 200,
                minDate: me.minValue,
                maxDate: me.maxValue,
                disabledDatesRE: me.disabledDatesRE,
                disabledDatesText: me.disabledDatesText,
                disabledDays: me.disabledDays,
                disabledDaysText: me.disabledDaysText,
                format: me.format,
                showToday: me.showToday,
                startDay: me.startDay,
                minText: format(me.minText, me.formatDate(me.minValue)),
                maxText: format(me.maxText, me.formatDate(me.maxValue)),
                listeners: {
                    select: { scope: me, fn: me.onSelect },
                    monthdblclick: { scope: me, fn: me.onOKClick },
                    yeardblclick: { scope: me, fn: me.onOKClick },
                    OkClick: { scope: me, fn: me.onOKClick },
                    CancelClick: { scope: me, fn: me.onCancelClick }
                },
                keyNavConfig: {
                    esc: function () {
                        me.collapse();
                    }
                }
            });
        },
        onCancelClick: function () {
            var me = this;
            me.selectMonth = null;
            me.collapse();
        },
        onOKClick: function () {
            var me = this;
            if (me.selectMonth) {
                me.setValue(me.selectMonth);
                me.fireEvent('select', me, me.selectMonth);
            }
            me.collapse();
        },
        onSelect: function (m, d) {
            var me = this;
            me.selectMonth = new Date((d[0] + 1) + '/1/' + d[1]);
        }
});
	 
	 
	 
Ext.create('Ext.form.Panel', {
	    title: 'iBOS/e Application Online Form',
		width: 500,
		height: 500,
	    renderTo: document.body,
	    items: [{
			xtype: 'monthfield',
			format: 'F Y',
			name: 'PREVEMPLOYEDFROM',
			//cls: 'field-margin',
			//labelAlign: 'top',
			fieldLabel: 'From',
			//width: 200,
		},{
			xtype: 'textfield',
			fieldLabel: 'Leonell'
		}]
				
    });
    
 });
	    
    
    
    </script>
</head>
<body>
	   
</body>
</html>
<cfsetting showdebugoutput="false">