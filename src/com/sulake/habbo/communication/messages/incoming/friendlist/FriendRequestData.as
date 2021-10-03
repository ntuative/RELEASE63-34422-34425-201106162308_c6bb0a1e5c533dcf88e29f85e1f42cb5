package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1376:int;
      
      private var var_2459:String;
      
      private var var_2460:int;
      
      private var var_2412:String;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1376 = param1.readInteger();
         this.var_2459 = param1.readString();
         this.var_2412 = param1.readString();
         this.var_2460 = this.var_1376;
      }
      
      public function get requestId() : int
      {
         return this.var_1376;
      }
      
      public function get requesterName() : String
      {
         return this.var_2459;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2460;
      }
      
      public function get figureString() : String
      {
         return this.var_2412;
      }
   }
}
