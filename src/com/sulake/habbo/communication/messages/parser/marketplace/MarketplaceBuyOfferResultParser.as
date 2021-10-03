package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceBuyOfferResultParser implements IMessageParser
   {
       
      
      private var _result:int;
      
      private var var_2912:int = -1;
      
      private var var_2914:int = -1;
      
      private var var_2913:int = -1;
      
      public function MarketplaceBuyOfferResultParser()
      {
         super();
      }
      
      public function get result() : int
      {
         return this._result;
      }
      
      public function get offerId() : int
      {
         return this.var_2912;
      }
      
      public function get newPrice() : int
      {
         return this.var_2914;
      }
      
      public function get requestedOfferId() : int
      {
         return this.var_2913;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._result = param1.readInteger();
         this.var_2912 = param1.readInteger();
         this.var_2914 = param1.readInteger();
         this.var_2913 = param1.readInteger();
         return true;
      }
   }
}
