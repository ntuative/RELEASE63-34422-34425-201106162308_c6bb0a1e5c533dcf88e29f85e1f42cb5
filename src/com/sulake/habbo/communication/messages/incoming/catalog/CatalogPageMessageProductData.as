package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_76:String = "s";
      
      public static const const_186:String = "e";
       
      
      private var var_1589:String;
      
      private var var_2946:int;
      
      private var var_1056:String;
      
      private var var_1590:int;
      
      private var var_2023:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1589 = param1.readString();
         this.var_2946 = param1.readInteger();
         this.var_1056 = param1.readString();
         this.var_1590 = param1.readInteger();
         this.var_2023 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1589;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2946;
      }
      
      public function get extraParam() : String
      {
         return this.var_1056;
      }
      
      public function get productCount() : int
      {
         return this.var_1590;
      }
      
      public function get expiration() : int
      {
         return this.var_2023;
      }
   }
}
