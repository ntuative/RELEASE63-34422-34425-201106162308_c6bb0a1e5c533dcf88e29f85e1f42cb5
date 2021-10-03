package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.GetQuestsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.quest.OpenQuestTrackerMessageComposer;
   
   public class QuestCompleted implements IDisposable
   {
      
      private static const const_1091:int = 2000;
       
      
      private var _window:IFrameWindow;
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_140:QuestMessageData;
      
      private var var_726:Animation;
      
      private var var_1375:int;
      
      public function QuestCompleted(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_140 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_726)
         {
            this.var_726.dispose();
            this.var_726 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.close();
      }
      
      public function onQuestCancelled() : void
      {
         this.close();
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.prepare(param1);
         this.var_1375 = const_1091;
      }
      
      private function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function onNextQuest(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._window.visible = false;
         this._questEngine.questController.questDetails.openForNextQuest = this._questEngine.configuration.getKey("questing.showDetailsForNextQuest") == "true";
         this._questEngine.send(new OpenQuestTrackerMessageComposer());
      }
      
      private function onMoreQuests(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._window.visible = false;
            this._questEngine.send(new GetQuestsMessageComposer());
         }
      }
      
      public function prepare(param1:QuestMessageData) : void
      {
         this.var_140 = param1;
         if(this._window == null)
         {
            this._window = IFrameWindow(this._questEngine.getXmlWindow("QuestCompletedDialog"));
            this._window.findChildByTag("close").procedure = this.onNextQuest;
            this._window.findChildByName("next_quest_button").procedure = this.onNextQuest;
            this._window.findChildByName("more_quests_button").procedure = this.onMoreQuests;
            new PendingImage(this._questEngine,this._window.findChildByName("reward_icon"),"quest_doneicon");
            new PendingImage(this._questEngine,this._window.findChildByName("campaign_reward_icon"),"ach_receive_star");
            this._window.findChildByName("catalog_link_region").procedure = this.onCatalogLink;
            this.var_726 = this._questEngine.getTwinkleAnimation(this._window);
         }
         this._window.findChildByName("catalog_link_txt").caption = this._questEngine.localization.getKey("quests.completed.cataloglink." + this.var_140.activityPointType);
         var _loc2_:String = "quests.completed.reward." + this.var_140.activityPointType;
         this._questEngine.localization.registerParameter(_loc2_,"amount",this.var_140.rewardCurrencyAmount.toString());
         this._window.findChildByName("reward_txt").caption = this._questEngine.localization.getKey(_loc2_,_loc2_);
         this._window.visible = false;
         this._window.findChildByName("congrats_txt").caption = this._questEngine.localization.getKey(!!this.var_140.lastQuestInCampaign ? "quests.completed.campaign.caption" : "quests.completed.quest.caption");
         this._window.findChildByName("more_quests_button").visible = this.var_140.lastQuestInCampaign;
         this._window.findChildByName("campaign_reward_icon").visible = this.var_140.lastQuestInCampaign;
         this._window.findChildByName("catalog_link_region").visible = !this.var_140.lastQuestInCampaign;
         this._window.findChildByName("next_quest_button").visible = !this.var_140.lastQuestInCampaign;
         this._window.findChildByName("reward_icon").visible = !this.var_140.lastQuestInCampaign;
         this._window.findChildByName("campaign_reward_icon").visible = this.var_140.lastQuestInCampaign;
         this._window.findChildByName("campaign_pic_bitmap").visible = this.var_140.lastQuestInCampaign;
         this.setWindowTitle(!!this.var_140.lastQuestInCampaign ? "quests.completed.campaign.title" : "quests.completed.quest.title");
         this.setDesc(this.var_140.getQuestLocalizationKey() + ".completed");
         this._questEngine.setupCampaignImage(this._window,param1,this.var_140.lastQuestInCampaign);
      }
      
      private function setWindowTitle(param1:String) : void
      {
         this._questEngine.localization.registerParameter(param1,"category",this._questEngine.getCampaignName(this.var_140));
         this._window.caption = this._questEngine.localization.getKey(param1,param1);
      }
      
      private function setDesc(param1:String) : void
      {
         this._window.findChildByName("desc_txt").caption = this._questEngine.localization.getKey(param1,param1);
      }
      
      private function onCatalogLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.openCatalog(this.var_140);
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_1375 > 0)
         {
            this.var_1375 -= param1;
            if(this.var_1375 < 1)
            {
               this._window.center();
               this._window.visible = true;
               this._window.activate();
               if(this.var_140.lastQuestInCampaign)
               {
                  this.var_726.restart();
               }
               else
               {
                  this.var_726.stop();
               }
            }
         }
         if(this.var_726 != null)
         {
            this.var_726.update(param1);
         }
      }
   }
}
