using Toybox.WatchUi as Ui;

class MinTimeDFView extends Ui.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Time (Hours.Minutes)";
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
      function compute(info) {
        // See Activity.Info in the documentation for available information.
        var t1 = info.elapsedTime;
        var t2 = t1 / 900000;
        var t3 = t2 * 0.15;
        if (t3 == 0.60){
        	t3 = 1.00;
        }
        if (t3 == 1.60){
        	t3 = 2.00;
        }
       if (t3 == 2.60){
        	t3 = 3.00;
        }
        if (t3 == 3.60){
        	t3 = 4.00;
        }
        if (t3 == 4.60){
        	t3 = 5.00;
        }
        if (t3 == 5.60){
        	t3 = 6.00;
        }
        if (t3 == 6.60){
        	t3 = 7.00;
        }
        if (t3 == 7.60){
        	t3 = 8.00;
        }
        if (t3 == 8.60){
        	t3 = 9.00;
        }
        if (t3 == 9.60){
        	t3 = 10.00;
        }
        if (t3 == 10.60){
        	t3 = 11.00;
        }
        if (t3 == 11.60){
        	t3 = 12.00;
        }
        if (t3 >= 12.00){
        	t3 = "Wow! Long workout!!!";
        }

        return t3;
    }

}