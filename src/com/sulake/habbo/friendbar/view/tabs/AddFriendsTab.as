package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   
   public class AddFriendsTab extends Tab
   {
      
      protected static const ICON:String = "icon";
      
      protected static const TEXT:String = "text";
      
      protected static const const_462:String = "header";
      
      protected static const const_1022:String = "label";
      
      protected static const BUTTON:String = "button";
      
      private static const const_1533:String = "addFriendsTabXML";
      
      private static const const_1534:String = "find_friends_icon_png";
      
      private static var var_990:int = -1;
      
      private static const const_78:uint = 6907230;
      
      private static const const_1066:uint = 9209986;
      
      private static const POOL:Array = [];
      
      private static const const_467:Array = [];
       
      
      public function AddFriendsTab()
      {
         super();
      }
      
      public static function allocate() : AddFriendsTab
      {
         var _loc1_:AddFriendsTab = false ? POOL.pop() : new AddFriendsTab();
         _loc1_.var_163 = false;
         _loc1_._window = _loc1_.allocateEntityWindow();
         return _loc1_;
      }
      
      public function allocateEntityWindow() : IWindowContainer
      {
         var _loc1_:IWindowContainer = false ? const_467.pop() : WINDOWING.buildFromXML(ASSETS.getAssetByName(const_1533).content as XML) as IWindowContainer;
         var _loc2_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_462));
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc1_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc2_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         if(var_990 < 0)
         {
            var_990 = _loc1_.height;
         }
         _loc1_.height = name_1;
         var _loc3_:IBitmapWrapperWindow = _loc1_.findChildByName(ICON) as IBitmapWrapperWindow;
         _loc3_.disposesBitmap = false;
         _loc3_.bitmap = ASSETS.getAssetByName(const_1534).content as BitmapData;
         var _loc4_:IWindow = _loc1_.findChildByName(BUTTON);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
         var _loc5_:IWindow = _loc1_.findChildByName(TEXT);
         _loc5_.visible = false;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            param1.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName(const_462));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            _loc2_.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            param1.findChildByName(BUTTON).removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
            param1.findChildByName(TEXT).visible = false;
            param1.width = name_2;
            param1.height = name_1;
            if(const_467.indexOf(param1) == -1)
            {
               const_467.push(param1);
            }
         }
      }
      
      override public function select(param1:Boolean) : void
      {
         if(!selected)
         {
            _window.height = var_990;
            _window.y = 0 - (0 - name_1);
            _window.findChildByName(TEXT).visible = true;
            super.select(param1);
         }
      }
      
      override public function deselect(param1:Boolean) : void
      {
         if(selected)
         {
            _window.y = 0;
            _window.height = name_1;
            _window.findChildByName(TEXT).visible = false;
            super.deselect(param1);
         }
      }
      
      override public function recycle() : void
      {
         if(!disposed)
         {
            if(!var_163)
            {
               if(_window)
               {
                  this.releaseEntityWindow(_window);
                  _window = null;
               }
               var_163 = true;
               POOL.push(this);
            }
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         ITextWindow(_window.findChildByTag(const_1022)).underline = exposed;
         _window.color = !!exposed ? uint(const_1066) : uint(const_78);
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         ITextWindow(_window.findChildByTag(const_1022)).underline = exposed;
         _window.color = !!exposed ? uint(const_1066) : uint(const_78);
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            var_348.findNewFriends();
            this.deselect(true);
         }
      }
   }
}
