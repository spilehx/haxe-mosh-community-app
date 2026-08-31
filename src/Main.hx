import js.Browser;

class Main extends hxd.App {
    override function init() {
        var text = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        text.text = "Hello game";
        text.x = 100;
        text.y = 100;
    }

    static function main() {
        new Main();
    }
}