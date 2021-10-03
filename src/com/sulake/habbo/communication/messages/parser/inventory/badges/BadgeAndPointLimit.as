package com.sulake.habbo.communication.messages.parser.inventory.badges
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class BadgeAndPointLimit
   {
       
      
      private var var_1908:String;
      
      private var var_1999:int;
      
      public function BadgeAndPointLimit(param1:String, param2:IMessageDataWrapper)
      {
         super();
         this.var_1908 = "ACH_" + param1 + param2.readInteger();
         this.var_1999 = param2.readInteger();
      }
      
      public function get badgeId() : String
      {
         return this.var_1908;
      }
      
      public function get limit() : int
      {
         return this.var_1999;
      }
   }
}
