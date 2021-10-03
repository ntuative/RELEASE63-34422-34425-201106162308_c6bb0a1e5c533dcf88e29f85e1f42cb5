package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2111:int;
      
      private var var_2412:String;
      
      private var var_1109:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2111 = param1.readInteger();
         this.var_2412 = param1.readString();
         this.var_1109 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_2111;
      }
      
      public function get figureString() : String
      {
         return this.var_2412;
      }
      
      public function get gender() : String
      {
         return this.var_1109;
      }
   }
}
