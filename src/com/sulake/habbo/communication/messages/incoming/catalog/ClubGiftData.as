package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1236:int;
      
      private var var_2655:Boolean;
      
      private var var_2466:Boolean;
      
      private var var_2654:int;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1236 = param1.readInteger();
         this.var_2655 = param1.readBoolean();
         this.var_2654 = param1.readInteger();
         this.var_2466 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return this.var_1236;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2655;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2466;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2654;
      }
   }
}
