package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_2386:int = 0;
      
      private var var_1583:Dictionary;
      
      private var var_2014:int = 0;
      
      private var var_2013:int = 0;
      
      private var var_2269:Boolean = false;
      
      private var var_2422:int = 0;
      
      private var var_2421:int = 0;
      
      public function Purse()
      {
         this.var_1583 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2386;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2386 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2014;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2014 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2013;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2013 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_2014 > 0 || this.var_2013 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2269;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2269 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2422;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2422 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2421;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2421 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1583;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1583 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1583[param1];
      }
   }
}
