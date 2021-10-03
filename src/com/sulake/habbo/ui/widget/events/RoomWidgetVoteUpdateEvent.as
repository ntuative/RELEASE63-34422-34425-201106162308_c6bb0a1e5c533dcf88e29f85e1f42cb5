package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_157:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_145:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1260:String;
      
      private var var_1478:Array;
      
      private var var_1222:Array;
      
      private var var_2018:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1260 = param2;
         this.var_1478 = param3;
         this.var_1222 = param4;
         if(this.var_1222 == null)
         {
            this.var_1222 = [];
         }
         this.var_2018 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1260;
      }
      
      public function get choices() : Array
      {
         return this.var_1478.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1222.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2018;
      }
   }
}
