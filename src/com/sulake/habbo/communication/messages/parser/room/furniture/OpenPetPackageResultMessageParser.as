package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_233:int = 0;
      
      private var var_1932:int = 0;
      
      private var var_1796:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_233;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1932;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1796;
      }
      
      public function flush() : Boolean
      {
         this.var_233 = 0;
         this.var_1932 = 0;
         this.var_1796 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_233 = param1.readInteger();
         this.var_1932 = param1.readInteger();
         this.var_1796 = param1.readString();
         return true;
      }
   }
}
