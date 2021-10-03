package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1861:int;
      
      private var _currentPosition:int;
      
      private var var_1863:int;
      
      private var var_1862:int;
      
      private var var_1864:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1861;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1863;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1862;
      }
      
      public function get syncCount() : int
      {
         return this.var_1864;
      }
      
      public function flush() : Boolean
      {
         this.var_1861 = -1;
         this._currentPosition = -1;
         this.var_1863 = -1;
         this.var_1862 = -1;
         this.var_1864 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1861 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1863 = param1.readInteger();
         this.var_1862 = param1.readInteger();
         this.var_1864 = param1.readInteger();
         return true;
      }
   }
}
