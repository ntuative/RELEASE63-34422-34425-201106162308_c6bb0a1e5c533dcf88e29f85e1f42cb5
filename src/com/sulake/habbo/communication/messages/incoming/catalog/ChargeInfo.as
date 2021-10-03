package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2409:int;
      
      private var var_2411:int;
      
      private var var_1321:int;
      
      private var var_1323:int;
      
      private var var_2067:int;
      
      private var var_2410:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2409 = param1.readInteger();
         this.var_2411 = param1.readInteger();
         this.var_1321 = param1.readInteger();
         this.var_1323 = param1.readInteger();
         this.var_2067 = param1.readInteger();
         this.var_2410 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2409;
      }
      
      public function get charges() : int
      {
         return this.var_2411;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1321;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1323;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2410;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2067;
      }
   }
}
