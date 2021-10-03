package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1954:int;
      
      private var var_2814:int;
      
      private var var_770:int;
      
      private var var_556:Number;
      
      private var var_2812:Boolean;
      
      private var var_2813:int;
      
      private var var_2049:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_556);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2814 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2813 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2812 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_770;
         if(this.var_770 == 1)
         {
            this.var_556 = param1;
            this.var_1954 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_770);
            this.var_556 = this.var_556 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2812 && param3 - this.var_1954 >= this.var_2814)
         {
            this.var_770 = 0;
            if(this.var_2049 < this.var_2813)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_2049;
               this.var_1954 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
