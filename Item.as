package 
{
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Alex Shen
	 */
	public class Item {
		
		[Embed(source = "items/Items_Main.xml", mimeType = "application/octet-stream")] private static const ITEM_XML:Class;
		private var itemList:XML;
		private var name:String;
		private var description:String;
		private var options:Array = new Array();
		
		public function Item(code:String) {
			itemList = loadItems(ITEM_XML);
			var dataElement:XML;
			var optionElement:XML;
			var dataList:XMLList = itemList.item;
			var optionList:XMLList;
			for each(dataElement in dataList) {
				if (String(dataElement.@id) == code) {
					name = String(dataElement.@name);
					description = String(dataElement.description.@value);
					optionList = dataElement.options.option;
					for each(optionElement in optionList) {
						options.push(String(optionElement.@name));
					}
				}
			}
		}
		
		public function getName():String {
			return name;
		}
		
		public function getDescription():String {
			return description;
		}
		
		public function getOptions():Array {
			return options;
		}
		
		public static function loadItems(xml:Class):XML {
			var ramData:ByteArray = new xml;
			var dataString:String = ramData.readUTFBytes(ramData.length);
			return new XML(dataString);
		}
	}
	
}