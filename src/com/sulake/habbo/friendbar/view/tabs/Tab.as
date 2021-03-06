package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.IHabboFriendBarView;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.geom.Point;
   
   public class Tab implements ITab
   {
      
      public static var name_2:int = 127;
      
      public static var name_1:int = 36;
      
      public static var var_348:IHabboFriendBarData;
      
      public static var var_499:IHabboFriendBarView;
      
      public static var ASSETS:IAssetLibrary;
      
      public static var WINDOWING:IHabboWindowManager;
      
      public static var var_2194:IHabboLocalizationManager;
      
      public static var var_2174:TextCropper;
       
      
      protected var _window:IWindowContainer;
      
      protected var var_163:Boolean;
      
      private var var_1920:Boolean;
      
      private var _selected:Boolean;
      
      private var _disposed:Boolean;
      
      public function Tab()
      {
         super();
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function get recycled() : Boolean
      {
         return this.var_163;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      protected function get exposed() : Boolean
      {
         return this.var_1920;
      }
      
      public function select(param1:Boolean) : void
      {
         this.conceal();
         this._selected = true;
      }
      
      public function deselect(param1:Boolean) : void
      {
         this._selected = false;
      }
      
      public function recycle() : void
      {
         this.conceal();
         this.var_163 = true;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this._window)
            {
               this._window.dispose();
               this._window = null;
            }
            this._disposed = true;
         }
      }
      
      protected function expose() : void
      {
         this.var_1920 = true;
      }
      
      protected function conceal() : void
      {
         this.var_1920 = false;
      }
      
      protected function onMouseClick(param1:WindowMouseEvent) : void
      {
         if(this.disposed || this.recycled)
         {
            return;
         }
         if(this.selected)
         {
            var_499.deSelect(true);
         }
         else
         {
            var_499.selectTab(this,true);
         }
      }
      
      protected function onMouseOver(param1:WindowMouseEvent) : void
      {
         if(this.disposed || this.recycled)
         {
            return;
         }
         if(!this.selected)
         {
            this.expose();
         }
      }
      
      protected function onMouseOut(param1:WindowMouseEvent) : void
      {
         if(this.disposed || this.recycled || this._window == null)
         {
            return;
         }
         if(!this.selected)
         {
            if(!this._window.hitTestGlobalPoint(new Point(param1.stageX,param1.stageY)))
            {
               this.conceal();
            }
         }
      }
   }
}
