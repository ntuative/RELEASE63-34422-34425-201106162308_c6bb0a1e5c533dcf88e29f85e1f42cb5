package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1241:String = "M";
      
      public static const const_1929:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_187:Number = 0;
      
      private var var_186:Number = 0;
      
      private var var_493:int = 0;
      
      private var _name:String = "";
      
      private var var_1674:int = 0;
      
      private var var_973:String = "";
      
      private var _figure:String = "";
      
      private var var_2248:String = "";
      
      private var var_2250:int;
      
      private var var_2246:int = 0;
      
      private var var_2249:String = "";
      
      private var var_2251:int = 0;
      
      private var var_2247:int = 0;
      
      private var var_2272:String = "";
      
      private var var_190:Boolean = false;
      
      public function UserMessageData(param1:int)
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
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_190)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1674;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_1674 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_973;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_973 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_190)
         {
            this._figure = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2248;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_2248 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2250;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2250 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2246;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2246 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2249;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_2249 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2251;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2251 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2247;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_190)
         {
            this.var_2247 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2272;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_190)
         {
            this.var_2272 = param1;
         }
      }
   }
}
