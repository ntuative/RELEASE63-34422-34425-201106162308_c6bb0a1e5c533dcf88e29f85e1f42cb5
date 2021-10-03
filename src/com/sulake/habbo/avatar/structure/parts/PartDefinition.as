package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2387:String;
      
      private var var_1766:String;
      
      private var var_2388:String;
      
      private var var_1764:Boolean;
      
      private var var_1765:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2387 = String(param1["set-type"]);
         this.var_1766 = String(param1["flipped-set-type"]);
         this.var_2388 = String(param1["remove-set-type"]);
         this.var_1764 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1765 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1765;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1765 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2387;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1766;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2388;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1764;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1764 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1766 = param1;
      }
   }
}
