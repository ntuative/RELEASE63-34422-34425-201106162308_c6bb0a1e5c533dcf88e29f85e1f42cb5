package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2210:String;
      
      protected var var_1533:Number;
      
      protected var var_3004:Boolean;
      
      protected var var_3003:Boolean;
      
      protected var var_2974:Boolean;
      
      protected var var_2594:Boolean;
      
      protected var var_3002:int;
      
      protected var var_2977:int;
      
      protected var var_2980:int;
      
      protected var var_2976:int;
      
      protected var var_2111:String;
      
      protected var var_1733:int;
      
      protected var var_1107:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2974 = param5;
         this.var_3003 = param6;
         this.var_3004 = param7;
         this.var_2594 = param8;
         this.var_2210 = param9;
         this.var_1533 = param10;
         this.var_3002 = param11;
         this.var_2977 = param12;
         this.var_2980 = param13;
         this.var_2976 = param14;
         this.var_2111 = param15;
         this.var_1733 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2210;
      }
      
      public function get extra() : Number
      {
         return this.var_1533;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_3004;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_3003;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2974;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2594;
      }
      
      public function get expires() : int
      {
         return this.var_3002;
      }
      
      public function get creationDay() : int
      {
         return this.var_2977;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2980;
      }
      
      public function get creationYear() : int
      {
         return this.var_2976;
      }
      
      public function get slotId() : String
      {
         return this.var_2111;
      }
      
      public function get songId() : int
      {
         return this.var_1733;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_1107 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_1107;
      }
   }
}
