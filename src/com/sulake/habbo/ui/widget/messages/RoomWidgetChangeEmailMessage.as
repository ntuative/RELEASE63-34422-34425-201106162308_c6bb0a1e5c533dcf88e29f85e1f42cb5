package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChangeEmailMessage extends RoomWidgetMessage
   {
      
      public static const const_932:String = "rwcem_change_email";
       
      
      private var var_2452:String;
      
      public function RoomWidgetChangeEmailMessage(param1:String)
      {
         super(const_932);
         this.var_2452 = param1;
      }
      
      public function get newEmail() : String
      {
         return this.var_2452;
      }
   }
}
