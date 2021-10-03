package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1410:IHabboTracking;
      
      private var var_2136:Boolean = false;
      
      private var var_2735:int = 0;
      
      private var var_1991:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1410 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1410 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2136 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2735 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2136)
         {
            return;
         }
         ++this.var_1991;
         if(this.var_1991 <= this.var_2735)
         {
            this.var_1410.trackGoogle("toolbar",param1);
         }
      }
   }
}
