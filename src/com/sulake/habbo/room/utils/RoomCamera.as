package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1576:Number = 12;
       
      
      private var var_2722:int = -1;
      
      private var var_2719:int = -2;
      
      private var var_220:Vector3d = null;
      
      private var var_1283:Number = 0;
      
      private var var_1568:Number = 0;
      
      private var var_1976:Boolean = false;
      
      private var var_198:Vector3d = null;
      
      private var var_1973:Vector3d;
      
      private var var_2724:Boolean = false;
      
      private var var_2720:Boolean = false;
      
      private var var_2717:Boolean = false;
      
      private var var_2716:Boolean = false;
      
      private var var_2721:int = 0;
      
      private var var_2715:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2723:int = 0;
      
      private var var_2718:int = 0;
      
      private var var_1926:int = -1;
      
      private var var_1974:int = 0;
      
      private var var_1975:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1973 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_198;
      }
      
      public function get targetId() : int
      {
         return this.var_2722;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2719;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1973;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2724;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2720;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2717;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2716;
      }
      
      public function get screenWd() : int
      {
         return this.var_2721;
      }
      
      public function get screenHt() : int
      {
         return this.var_2715;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2723;
      }
      
      public function get roomHt() : int
      {
         return this.var_2718;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1926;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_220 != null && this.var_198 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2722 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1973.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2719 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2724 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2720 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2717 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2716 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2721 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2715 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1975 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2723 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2718 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1926 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_220 == null)
         {
            this.var_220 = new Vector3d();
         }
         if(this.var_220.x != param1.x || this.var_220.y != param1.y || this.var_220.z != param1.z)
         {
            this.var_220.assign(param1);
            this.var_1974 = 0;
            _loc2_ = Vector3d.dif(this.var_220,this.var_198);
            this.var_1283 = _loc2_.length;
            this.var_1976 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_220 = null;
         this.var_198 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_198 != null)
         {
            return;
         }
         this.var_198 = new Vector3d();
         this.var_198.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_198 == null)
         {
            this.var_198 = new Vector3d();
         }
         this.var_198.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_220 != null && this.var_198 != null)
         {
            ++this.var_1974;
            if(this.var_1975)
            {
               this.var_1975 = false;
               this.var_198 = this.var_220;
               this.var_220 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_220,this.var_198);
            if(_loc3_.length > this.var_1283)
            {
               this.var_1283 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_198 = this.var_220;
               this.var_220 = null;
               this.var_1568 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1283);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1283 / const_1576;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1976)
               {
                  if(_loc7_ < this.var_1568)
                  {
                     _loc7_ = this.var_1568;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_1976 = false;
                  }
               }
               this.var_1568 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_198 = Vector3d.sum(this.var_198,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1926 = -1;
      }
   }
}
