package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1296:int = 0;
       
      
      private var _id:int;
      
      private var _type:String = "";
      
      private var var_106:Vector3d;
      
      private var var_493:Vector3d;
      
      private var var_2004:Vector3d;
      
      private var var_2005:Vector3d;
      
      private var var_672:Array;
      
      private var var_77:RoomObjectModel;
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_673:IRoomObjectEventHandler;
      
      private var _updateID:int;
      
      private var _instanceId:int = 0;
      
      public function RoomObject(param1:int, param2:int, param3:String)
      {
         super();
         this._id = param1;
         this.var_106 = new Vector3d();
         this.var_493 = new Vector3d();
         this.var_2004 = new Vector3d();
         this.var_2005 = new Vector3d();
         this.var_672 = new Array(param2);
         var _loc4_:Number = param2 - 1;
         while(_loc4_ >= 0)
         {
            this.var_672[_loc4_] = 0;
            _loc4_--;
         }
         this._type = param3;
         this.var_77 = new RoomObjectModel();
         this._visualization = null;
         this.var_673 = null;
         this._updateID = 0;
         this._instanceId = var_1296++;
      }
      
      public function dispose() : void
      {
         this.var_106 = null;
         this.var_493 = null;
         if(this.var_77 != null)
         {
            this.var_77.dispose();
            this.var_77 = null;
         }
         this.var_672 = null;
         this.setVisualization(null);
         this.setEventHandler(null);
      }
      
      public function getId() : int
      {
         return this._id;
      }
      
      public function getType() : String
      {
         return this._type;
      }
      
      public function getInstanceId() : int
      {
         return this._instanceId;
      }
      
      public function getLocation() : IVector3d
      {
         this.var_2004.assign(this.var_106);
         return this.var_2004;
      }
      
      public function getDirection() : IVector3d
      {
         this.var_2005.assign(this.var_493);
         return this.var_2005;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return this.var_77;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return this.var_77;
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < this.var_672.length)
         {
            return this.var_672[param1];
         }
         return -1;
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return this._visualization;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_106.x != param1.x || this.var_106.y != param1.y || this.var_106.z != param1.z)
         {
            this.var_106.x = param1.x;
            this.var_106.y = param1.y;
            this.var_106.z = param1.z;
            ++this._updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_493.x != param1.x || this.var_493.y != param1.y || this.var_493.z != param1.z)
         {
            this.var_493.x = (param1.x % 360 + 360) % 360;
            this.var_493.y = (param1.y % 360 + 360) % 360;
            this.var_493.z = (param1.z % 360 + 360) % 360;
            ++this._updateID;
         }
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < this.var_672.length)
         {
            if(this.var_672[param2] != param1)
            {
               this.var_672[param2] = param1;
               ++this._updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != this._visualization)
         {
            if(this._visualization != null)
            {
               this._visualization.dispose();
            }
            this._visualization = param1;
            if(this._visualization != null)
            {
               this._visualization.object = this;
            }
         }
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == this.var_673)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = this.var_673;
         if(_loc2_ != null)
         {
            this.var_673 = null;
            _loc2_.object = null;
         }
         this.var_673 = param1;
         if(this.var_673 != null)
         {
            this.var_673.object = this;
         }
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return this.var_673;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return this.getEventHandler();
      }
   }
}
