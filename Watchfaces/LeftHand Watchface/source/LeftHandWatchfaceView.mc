using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.ActivityMonitor as Act;

class LeftHandWatchfaceView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
    	var back = App.getApp().getProperty("BackgroundColor");
        	setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Get the current time and format it correctly
        // Varibles, and other stuff
        var back = App.getApp().getProperty("BackgroundColor");
        var icons = App.getApp().getProperty("icons");
        var act = Act.getInfo();
        var dateInfo = Calendar.info(Time.now(), Time.FORMAT_MEDIUM);
        var batteryinfo = Lang.format("$1$%", [Sys.getSystemStats().battery.format("%02d")]);
        var clockTime = Sys.getClockTime();
		var minString = Lang.format("$1$", [clockTime.min.format("%02d")]);
        var stepinfo = Lang.format("$1$", [act.steps]);
        var timeFormat = "$1$:$2$";
        var hours = clockTime.hour;
        var dateString = Lang.format("$1$ $2$", [dateInfo.day_of_week, dateInfo.day]);
		var monthString = Lang.format("$1$ $2$", [dateInfo.month, dateInfo.year]);
        var isConnected = Sys.getDeviceSettings().phoneConnected;
        var phone = "";
        var phone2 = "";
        var ampm = "";
        var view = View.findDrawableById("TimeLabel");
        if (isConnected == true){
        	phone2 = "Phone";
        	phone = "Connected";
    	}
    	else {
    		phone2 = "";
    		phone = "";
    	}
        if (!Sys.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
                ampm = "P";
                view = View.findDrawableById("ampm");
        		view.setColor(App.getApp().getProperty("ForegroundColor"));
       			view.setText(ampm);
            }
            if (hours <= 12) {
            	ampm = "A";
                view = View.findDrawableById("ampm");
        		view.setColor(App.getApp().getProperty("ForegroundColor"));
       			view.setText(ampm);
       			}
        } else {
        }
        var hourString = Lang.format("$1$", [hours]);
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Update the view
        // Text, and icons!
        view = View.findDrawableById("TimeLabel");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(hourString);
        view = View.findDrawableById("TimeLabel2");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(minString);
        if (icons == 2){
        view = View.findDrawableById("stepinfo");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText("Steps: " + stepinfo);
        view = View.findDrawableById("batt");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText("Battery: " + batteryinfo);
        }
        if (icons == 1){
        view = View.findDrawableById("stepinfoicon");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(stepinfo);
        view = View.findDrawableById("batticont");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(batteryinfo);
        view = View.findDrawableById("footicon");
      	view.setLocation(48, 0);
      	view = View.findDrawableById("batticon");
      	view.setLocation(67, 23);
        }
        view = View.findDrawableById("date");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(monthString);
        view = View.findDrawableById("mon");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(dateString);
        var phonet = App.getApp().getProperty("phone");
        if (phonet == 2){
        view = View.findDrawableById("phone");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(phone);
        view = View.findDrawableById("phone2");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(phone2);
        }
        if (phonet == 1){
        	if (isConnected == true){
        			view = View.findDrawableById("phoneicon");
      				view.setLocation(3, 175);
      		}
      	}
        if (back != 1){
        	var view2 = View.findDrawableById("id_monkey");
        	view2.setLocation(300, 300);
        }
        if (back == 1){
        	var view2 = View.findDrawableById("id_monkey");
        	view2.setLocation(0, 0);
        }
        
        

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
