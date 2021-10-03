package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1251:int;
      
      private var var_1908:String;
      
      private var var_1724:int;
      
      private var var_2298:int;
      
      private var var_2299:int;
      
      private var var_1722:int;
      
      private var var_1723:Boolean;
      
      private var _category:String;
      
      private var var_2297:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1251 = param1.readInteger();
         this.var_1908 = param1.readString();
         this.var_1724 = Math.max(1,param1.readInteger());
         this.var_2298 = param1.readInteger();
         this.var_2299 = param1.readInteger();
         this.var_1722 = param1.readInteger();
         this.var_1723 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2297 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_1908;
      }
      
      public function get level() : int
      {
         return this.var_1251;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1724;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2298;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2299;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1722;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1723;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2297;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1251 > 1 || this.var_1723;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1722 = this.var_1724;
      }
   }
}
