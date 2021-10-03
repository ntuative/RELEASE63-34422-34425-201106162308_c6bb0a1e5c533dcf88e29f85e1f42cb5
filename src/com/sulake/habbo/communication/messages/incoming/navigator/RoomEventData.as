package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1961:Boolean;
      
      private var var_2686:int;
      
      private var var_2687:String;
      
      private var var_358:int;
      
      private var var_2689:int;
      
      private var var_1716:String;
      
      private var var_2688:String;
      
      private var var_2690:String;
      
      private var var_918:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_918 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1961 = false;
            return;
         }
         this.var_1961 = true;
         this.var_2686 = int(_loc2_);
         this.var_2687 = param1.readString();
         this.var_358 = int(param1.readString());
         this.var_2689 = param1.readInteger();
         this.var_1716 = param1.readString();
         this.var_2688 = param1.readString();
         this.var_2690 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_918.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_918 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2686;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2687;
      }
      
      public function get flatId() : int
      {
         return this.var_358;
      }
      
      public function get eventType() : int
      {
         return this.var_2689;
      }
      
      public function get eventName() : String
      {
         return this.var_1716;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2688;
      }
      
      public function get creationTime() : String
      {
         return this.var_2690;
      }
      
      public function get tags() : Array
      {
         return this.var_918;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1961;
      }
   }
}
