package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1392:int = 1;
      
      public static const const_861:int = 2;
      
      public static const const_837:int = 3;
      
      public static const const_1812:int = 4;
       
      
      private var _index:int;
      
      private var var_2805:String;
      
      private var var_2803:String;
      
      private var var_2802:Boolean;
      
      private var var_2804:String;
      
      private var var_1040:String;
      
      private var var_2801:int;
      
      private var var_2800:int;
      
      private var _type:int;
      
      private var var_2403:String;
      
      private var var_1059:GuestRoomData;
      
      private var var_1060:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2805 = param1.readString();
         this.var_2803 = param1.readString();
         this.var_2802 = param1.readInteger() == 1;
         this.var_2804 = param1.readString();
         this.var_1040 = param1.readString();
         this.var_2801 = param1.readInteger();
         this.var_2800 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1392)
         {
            this.var_2403 = param1.readString();
         }
         else if(this._type == const_837)
         {
            this.var_1060 = new PublicRoomData(param1);
         }
         else if(this._type == const_861)
         {
            this.var_1059 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1059 != null)
         {
            this.var_1059.dispose();
            this.var_1059 = null;
         }
         if(this.var_1060 != null)
         {
            this.var_1060.dispose();
            this.var_1060 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2805;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2803;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2802;
      }
      
      public function get picText() : String
      {
         return this.var_2804;
      }
      
      public function get picRef() : String
      {
         return this.var_1040;
      }
      
      public function get folderId() : int
      {
         return this.var_2801;
      }
      
      public function get tag() : String
      {
         return this.var_2403;
      }
      
      public function get userCount() : int
      {
         return this.var_2800;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1059;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1060;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1392)
         {
            return 0;
         }
         if(this.type == const_861)
         {
            return this.var_1059.maxUserCount;
         }
         if(this.type == const_837)
         {
            return this.var_1060.maxUsers;
         }
         return 0;
      }
   }
}
