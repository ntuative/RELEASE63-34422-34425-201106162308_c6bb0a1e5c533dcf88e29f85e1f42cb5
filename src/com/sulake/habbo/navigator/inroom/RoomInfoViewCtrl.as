package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_201:IWindowContainer;
      
      private var var_3019:int;
      
      private var var_359:RoomEventViewCtrl;
      
      private var var_360:Timer;
      
      private var var_146:RoomSettingsCtrl;
      
      private var var_264:RoomThumbnailCtrl;
      
      private var var_939:TagRenderer;
      
      private var var_361:IWindowContainer;
      
      private var var_362:IWindowContainer;
      
      private var var_610:IWindowContainer;
      
      private var var_1718:IWindowContainer;
      
      private var var_1719:IWindowContainer;
      
      private var var_1161:IWindowContainer;
      
      private var var_937:ITextWindow;
      
      private var var_938:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_751:ITextWindow;
      
      private var var_1160:ITextWindow;
      
      private var var_940:ITextWindow;
      
      private var var_753:ITextWindow;
      
      private var var_1426:ITextWindow;
      
      private var var_265:IWindowContainer;
      
      private var var_754:IWindowContainer;
      
      private var var_1428:IWindowContainer;
      
      private var var_1716:ITextWindow;
      
      private var var_609:ITextWindow;
      
      private var var_1717:IWindow;
      
      private var var_1158:IContainerButtonWindow;
      
      private var var_1164:IContainerButtonWindow;
      
      private var var_1162:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1159:IContainerButtonWindow;
      
      private var var_1431:IButtonWindow;
      
      private var var_1427:IButtonWindow;
      
      private var var_1429:IButtonWindow;
      
      private var var_752:IWindowContainer;
      
      private var var_1163:ITextWindow;
      
      private var var_941:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_750:IButtonWindow;
      
      private var var_1430:Boolean = false;
      
      private const const_789:int = 75;
      
      private const const_852:int = 3;
      
      private const const_1020:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_359 = new RoomEventViewCtrl(this._navigator);
         this.var_146 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_264 = new RoomThumbnailCtrl(this._navigator);
         this.var_939 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_146);
         this.var_360 = new Timer(6000,1);
         this.var_360.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_360)
         {
            this.var_360.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_360.reset();
            this.var_360 = null;
         }
         this._navigator = null;
         this.var_359 = null;
         this.var_146 = null;
         this.var_264 = null;
         if(this.var_939)
         {
            this.var_939.dispose();
            this.var_939 = null;
         }
         this.var_201 = null;
         this.var_361 = null;
         this.var_362 = null;
         this.var_610 = null;
         this.var_1718 = null;
         this.var_1719 = null;
         this.var_1161 = null;
         this.var_937 = null;
         this.var_938 = null;
         this._ownerName = null;
         this.var_751 = null;
         this.var_1160 = null;
         this.var_940 = null;
         this.var_753 = null;
         this.var_1426 = null;
         this.var_265 = null;
         this.var_754 = null;
         this.var_1428 = null;
         this.var_1716 = null;
         this.var_609 = null;
         this.var_1717 = null;
         this.var_1158 = null;
         this.var_1164 = null;
         this.var_1162 = null;
         this._remFavouriteButton = null;
         this.var_1159 = null;
         this.var_1431 = null;
         this.var_1427 = null;
         this.var_1429 = null;
         this.var_752 = null;
         this.var_1163 = null;
         this.var_941 = null;
         this._buttons = null;
         this.var_750 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_360.reset();
         this.var_359.active = true;
         this.var_146.active = false;
         this.var_264.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_360.reset();
         this.var_146.load(param1);
         this.var_146.active = true;
         this.var_359.active = false;
         this.var_264.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_146.active = true;
         this.var_359.active = false;
         this.var_264.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_360.reset();
         this.var_146.active = false;
         this.var_359.active = false;
         this.var_264.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1430 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_360.reset();
         this.var_359.active = false;
         this.var_146.active = false;
         this.var_264.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_852;
         this._window.y = this.const_789;
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_201,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_201.height = Util.getLowestPoint(this.var_201);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_1020;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_361);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_146.refresh(this.var_361);
         this.var_264.refresh(this.var_361);
         Util.moveChildrenToColumn(this.var_361,["room_details","room_buttons"],0,2);
         this.var_361.height = Util.getLowestPoint(this.var_361);
         this.var_361.visible = true;
         Logger.log("XORP: " + this.var_362.visible + ", " + this.var_1161.visible + ", " + this.var_610.visible + ", " + this.var_610.rectangle + ", " + this.var_361.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_265);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_359.refresh(this.var_265);
         if(Util.hasVisibleChildren(this.var_265) && !(this.var_146.active || this.var_264.active))
         {
            Util.moveChildrenToColumn(this.var_265,["event_details","event_buttons"],0,2);
            this.var_265.height = Util.getLowestPoint(this.var_265);
            this.var_265.visible = true;
         }
         else
         {
            this.var_265.visible = false;
         }
         Logger.log("EVENT: " + this.var_265.visible + ", " + this.var_265.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_146.active && !this.var_264.active && !this.var_359.active)
         {
            this.var_752.visible = true;
            this.var_941.text = this.getEmbedData();
         }
         else
         {
            this.var_752.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_146.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_750)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_750.visible = _loc1_;
            if(this.var_1430)
            {
               this.var_750.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_750.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_146.active || this.var_264.active)
         {
            return;
         }
         this.var_937.text = param1.roomName;
         this.var_937.height = this.var_937.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_751.text = param1.description;
         this.var_939.refreshTags(this.var_362,param1.tags);
         this.var_751.visible = false;
         if(param1.description != "")
         {
            this.var_751.height = this.var_751.textHeight + 5;
            this.var_751.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1164,"facebook_logo_small",_loc3_,null,0);
         this.var_1164.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1158,"thumb_up",_loc4_,null,0);
         this.var_1158.visible = _loc4_;
         this.var_753.visible = !_loc4_;
         this.var_1426.visible = !_loc4_;
         this.var_1426.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_362,"home",param2,null,0);
         this._navigator.refreshButton(this.var_362,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_362,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_937.y,0);
         this.var_362.visible = true;
         this.var_362.height = Util.getLowestPoint(this.var_362);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_362.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_146.active || this.var_264.active)
         {
            return;
         }
         this.var_938.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_938.height = this.var_938.textHeight + 5;
         this.var_1160.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1160.height = this.var_1160.textHeight + 5;
         Util.moveChildrenToColumn(this.var_610,["public_space_name","public_space_desc"],this.var_938.y,0);
         this.var_610.visible = true;
         this.var_610.height = Math.max(86,Util.getLowestPoint(this.var_610));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_359.active)
         {
            return;
         }
         this.var_1716.text = param1.eventName;
         this.var_609.text = param1.eventDescription;
         this.var_939.refreshTags(this.var_754,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_609.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_609.height = this.var_609.textHeight + 5;
            this.var_609.y = Util.getLowestPoint(this.var_754) + 2;
            this.var_609.visible = true;
         }
         this.var_754.visible = true;
         this.var_754.height = Util.getLowestPoint(this.var_754);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_146.active || this.var_264.active)
         {
            return;
         }
         this.var_1431.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1162.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1159.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1161.visible = Util.hasVisibleChildren(this.var_1161);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_359.active)
         {
            return;
         }
         this.var_1427.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1429.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1428.visible = Util.hasVisibleChildren(this.var_1428);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_201 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_361 = IWindowContainer(this.find("room_info"));
         this.var_362 = IWindowContainer(this.find("room_details"));
         this.var_610 = IWindowContainer(this.find("public_space_details"));
         this.var_1718 = IWindowContainer(this.find("owner_name_cont"));
         this.var_1719 = IWindowContainer(this.find("rating_cont"));
         this.var_1161 = IWindowContainer(this.find("room_buttons"));
         this.var_937 = ITextWindow(this.find("room_name"));
         this.var_938 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_751 = ITextWindow(this.find("room_desc"));
         this.var_1160 = ITextWindow(this.find("public_space_desc"));
         this.var_940 = ITextWindow(this.find("owner_caption"));
         this.var_753 = ITextWindow(this.find("rating_caption"));
         this.var_1426 = ITextWindow(this.find("rating_txt"));
         this.var_265 = IWindowContainer(this.find("event_info"));
         this.var_754 = IWindowContainer(this.find("event_details"));
         this.var_1428 = IWindowContainer(this.find("event_buttons"));
         this.var_1716 = ITextWindow(this.find("event_name"));
         this.var_609 = ITextWindow(this.find("event_desc"));
         this.var_1164 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1158 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1717 = this.find("staff_pick_button");
         this.var_1162 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1159 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1431 = IButtonWindow(this.find("room_settings_button"));
         this.var_1427 = IButtonWindow(this.find("create_event_button"));
         this.var_1429 = IButtonWindow(this.find("edit_event_button"));
         this.var_752 = IWindowContainer(this.find("embed_info"));
         this.var_1163 = ITextWindow(this.find("embed_info_txt"));
         this.var_941 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_750 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1162,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1431,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1159,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1427,this.method_8);
         this.addMouseClickListener(this.var_1429,this.method_8);
         this.addMouseClickListener(this.var_941,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1158,this.onThumbUp);
         this.addMouseClickListener(this.var_1717,this.onStaffPick);
         this.addMouseClickListener(this.var_1164,this.onFacebookLike);
         this.addMouseClickListener(this.var_750,this.onZoomClick);
         this._navigator.refreshButton(this.var_1162,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1159,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_361,this.onHover);
         this.addMouseOverListener(this.var_265,this.onHover);
         this.var_940.width = this.var_940.textWidth;
         Util.moveChildrenToRow(this.var_1718,["owner_caption","owner_name"],this.var_940.x,this.var_940.y,3);
         this.var_753.width = this.var_753.textWidth;
         Util.moveChildrenToRow(this.var_1719,["rating_caption","rating_txt"],this.var_753.x,this.var_753.y,3);
         this.var_1163.height = this.var_1163.textHeight + 5;
         Util.moveChildrenToColumn(this.var_752,["embed_info_txt","embed_src_txt"],this.var_1163.y,2);
         this.var_752.height = Util.getLowestPoint(this.var_752) + 5;
         this.var_3019 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function method_8(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_941.setSelection(0,this.var_941.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.const_370));
         this.var_1430 = !this.var_1430;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_360.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_146 != null)
         {
            this.var_146.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
