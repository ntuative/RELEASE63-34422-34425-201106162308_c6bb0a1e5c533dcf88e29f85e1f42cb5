package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var var_1127:IAnimation;
      
      private var _id:String;
      
      private var var_2113:int;
      
      private var var_2563:String;
      
      private var var_2562:Boolean;
      
      private var _dx:Array;
      
      private var var_1508:Array;
      
      private var var_1509:Array;
      
      public function SpriteDataContainer(param1:IAnimation, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super();
         this.var_1127 = param1;
         this._id = String(param2.@id);
         this.var_2113 = parseInt(param2.@ink);
         this.var_2563 = String(param2.@member);
         this.var_2562 = Boolean(parseInt(param2.@directions));
         this._dx = [];
         this.var_1508 = [];
         this.var_1509 = [];
         for each(_loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            this._dx[_loc4_] = parseInt(_loc3_.@dx);
            this.var_1508[_loc4_] = parseInt(_loc3_.@dy);
            this.var_1509[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < this._dx.length)
         {
            return this._dx[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < this.var_1508.length)
         {
            return this.var_1508[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < this.var_1509.length)
         {
            return this.var_1509[param1];
         }
         return 0;
      }
      
      public function get animation() : IAnimation
      {
         return this.var_1127;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get ink() : int
      {
         return this.var_2113;
      }
      
      public function get member() : String
      {
         return this.var_2563;
      }
      
      public function get hasDirections() : Boolean
      {
         return this.var_2562;
      }
   }
}
