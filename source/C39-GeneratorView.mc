import Toybox.Graphics;
import Toybox.WatchUi;

var encoding = [[2, 0, 2, 1, 3, 0, 3, 0, 2],
                [3, 0, 2, 1, 2, 0, 2, 0, 3],
                [2, 0, 3, 1, 2, 0, 2, 0, 3],
                [3, 0, 3, 1, 2, 0, 2, 0, 2],
                [2, 0, 2, 1, 3, 0, 2, 0, 3],
                [3, 0, 2, 1, 3, 0, 2, 0, 2],
                [2, 0, 3, 1, 3, 0, 2, 0, 2],
                [2, 0, 2, 1, 2, 0, 3, 0, 3],
                [3, 0, 2, 1, 2, 0, 3, 0, 2],
                [2, 0, 3, 1, 2, 0, 3, 0, 2],
                [2, 1, 2, 0, 3, 0, 3, 0, 2]
            ]; 
                    
            // Array of 11 elements, 0-9 and *
            // 0 = short white bar, 1 = long white bar, 2 = short black bar, 3 = long black bar
var width;
var height;

var code = [];

class C39_GeneratorView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        width = dc.getWidth();
        height = dc.getHeight();
        var codeString = Application.Properties.getValue("Code");
        var codeChars = codeString.toCharArray();
        for (var i = 0; i < codeChars.size(); i++) {
            code.add(codeChars[i].toNumber() - 48);
        }
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.clear();

        var codeArray = [10];
        codeArray.addAll(code);
        codeArray.add(10);

        var codeLen = codeArray.size();
        var totalLen = 13 * codeLen;

        var barWidthSmall = (width * 0.8) / totalLen;
        // Round barwidth to .5
        barWidthSmall = Math.round(barWidthSmall * 2) / 2;
        var x = (width / 2) - ((totalLen * barWidthSmall) / 2);

        for (var i = 0; i < codeLen; i++) {
            for (var j = 0; j < 9; j++) {
                if (encoding[codeArray[i]][j] < 2) {
                    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
                } else {
                    dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
                }
                var barWidth = 0;
                switch (encoding[codeArray[i]][j]) {
                    case 0:
                        barWidth = barWidthSmall;
                        break;
                    case 1:
                        barWidth = barWidthSmall * 2;
                        break;
                    case 2:
                        barWidth = barWidthSmall;
                        break;
                    case 3:
                        barWidth = barWidthSmall * 2;
                        break;
                }
                dc.fillRectangle(x, height * 0.3, barWidth, height * 0.4);
                x += barWidth;
            }
            x += barWidthSmall;
        }
        var text = "";
        for (var i = 0; i < code.size(); i++) {
            text += code[i];
        }
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.drawText(width / 2, (height * 0.8) - (Graphics.getFontHeight(Graphics.FONT_SMALL) / 2), Graphics.FONT_SMALL, text, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(width / 2, (height * 0.2) - (Graphics.getFontHeight(Graphics.FONT_SMALL) / 2), Graphics.FONT_SMALL, "C39-Generator", Graphics.TEXT_JUSTIFY_CENTER);
    }

    function onHide() as Void {
    }

}