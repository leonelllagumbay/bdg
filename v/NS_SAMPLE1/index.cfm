<!-- Comment --->
<!DOCTYPE>
<html>
	<head>
		<title>Hello World Sample</title>
		<link rel="stylesheet" type="text/css" href="../../scripts/ext6/build/classic/theme-triton/resources/theme-triton-all.css">
		<script src="../../scripts/ext6/build/ext-all.js"></script>
		<script>
			// Panel Example
			// In this example we create a classic Hello World example.  The example
			// uses the Panel component rendering it to the browser's document
			// body (though any HTML element could be targeted).
			//
			// Try forking this fiddle and changing the config options described on
			// the Panel's API doc to see the versatility of the Panel component.

			Ext.application({
			    name: 'Fiddle',

			    launch: function() {

			    function calculateClockHandsAngle(inputTime) {
	/** inputTime sample "12:30";
	  * minuteHand - it takes an hour for a full cycle
	  * hourHand - it takes 12 hours for full cycle
	  * Assume: 1 minute angle = 6 degrees
	  *           minuteHand moves 6 degree angle per minute, 360/60 = 6
	  *           hourHand moves 0.5 degree per minute, 12h*60min = 720, 360/720 = 0.5
	  * Input argument format is HH:MM or H:M or HH or H
	  **/

	// Convert input to minute representation of time
	var timeArr = inputTime.split(":");
	var timeInMinute = 0;
	if (timeArr.length == 2) {
		var hourPart = Math.abs(timeArr[0]);
		var minutePart = Math.abs(timeArr[1]);
		if (hourPart == 12) hourPart = 0;
		if (!isNaN(hourPart) && !isNaN(minutePart)) {
			timeInMinute = hourPart*60 + minutePart;
		} else {
			throw("Invalid time!");
		}
	} else {
		var hourPart = timeArr[0];
		var minutePart = 0;
		if (!isNaN(hourPart)) {
			timeInMinute = hourPart*60;
		} else {
			throw("Invalid time!");
		}
	}

	// Calculate minute hand angle with reference to 12 o' clock
	var minuteHandAngle = timeInMinute*6;

	// Calculate hour hand angle with reference to 12 o' clock
	var hourHandAngle = timeInMinute*(0.5);

	// Get the absolute difference of the angle
	var angleDiff = Math.abs(minuteHandAngle - hourHandAngle);
	if (angleDiff <= 180) {
		return angleDiff;
	} else if (angleDiff > 180 && angleDiff <=360) {
		return 360 - angleDiff;
	} else {
		// Calculate equivalent angle that is less than or equal to 180
		var equivalentAngleMod = angleDiff/360;
		var equnum = equivalentAngleMod.toString().split(".")
		if (equnum.length > 1) equivalentAngleMod = "0." + equnum[1];
			else return 0;

		var equivalentAngle = Math.round(360 * equivalentAngleMod);
		if (equivalentAngle <= 180) return equivalentAngle;
		else return 360 - equivalentAngle;
	}
}

			    console.log(calculateClockHandsAngle("2:47"));

				/* JavaScript code */
			    function OpenStructImplementation() {
			    	this.foo = "foo_value";
			    	this.baz = "baz_value";
			    }

			    OpenStructImplementation.prototype = {
			    	constructor: OpenStructImplementation,
			    	getFoo: function() {
			    		return this.foo;
			    	},
			    	setFoo: function(fooVal) {
			    		this.foo = fooVal;
			    	},
			    	getBaz: function() {
			    		return this.baz;
			    	},
			    	setBaz: function(bazVal) {
			    		this.baz = 	bazVal;
			    	}
			    }

			    instance = new OpenStructImplementation();

			    console.log(instance);

var str = 'LLWWWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW';

function runEncoded(str) {
    var encodedversion = [];
    // Match repeating strings
    var matchstr = str.match(/(.)\1*/g);
    matchstr.forEach(function(substr) {
    	// count each match and and insert value
    	encodedversion.push(substr.length + substr[0]);
    });
    return encodedversion.join("");
}

console.log(runEncoded(str));

			        Ext.create({
			            xtype: 'panel',
			            renderTo: Ext.getBody(),
			            title: 'Hello World!',
			            frame: true,
			            margin: 20,
			            height: 200,
			            width: 300,
			            bodyPadding: 12,
			            html: '<h2>Welcome to Ext JS</h2><br><i>... and <b>Hello World!</b></i>'
			        });
			    }
			});
		</script>
	</head>
<body>
</body>

</html>