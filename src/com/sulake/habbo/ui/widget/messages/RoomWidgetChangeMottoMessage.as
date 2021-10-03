package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChangeMottoMessage extends RoomWidgetMessage
   {
      
      public static const const_911:String = "RWVM_CHANGE_MOTTO_MESSAGE";
       
      
      private var var_1701:String;
      
      public function RoomWidgetChangeMottoMessage(param1:String)
      {
         super(const_911);
         this.var_1701 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1701;
      }
   }
}
