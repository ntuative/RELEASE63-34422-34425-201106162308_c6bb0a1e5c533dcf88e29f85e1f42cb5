package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_975:String;
      
      private var var_1771:int;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_975 = param1.readString();
         this.var_1771 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_975;
      }
      
      public function get errorCode() : int
      {
         return this.var_1771;
      }
   }
}
