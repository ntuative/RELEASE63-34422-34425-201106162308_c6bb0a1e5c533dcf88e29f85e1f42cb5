package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_788:int = 1;
      
      public static const const_939:int = 2;
      
      public static const const_990:int = 3;
      
      public static const const_1154:int = 4;
      
      public static const const_867:int = 5;
      
      public static const const_1170:int = 6;
       
      
      private var _type:int;
      
      private var var_1216:int;
      
      private var var_2699:String;
      
      private var var_2885:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1216 = param2;
         this.var_2699 = param3;
         this.var_2885 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2699;
      }
      
      public function get time() : String
      {
         return this.var_2885;
      }
      
      public function get senderId() : int
      {
         return this.var_1216;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
