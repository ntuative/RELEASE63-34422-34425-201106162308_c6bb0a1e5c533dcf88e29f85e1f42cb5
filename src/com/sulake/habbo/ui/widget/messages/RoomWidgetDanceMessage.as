package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_997:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1278:int = 0;
      
      public static const const_1754:Array = [2,3,4];
       
      
      private var var_91:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_997);
         this.var_91 = param1;
      }
      
      public function get style() : int
      {
         return this.var_91;
      }
   }
}
