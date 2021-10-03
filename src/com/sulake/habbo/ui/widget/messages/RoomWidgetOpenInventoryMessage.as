package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_864:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1736:String = "inventory_effects";
      
      public static const const_1248:String = "inventory_badges";
      
      public static const const_1726:String = "inventory_clothes";
      
      public static const const_1879:String = "inventory_furniture";
       
      
      private var var_2657:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_864);
         this.var_2657 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2657;
      }
   }
}
