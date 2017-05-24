using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.ActivityMonitor as Act;

var sleeping = true;
var sleepcount = 0;
var newsleep = false;

class DayShiftView extends Ui.WatchFace {

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
        var timeFormat = "$1$:$2$";
        var act = Act.getInfo();
        var dateInfo = Calendar.info(Time.now(), Time.FORMAT_MEDIUM);
        var clockTime = Sys.getClockTime();
        var hours = clockTime.hour;
        var hours2 = clockTime.hour;
        var minString = Lang.format("$1$", [clockTime.min.format("%02d")]);
        var hourString = Lang.format("$1$", [hours]);
        var dateString = Lang.format("$1$ $2$", [dateInfo.day_of_week, dateInfo.day]);
		var monthString = Lang.format("$1$ $2$", [dateInfo.month, dateInfo.year]);
		var batteryinfo = Lang.format("$1$%", [Sys.getSystemStats().battery.format("%02d")]);
		var stepinfo = Lang.format("$1$", [act.steps]);
		var usesecs = App.getApp().getProperty("Secs");
		var se = clockTime.sec;
		var secString = Lang.format("$1$", [se]);
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
        view.setText(hourString);
        if (hours2 <= 10){
        	view.setColor(0xFFFFFF);
        }
        if (hours2 >= 10){
        	if (hours2 << 12){
        		view.setColor(0x000000);
        	}
        }      
        if (hours2 >= 12){
        	if (hours2 << 14){
        		view.setColor(0x000000);
        	}
        }
        if (hours2 >= 14){
        	if (hours2 << 16){
        		view.setColor(0x000000);
        	}
        } 
        if (hours2 >= 16){
        		if (hours2 <= 17){
        			view.setColor(0xFFFFFF);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
        				view.setColor(0x000000);
        			}
        		}
        		if (hours2 >= 20){
        			view.setColor(0xFFFFFF);
        		}
        }    
        view = View.findDrawableById("TimeLabel2");
        view.setText(minString);
        if (hours2 <= 10){
        		view.setColor(0xFFFFFF);
        }
        if (hours2 >= 10){
        	if (hours2 << 12){
        		view.setColor(0x000000);
        	}
        }      
        if (hours2 >= 12){
        	if (hours2 << 14){
        		view.setColor(0x000000);
        	}
        }
        if (hours2 >= 14){
        	if (hours2 << 16){
        		view.setColor(0x000000);
        	}
        } 
        if (hours2 >= 16){
        		if (hours2 <= 17){
        			view.setColor(0xFFFFFF);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
        				view.setColor(0x000000);
        			}
        		}
        		if (hours2 >= 20){
        			view.setColor(0xFFFFFF);
        		}
        }   
		view = View.findDrawableById("date");
        view.setText(monthString);
        if (hours2 <= 10){
        		view.setColor(0xFFFFFF);
        }
        if (hours2 >= 10){
        	if (hours2 << 12){
        		view.setColor(0x000000);
        	}
        }      
        if (hours2 >= 12){
        	if (hours2 << 14){
        		view.setColor(0x000000);
        	}
        }
        if (hours2 >= 14){
        	if (hours2 << 16){
        		view.setColor(0x000000);
        	}
        } 
        if (hours2 >= 16){
        		if (hours2 <= 17){
        			view.setColor(0xFFFFFF);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
        				view.setColor(0x000000);
        			}
        		}
        		if (hours2 >= 20){
        			view.setColor(0xFFFFFF);
        		}
        }   
        view = View.findDrawableById("mon");
        if (hours2 <= 10){
        		view.setColor(0xFFFFFF);
        }
        if (hours2 >= 10){
        	if (hours2 << 12){
        		view.setColor(0x000000);
        	}
        }      
        if (hours2 >= 12){
        	if (hours2 << 14){
        		view.setColor(0x000000);
        	}
        }
        if (hours2 >= 14){
        	if (hours2 << 16){
        		view.setColor(0x000000);
        	}
        } 
        if (hours2 >= 16){
        		if (hours2 <= 17){
        			view.setColor(0xFFFFFF);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
        				view.setColor(0x000000);
        			}
        		}
        		if (hours2 >= 20){
        			view.setColor(0xFFFFFF);
        		}
        }  
        view.setText(dateString);
        view = View.findDrawableById("stepinfoicon");
        if (hours2 <= 10){
        		view.setColor(0xFFFFFF);
        }
        if (hours2 >= 10){
        	if (hours2 << 12){
        		view.setColor(0x000000);
        	}
        }      
        if (hours2 >= 12){
        	if (hours2 << 14){
        		view.setColor(0x000000);
        	}
        }
        if (hours2 >= 14){
        	if (hours2 << 16){
        		view.setColor(0x000000);
        	}
        } 
        if (hours2 >= 16){
        		if (hours2 <= 17){
        			view.setColor(0xFFFFFF);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
        				view.setColor(0x000000);
        			}
        		}
        		if (hours2 >= 20){
        			view.setColor(0xFFFFFF);
        		}
        }  
        view.setText(stepinfo);
        view = View.findDrawableById("batticont");
        if (hours2 <= 10){
        		view.setColor(0xFFFFFF);
        }
        if (hours2 >= 10){
        	if (hours2 << 12){
        		view.setColor(0x000000);
        	}
        }      
        if (hours2 >= 12){
        	if (hours2 << 14){
        		view.setColor(0x000000);
        	}
        }
        if (hours2 >= 14){
        	if (hours2 << 16){
        		view.setColor(0x000000);
        	}
        } 
        if (hours2 >= 16){
        		if (hours2 <= 17){
        			view.setColor(0xFFFFFF);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
        				view.setColor(0x000000);
        			}
        		}
        		if (hours2 >= 20){
        			view.setColor(0xFFFFFF);
        		}
        } 
        view.setText(batteryinfo);
        if (hours2 <= 10){
        	view = View.findDrawableById("footicon");
      		view.setLocation(33, 0);
      		view = View.findDrawableById("batticon");
      		view.setLocation(52, 23);
      		view = View.findDrawableById("footiconb");
      		view.setLocation(99999, 0);
      		view = View.findDrawableById("batticonb");
      		view.setLocation(5299999, 23);
      	}
      	if (hours2 >= 16){
      		view = View.findDrawableById("footicon");
      		view.setLocation(33, 0);
      		view = View.findDrawableById("batticon");
      		view.setLocation(52, 23);
      		view = View.findDrawableById("footiconb");
      		view.setLocation(33999, 0);
      		view = View.findDrawableById("batticonb");
      		view.setLocation(529999, 23);
      	}
        if (hours2 >= 16){
        		if (hours2 <= 17){
					view = View.findDrawableById("footicon");
      				view.setLocation(33, 0);
      				view = View.findDrawableById("batticon");
      				view.setLocation(52, 23);
      				view = View.findDrawableById("footiconb");
      				view.setLocation(33999, 0);
      				view = View.findDrawableById("batticonb");
      				view.setLocation(529999, 23);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
						view = View.findDrawableById("footiconb");
      					view.setLocation(33, 0);
      					view = View.findDrawableById("batticonb");
      					view.setLocation(52, 23);
      					view = View.findDrawableById("footicon");
      					view.setLocation(33999, 0);
      					view = View.findDrawableById("batticon");
      					view.setLocation(529999, 23);
        				}
        			}
        		if (hours2 >= 20){
					view = View.findDrawableById("footicon");
      				view.setLocation(33, 0);
      				view = View.findDrawableById("batticon");
      				view.setLocation(52, 23);
      				view = View.findDrawableById("footiconb");
      				view.setLocation(33999, 0);
      				view = View.findDrawableById("batticonb");
      				view.setLocation(529999, 23);
        		}
        }  
      	if (hours2 <= 15){
      		if (hours2 >= 11){
      			view = View.findDrawableById("footiconb");
      			view.setLocation(33, 0);
      			view = View.findDrawableById("batticonb");
      			view.setLocation(52, 23);
      		}
      	}
      	view = View.findDrawableById("seconds");
      	if (hours2 <= 10){
        		view.setColor(0xFFFFFF);
        }
        if (hours2 >= 10){
        	if (hours2 << 12){
        		view.setColor(0x000000);
        	}
        }      
        if (hours2 >= 12){
        	if (hours2 << 14){
        		view.setColor(0x000000);
        	}
        }
        if (hours2 >= 14){
        	if (hours2 << 16){
        		view.setColor(0x000000);
        	}
        } 
        if (hours2 >= 16){
        		if (hours2 <= 17){
        			view.setColor(0xFFFFFF);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
        				view.setColor(0x000000);
        			}
        		}
        		if (hours2 >= 20){
        			view.setColor(0xFFFFFF);
        		}
        } 
        view = View.findDrawableById("colon");
      	if (hours2 <= 10){
        		view.setColor(0xFFFFFF);
        }
        if (hours2 >= 10){
        	if (hours2 << 12){
        		view.setColor(0x000000);
        	}
        }      
        if (hours2 >= 12){
        	if (hours2 << 14){
        		view.setColor(0x000000);
        	}
        }
        if (hours2 >= 14){
        	if (hours2 << 16){
        		view.setColor(0x000000);
        	}
        } 
        if (hours2 >= 16){
        		if (hours2 <= 17){
        			view.setColor(0xFFFFFF);
        		}
        		if (hours2 >= 18){
        			if (hours2 <= 19){
        				view.setColor(0x000000);
        			}
        		}
        		if (hours2 >= 20){
        			view.setColor(0xFFFFFF);
        		}
        } 
        if (App.getApp().getProperty("UseMilitaryFormat")) {
        	view.setText("");
        }
        else{
        	view.setText(":");
        }
        view = View.findDrawableById("seconds");
        if (App.getApp().getProperty("UseMilitaryFormat")) {
        	view.setText("");
        }
        else {
        	view.setText("");
        }
      	if (usesecs == true){
        	if (sleeping == false){
				view = View.findDrawableById("seconds");
        		view.setText(secString);
        		sleepcount = sleepcount + 1;
        		if (newsleep == true){
        			sleepcount = 0;
        			newsleep = false;
        		}
        		if (sleepcount == 9){
        			sleeping = true;
        			sleepcount = 0;
        			if (App.getApp().getProperty("UseMilitaryFormat")) {
        				view.setText("");
        			}
        			else {
        				view.setText(":");
        			}
        		}
        	}
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
    	sleeping = false;
    	newsleep = true;
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    	sleeping = true;
    }

}
