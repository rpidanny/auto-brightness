var serialport = require("serialport");
var SerialPort = serialport.SerialPort;
var sys = require('sys')
var exec = require('child_process').exec;
var child;

var sp = new SerialPort("/dev/ttyUSB0",{
	baudrate:9600,
	parser: serialport.parsers.readline("\n")
});

function puts(error, stdout, stderr) { /*sys.puts(stdout)*/ };

/*
serialport.list(function (err, ports) {
  ports.forEach(function(port) {
    console.log(port.comName);
    console.log(port.pnpId);
    console.log(port.manufacturer);
  });
});
*/
sp.on("open",function(){
	console.log("Serial Port Open!");
	//sp.write("1");
	sp.on("data",function(data){
		var brightness= parseInt(data)*10;
		console.log('Brightness : '+brightness);
		exec("sudo ddccontrol -p -r 0x10 -w "+brightness, puts); //External Monitor
		exec("xbacklight -set "+brightness+10, puts);	//Laptop Display
	});
});
