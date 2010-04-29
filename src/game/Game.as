package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mx.charts.chartClasses.DataDescription;
	import mx.core.Application;
	import mx.core.FlexGlobals;

	public class Game extends Sprite
	{
		private var last_frame_time:Number;
		private var gamefield:GameField;
		private var snake:Snake;
		
		public function Game()
		{
			snake = new Snake(1,4,0,0,0x00ff00,false);
			addChild(snake);
			addEventListener(Event.ADDED_TO_STAGE, function():void {
				stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			});
			
			gamefield = new GameField;
			addChild(gamefield);
			
		}
	
		private function enterFrameHandler(e:Event):void 
		{
			var date:Date = new Date;
			update(date.time - last_frame_time);
			last_frame_time = date.time; 
		}
		
		private function update(dt:Number):void 
		{
			gamefield.update(dt);
			gamefield.draw();
		}
	}
}