package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_866:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2576:int;
      
      private var var_2575:int;
      
      private var _color:uint;
      
      private var var_1193:int;
      
      private var var_2574:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_866);
         this.var_2576 = param1;
         this.var_2575 = param2;
         this._color = param3;
         this.var_1193 = param4;
         this.var_2574 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2576;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2575;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1193;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2574;
      }
   }
}
