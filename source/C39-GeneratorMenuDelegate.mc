import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class C39_GeneratorMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        //var delegate = (getApp().getInitialView() as [Views, InputDelegates])[1] as C39_GeneratorDelegate;
        
        switch(item) {
            case :Clear:
                code = [];
                break;

            case :Delete:
                code = code.slice(0, code.size() - 1);
                break;

            case :Save:
                var codeString = "";
                for (var i = 0; i < code.size(); i++) {
                    codeString += code[i].toString();
                }
                Application.Properties.setValue("Code", codeString);
                break;

            case :n0:
                code.add(0);
                break;

            case :n1:
                code.add(1);
                break;

            case :n2:
                code.add(2);
                break;

            case :n3:
                code.add(3);
                break;

            case :n4:
                code.add(4);
                break;

            case :n5:
                code.add(5);
                break;
            
            case :n6:
                code.add(6);
                break;

            case :n7:
                code.add(7);
                break;

            case :n8:
                code.add(8);
                break;

            case :n9:
                code.add(9);
                break;
        }
    }

}