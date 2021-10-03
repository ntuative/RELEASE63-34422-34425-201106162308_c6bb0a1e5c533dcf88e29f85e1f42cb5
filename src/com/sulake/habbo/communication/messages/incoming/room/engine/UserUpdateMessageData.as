package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_187:Number = 0;
      
      private var var_186:Number = 0;
      
      private var var_2753:Number = 0;
      
      private var var_2752:Number = 0;
      
      private var var_2750:Number = 0;
      
      private var var_2749:Number = 0;
      
      private var var_493:int = 0;
      
      private var var_2531:int = 0;
      
      private var var_353:Array;
      
      private var var_2751:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_353 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_187 = param3;
         this.var_186 = param4;
         this.var_2753 = param5;
         this.var_493 = param6;
         this.var_2531 = param7;
         this.var_2752 = param8;
         this.var_2750 = param9;
         this.var_2749 = param10;
         this.var_2751 = param11;
         this.var_353 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_187;
      }
      
      public function get z() : Number
      {
         return this.var_186;
      }
      
      public function get localZ() : Number
      {
         return this.var_2753;
      }
      
      public function get targetX() : Number
      {
         return this.var_2752;
      }
      
      public function get targetY() : Number
      {
         return this.var_2750;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2749;
      }
      
      public function get dir() : int
      {
         return this.var_493;
      }
      
      public function get dirHead() : int
      {
         return this.var_2531;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2751;
      }
      
      public function get actions() : Array
      {
         return this.var_353.slice();
      }
   }
}
