package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_358:int;
      
      private var var_2800:int;
      
      private var var_2849:Boolean;
      
      private var var_2470:int;
      
      private var _ownerName:String;
      
      private var var_137:RoomData;
      
      private var var_844:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_358 = param1.readInteger();
         this.var_2800 = param1.readInteger();
         this.var_2849 = param1.readBoolean();
         this.var_2470 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_137 = new RoomData(param1);
         this.var_844 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_137 != null)
         {
            this.var_137.dispose();
            this.var_137 = null;
         }
         if(this.var_844 != null)
         {
            this.var_844.dispose();
            this.var_844 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_358;
      }
      
      public function get userCount() : int
      {
         return this.var_2800;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2849;
      }
      
      public function get ownerId() : int
      {
         return this.var_2470;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_137;
      }
      
      public function get event() : RoomData
      {
         return this.var_844;
      }
   }
}
