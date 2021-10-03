package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1049:int = 20;
      
      private static const const_682:int = 9;
      
      private static const const_1473:int = -1;
       
      
      private var var_313:Array;
      
      private var var_802:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_313 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_802)
            {
               this.var_802 = true;
               this.var_313 = new Array();
               this.var_313.push(const_1473);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_802)
            {
               this.var_802 = false;
               this.var_313 = new Array();
               this.var_313.push(const_1049);
               this.var_313.push(const_682 + param1);
               this.var_313.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_313.length > 0)
            {
               super.setAnimation(this.var_313.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
