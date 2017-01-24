using Toybox.WatchUi as Ui;

class HalfKMDistView extends Ui.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        var settitle = Application.getApp().getProperty("settitle");
        if (settitle == true){
        	label = "Distance (KM)";
        }
        else{
        	label = "Distance";
        }
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        var d1 = 1;
        if (info.elapsedDistance == null){
        	d1 = 500;
        }
        else{
        	d1 = info.elapsedDistance;
        }
        var d2 = d1 / 500;
        var d3 = d2 / 2.0;
        
        return d3;
    }

}