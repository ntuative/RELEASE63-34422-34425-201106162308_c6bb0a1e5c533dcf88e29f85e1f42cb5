package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2576:int;
      
      private var var_2575:int;
      
      private var var_2824:String;
      
      private var var_2823:int;
      
      private var var_2825:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2576 = param1;
         this.var_2575 = param2;
         this.var_2824 = param3;
         this.var_2823 = param4;
         this.var_2825 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2576,this.var_2575,this.var_2824,this.var_2823,int(this.var_2825)];
      }
      
      public function dispose() : void
      {
      }
   }
}
