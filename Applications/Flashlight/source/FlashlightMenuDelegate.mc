using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class FlashlightMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            System.exit();
        } 
    }

}