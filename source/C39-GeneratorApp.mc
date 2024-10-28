import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class C39_GeneratorApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state as Dictionary?) as Void {
    }

    function onStop(state as Dictionary?) as Void {
    }

    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new C39_GeneratorView(), new C39_GeneratorDelegate() ];
    }

}

function getApp() as C39_GeneratorApp {
    return Application.getApp() as C39_GeneratorApp;
}