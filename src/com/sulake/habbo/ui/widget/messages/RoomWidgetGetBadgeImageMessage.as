package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_784:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_1908:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_784);
         this.var_1908 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_1908;
      }
   }
}
