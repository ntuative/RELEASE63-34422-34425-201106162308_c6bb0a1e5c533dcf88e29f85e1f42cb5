package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_2024:int;
      
      private var var_2789:String;
      
      private var var_326:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_2024 = param1.readInteger();
         this.var_2789 = param1.readString();
         this.var_326 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_2024;
      }
      
      public function get nodeName() : String
      {
         return this.var_2789;
      }
      
      public function get visible() : Boolean
      {
         return this.var_326;
      }
   }
}
