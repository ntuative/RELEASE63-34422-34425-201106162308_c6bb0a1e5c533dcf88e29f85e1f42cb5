package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_923:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2403:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_923);
         this.var_2403 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2403;
      }
   }
}
