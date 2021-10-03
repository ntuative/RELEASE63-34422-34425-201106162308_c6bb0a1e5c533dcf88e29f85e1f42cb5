package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2174:int = 1;
      
      public static const const_2294:int = 2;
      
      public static const const_2134:int = 3;
      
      public static const const_2157:int = 4;
      
      public static const const_1806:int = 5;
      
      public static const const_2231:int = 6;
      
      public static const const_1774:int = 7;
      
      public static const const_1907:int = 8;
      
      public static const const_2092:int = 9;
      
      public static const const_1902:int = 10;
      
      public static const const_1713:int = 11;
      
      public static const const_1925:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1771:int;
      
      private var var_701:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1771 = param1.readInteger();
         this.var_701 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1771;
      }
      
      public function get info() : String
      {
         return this.var_701;
      }
   }
}
