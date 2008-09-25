import flash.display.Stage;
import flash.media.Video;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.events.NetStatusEvent;

class VideoPlayer extends flash.display.Sprite {

    private var _video : Video;
    private var _connect_nc: NetConnection;
    private var _stream_ns : NetStream;
    private var _videodata : Dynamic;

    public function new(video_url:String){
        super();
        _video = new Video();
        _connect_nc = new NetConnection();
        _connect_nc.connect(null);
        _stream_ns = new NetStream(_connect_nc);
        _stream_ns.client = this;
        _stream_ns.addEventListener(NetStatusEvent.NET_STATUS, this.netStatusHandler);
        this.addChild(_video);
        _video.attachNetStream(_stream_ns);
        _stream_ns.play(video_url);
    }

    public function setDimensions(w:Float, h:Float, ?stretch = false){
        var aspect_ratio = _videodata.width/_videodata.height;
        var new_w = w;
        var new_h = (stretch) ? h : w/aspect_ratio;
        if ( new_h > this.stage.stageHeight) {
            new_w = w * (this.stage.stageHeight/new_h);
            new_h = this.stage.stageHeight;
        }
        if( new_w > this.stage.stageWidth){
            new_h = h * (this.stage.stageWidth/new_w);
            new_w = this.stage.stageWidth;
        }
        _video.height = new_h;
        _video.width = new_w;
    }

    public function netStatusHandler(event:NetStatusEvent) {
        //trace(p_evt.info.code);
        if (event.info.code == "NetStream.Play.FileStructureInvalid") {
            trace("The MP4's file structure is invalid.");
        } else if(event.info.code == "NetStream.Play.NoSupportedTrackFound") {
            trace("The MP4 doesn't contain any supported tracks");
        }
    }

    public function onMetaData(data:Dynamic){
        _videodata = data;
        this.setDimensions(_videodata.width,_videodata.height);
        for(i in Reflect.fields(data))
            //trace("obj."+i+" is "+Reflect.field(data,i));
    }    


}