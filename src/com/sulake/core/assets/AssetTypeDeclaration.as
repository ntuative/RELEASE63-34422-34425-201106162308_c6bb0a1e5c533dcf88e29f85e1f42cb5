package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2441:String;
      
      private var var_2442:Class;
      
      private var var_2443:Class;
      
      private var var_1788:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2441 = param1;
         this.var_2442 = param2;
         this.var_2443 = param3;
         if(rest == null)
         {
            this.var_1788 = new Array();
         }
         else
         {
            this.var_1788 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2441;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2442;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2443;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1788;
      }
   }
}
