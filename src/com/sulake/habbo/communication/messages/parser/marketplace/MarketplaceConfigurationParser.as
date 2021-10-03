package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1634:Boolean;
      
      private var var_2621:int;
      
      private var var_1918:int;
      
      private var var_1917:int;
      
      private var var_2620:int;
      
      private var var_2619:int;
      
      private var var_2622:int;
      
      private var var_2497:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1634;
      }
      
      public function get commission() : int
      {
         return this.var_2621;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1918;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1917;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2619;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2620;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2622;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2497;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1634 = param1.readBoolean();
         this.var_2621 = param1.readInteger();
         this.var_1918 = param1.readInteger();
         this.var_1917 = param1.readInteger();
         this.var_2619 = param1.readInteger();
         this.var_2620 = param1.readInteger();
         this.var_2622 = param1.readInteger();
         this.var_2497 = param1.readInteger();
         return true;
      }
   }
}
