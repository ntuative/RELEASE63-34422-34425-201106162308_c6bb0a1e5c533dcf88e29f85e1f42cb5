package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_174:String = "ROE_MOUSE_CLICK";
      
      public static const const_193:String = "ROE_MOUSE_ENTER";
      
      public static const const_601:String = "ROE_MOUSE_MOVE";
      
      public static const const_178:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2271:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_494:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1794:String = "";
      
      private var var_2774:Boolean;
      
      private var var_2776:Boolean;
      
      private var var_2773:Boolean;
      
      private var var_2777:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1794 = param2;
         this.var_2774 = param5;
         this.var_2776 = param6;
         this.var_2773 = param7;
         this.var_2777 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1794;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2774;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2776;
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
