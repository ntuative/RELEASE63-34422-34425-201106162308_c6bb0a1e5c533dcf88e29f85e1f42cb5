package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class HabboNotificationViewManager implements IUpdateReceiver
   {
      
      private static const const_1697:int = 78;
      
      private static const const_704:int = 4;
       
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1366:Map;
      
      private var var_924:Map;
      
      private var _disposed:Boolean = false;
      
      private var var_1653:int = 78;
      
      private var var_207:Array;
      
      public function HabboNotificationViewManager(param1:IAssetLibrary, param2:IHabboWindowManager, param3:Map, param4:Map)
      {
         super();
         this._assetLibrary = param1;
         this._windowManager = param2;
         this.var_1366 = param3;
         this.var_924 = param4;
         this.var_207 = new Array();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function replaceIcon(param1:BadgeImageReadyEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_207)
         {
            _loc2_.replaceIcon(param1);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = this.var_207.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            (this.var_207.pop() as HabboNotificationItemView).dispose();
            _loc2_++;
         }
         this._assetLibrary = null;
         this._windowManager = null;
         if(this.var_1366)
         {
            this.var_1366.dispose();
            this.var_1366 = null;
         }
         if(this.var_924)
         {
            this.var_924.dispose();
            this.var_924 = null;
         }
         this._disposed = true;
      }
      
      public function showItem(param1:HabboNotificationItem) : Boolean
      {
         if(!this.isSpaceAvailable())
         {
            return false;
         }
         var _loc2_:HabboNotificationItemView = new HabboNotificationItemView(this._assetLibrary.getAssetByName("layout_notification_xml"),this._windowManager,this.var_1366,this.var_924,param1);
         _loc2_.reposition(this.getNextAvailableVerticalPosition());
         this.var_207.push(_loc2_);
         this.var_207.sortOn("verticalPosition",Array.NUMERIC);
         return true;
      }
      
      public function isSpaceAvailable() : Boolean
      {
         return this.getNextAvailableVerticalPosition() + HabboNotificationItemView.const_602 < 540;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.var_207.length)
         {
            (this.var_207[_loc2_] as HabboNotificationItemView).update(param1);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_207.length)
         {
            _loc3_ = this.var_207[_loc2_] as HabboNotificationItemView;
            if(_loc3_.ready)
            {
               _loc3_.dispose();
               this.var_207.splice(_loc2_,1);
               _loc2_--;
            }
            _loc2_++;
         }
      }
      
      private function getNextAvailableVerticalPosition() : int
      {
         var _loc3_:* = null;
         if(this.var_207.length == 0)
         {
            return this.var_1653;
         }
         var _loc1_:int = this.var_1653;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_207.length)
         {
            _loc3_ = this.var_207[_loc2_] as HabboNotificationItemView;
            if(_loc1_ + HabboNotificationItemView.const_602 < _loc3_.verticalPosition)
            {
               return _loc1_;
            }
            _loc1_ = _loc3_.verticalPosition + HabboNotificationItemView.const_602 + const_704;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function set topMarginIncrease(param1:int) : void
      {
         var _loc4_:* = null;
         this.var_1653 = const_1697 + param1;
         var _loc2_:int = this.var_1653;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_207.length)
         {
            _loc4_ = this.var_207[_loc3_] as HabboNotificationItemView;
            _loc4_.reposition(_loc2_);
            _loc2_ = _loc4_.verticalPosition + HabboNotificationItemView.const_602 + const_704;
            _loc3_++;
         }
      }
   }
}
