package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_552:QuestsList;
      
      private var var_464:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_382:QuestTracker;
      
      private var var_665:NextQuestTimer;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_382 = new QuestTracker(this._questEngine);
         this.var_552 = new QuestsList(this._questEngine);
         this.var_464 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_665 = new NextQuestTimer(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_552.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_552.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_382.onQuest(param1);
         this.var_464.onQuest(param1);
         this._questCompleted.onQuest(param1);
         this.var_665.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_382.onQuestCompleted(param1);
         this.var_464.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_382.onQuestCancelled();
         this.var_464.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
         this.var_665.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_382.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_552.onRoomExit();
         this.var_382.onRoomExit();
         this.var_464.onRoomExit();
         this.var_665.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_382.update(param1);
         this.var_665.update(param1);
         this.var_552.update(param1);
         this.var_464.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_552)
         {
            this.var_552.dispose();
            this.var_552 = null;
         }
         if(this.var_382)
         {
            this.var_382.dispose();
            this.var_382 = null;
         }
         if(this.var_464)
         {
            this.var_464.dispose();
            this.var_464 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_665)
         {
            this.var_665.dispose();
            this.var_665 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_552;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_464;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_382;
      }
   }
}
