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
        var hourString = Lang.format("$1$", [hours]);
        dc.drawText(110, 50, Gfx.FONT_TINY, stepinfo, Gfx.TEXT_JUSTIFY_CENTER);
        if (!Sys.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (App.getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Update the view
        var view = View.findDrawableById("TimeLabel");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(hourString);
        view = View.findDrawableById("TimeLabel2");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(minString);
        view = View.findDrawableById("stepinfo");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText("Steps: " + stepinfo);
        view = View.findDrawableById("batt");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText("Battery: " + batteryinfo);
        view = View.findDrawableById("date");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(monthString);
        view = View.findDrawableById("mon");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(dateString);
        

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
