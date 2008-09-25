import flash.display.Stage;
import flash.display.StageScaleMode;
import flash.events.Event;

class Main {
    
    private var mc : flash.display.Sprite;
    private var videoplayer : VideoPlayer;

    public function new(){
        mc = flash.Lib.current;
        mc.stage.scaleMode = StageScaleMode.NO_SCALE;
        mc.stage.addEventListener(Event.RESIZE, myResizeHandler);
        videoplayer = new VideoPlayer(flash.Lib.current.loaderInfo.parameters.video_url);
        mc.addChild(videoplayer);
        this.myResizeHandler();
    }
    
    public function myResizeHandler(?event:Event){
        videoplayer.setDimensions(mc.stage.stageWidth,mc.stage.stageHeight);
    }

    public static function main()
    {
        new Main();
    }
}
