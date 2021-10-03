package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_187:Number = 0;
      
      private var var_186:Number = 0;
      
      private var var_493:int = 0;
      
      private var var_517:int = 0;
      
      private var var_614:int = 0;
      
      private var _type:int = 0;
      
      private var var_3065:String = "";
      
      private var var_1533:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2478:int = 0;
      
      private var var_2647:Boolean;
      
      private var var_2782:String = null;
      
      private var var_190:Boolean = false;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_190 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_190)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_187;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_190)
         {
            this.var_187 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_186;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_190)
         {
            this.var_186 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_493;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_493 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_517;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_517 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_614;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_614 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_190)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_190)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_190)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2782;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_2782 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_1533;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_1533 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return this.var_2478;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2478 = param1;
         }
      }
      
      public function get knownAsUsable() : Boolean
      {
         return this.var_2647;
      }
      
      public function set knownAsUsable(param1:Boolean) : void
      {
         this.var_2647 = param1;
      }
   }
}
