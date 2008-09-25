package  {
	import flash.Lib;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import flash.Boot;
	public class Main {
		public function Main() : void { if( !Boot.skip_constructor ) {
			this.mc = Lib.current;
			this.mc.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.mc.stage.addEventListener(Event.RESIZE,this.myResizeHandler);
			this.videoplayer = new VideoPlayer("samples/movies/vertical.mov");
			this.mc.addChild(this.videoplayer);
			this.myResizeHandler();
		}}
		
		protected var mc : Sprite;
		protected var videoplayer : VideoPlayer;
		public function myResizeHandler(event : Event = null) : void {
			this.videoplayer.setDimensions(this.mc.stage.stageWidth,this.mc.stage.stageHeight);
		}
		
		static public function main() : void {
			new Main();
		}
		
	}
}
