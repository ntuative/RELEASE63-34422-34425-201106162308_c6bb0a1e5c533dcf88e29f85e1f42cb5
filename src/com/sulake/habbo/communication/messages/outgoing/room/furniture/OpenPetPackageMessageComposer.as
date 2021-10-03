package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_233:int;
      
      private var var_2274:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_233 = param1;
         this.var_2274 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_233,this.var_2274];
      }
      
      public function dispose() : void
      {
      }
   }
}
