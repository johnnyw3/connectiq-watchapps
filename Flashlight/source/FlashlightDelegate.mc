using Toybox.WatchUi as Ui;

class FlashlightDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new FlashlightMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

}