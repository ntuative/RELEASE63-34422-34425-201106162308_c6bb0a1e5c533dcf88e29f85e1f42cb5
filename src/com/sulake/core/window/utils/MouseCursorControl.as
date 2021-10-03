package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_30;
      
      private static var var_152:Stage;
      
      private static var var_326:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_820:Boolean = true;
      
      private static var var_129:DisplayObject;
      
      private static var var_1538:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_152 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_129)
            {
               var_152.removeChild(var_129);
               var_152.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_152.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_152.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_152.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_820 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_326;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_326 = param1;
         if(var_326)
         {
            if(var_129)
            {
               var_129.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_129)
         {
            var_129.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_820)
         {
            _loc1_ = var_1538[_type];
            if(_loc1_)
            {
               if(var_129)
               {
                  var_152.removeChild(var_129);
               }
               else
               {
                  var_152.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_152.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_152.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_152.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_129 = _loc1_;
               var_152.addChild(var_129);
            }
            else
            {
               if(var_129)
               {
                  var_152.removeChild(var_129);
                  var_152.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_152.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_152.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_152.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_129 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_30:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_377:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_746:
                  case MouseCursorType.const_279:
                  case MouseCursorType.const_1721:
                  case MouseCursorType.const_1762:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_820 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1538[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_129)
         {
            var_129.x = param1.stageX - 2;
            var_129.y = param1.stageY;
            if(_type == MouseCursorType.const_30)
            {
               var_326 = false;
               Mouse.show();
            }
            else
            {
               var_326 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_129 && _type != MouseCursorType.const_30)
         {
            Mouse.hide();
            var_326 = false;
         }
      }
   }
}
