package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_778:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_688:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_778);
         this.var_688 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_688;
      }
   }
}
