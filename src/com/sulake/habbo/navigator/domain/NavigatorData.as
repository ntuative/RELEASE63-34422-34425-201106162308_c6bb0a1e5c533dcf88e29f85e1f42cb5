package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_2038:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_211:MsgWithRequestId;
      
      private var var_612:RoomEventData;
      
      private var var_2319:Boolean;
      
      private var var_2315:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2260:int;
      
      private var var_266:GuestRoomData;
      
      private var var_945:PublicRoomShortData;
      
      private var var_2318:int;
      
      private var var_2324:Boolean;
      
      private var var_2317:int;
      
      private var var_2322:Boolean;
      
      private var var_1732:int;
      
      private var var_2323:Boolean;
      
      private var var_1435:Array;
      
      private var var_1434:Array;
      
      private var var_2314:int;
      
      private var var_1436:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1169:Boolean;
      
      private var var_2320:int;
      
      private var var_2321:Boolean;
      
      private var var_2316:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1435 = new Array();
         this.var_1434 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_266 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_266 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_945 = null;
         this.var_266 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_945 = param1.publicSpace;
            this.var_612 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_612 != null)
         {
            this.var_612.dispose();
            this.var_612 = null;
         }
         if(this.var_945 != null)
         {
            this.var_945.dispose();
            this.var_945 = null;
         }
         if(this.var_266 != null)
         {
            this.var_266.dispose();
            this.var_266 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_266 != null)
         {
            this.var_266.dispose();
         }
         this.var_266 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_612 != null)
         {
            this.var_612.dispose();
         }
         this.var_612 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_211 != null && this.var_211 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_211 != null && this.var_211 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_211 != null && this.var_211 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_211 = param1;
         this.var_1169 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_211 = param1;
         this.var_1169 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_211 = param1;
         this.var_1169 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_211 == null)
         {
            return;
         }
         this.var_211.dispose();
         this.var_211 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_211 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_211 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_211 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_612;
      }
      
      public function get avatarId() : int
      {
         return this.var_2260;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2319;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2315;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_266;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_945;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2324;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2317;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1732;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2322;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2320;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2318;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2323;
      }
      
      public function get adIndex() : int
      {
         return this.var_2316;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2321;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2260 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2317 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2324 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2319 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2315 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2322 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1732 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2320 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2318 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2323 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2316 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2321 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1435 = param1;
         this.var_1434 = new Array();
         for each(_loc2_ in this.var_1435)
         {
            if(_loc2_.visible)
            {
               this.var_1434.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1435;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1434;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2314 = param1.limit;
         this.var_1436 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1436 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_266.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_266 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_266.flatId;
         return this.var_1732 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1436 >= this.var_2314;
      }
      
      public function startLoading() : void
      {
         this.var_1169 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1169;
      }
   }
}
