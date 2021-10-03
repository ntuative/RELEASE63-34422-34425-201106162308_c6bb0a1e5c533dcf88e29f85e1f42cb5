package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1798:String = "WE_DESTROY";
      
      public static const const_332:String = "WE_DESTROYED";
      
      public static const const_2009:String = "WE_OPEN";
      
      public static const const_1876:String = "WE_OPENED";
      
      public static const const_1720:String = "WE_CLOSE";
      
      public static const const_1783:String = "WE_CLOSED";
      
      public static const const_1833:String = "WE_FOCUS";
      
      public static const const_360:String = "WE_FOCUSED";
      
      public static const const_1743:String = "WE_UNFOCUS";
      
      public static const const_1710:String = "WE_UNFOCUSED";
      
      public static const const_1794:String = "WE_ACTIVATE";
      
      public static const const_587:String = "WE_ACTIVATED";
      
      public static const const_1781:String = "WE_DEACTIVATE";
      
      public static const const_516:String = "WE_DEACTIVATED";
      
      public static const const_337:String = "WE_SELECT";
      
      public static const const_48:String = "WE_SELECTED";
      
      public static const const_528:String = "WE_UNSELECT";
      
      public static const const_565:String = "WE_UNSELECTED";
      
      public static const const_1870:String = "WE_LOCK";
      
      public static const const_1752:String = "WE_LOCKED";
      
      public static const const_1930:String = "WE_UNLOCK";
      
      public static const const_1901:String = "WE_UNLOCKED";
      
      public static const const_841:String = "WE_ENABLE";
      
      public static const const_247:String = "WE_ENABLED";
      
      public static const const_767:String = "WE_DISABLE";
      
      public static const const_270:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_410:String = "WE_RELOCATED";
      
      public static const const_1246:String = "WE_RESIZE";
      
      public static const const_39:String = "WE_RESIZED";
      
      public static const const_1747:String = "WE_MINIMIZE";
      
      public static const const_1841:String = "WE_MINIMIZED";
      
      public static const const_1963:String = "WE_MAXIMIZE";
      
      public static const const_1966:String = "WE_MAXIMIZED";
      
      public static const const_1866:String = "WE_RESTORE";
      
      public static const const_1926:String = "WE_RESTORED";
      
      public static const const_619:String = "WE_CHILD_ADDED";
      
      public static const const_436:String = "WE_CHILD_REMOVED";
      
      public static const const_219:String = "WE_CHILD_RELOCATED";
      
      public static const const_147:String = "WE_CHILD_RESIZED";
      
      public static const const_372:String = "WE_CHILD_ACTIVATED";
      
      public static const const_514:String = "WE_PARENT_ADDED";
      
      public static const const_1734:String = "WE_PARENT_REMOVED";
      
      public static const const_1765:String = "WE_PARENT_RELOCATED";
      
      public static const const_658:String = "WE_PARENT_RESIZED";
      
      public static const const_1238:String = "WE_PARENT_ACTIVATED";
      
      public static const const_181:String = "WE_OK";
      
      public static const const_570:String = "WE_CANCEL";
      
      public static const const_114:String = "WE_CHANGE";
      
      public static const const_584:String = "WE_SCROLL";
      
      public static const const_116:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_736:IWindow;
      
      protected var var_1130:Boolean;
      
      protected var var_505:Boolean;
      
      protected var var_163:Boolean;
      
      protected var var_737:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_736 = param3;
         _loc5_.var_505 = param4;
         _loc5_.var_163 = false;
         _loc5_.var_737 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_736;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_505;
      }
      
      public function recycle() : void
      {
         if(this.var_163)
         {
            throw new Error("Event already recycled!");
         }
         this.var_736 = null;
         this._window = null;
         this.var_163 = true;
         this.var_1130 = false;
         this.var_737.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1130;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1130 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1130;
      }
      
      public function stopPropagation() : void
      {
         this.var_1130 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1130 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_505 + " window: " + this._window + " }";
      }
   }
}
