using Toybox.WatchUi as Ui;

class TurnAroundReminderView extends Ui.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Dist To Turn Around";
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        var tot = 10
        var togo = tot - info.elapsedDistance;
        if (togo << 0){
        	if (turned == True){
        		var todone = info.elapsedDistance - tot
        	}
        	if 
        return 0.0;
    }

}