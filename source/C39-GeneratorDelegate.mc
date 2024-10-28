import Toybox.Lang;
import Toybox.WatchUi;

class C39_GeneratorDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        var menu = new Rez.Menus.MainMenu();
        var title = "";
        if (code.size() == 0) {
            title += "---";
        } else {
            for (var i = 0; i < code.size(); i++) {
                title += code[i];
            }
        }
        menu.setTitle(title);
        WatchUi.pushView(menu, new C39_GeneratorMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
}