package com.sulake.habbo.ui.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.quest.IHabboQuestEngine;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_120:int = 18;
      
      private static const const_1659:int = 9;
      
      private static const const_1141:int = 10;
      
      private static const const_713:int = 25;
      
      private static const const_1661:int = 25;
      
      private static const const_1140:int = 4000;
      
      private static const const_1662:int = 6000;
      
      private static const const_1658:int = 3;
      
      private static const const_1660:int = 1;
      
      private static const const_714:int = 8;
      
      private static const const_478:int = 0;
      
      private static const const_1142:int = (const_714 + const_478) * const_120 + const_120;
      
      private static const const_479:int = 9;
      
      private static const const_1657:int = 200;
      
      private static const const_1663:int = 40;
       
      
      private var var_1339:int = 0;
      
      private var var_1092:int = 0;
      
      private var var_43:IWindowContainer;
      
      private var var_409:IItemListWindow;
      
      private var var_136:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_79:Array;
      
      private var var_298:Array;
      
      private var var_2871:int;
      
      private var var_2872:int = 0;
      
      private var var_873:Number = 1;
      
      private var _baseUrl:String;
      
      private var var_1094:Number = 1;
      
      private var var_2093:Number = 0;
      
      private var var_872:Point;
      
      private var var_31:RoomChatHistoryViewer;
      
      private var var_1019:Boolean = false;
      
      private var var_2092:Boolean = false;
      
      private var var_23:Component = null;
      
      private var _questEngine:IHabboQuestEngine;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_2873:int = 150;
      
      private var var_256:int = 171.0;
      
      private var var_1093:int = 18;
      
      private var var_3045:int = 100;
      
      private var var_2870:int = 0;
      
      public function RoomChatWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IHabboConfigurationManager, param6:int, param7:Component, param8:IHabboQuestEngine)
      {
         this._itemList = new Array();
         this.var_79 = new Array();
         this.var_298 = new Array();
         this.var_872 = new Point();
         super(param1,param2,param3,param4);
         this._questEngine = param8;
         this._config = param5;
         this.var_2871 = param6;
         this.var_43 = param2.createWindow("chat_container","",HabboWindowType.const_71,HabboWindowStyle.const_30,HabboWindowParam.const_46,new Rectangle(0,0,200,this.var_256 + RoomChatHistoryPulldown.const_94),null,0) as IWindowContainer;
         this.var_43.background = true;
         this.var_43.color = 33554431;
         this.var_43.tags.push("room_widget_chat");
         this.var_409 = param2.createWindow("chat_contentlist","",HabboWindowType.const_1197,HabboWindowStyle.const_46,0 | 0,new Rectangle(0,0,200,this.var_256),null,0) as IItemListWindow;
         this.var_43.addChild(this.var_409);
         this.var_136 = param2.createWindow("chat_active_content","",HabboWindowType.const_71,HabboWindowStyle.const_46,HabboWindowParam.const_63,new Rectangle(0,0,200,this.var_256),null,0) as IWindowContainer;
         this.var_136.clipping = false;
         this.var_409.addListItem(this.var_136);
         this.var_31 = new RoomChatHistoryViewer(this,param2,this.var_43,param3);
         this._baseUrl = param5.getKey("site.url");
         this.var_2873 = int(param5.getKey("chat.history.item.max.count","150"));
         var _loc9_:Boolean = param5.getBoolean("chat.history.disabled",false);
         if(this.var_31 != null)
         {
            this.var_31.disabled = _loc9_;
         }
         if(param7 != null)
         {
            this.var_23 = param7;
            this.var_23.registerUpdateReceiver(this,1);
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.var_43;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(disposed)
         {
            return;
         }
         while(this.var_298.length > 0)
         {
            _loc1_ = this.var_298.shift();
         }
         this.var_31.dispose();
         this.var_31 = null;
         while(this._itemList.length > 0)
         {
            _loc1_ = this._itemList.shift();
            _loc1_.dispose();
         }
         while(this.var_79.length > 0)
         {
            _loc1_ = this.var_79.shift();
            _loc1_.dispose();
         }
         this.var_43.dispose();
         if(this.var_23 != null)
         {
            this.var_23.removeUpdateReceiver(this);
            this.var_23 = null;
         }
         this._questEngine = null;
         super.dispose();
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > this.var_1339 && this.var_1339 > 0)
         {
            this.var_1339 = -1;
            this.animationStart();
         }
         if(this.var_1019)
         {
            _loc2_ = param1 / const_1661 * const_1658;
            if(_loc2_ + this.var_1092 > this.var_1093)
            {
               _loc2_ = this.var_1093 - this.var_1092;
            }
            if(_loc2_ > 0)
            {
               this.moveItemsUp(_loc2_);
               this.var_1092 += _loc2_;
            }
            if(this.var_1092 >= this.var_1093)
            {
               this.var_1093 = const_120;
               this.var_1092 = 0;
               this.animationStop();
               this.processBuffer();
               this.var_1339 = getTimer() + const_1140;
            }
         }
         if(this.var_31 != null)
         {
            this.var_31.update(param1);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_965,this.onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_489,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_1008,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_741,this.onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_965,this.onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_489,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_1008,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_741,this.onRoomViewUpdate);
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,this.getFreeItemId(),localizations,this._baseUrl);
         _loc2_.define(param1);
         if(this.var_1094 != 1)
         {
            _loc2_.senderX /= this.var_1094;
         }
         _loc2_.senderX -= this.var_872.x;
         this.setChatItemLocHorizontal(_loc2_);
         this.var_79.push(_loc2_);
         this.processBuffer();
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(this.var_2093 == 0)
            {
               this.var_2093 = param1.scale;
            }
            else
            {
               this.var_1094 = param1.scale / this.var_2093;
            }
         }
         if(param1.positionDelta != null)
         {
            this.var_872.x += param1.positionDelta.x / this.var_1094;
            this.var_872.y += param1.positionDelta.y / this.var_1094;
         }
         if(param1.rect != null)
         {
            if(this.var_31 == null)
            {
               return;
            }
            this.var_43.width = _loc2_.width;
            this.var_43.height = this.var_256 + this.var_31.pulldownBarHeight;
            this.var_409.width = this.var_43.width - this.var_31.scrollbarWidth;
            this.var_409.height = this.var_256;
            this.var_409.x = this.var_43.x;
            this.var_409.y = this.var_43.y;
            this.var_136.width = this.var_43.width - this.var_31.scrollbarWidth;
            this.var_136.height = this.var_256;
            if(this.historyViewerActive())
            {
               this.reAlignItemsToHistoryContent();
            }
            this.var_31.containerResized(this.var_43.rectangle,true);
         }
         this.alignItems();
      }
      
      private function processBuffer() : void
      {
         if(this.var_1019)
         {
            return;
         }
         if(this.var_79.length == 0)
         {
            return;
         }
         while(this.var_79.length > const_1660 || this.historyViewerActive() && this.var_79.length > 0)
         {
            this.activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(this._itemList.length == 0)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = this.checkLastItemAllowsAdding(this.var_79[0]);
         }
         if(_loc1_)
         {
            this.activateItemFromBuffer();
            this.var_1339 = getTimer() + const_1140;
         }
         else
         {
            if(this._itemList.length > 0 && this.var_79.length > 0)
            {
               this.var_1093 = this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_79[0]);
            }
            else
            {
               this.var_1093 = const_120;
            }
            this.animationStart();
         }
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.var_79.length == 0)
         {
            return;
         }
         if(this.historyViewerMinimized())
         {
            this.resetArea();
            this.hideHistoryViewer();
         }
         if(!this.checkLastItemAllowsAdding(this.var_79[0]))
         {
            this.selectItemsToMove();
            this.moveItemsUp(this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_79[0]));
            if(!this.checkLastItemAllowsAdding(this.var_79[0]))
            {
               this.var_136.height += const_120;
               if(this.var_31 != null)
               {
                  this.var_31.containerResized(this.var_43.rectangle);
               }
            }
         }
         _loc1_ = this.var_79.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               this.var_136.addChild(_loc2_);
               _loc1_.timeStamp = new Date().time;
               this._itemList.push(_loc1_);
               _loc3_ = 0;
               if(this._itemList.length > 1)
               {
                  _loc3_ = this._itemList[this._itemList.length - 2].screenLevel;
                  if(this.historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(this.var_873,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = this.var_873;
               if(_loc1_.aboveLevels > const_714 + const_478 + 2)
               {
                  _loc1_.aboveLevels = const_714 + const_478 + 2;
               }
               this.var_873 = 0;
               this.setChatItemLocHorizontal(_loc1_);
               this.setChatItemLocVertical(_loc1_);
               this.setChatItemRenderable(_loc1_);
            }
         }
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(this._itemList.length == 0)
         {
            return true;
         }
         var _loc2_:RoomChatItem = this._itemList[this._itemList.length - 1];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(this.var_136.rectangle.bottom - (this.var_136.y + _loc2_.y + _loc2_.height) <= this.getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_31 == null)
         {
            return;
         }
         _loc1_ = this._itemList.length - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
               this.setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < this._itemList.length)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.var_79.length)
         {
            _loc2_ = this.var_79[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function animationStart() : void
      {
         if(this.var_1019)
         {
            return;
         }
         this.selectItemsToMove();
         this.var_1019 = true;
      }
      
      private function animationStop() : void
      {
         this.var_1019 = false;
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(this.var_1019)
         {
            return;
         }
         this.purgeItems();
         this.var_298 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(this._itemList.length == 0)
         {
            this.var_873 = 1;
            return;
         }
         if(this.historyViewerActive())
         {
            return;
         }
         ++this.var_873;
         var _loc3_:int = this._itemList.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this._itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_478 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timeStamp >= const_1662)
               {
                  _loc4_.timeStamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  this.var_298.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(this.var_298 == null)
         {
            return;
         }
         if(this.var_298.length == 0)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = this.var_298.length - 1;
         while(_loc5_ >= 0)
         {
            _loc2_ = this.var_298[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = this._itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(this.historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(this._itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - this._itemList[_loc4_ - 1].y < this.getItemSpacing(this._itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || this.var_31 == null)
         {
            return;
         }
         if(this._questEngine)
         {
            this.var_2870 = !!this._questEngine.isTrackerVisible() ? int(const_1657) : 0;
         }
         var _loc2_:Number = (param1.senderX + this.var_872.x) * this.var_1094;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = -this.var_43.width / 2 - const_1141 + this.var_3045;
         var _loc6_:Number = this.var_43.width / 2 + const_1141 - this.var_31.scrollbarWidth - this.var_2870;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + this.var_43.width / 2 + this.var_43.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = this._itemList.indexOf(param1);
            _loc3_ = !!this.historyViewerActive() ? 0 : Number(this.var_873);
            if(_loc2_ == this._itemList.length - 1)
            {
               param1.y = this.getAreaBottom() - (_loc3_ + 1) * const_120 - const_479;
            }
            else
            {
               _loc4_ = this._itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = this._itemList[_loc2_ + 1].y - this.getItemSpacing(param1,this._itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = this._itemList[_loc2_ + 1].y - _loc4_ * const_120;
               }
            }
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_713)
            {
               if(param1.view != null)
               {
                  this.var_136.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  this.var_136.addChild(param1.view);
               }
            }
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_120;
               }
               else
               {
                  _loc2_ += this.getItemSpacing(this._itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_120;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function getAreaBottom() : Number
      {
         if(this.historyViewerActive())
         {
            return this.var_136.height;
         }
         return this.var_256 + this.var_43.y;
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_120;
         }
         return const_1659;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(this.historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(this._itemList.length > this.var_2873)
         {
            _loc2_ = this._itemList.shift();
            _loc3_ = this.var_298.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               this.var_298.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               this.var_136.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < this._itemList.length; _loc1_++)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_713)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = this.var_298.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     this.var_298.splice(_loc3_,1);
                  }
                  this.var_136.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(this.var_79.length > 0)
         {
            _loc4_ = true;
         }
         if(this.getTotalContentHeight() > const_120 && !_loc4_ && !this.historyViewerActive())
         {
            if(this.var_31 != null)
            {
               this.stretchAreaBottomTo(this.var_43.y);
               this.alignItems();
               if(!this.historyViewerActive())
               {
                  this.var_31.showHistoryViewer();
               }
               if(!this.historyViewerVisible())
               {
                  this.var_31.visible = true;
               }
            }
         }
         else if(this.historyViewerVisible())
         {
            this.var_31.visible = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + this.var_2871.toString() + "_item_" + (this.var_2872++).toString();
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(this.var_31 != null)
            {
               this.var_31.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_583,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_725,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(this.historyViewerVisible())
         {
            return;
         }
         if(this.var_31 != null)
         {
            this.var_31.beginDrag(param5.stageY);
         }
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(this.var_31 != null)
         {
            this.var_31.beginDrag(param1.stageY,true);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(this.var_31 != null)
         {
            this.var_31.hideHistoryViewer();
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = this.var_43.rectangle.bottom + param1 - 0;
         this.stretchAreaBottomTo(_loc2_);
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = this.var_43.context.getDesktopWindow().height - 0 - const_1663;
         param1 = Math.min(param1,_loc2_);
         this.var_256 = param1 - this.var_43.y;
         this.var_43.height = this.var_256 + RoomChatHistoryPulldown.const_94;
         if(this.var_31 != null)
         {
            this.var_31.containerResized(this.var_43.rectangle);
         }
      }
      
      public function resetArea() : void
      {
         if(this.var_31 == null)
         {
            return;
         }
         this.animationStop();
         this.var_256 = const_1142 + const_479;
         this.var_43.height = this.var_256 + this.var_31.pulldownBarHeight;
         this.var_409.width = this.var_43.width - this.var_31.scrollbarWidth;
         this.var_409.height = this.var_256;
         this.var_136.width = this.var_43.width - this.var_31.scrollbarWidth;
         if(this.historyViewerActive())
         {
            this.var_136.height = this.getTotalContentHeight() + const_479;
         }
         else
         {
            this.var_136.height = this.var_256;
         }
         this.var_409.scrollV = 1;
         if(!this.historyViewerActive())
         {
            this.var_31.containerResized(this.var_43.rectangle);
         }
         this.purgeItems();
         this.alignItems();
      }
      
      private function historyViewerActive() : Boolean
      {
         return this.var_31 == null ? false : Boolean(this.var_31.active);
      }
      
      private function historyViewerVisible() : Boolean
      {
         return this.var_31 == null ? false : Boolean(this.var_31.visible);
      }
      
      public function hideHistoryViewer() : void
      {
         if(this.var_31 != null)
         {
            this.var_31.hideHistoryViewer();
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return this.var_409.height <= 1;
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_79.length)
         {
            _loc4_ = this.var_79[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_713;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = this.var_43.rectangle.bottom;
         this.stretchAreaBottomTo(this.var_43.rectangle.top + _loc1_);
         _loc3_ -= this.var_43.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_1350)
         {
            this.resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_79.length)
         {
            _loc4_ = this.var_79[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         this.var_2092 = true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = this.var_43.rectangle.bottom - 0;
         if(_loc1_ < const_1142)
         {
            if(_loc1_ <= this.var_256 + this.var_43.y)
            {
               if(this.historyViewerActive())
               {
                  this.hideHistoryViewer();
               }
               this.resetArea();
               return;
            }
         }
         if(this.var_2092 && !this.historyViewerActive())
         {
            this.resetArea();
            this.var_2092 = false;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(this.historyViewerActive())
         {
            this.var_136.height = this.getTotalContentHeight() + const_479;
            this.alignItems();
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_79.length)
         {
            _loc1_ = this.var_79[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_79.length)
         {
            _loc1_ = this.var_79[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
   }
}
