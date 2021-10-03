package com.sulake.habbo.ui.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_489:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
      
      public static const const_741:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_1008:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
       
      
      private var var_2094:Rectangle;
      
      private var var_2095:Point;
      
      private var _scale:Number = 0.0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0.0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this.var_2094 = param2;
         this.var_2095 = param3;
         this._scale = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(this.var_2094 != null)
         {
            return this.var_2094.clone();
         }
         return null;
      }
      
      public function get positionDelta() : Point
      {
         if(this.var_2095 != null)
         {
            return this.var_2095.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
   }
}
