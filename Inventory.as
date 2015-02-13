package 
{
	
	/**
	 * ...
	 * @author Alex Shen
	 */
	public class  Inventory	{
		private var capacity:int;
		private var items:Array = new Array();
		
		public function Inventory(cap:int) {
			this.capacity = cap;
		}
		
		public function addItem(item:Item):void {
			items.push(item);
		}
		
		public function getNumItems():int {
			return items.length();
		}
		
		public function removeItem(index:int):void {
			items.splice(index, 1);
		}
		
		public function getItemList():Array {
			return items;
		}
	}
	
}