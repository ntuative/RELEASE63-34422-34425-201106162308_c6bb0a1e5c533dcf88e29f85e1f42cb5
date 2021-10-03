package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1236:int;
      
      private var var_1735:String;
      
      private var var_1773:int;
      
      private var _upgrade:Boolean;
      
      private var var_2394:Boolean;
      
      private var var_2391:int;
      
      private var var_2397:int;
      
      private var var_2393:int;
      
      private var var_2395:int;
      
      private var var_2396:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1236 = param1.readInteger();
         this.var_1735 = param1.readString();
         this.var_1773 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2394 = param1.readBoolean();
         this.var_2391 = param1.readInteger();
         this.var_2397 = param1.readInteger();
         this.var_2393 = param1.readInteger();
         this.var_2395 = param1.readInteger();
         this.var_2396 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1236;
      }
      
      public function get productCode() : String
      {
         return this.var_1735;
      }
      
      public function get price() : int
      {
         return this.var_1773;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2394;
      }
      
      public function get periods() : int
      {
         return this.var_2391;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2397;
      }
      
      public function get year() : int
      {
         return this.var_2393;
      }
      
      public function get month() : int
      {
         return this.var_2395;
      }
      
      public function get day() : int
      {
         return this.var_2396;
      }
   }
}
