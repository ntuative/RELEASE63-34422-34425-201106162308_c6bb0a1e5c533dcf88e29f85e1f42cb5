package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_358:int;
      
      private var var_844:Boolean;
      
      private var var_937:String;
      
      private var _ownerName:String;
      
      private var var_2282:int;
      
      private var var_2800:int;
      
      private var var_2892:int;
      
      private var var_1816:String;
      
      private var var_2895:int;
      
      private var var_2313:Boolean;
      
      private var var_879:int;
      
      private var var_1662:int;
      
      private var var_2893:String;
      
      private var var_918:Array;
      
      private var var_2891:RoomThumbnailData;
      
      private var var_2283:Boolean;
      
      private var var_2894:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_918 = new Array();
         super();
         this.var_358 = param1.readInteger();
         this.var_844 = param1.readBoolean();
         this.var_937 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2282 = param1.readInteger();
         this.var_2800 = param1.readInteger();
         this.var_2892 = param1.readInteger();
         this.var_1816 = param1.readString();
         this.var_2895 = param1.readInteger();
         this.var_2313 = param1.readBoolean();
         this.var_879 = param1.readInteger();
         this.var_1662 = param1.readInteger();
         this.var_2893 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_918.push(_loc4_);
            _loc3_++;
         }
         this.var_2891 = new RoomThumbnailData(param1);
         this.var_2283 = param1.readBoolean();
         this.var_2894 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_358;
      }
      
      public function get event() : Boolean
      {
         return this.var_844;
      }
      
      public function get roomName() : String
      {
         return this.var_937;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2282;
      }
      
      public function get userCount() : int
      {
         return this.var_2800;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2892;
      }
      
      public function get description() : String
      {
         return this.var_1816;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2895;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2313;
      }
      
      public function get score() : int
      {
         return this.var_879;
      }
      
      public function get categoryId() : int
      {
         return this.var_1662;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2893;
      }
      
      public function get tags() : Array
      {
         return this.var_918;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2891;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2283;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2894;
      }
   }
}
