package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var var_2043:String;
      
      private var var_2045:String;
      
      private var var_2044:String;
      
      private var _name:String;
      
      private var var_1128:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         this.var_2043 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         this.var_2045 = _loc5_[0];
         this.var_2044 = _loc5_[1];
         this._name = param2;
         this.var_1128 = param3;
      }
      
      public function get id() : String
      {
         return this.var_2043 + "_" + this.var_2045 + "." + this.var_2044;
      }
      
      public function get languageCode() : String
      {
         return this.var_2043;
      }
      
      public function get countryCode() : String
      {
         return this.var_2045;
      }
      
      public function get encoding() : String
      {
         return this.var_2044;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get url() : String
      {
         return this.var_1128;
      }
   }
}
