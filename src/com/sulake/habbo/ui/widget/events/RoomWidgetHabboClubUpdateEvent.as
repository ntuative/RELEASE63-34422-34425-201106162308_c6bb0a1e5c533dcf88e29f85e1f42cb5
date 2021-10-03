package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_256:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2558:int = 0;
      
      private var var_2561:int = 0;
      
      private var var_2560:int = 0;
      
      private var var_2559:Boolean = false;
      
      private var var_2101:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_256,param6,param7);
         this.var_2558 = param1;
         this.var_2561 = param2;
         this.var_2560 = param3;
         this.var_2559 = param4;
         this.var_2101 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2558;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2561;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2560;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2559;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2101;
      }
   }
}
