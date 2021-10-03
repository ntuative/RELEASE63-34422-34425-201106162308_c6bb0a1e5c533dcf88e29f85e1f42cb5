package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_2011:int = 0;
      
      private var var_2012:int = 0;
      
      private var var_2067:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_2011;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_2012;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2067;
      }
      
      public function flush() : Boolean
      {
         this.var_2011 = 0;
         this.var_2012 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2011 = param1.readInteger();
         this.var_2012 = param1.readInteger();
         this.var_2067 = param1.readInteger();
         return true;
      }
   }
}
