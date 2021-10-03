package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_490:RoomObjectLocationCacheItem = null;
      
      private var var_229:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_490 = new RoomObjectLocationCacheItem(param1);
         this.var_229 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_490;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_229;
      }
      
      public function dispose() : void
      {
         if(this.var_490 != null)
         {
            this.var_490.dispose();
            this.var_490 = null;
         }
         if(this.var_229 != null)
         {
            this.var_229.dispose();
            this.var_229 = null;
         }
      }
   }
}
