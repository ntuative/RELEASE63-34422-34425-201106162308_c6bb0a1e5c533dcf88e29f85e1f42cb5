package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_554:WallRasterizer;
      
      private var var_553:FloorRasterizer;
      
      private var var_829:WallAdRasterizer;
      
      private var var_555:LandscapeRasterizer;
      
      private var var_830:PlaneMaskManager;
      
      private var var_856:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_554 = new WallRasterizer();
         this.var_553 = new FloorRasterizer();
         this.var_829 = new WallAdRasterizer();
         this.var_555 = new LandscapeRasterizer();
         this.var_830 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_856;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_553;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_554;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_829;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_555;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_830;
      }
      
      public function dispose() : void
      {
         if(this.var_554 != null)
         {
            this.var_554.dispose();
            this.var_554 = null;
         }
         if(this.var_553 != null)
         {
            this.var_553.dispose();
            this.var_553 = null;
         }
         if(this.var_829 != null)
         {
            this.var_829.dispose();
            this.var_829 = null;
         }
         if(this.var_555 != null)
         {
            this.var_555.dispose();
            this.var_555 = null;
         }
         if(this.var_830 != null)
         {
            this.var_830.dispose();
            this.var_830 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_554 != null)
         {
            this.var_554.clearCache();
         }
         if(this.var_553 != null)
         {
            this.var_553.clearCache();
         }
         if(this.var_555 != null)
         {
            this.var_555.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_554.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_553.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_829.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_555.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_830.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_856)
         {
            return;
         }
         this.var_554.initializeAssetCollection(param1);
         this.var_553.initializeAssetCollection(param1);
         this.var_829.initializeAssetCollection(param1);
         this.var_555.initializeAssetCollection(param1);
         this.var_830.initializeAssetCollection(param1);
         this.var_856 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
