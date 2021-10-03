package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2264:int = 0;
      
      private var var_1554:String = "";
      
      private var var_1953:String = "";
      
      private var var_2641:String = "";
      
      private var var_2640:String = "";
      
      private var var_1937:int = 0;
      
      private var var_2644:int = 0;
      
      private var var_2643:int = 0;
      
      private var var_1552:int = 0;
      
      private var var_2642:int = 0;
      
      private var var_1551:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2264 = param1;
         this.var_1554 = param2;
         this.var_1953 = param3;
         this.var_2641 = param4;
         this.var_2640 = param5;
         if(param6)
         {
            this.var_1937 = 1;
         }
         else
         {
            this.var_1937 = 0;
         }
         this.var_2644 = param7;
         this.var_2643 = param8;
         this.var_1552 = param9;
         this.var_2642 = param10;
         this.var_1551 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2264,this.var_1554,this.var_1953,this.var_2641,this.var_2640,this.var_1937,this.var_2644,this.var_2643,this.var_1552,this.var_2642,this.var_1551];
      }
   }
}
