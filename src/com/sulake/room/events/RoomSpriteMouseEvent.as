package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1794:String = "";
      
      private var var_1944:String = "";
      
      private var var_2505:String = "";
      
      private var var_2778:Number = 0;
      
      private var var_2775:Number = 0;
      
      private var var_2666:Number = 0;
      
      private var var_2665:Number = 0;
      
      private var var_2776:Boolean = false;
      
      private var var_2774:Boolean = false;
      
      private var var_2773:Boolean = false;
      
      private var var_2777:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1794 = param2;
         this.var_1944 = param3;
         this.var_2505 = param4;
         this.var_2778 = param5;
         this.var_2775 = param6;
         this.var_2666 = param7;
         this.var_2665 = param8;
         this.var_2776 = param9;
         this.var_2774 = param10;
         this.var_2773 = param11;
         this.var_2777 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1794;
      }
      
      public function get canvasId() : String
      {
         return this.var_1944;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2505;
      }
      
      public function get screenX() : Number
      {
         return this.var_2778;
      }
      
      public function get screenY() : Number
      {
         return this.var_2775;
      }
      
      public function get localX() : Number
      {
         return this.var_2666;
      }
      
      public function get localY() : Number
      {
         return this.var_2665;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2776;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2774;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2773;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2777;
      }
   }
}
