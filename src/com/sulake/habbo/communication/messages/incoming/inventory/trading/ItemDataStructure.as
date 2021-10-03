package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2567:int;
      
      private var var_1626:String;
      
      private var var_2979:int;
      
      private var var_2975:int;
      
      private var _category:int;
      
      private var var_2210:String;
      
      private var var_1533:int;
      
      private var var_2978:int;
      
      private var var_2977:int;
      
      private var var_2980:int;
      
      private var var_2976:int;
      
      private var var_2974:Boolean;
      
      private var var_3077:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2567 = param1;
         this.var_1626 = param2;
         this.var_2979 = param3;
         this.var_2975 = param4;
         this._category = param5;
         this.var_2210 = param6;
         this.var_1533 = param7;
         this.var_2978 = param8;
         this.var_2977 = param9;
         this.var_2980 = param10;
         this.var_2976 = param11;
         this.var_2974 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2567;
      }
      
      public function get itemType() : String
      {
         return this.var_1626;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2979;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2975;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2210;
      }
      
      public function get extra() : int
      {
         return this.var_1533;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2978;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2974;
      }
      
      public function get songID() : int
      {
         return this.var_1533;
      }
   }
}
