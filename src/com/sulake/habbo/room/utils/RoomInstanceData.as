package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_777:TileHeightMap = null;
      
      private var var_1213:LegacyWallGeometry = null;
      
      private var var_1214:RoomCamera = null;
      
      private var var_778:SelectedRoomObjectData = null;
      
      private var var_779:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_536:Map;
      
      private var var_537:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_536 = new Map();
         this.var_537 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1213 = new LegacyWallGeometry();
         this.var_1214 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_777;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_777 != null)
         {
            this.var_777.dispose();
         }
         this.var_777 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1213;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1214;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_778;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_778 != null)
         {
            this.var_778.dispose();
         }
         this.var_778 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_779;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_779 != null)
         {
            this.var_779.dispose();
         }
         this.var_779 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_777 != null)
         {
            this.var_777.dispose();
            this.var_777 = null;
         }
         if(this.var_1213 != null)
         {
            this.var_1213.dispose();
            this.var_1213 = null;
         }
         if(this.var_1214 != null)
         {
            this.var_1214.dispose();
            this.var_1214 = null;
         }
         if(this.var_778 != null)
         {
            this.var_778.dispose();
            this.var_778 = null;
         }
         if(this.var_779 != null)
         {
            this.var_779.dispose();
            this.var_779 = null;
         }
         if(this.var_536 != null)
         {
            this.var_536.dispose();
            this.var_536 = null;
         }
         if(this.var_537 != null)
         {
            this.var_537.dispose();
            this.var_537 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_536.remove(param1.id);
            this.var_536.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_536.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_536.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_536.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_537.remove(param1.id);
            this.var_537.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_537.length > 0)
         {
            return this.getWallItemDataWithId(this.var_537.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_537.remove(param1);
      }
   }
}
