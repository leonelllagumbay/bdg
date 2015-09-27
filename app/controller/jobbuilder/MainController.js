Ext.define('Form.controller.jobbuilder.MainController', {
   	extend: 'Ext.app.Controller',
   	views: ['jobbuilder.MainView','jobbuilder.OrgChartView'],
   	models: [],
   	stores: [],
	init: function() {
		this.control({
			'orgchartview': {
				render: this.drawChart
			},
			'orgchartview button[action=refresh]': {
				click: this.drawChart
			}
		})
	},
	drawChart: function(b) {
		if (b.setDisabled) b.setDisabled(true);
		var data = new google.visualization.DataTable();

        data.addColumn('string', 'Name');
        data.addColumn('string', 'Manager');
        data.addColumn('string', 'ToolTip');

        var orgDevStore = Ext.widget('orgdevview').getStore();
        var chartDataTemp = new Array();
        var finalChartData = new Array();
        
        chartDataTemp = orgDevStore.data.items;
        for (a = 0; a < chartDataTemp.length; a++) {
        	var tempStruct = {};
        	var chartData = new Array();
        	var avatar = chartDataTemp[a].data['ecrgmyibose-AVATAR'];
        	var profilepic = "";
        	if(avatar != "") profilepic = "<p><img src='../../resource/image/pics201/fbc/" + avatar + "' width='50' height='50' alt='No Profile Pic'></p>";
        	
        	tempStruct['v'] = chartDataTemp[a].data['cmfpa-PERSONNELIDNO'];
        	tempStruct['f'] = '<div style="' + chartDataTemp[a].data['clkposition-JOBSTYLE'] + '">' + chartDataTemp[a].data['clkposition-DESCRIPTION'] + '</div>' + profilepic +'<p>' + chartDataTemp[a].data['cmfpa-FIRSTNAME'] + ' ' + chartDataTemp[a].data['cmfpa-MIDDLENAME'] + ' ' + chartDataTemp[a].data['cmfpa-LASTNAME'] + '</p>';
        	chartData.push(tempStruct);
        	chartData.push(chartDataTemp[a].data['cmfpa-SUPERIORCODE']); // Parent
        	if (chartDataTemp[a].data['clkposition-TOOLTIP'] != '') {
        		chartData.push(chartDataTemp[a].data['clkposition-TOOLTIP']); // Tooltip
        	} else {
        		chartData.push('');
        	}
	
        	finalChartData.push(chartData);
        }
        
        data.addRows(finalChartData); 
		
		var chart = new google.visualization.OrgChart(document.getElementById('orgchart37463483473'));
        chart.draw(data, {
        	allowHtml:true,
        	size: 'medium',
        	allowCollapse: true
        });
        if (b.setDisabled) b.setDisabled(false);
	}
});