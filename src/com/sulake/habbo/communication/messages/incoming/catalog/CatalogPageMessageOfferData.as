package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1236:int;
      
      private var var_2066:String;
      
      private var var_1321:int;
      
      private var var_1323:int;
      
      private var var_2067:int;
      
      private var var_2101:int;
      
      private var var_1299:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1236 = param1.readInteger();
         this.var_2066 = param1.readString();
         this.var_1321 = param1.readInteger();
         this.var_1323 = param1.readInteger();
         this.var_2067 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1299 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1299.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         this.var_2101 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1236;
      }
      
      public function get localizationId() : String
      {
         return this.var_2066;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1321;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1323;
      }
      
      public function get products() : Array
      {
         return this.var_1299;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2067;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2101;
      }
   }
}
