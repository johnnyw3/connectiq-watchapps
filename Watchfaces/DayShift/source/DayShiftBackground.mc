using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class Background extends Ui.Drawable {

    function initialize() {
        var dictionary = {
            :identifier => "Background"
        };

        Drawable.initialize(dictionary);
    }

    function draw(dc) {
        // Set the background color then call to clear the screen
         var clockTime = Sys.getClockTime();
        var hours = clockTime.hour;
        if (hours <= 3){
        	dc.setColor(Gfx.COLOR_TRANSPARENT, 0x000000);
        }
        if (hours >= 4){
        	if (hours << 6){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0x555555);
        	}
        }
        if (hours >= 6){
        	if (hours << 8){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0x38761D);
        	}
        }
         if (hours >= 8){
        	if (hours << 10){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0x0000CC);
        	}
        }  
        if (hours >= 10){
        	if (hours << 12){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0x93C47D);
        	}
        }      
        if (hours >= 12){
        	if (hours << 14){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0xEFBA2D);
        	}
        }
        if (hours >= 14){
        	if (hours << 16){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0xBF9524);
        	}
        } 
        if (hours >= 16){
        	if (hours << 18){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0x0000FF);
        	}
        }  
         if (hours >= 18){
        	if (hours << 20){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0xAAAAAA);
        	}
        }  
        if (hours >= 20){
        	if (hours << 22){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0x555555);
        	}
        }  
        if (hours >= 22){
        		dc.setColor(Gfx.COLOR_TRANSPARENT, 0x000000);
        }                                    
        dc.clear();
    }

}
