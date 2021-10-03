package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_108:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_159:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_812:int = 2;
      
      public static const const_929:int = 3;
      
      public static const const_1805:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1701:String = "";
      
      private var var_2250:int;
      
      private var var_2246:int = 0;
      
      private var var_2247:int = 0;
      
      private var _figure:String = "";
      
      private var var_48:BitmapData = null;
      
      private var var_257:Array;
      
      private var var_1625:int = 0;
      
      private var var_2484:String = "";
      
      private var var_2486:int = 0;
      
      private var var_2485:int = 0;
      
      private var var_1854:Boolean = false;
      
      private var var_1693:String = "";
      
      private var var_2219:Boolean = false;
      
      private var var_2707:Boolean = false;
      
      private var var_2702:Boolean = true;
      
      private var var_1345:int = 0;
      
      private var var_2706:Boolean = false;
      
      private var var_2703:Boolean = false;
      
      private var var_2704:Boolean = false;
      
      private var var_2705:Boolean = false;
      
      private var var_2700:Boolean = false;
      
      private var var_2701:Boolean = false;
      
      private var var_2708:int = 0;
      
      private var var_1853:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_257 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1701 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1701;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2250 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2250;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2246 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2246;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2247 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2247;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_48 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_257 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_257;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1625 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1625;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2484 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2484;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2707 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2707;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1345 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1345;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2706 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2706;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2703 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2703;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2704 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2704;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2705 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2705;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2700 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2700;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2701 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2701;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2708 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2708;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2702 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2702;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1853 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1853;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2486 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2486;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2485 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2485;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1854 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1854;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1693 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1693;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2219 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2219;
      }
   }
}
