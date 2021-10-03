package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1881:IID;
      
      private var var_1136:Boolean;
      
      private var var_1246:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1881 = param1;
         this.var_1246 = new Array();
         this.var_1136 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1881;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1136;
      }
      
      public function get receivers() : Array
      {
         return this.var_1246;
      }
      
      public function dispose() : void
      {
         if(!this.var_1136)
         {
            this.var_1136 = true;
            this.var_1881 = null;
            while(this.var_1246.length > 0)
            {
               this.var_1246.pop();
            }
            this.var_1246 = null;
         }
      }
   }
}
