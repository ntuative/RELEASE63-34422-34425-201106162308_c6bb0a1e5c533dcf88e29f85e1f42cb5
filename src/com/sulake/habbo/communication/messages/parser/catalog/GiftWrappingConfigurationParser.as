package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2550:Boolean;
      
      private var var_2549:int;
      
      private var var_1838:Array;
      
      private var var_794:Array;
      
      private var var_792:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2550;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2549;
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
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1838 = [];
         this.var_794 = [];
         this.var_792 = [];
         this.var_2550 = param1.readBoolean();
         this.var_2549 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1838.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_794.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_792.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
