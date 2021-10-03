package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
      
      private static var var_1228:int = 0;
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1109:int;
      
      private var var_743:Boolean;
      
      private var _allowFollow:Boolean;
      
      private var _figure:String;
      
      private var var_1662:int;
      
      private var var_1701:String;
      
      private var var_1694:String;
      
      private var var_1693:String;
      
      private var var_1015:Vector.<FriendNotification>;
      
      private var var_2512:int = -1;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1693 = param3;
         this.var_1701 = param4;
         this.var_1109 = param5;
         this.var_743 = param6;
         this._allowFollow = param7;
         this._figure = param8;
         this.var_1662 = param9;
         this.var_1694 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_1109;
      }
      
      public function get online() : Boolean
      {
         return this.var_743;
      }
      
      public function get allowFollow() : Boolean
      {
         return this._allowFollow;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get categoryId() : int
      {
         return this.var_1662;
      }
      
      public function get motto() : String
      {
         return this.var_1701;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1694;
      }
      
      public function get realName() : String
      {
         return this.var_1693;
      }
      
      public function get logEventId() : int
      {
         return this.var_2512;
      }
      
      public function get notifications() : Vector.<FriendNotification>
      {
         if(!this.var_1015)
         {
            this.var_1015 = new Vector.<FriendNotification>();
         }
         return this.var_1015;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_1109 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_743 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this._allowFollow = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1662 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1701 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1694 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1693 = param1;
      }
      
      public function set logEventId(param1:int) : void
      {
         this.var_2512 = param1;
      }
      
      public function getNextLogEventId() : int
      {
         return ++var_1228;
      }
   }
}
