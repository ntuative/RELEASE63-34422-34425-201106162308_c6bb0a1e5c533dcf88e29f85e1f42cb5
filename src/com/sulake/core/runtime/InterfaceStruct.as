package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1449:IID;
      
      private var var_1769:String;
      
      private var var_116:IUnknown;
      
      private var var_763:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1449 = param1;
         this.var_1769 = getQualifiedClassName(this.var_1449);
         this.var_116 = param2;
         this.var_763 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1449;
      }
      
      public function get iis() : String
      {
         return this.var_1769;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_116;
      }
      
      public function get references() : uint
      {
         return this.var_763;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_116 == null;
      }
      
      public function dispose() : void
      {
         this.var_1449 = null;
         this.var_1769 = null;
         this.var_116 = null;
         this.var_763 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_763;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_763) : uint(0);
      }
   }
}
