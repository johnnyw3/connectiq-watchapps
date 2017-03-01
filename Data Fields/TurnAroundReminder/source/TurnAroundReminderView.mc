using Toybox.WatchUi as Ui;

var turned = false;
var distdis = false;
var done = false;

class TurnAroundReminderView extends Ui.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        var settitle = Application.getApp().getProperty("settitle");
        var settitle2 = Application.getApp().getProperty("settitle2");
        if (settitle == true){
        	if (settitle2 == true){
        		label = "TurnAround Notifier (Km)";
            }
            else{
        		label = "TurnAround Notifier";
        	}
        }
        else{
        	if (settitle2 == true){
        		label = "TurnAround (Km)";
        	}
        	else {
        		label = "TurnAround";
        	}
        }
    }
   

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        var timee = 1;
        var goal = Application.getApp().getProperty("setgoal");
        var end = goal * 2;
        var d1 = info.elapsedDistance;
        if (info.elapsedDistance == null){
        	d1 = 12500;
        }
		var d2 = d1 / 1000.0;
		var dist = d2;
        if (turned == false){
        	var tu1 = goal - dist;
        		if (tu1 <= 0) {
        			var nts = "Turn Around Now...";
        			turned = true;
        			timee = 1 + timee;
        			return nts;
        		}
        	var tu2 = tu1.toString();
        	var re = tu1;
        	if (distdis == true){
        		distdis = false;
        		return "To Turnaround....";
        		
        	}
        	else {
        		distdis = true;
        		return re;
        	}
        }
        if (turned == true){
        	var togo = end - dist;
        	if (togo <= 0){
        		return "Done!!!";
        	}
        	if (distdis == true){
        		distdis = false;
        		return "To Finish....";
        		
        	}
        	else {
        		distdis = true;
        		return togo;
        	}
			var t23 = "Km To End";
			var res = togo + t23;
        	return res;
        	}
        return 0.0;
    }

}