package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var var_11:Rectangle;
      
      protected var var_426:Rectangle;
      
      protected var var_68:Rectangle;
      
      protected var var_161:Rectangle;
      
      protected var var_162:Rectangle;
      
      protected var var_81:WindowRectLimits;
      
      protected var _context:WindowContext;
      
      protected var var_507:Boolean = false;
      
      protected var var_262:uint = 16777215;
      
      protected var var_597:uint;
      
      protected var var_508:uint = 10;
      
      protected var var_738:Boolean = true;
      
      protected var var_326:Boolean = true;
      
      protected var _blend:Number = 1.0;
      
      protected var var_21:uint;
      
      protected var _state:uint;
      
      protected var var_91:uint;
      
      protected var _type:uint;
      
      protected var var_18:String = "";
      
      protected var _name:String;
      
      protected var _id:uint;
      
      protected var var_918:Array;
      
      protected var _disposed:Boolean = false;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._type = param3;
         this.var_21 = param5;
         this._state = WindowState.const_106;
         this.var_91 = param4;
         this.var_918 = param8 == null ? new Array() : param8;
         this._context = param6;
         this.var_11 = param7.clone();
         this.var_426 = param7.clone();
         this.var_68 = param7.clone();
         this.var_161 = new Rectangle();
         this.var_162 = null;
         this.var_81 = new WindowRectLimits(this as IWindow);
      }
      
      public function get x() : int
      {
         return this.var_11.x;
      }
      
      public function get y() : int
      {
         return this.var_11.y;
      }
      
      public function get width() : int
      {
         return this.var_11.width;
      }
      
      public function get height() : int
      {
         return this.var_11.height;
      }
      
      public function get position() : Point
      {
         return this.var_11.topLeft;
      }
      
      public function get rectangle() : Rectangle
      {
         return this.var_11;
      }
      
      public function get limits() : IRectLimiter
      {
         return this.var_81;
      }
      
      public function get context() : IWindowContext
      {
         return this._context;
      }
      
      public function get mouseThreshold() : uint
      {
         return this.var_508;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get background() : Boolean
      {
         return this.var_507;
      }
      
      public function get clipping() : Boolean
      {
         return this.var_738;
      }
      
      public function get visible() : Boolean
      {
         return this.var_326;
      }
      
      public function get color() : uint
      {
         return this.var_262;
      }
      
      public function get alpha() : uint
      {
         return this.var_597 >>> 24;
      }
      
      public function get blend() : Number
      {
         return this._blend;
      }
      
      public function get param() : uint
      {
         return this.var_21;
      }
      
      public function get state() : uint
      {
         return this._state;
      }
      
      public function get style() : uint
      {
         return this.var_91;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get caption() : String
      {
         return this.var_18;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get tags() : Array
      {
         return this.var_918;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_11 = null;
            this._context = null;
            this._state = WindowState.const_541;
            this.var_918 = null;
         }
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function getInitialWidth() : int
      {
         return this.var_426.width;
      }
      
      public function getInitialHeight() : int
      {
         return this.var_426.height;
      }
      
      public function getPreviousWidth() : int
      {
         return this.var_68.width;
      }
      
      public function getPreviousHeight() : int
      {
         return this.var_68.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return this.var_161.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return this.var_161.height;
      }
      
      public function getMaximizedWidth() : int
      {
         return this.var_162.width;
      }
      
      public function getMaximizedHeight() : int
      {
         return this.var_162.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return this.var_81.maxWidth < int.MAX_VALUE;
      }
      
      public function getMaxWidth() : int
      {
         return this.var_81.maxWidth;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = this.var_81.maxWidth;
         this.var_81.maxWidth = param1;
         return _loc2_;
      }
      
      public function hasMinWidth() : Boolean
      {
         return this.var_81.minWidth > int.MIN_VALUE;
      }
      
      public function getMinWidth() : int
      {
         return this.var_81.minWidth;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = this.var_81.minWidth;
         this.var_81.minWidth = param1;
         return _loc2_;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return this.var_81.maxHeight < int.MAX_VALUE;
      }
      
      public function getMaxHeight() : int
      {
         return this.var_81.maxHeight;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = this.var_81.maxHeight;
         this.var_81.maxHeight = param1;
         return _loc2_;
      }
      
      public function hasMinHeight() : Boolean
      {
         return this.var_81.minHeight > int.MIN_VALUE;
      }
      
      public function getMinHeight() : int
      {
         return this.var_81.minHeight;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = this.var_81.minHeight;
         this.var_81.minHeight = param1;
         return _loc2_;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._type & param2 ^ param1) == 0;
         }
         return (this._type & param1) == param1;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._state & param2 ^ param1) == 0;
         }
         return (this._state & param1) == param1;
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_91 & param2 ^ param1) == 0;
         }
         return (this.var_91 & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_21 & param2 ^ param1) == 0;
         }
         return (this.var_21 & param1) == param1;
      }
   }
}
