package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_456:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const const_638:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var var_1155:int;
      
      private var var_2372:Boolean;
      
      private var var_518:Boolean;
      
      private var var_1686:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1155 = param2;
         this.var_2372 = param3;
         this.var_518 = param4;
         this.var_1686 = param5;
      }
      
      public function get position() : int
      {
         return this.var_1155;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return this.var_2372;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_518;
      }
      
      public function get isClubQueue() : Boolean
      {
         return this.var_1686;
      }
   }
}
