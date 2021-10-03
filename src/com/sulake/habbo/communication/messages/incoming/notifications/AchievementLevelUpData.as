package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1251:int;
      
      private var var_2082:int;
      
      private var var_2298:int;
      
      private var var_2299:int;
      
      private var var_2769:int;
      
      private var var_1908:int;
      
      private var var_2767:String = "";
      
      private var var_2768:String = "";
      
      private var var_2770:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1251 = param1.readInteger();
         this.var_1908 = param1.readInteger();
         this.var_2767 = param1.readString();
         this.var_2082 = param1.readInteger();
         this.var_2298 = param1.readInteger();
         this.var_2299 = param1.readInteger();
         this.var_2769 = param1.readInteger();
         this.var_2770 = param1.readInteger();
         this.var_2768 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1251;
      }
      
      public function get points() : int
      {
         return this.var_2082;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2298;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2299;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_2769;
      }
      
      public function get badgeId() : int
      {
         return this.var_1908;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2767;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2768;
      }
      
      public function get achievementID() : int
      {
         return this.var_2770;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
