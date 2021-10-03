package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   
   public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_500:int = 0;
      
      public static var var_909:int = 1;
      
      public static var var_906:int = 2;
      
      public static var var_905:int = 3;
      
      public static var var_907:int = 4;
      
      public static var var_908:int = 5;
      
      public static var var_1122:int = 6;
      
      public static var var_1121:int = 7;
       
      
      public function ChangeUserNameResultMessageEvent(param1:Function)
      {
         super(param1,ChangeUserNameResultMessageParser);
      }
      
      public function getParser() : ChangeUserNameResultMessageParser
      {
         return var_10 as ChangeUserNameResultMessageParser;
      }
   }
}
