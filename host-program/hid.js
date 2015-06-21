var HID = require('node-hid');
var sys = require('sys')
var exec = require('child_process').exec;

function puts(error, stdout, stderr) {/*sys.puts(stdout)*/};

var devices= HID.devices();
console.log(devices);

exec("sudo modprobe i2c-dev", puts);

for (var i = 0;i<devices.length; i++) {
	if(devices[i].vendorId==5824){
		console.log(devices[i].manufacturer);
		var danny = new HID.HID(devices[i].path);
		danny.on("data", function(data) {
			//console.log(data);
			if(data[0]!=13 && data[1]!=10){
				var receivedData=parseInt(String.fromCharCode(data[0],data[1],data[2],data[3]));
				var brightness=receivedData*20;
				//console.log(brightness);	
				console.log('Brightness : '+brightness);
				exec("sudo ddccontrol -p -r 0x10 -w "+brightness, puts); //External Monitor
				exec("xbacklight -set "+brightness+15, puts);	//Laptop Display
			}
			

		});

		danny.on("error", function(err) {
			console.log(err);
		});
	}
};
