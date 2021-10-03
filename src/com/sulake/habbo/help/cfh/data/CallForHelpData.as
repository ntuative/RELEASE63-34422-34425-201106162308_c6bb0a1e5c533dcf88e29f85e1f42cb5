package com.sulake.habbo.help.cfh.data
{
   public class CallForHelpData
   {
       
      
      private var var_2834:int;
      
      private var var_1611:int;
      
      private var var_2059:String = "";
      
      public function CallForHelpData()
      {
         super();
      }
      
      public function get topicIndex() : int
      {
         return this.var_2834;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1611;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_2059;
      }
      
      public function set topicIndex(param1:int) : void
      {
         this.var_2834 = param1;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1611 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_2059 = param1;
      }
      
      public function get userSelected() : Boolean
      {
         return this.var_1611 > 0;
      }
      
      public function getTopicKey(param1:int) : String
      {
         return (!!this.userSelected ? "help.cfh.topicwithharasser." : "help.cfh.topic.") + param1;
      }
      
      public function flush() : void
      {
         this.var_1611 = 0;
         this.var_2059 = "";
      }
   }
}
