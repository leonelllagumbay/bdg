/*$(function(){	
	$('#carousel').infiniteCarousel({
		displayTime: 3000,
		transitionSpeed: 3000,
		autoPilot: true,
	});
});*/

Ext.apply(Ext.form.field.VTypes, {
    captcha:  function(v) {
			var captchaorig = Ext.ComponentQuery.query('textfield[name=captchatext]')[0].getValue();
			var captchatype = Ext.ComponentQuery.query('textfield[name=captchainput]')[0].getValue();
			if(captchaorig != captchatype) {
				return false;
			} else {
				return true;
			}
		},
	    captchaText: 'Wrong captcha. Type the characters above again.'
});

function openContactUs() {
	var wc = Ext.create('Ext.window.Window', {
	    title: 'We want to hear from you!',
	    height: 500,
	    width: 870,
	    layout: 'fit',
	    items: [{
	        xtype: 'container',
	        layout: 'hbox',
	        items: [{
	        	xtype: 'form',
	        	autoScroll: true,
	        	flex: 1,
	        	height: '100%',
	        	defaults: {
	        		padding: 7,
	        		width: '90%'
	        	},
	        	items: [{
	        		xtype: 'displayfield',
	        		width: '97%',
	        		value: 'Tell us what you need from us and we\'ll get in touch with you as soon as we can. Request, comment, suggestion, inquiry; feel free to message us by filling out the form below. Or email directly to <a href="##">niloposo@diginfobettersystem.com</a> or <a href="##">nilposo@gmail.com</a>.'
	        	},{
	        		xtype: 'displayfield',
	        		value: '<strong>Contact Information</strong>'
	        	},{
	        		xtype: 'textfield',
	        		fieldLabel: 'Email',
	        		name: 'email',
	        		allowBlank: false,
	        		vtype: 'email',
	        		labelAlign: 'top'
	        	},{
	        		xtype: 'textfield',
	        		fieldLabel: 'Company',
	        		name: 'comp',
	        		allowBlank: false,
	        		labelAlign: 'top'
	        	},{
	        		xtype: 'textfield',
	        		fieldLabel: 'Address',
	        		name: 'address',
	        		labelAlign: 'top'
	        	},{
	        		xtype: 'numberfield',
	        		fieldLabel: 'Phone/Fax',
	        		name: 'phone',
	        		labelAlign: 'top'
	        	},{
	        		xtype: 'numberfield',
	        		fieldLabel: 'Mobile',
	        		name: 'mobile',
	        		labelAlign: 'top'
	        	},{
	        		xtype: 'textareafield',
	        		fieldLabel: 'Inquiry',
	        		name: 'inquiry',
	        		labelAlign: 'top',
	        		allowBlank: false
	        	},{
	        		xtype: 'displayfield',
	        		name: 'captcha',
	        		allowBlank: true,
	        		value: ''
	        	},{
	        		xtype: 'textfield',
	        		name: 'captchatext',
	        		hidden: true,
	        		value: new Date()
	        	},{
	        		xtype: 'textfield',
	        		name: 'captchainput',
	        		labelAlign: 'top',
	        		fieldLabel: 'Type the captcha text above',
	        		vtype: 'captcha'
	        	}],
	        	buttons: [{
	        		text: 'Send',
	        		action: 'submit',
	        		handler: function(b) {
	        			var dform = b.up('form').getForm();
	        			
	        			if (dform.isValid()) {
	        				b.up('form').getEl().mask('Sending...');
	        				var vals = dform.getValues();
	        				Ext.Ajax.request({
	        				    url: 'contactus.cfm',
	        				    params: {
	        				    	email: vals['email'],
	        				    	comp: vals['comp'],
	        				    	address: vals['address'],
	        				    	phone: vals['phone'],
	        				    	mobile: vals['mobile'],
	        				    	inquiry: vals['inquiry']
	        				    },
	        				    success: function(response) {
	        				    	b.up('form').getEl().unmask();
	        				    	b.up('window').close();
	        				    	Ext.Msg.alert('Status', 'Your inquiry has been sent.')
	        				    }
	        				});
	        			}
	        		}
	        	}],
	        },{
	        	xtype: 'container',
	        	flex: 1,
	        	padding: 4,
	        	height: '100%',
	        	items: [{
	        		xtype: 'displayfield',
	        		value: '<iframe width="415" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDHXxPiEcgk2q7P9OkWoLs1YhtgcWrxjek&q=City+and+Land+Mega+Plaza"></iframe>'
	        	},{
	        		xtype: 'displayfield',
	        		value: '<a target="_blank" href="https://www.facebook.com/diginfo.imachine"><img src="image/facebook-logo.png" width="20px"></a>&nbsp;<a target="_blank" href="http://diginfobettersystem.wordpress.com"><img src="image/wordpress.png" width="20px"></a>&nbsp;<a target="_blank" href="https://twitter.com/#!/DIGI_INFO#"><img src="image/twitter.png" width="20px"></a>&nbsp;<a target="_blank" href="http://www.linkedin.com/company/2356687?trk=tyah"><img src="image/linkedin-logo.png" width="20"></a>'
	        	}]
	        }]
	    }]
	}).show();
	
	
	Ext.Ajax.request({
	    url: './captcha.cfm',
	    success: function(response) {
	    	var response = JSON.parse(response.responseText);
	    	var clink = response["captchalink"].trim() || response["captchalink"];
	    	var cstring = response["captchastring"];
	    	var cdisplay = Ext.ComponentQuery.query('displayfield[name=captcha]')[0];
	    	cdisplay.setValue(clink);
	    	var cstringdisp = Ext.ComponentQuery.query('textfield[name=captchatext]')[0];
	    	cstringdisp.setValue(cstring);
	    }
	});
	
};

function showaboutus(containerid) {
	var ishidden = $('#'+containerid).is(":hidden");
	if (ishidden) {
		$('#'+containerid).show(1000);
	} else {
		$('#'+containerid).hide(1000);
	}
}

function getMoreInfo(dfilename, refparagraph, origelementref) {
	var ellipses = $('#'+ origelementref);
	ellipses.animate({opacity: '0.2'}, "slow");
	ellipses.animate({opacity: '0.4'}, "slow");
	ellipses.animate({opacity: '0.8'}, "slow");
	ellipses.animate({opacity: '1'}, "slow");
	ellipses.animate({opacity: '0.8'}, "slow");
	ellipses.animate({opacity: '0.4'}, "slow");
	ellipses.animate({opacity: '0.2'}, "slow");
	ellipses.animate({opacity: '1'}, "slow");
	Ext.Ajax.request({
	    url: './data/' + dfilename,
	    success: function(response) {
	    	var a = document.getElementById(refparagraph);
	    	a.innerHTML = response.responseText;
	    	$('#'+ origelementref).unbind("click");
	    	$('#'+ origelementref).click(function() {
	    		hideInfo(origelementref, refparagraph);
	    	});
	    }
	});
}

function hideInfo(origelementref, refparagraph) {
	var ishidden = $('#'+refparagraph).is(":hidden");
	if (ishidden) {
		$('#'+ refparagraph).show(1000);
	} else {
		$('#'+ refparagraph).hide(1000);
	}
}
