package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_1070:Array;
      
      private var var_2653:String;
      
      private var var_2651:String;
      
      private var var_2652:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_1070 = param1;
         this.var_2653 = param2;
         this.var_2651 = param3;
         this.var_2652 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_1070;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2653;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2651;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2652;
      }
   }
}
