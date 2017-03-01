using Toybox.WatchUi as Ui;

class MinTimeDFView extends Ui.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        var settitle = Application.getApp().getProperty("settitle");
        if (settitle == true){
        	label = "Time (Hours.Minutes)";
        }
        else{
        	label = "Time";
        }
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
        if (t3 == 0.75){
        	t3 = 1.15;
        }
       if (t3 == 0.90){
        	t3 = 1.30;
        }
        if (t3 == 1.05){
        	t3 = 1.45;
        }
        if (t3 == 1.20){
        	t3 = 2.00;
        }
        if (t3 == 1.35){
        	t3 = 2.15;
        }
        if (t3 == 1.50){
        	t3 = 2.30;
        }
        if (t3 == 1.65){
        	t3 = 2.45;
        }
        if (t3 == 1.80){
        	t3 = 3.00;
        	var done = true;
        }
        if (t3 == 1.95){
        	t3 = 3.15;
        }
        if (t3 == 2.10){
        	t3 = 3.30;
        }
        if (t3 == 2.25){
        	t3 = 3.45;
        }        
        if (t3 == 2.40){
        	t3 = 4.00;
        }        
        if (t3 == 2.55){
        	t3 = 4.15;
        }     
        if (t3 == 2.70){
        	t3 = 4.30;
        }               
        if (t3 == 2.85){
        	t3 = 4.45;
        }               
        if (t3 == 3.00){
        	if (done == true){
        		t3 = 5.00;
        	}
        }
        if (t3 >= 12.00){
        	t3 = "Wow! Long workout!!!";
        }

        return t3;
    }

}