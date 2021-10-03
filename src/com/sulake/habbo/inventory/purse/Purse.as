package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2014:int = 0;
      
      private var var_2013:int = 0;
      
      private var var_2270:int = 0;
      
      private var var_2271:Boolean = false;
      
      private var var_2269:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2014 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2013 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2270 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2271 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2269 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2014;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2013;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2270;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2271;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2269;
      }
   }
}
