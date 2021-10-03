package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetFloodControlEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_927:String = "RWFCE_FLOOD_CONTROL";
       
      
      private var var_1720:int = 0;
      
      public function RoomWidgetFloodControlEvent(param1:int)
      {
         super(const_927,false,false);
         this.var_1720 = param1;
      }
      
      public function get seconds() : int
      {
         return this.var_1720;
      }
   }
}
