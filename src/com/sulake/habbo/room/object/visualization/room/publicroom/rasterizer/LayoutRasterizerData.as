package com.sulake.habbo.room.object.visualization.room.publicroom.rasterizer
{
   public class LayoutRasterizerData
   {
       
      
      private var var_2081:XMLList;
      
      public function LayoutRasterizerData(param1:XML)
      {
         super();
         this.var_2081 = param1.elements.element;
      }
      
      public function get elementList() : XMLList
      {
         return this.var_2081;
      }
      
      public function dispose() : void
      {
         this.var_2081 = null;
      }
   }
}
