package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1634:Boolean = false;
      
      private var var_1773:int;
      
      private var var_1838:Array;
      
      private var var_794:Array;
      
      private var var_792:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1634 = _loc2_.isWrappingEnabled;
         this.var_1773 = _loc2_.wrappingPrice;
         this.var_1838 = _loc2_.stuffTypes;
         this.var_794 = _loc2_.boxTypes;
         this.var_792 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1634;
      }
      
      public function get price() : int
      {
         return this.var_1773;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1838;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_794;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_792;
      }
   }
}
