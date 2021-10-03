package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1733:int;
      
      private var var_2128:Number;
      
      private var var_2937:Number;
      
      private var var_2936:int;
      
      private var var_2934:Number;
      
      private var var_2935:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1733 = param1;
         this.var_2128 = param2;
         this.var_2937 = param3;
         this.var_2934 = param4;
         this.var_2935 = param5;
         this.var_2936 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1733;
      }
      
      public function get startPos() : Number
      {
         if(this.var_2128 < 0)
         {
            return 0;
         }
         return this.var_2128 + (getTimer() - this.var_2936) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2937;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2934;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2935;
      }
   }
}
