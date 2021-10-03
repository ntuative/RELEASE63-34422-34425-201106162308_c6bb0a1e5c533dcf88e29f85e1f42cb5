package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_2124:String;
      
      private var var_2122:int;
      
      private var var_2123:int;
      
      private var var_2067:int;
      
      private var _id:int;
      
      private var var_2125:Boolean;
      
      private var _type:String;
      
      private var var_2927:String;
      
      private var var_2928:int;
      
      private var var_2126:String;
      
      private var var_2929:int;
      
      private var var_2930:int;
      
      private var var_1642:int;
      
      private var var_2121:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_2121 = new Date();
         super();
         this.var_2124 = param1.readString();
         this.var_2122 = param1.readInteger();
         this.var_2123 = param1.readInteger();
         this.var_2067 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2125 = param1.readBoolean();
         this._type = param1.readString();
         this.var_2927 = param1.readString();
         this.var_2928 = param1.readInteger();
         this.var_2126 = param1.readString();
         this.var_2929 = param1.readInteger();
         this.var_2930 = param1.readInteger();
         this.var_1642 = param1.readInteger();
      }
      
      public function get campaignCode() : String
      {
         return this.var_2124;
      }
      
      public function get localizationCode() : String
      {
         return this.var_2126;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2122;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2123;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2067;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2125;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_2927;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_2928;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2929;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2930;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(this.var_1642 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_2121.getTime();
         return int(Math.max(0,this.var_1642 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_2124;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_2126;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_2125 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_2122 >= this.var_2123;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_2121;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1642 = param1;
      }
   }
}
