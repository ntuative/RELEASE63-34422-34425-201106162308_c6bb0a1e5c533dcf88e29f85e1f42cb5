package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_2147:int;
      
      private var var_2274:String;
      
      private var var_1251:int;
      
      private var var_1212:int;
      
      private var var_1808:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2147 = param1.readInteger();
         this.var_2274 = param1.readString();
         this.var_1251 = param1.readInteger();
         this.var_1212 = param1.readInteger();
         this.var_1808 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_2147;
      }
      
      public function get petName() : String
      {
         return this.var_2274;
      }
      
      public function get level() : int
      {
         return this.var_1251;
      }
      
      public function get petType() : int
      {
         return this.var_1212;
      }
      
      public function get breed() : int
      {
         return this.var_1808;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
