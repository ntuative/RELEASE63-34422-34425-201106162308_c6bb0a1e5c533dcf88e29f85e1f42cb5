package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2237:Number = 0.0;
      
      private var var_2236:Number = 0.0;
      
      private var var_2239:Number = 0.0;
      
      private var var_2238:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2237 = param1;
         this.var_2236 = param2;
         this.var_2239 = param3;
         this.var_2238 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2237;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2236;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2239;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2238;
      }
   }
}
