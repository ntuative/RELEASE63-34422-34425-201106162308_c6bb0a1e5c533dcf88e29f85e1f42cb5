package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1791:int;
      
      private var var_2444:int;
      
      private var var_1611:int;
      
      private var var_2364:int;
      
      private var var_137:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1791 = param1.readInteger();
         this.var_2444 = param1.readInteger();
         this.var_1611 = param1.readInteger();
         this.var_2364 = param1.readInteger();
         this.var_137 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1791);
      }
      
      public function get callId() : int
      {
         return this.var_1791;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2444;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1611;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2364;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_137;
      }
   }
}
