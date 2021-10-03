package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1910:int = 1;
      
      public static const const_2221:int = 2;
      
      public static const const_1991:int = 3;
      
      public static const const_1723:int = 4;
       
      
      private var var_1511:int = 0;
      
      private var var_1510:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1511 = 0;
         this.var_1510 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1511 = param1.readInteger();
         if(this.var_1511 == 3)
         {
            this.var_1510 = param1.readString();
         }
         else
         {
            this.var_1510 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1511;
      }
      
      public function get parameter() : String
      {
         return this.var_1510;
      }
   }
}
