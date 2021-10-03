package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_127:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1877:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_127);
         this.var_1877 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_1877;
      }
   }
}
