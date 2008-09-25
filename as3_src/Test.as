package  {
	import flash.Lib;
	import flash.text.TextField;
	public class Test {
		static public function main() : void {
			var tf : TextField = new TextField();
			tf.text = "Hello World !";
			Lib.current.addChild(tf);
		}
		
	}
}
