package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_665:uint = 0;
      
      public static const const_1763:uint = 1;
      
      public static const const_2208:int = 0;
      
      public static const const_2214:int = 1;
      
      public static const const_2240:int = 2;
      
      public static const const_2110:int = 3;
      
      public static const const_1992:int = 4;
      
      public static const const_400:int = 5;
      
      public static var var_421:IEventQueue;
      
      private static var var_725:IEventProcessor;
      
      private static var var_2153:uint = const_665;
      
      private static var stage:Stage;
      
      private static var var_182:IWindowRenderer;
       
      
      private var var_2970:EventProcessorState;
      
      private var var_2969:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_144:DisplayObjectContainer;
      
      protected var var_3055:Boolean = true;
      
      protected var var_1400:Error;
      
      protected var var_2231:int = -1;
      
      protected var var_1406:IInternalWindowServices;
      
      protected var var_1683:IWindowParser;
      
      protected var var_3018:IWindowFactory;
      
      protected var var_95:IDesktopWindow;
      
      protected var var_1684:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_596:Boolean = false;
      
      private var var_2968:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_182 = param2;
         this._localization = param4;
         this.var_144 = param5;
         this.var_1406 = new ServiceManager(this,param5);
         this.var_3018 = param3;
         this.var_1683 = new WindowParser(this);
         this.var_2969 = param7;
         if(!stage)
         {
            if(this.var_144 is Stage)
            {
               stage = this.var_144 as Stage;
            }
            else if(this.var_144.stage)
            {
               stage = this.var_144.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_95 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_95.limits.maxWidth = param6.width;
         this.var_95.limits.maxHeight = param6.height;
         this.var_144.addChild(this.var_95.getDisplayObject());
         this.var_144.doubleClickEnabled = true;
         this.var_144.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2970 = new EventProcessorState(var_182,this.var_95,this.var_95,null,this.var_2969);
         inputMode = const_665;
         this.var_1684 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_2153;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_421)
         {
            if(var_421 is IDisposable)
            {
               IDisposable(var_421).dispose();
            }
         }
         if(var_725)
         {
            if(var_725 is IDisposable)
            {
               IDisposable(var_725).dispose();
            }
         }
         switch(value)
         {
            case const_665:
               var_421 = new MouseEventQueue(stage);
               var_725 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1763:
               var_421 = new TabletEventQueue(stage);
               var_725 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_665;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_144.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_144.removeChild(IGraphicContextHost(this.var_95).getGraphicContext(true) as DisplayObject);
            this.var_95.destroy();
            this.var_95 = null;
            this.var_1684.destroy();
            this.var_1684 = null;
            if(this.var_1406 is IDisposable)
            {
               IDisposable(this.var_1406).dispose();
            }
            this.var_1406 = null;
            this.var_1683.dispose();
            this.var_1683 = null;
            var_182 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1400;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2231;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1400 = param2;
         this.var_2231 = param1;
         if(this.var_3055)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1400 = null;
         this.var_2231 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1406;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1683;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_3018;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_95;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_95.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1992,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1684;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_95,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_95)
         {
            this.var_95 = null;
         }
         if(param1.state != WindowState.const_541)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_182.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_596 = true;
         if(this.var_1400)
         {
            throw this.var_1400;
         }
         var_725.process(this.var_2970,var_421);
         this.var_596 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2968 = true;
         var_182.update(param1);
         this.var_2968 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_95 != null && !this.var_95.disposed)
         {
            if(this.var_144 is Stage)
            {
               this.var_95.limits.maxWidth = Stage(this.var_144).stageWidth;
               this.var_95.limits.maxHeight = Stage(this.var_144).stageHeight;
               this.var_95.width = Stage(this.var_144).stageWidth;
               this.var_95.height = Stage(this.var_144).stageHeight;
            }
            else
            {
               this.var_95.limits.maxWidth = this.var_144.width;
               this.var_95.limits.maxHeight = this.var_144.height;
               this.var_95.width = this.var_144.width;
               this.var_95.height = this.var_144.height;
            }
         }
      }
   }
}
