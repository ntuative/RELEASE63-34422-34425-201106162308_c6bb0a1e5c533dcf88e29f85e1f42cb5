package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_769:int = 500;
      
      private static var var_655:Vector3d = new Vector3d();
       
      
      private var var_461:Vector3d;
      
      private var var_106:Vector3d;
      
      private var var_1008:Number = 0.0;
      
      private var var_1921:int = 0;
      
      private var var_2625:int;
      
      private var var_1009:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_461 = new Vector3d();
         this.var_106 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1921;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_106 = null;
         this.var_461 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null)
         {
            this.var_106.assign(param1.getLocation());
         }
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1009 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         if(param1.loc != null)
         {
            this.var_106.assign(param1.loc);
         }
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = _loc2_.targetLoc;
               this.var_2625 = this.var_1921;
               this.var_461.assign(_loc3_);
               this.var_461.sub(this.var_106);
            }
         }
      }
      
      protected function getLocationOffset() : IVector3d
      {
         return null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:IVector3d = this.getLocationOffset();
         var _loc3_:IRoomObjectModelController = object.getModelController();
         if(_loc3_ != null)
         {
            if(_loc2_ != null)
            {
               if(this.var_1008 != _loc2_.z)
               {
                  this.var_1008 = _loc2_.z;
                  _loc3_.setNumber(RoomObjectVariableEnum.const_805,this.var_1008);
               }
            }
            else if(this.var_1008 != 0)
            {
               this.var_1008 = 0;
               _loc3_.setNumber(RoomObjectVariableEnum.const_805,this.var_1008);
            }
         }
         if(this.var_461.length > 0 || _loc2_ != null)
         {
            _loc4_ = param1 - this.var_2625;
            if(_loc4_ == this.var_1009 >> 1)
            {
               _loc4_++;
            }
            if(_loc4_ > this.var_1009)
            {
               _loc4_ = this.var_1009;
            }
            if(this.var_461.length > 0)
            {
               var_655.assign(this.var_461);
               var_655.mul(_loc4_ / Number(this.var_1009));
               var_655.add(this.var_106);
            }
            else
            {
               var_655.assign(this.var_106);
            }
            if(_loc2_ != null)
            {
               var_655.add(_loc2_);
            }
            if(object != null)
            {
               object.setLocation(var_655);
            }
            if(_loc4_ == this.var_1009)
            {
               this.var_461.x = 0;
               this.var_461.y = 0;
               this.var_461.z = 0;
            }
         }
         this.var_1921 = param1;
      }
   }
}
