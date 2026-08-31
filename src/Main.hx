class Main extends hxd.App {
    static inline var SPEED = 260.0;
    static inline var SPIN_SPEED = 8.0;
    static var resources:hxd.res.Loader;

    var logo:h2d.Bitmap;
    var clickArea:h2d.Interactive;
    var targetX:Float;
    var targetY:Float;
    var followingClick = false;

    override function init() {
        logo = new h2d.Bitmap(resources.load("img/logo.png").toTile(), s2d);
        logo.x = (s2d.width - logo.tile.width) * 0.5;
        logo.y = (s2d.height - logo.tile.height) * 0.5;

        clickArea = new h2d.Interactive(s2d.width, s2d.height, s2d);
        clickArea.onPush = function(event) {
            followingClick = true;
            setTarget(event.relX - logo.tile.width * 0.5, event.relY - logo.tile.height * 0.5);
        };

        chooseRandomTarget();
    }

    override function update(dt:Float) {
        if (followingClick) {
            logo.rotation += SPIN_SPEED * dt;
        }

        var dx = targetX - logo.x;
        var dy = targetY - logo.y;
        var distance = Math.sqrt(dx * dx + dy * dy);
        var step = SPEED * dt;

        if (distance <= step) {
            logo.x = targetX;
            logo.y = targetY;
            if (followingClick) {
                followingClick = false;
                logo.rotation = 0;
            }
            chooseRandomTarget();
        } else {
            logo.x += dx / distance * step;
            logo.y += dy / distance * step;
        }
    }

    override function onResize() {
        clickArea.width = s2d.width;
        clickArea.height = s2d.height;
        logo.x = clampX(logo.x);
        logo.y = clampY(logo.y);
        targetX = clampX(targetX);
        targetY = clampY(targetY);
    }

    function chooseRandomTarget() {
        targetX = Math.random() * Math.max(0, s2d.width - logo.tile.width);
        targetY = Math.random() * Math.max(0, s2d.height - logo.tile.height);
    }

    function setTarget(x:Float, y:Float) {
        targetX = clampX(x);
        targetY = clampY(y);
    }

    inline function clampX(x:Float) {
        return Math.max(0, Math.min(x, s2d.width - logo.tile.width));
    }

    inline function clampY(y:Float) {
        return Math.max(0, Math.min(y, s2d.height - logo.tile.height));
    }

    static function main() {
        resources = new hxd.res.Loader(hxd.fs.EmbedFileSystem.create("assets"));
        new Main();
    }
}
