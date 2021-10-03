package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabSelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class AvatarEditorView
   {
      
      public static var var_1384:IWindowContainer;
      
      public static var var_1668:IWindowContainer;
      
      public static var var_2185:int = 6710886;
      
      private static const const_1520:int = 5000;
      
      private static const const_1521:Point = new Point(100,30);
       
      
      private var var_24:HabboAvatarEditor;
      
      private var var_59:IWindowContainer;
      
      private var var_417:String;
      
      private var var_243:ITabSelectorWindow;
      
      private var var_85:IFrameWindow;
      
      private var var_639:IWindowContainer;
      
      private var var_318:IFrameWindow;
      
      private var _saveTimer:Timer;
      
      private var var_1496:String;
      
      private var var_2520:Boolean = true;
      
      private var var_1234:Array;
      
      private var var_1435:Array;
      
      public function AvatarEditorView(param1:HabboAvatarEditor, param2:Array)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_1234 = [];
         this.var_1435 = [AvatarEditorFigureCategory.const_1011,AvatarEditorFigureCategory.const_51,AvatarEditorFigureCategory.const_244,AvatarEditorFigureCategory.const_800,AvatarEditorFigureCategory.HOTLOOKS,AvatarEditorFigureCategory.const_113];
         super();
         this.var_24 = param1;
         if(var_1384 == null)
         {
            _loc4_ = this.var_24.manager.assets.getAssetByName("AvatarEditorThumb") as XmlAsset;
            var_1384 = this.var_24.manager.windowManager.buildFromXML(_loc4_.content as XML) as IWindowContainer;
         }
         if(var_1668 == null)
         {
            _loc5_ = this.var_24.manager.assets.getAssetByName("color_chooser_cell") as XmlAsset;
            var_1668 = this.var_24.manager.windowManager.buildFromXML(_loc5_.content as XML) as IWindowContainer;
         }
         this._saveTimer = new Timer(const_1520,1);
         this._saveTimer.addEventListener(TimerEvent.TIMER,this.onUpdate);
         if(param2 == null)
         {
            param2 = this.var_1435;
         }
         for each(_loc3_ in param2)
         {
            this.var_1234.push(_loc3_);
         }
         this.createWindow();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._saveTimer != null)
         {
            this._saveTimer.stop();
            this._saveTimer.removeEventListener(TimerEvent.TIMER,this.onUpdate);
            this._saveTimer = null;
         }
         if(this.var_243)
         {
            this.var_243.dispose();
            this.var_243 = null;
         }
         if(this.var_318)
         {
            this.var_318.dispose();
            this.var_318 = null;
         }
         if(this.var_59)
         {
            this.var_59.dispose();
            this.var_59 = null;
         }
         if(this.var_639 != null)
         {
            this.var_639.dispose();
            this.var_639 = null;
         }
         if(this.var_85)
         {
            this.var_85.dispose();
            this.var_85 = null;
         }
         if(this.var_59 != null)
         {
            _loc1_ = this.var_59.findChildByName("figureContainer") as IWindowContainer;
            if(_loc1_ != null)
            {
               while(_loc1_.numChildren > 0)
               {
                  _loc1_.removeChildAt(0);
               }
            }
            _loc2_ = this.var_59.findChildByName("contentArea") as IWindowContainer;
            if(_loc2_ != null)
            {
               while(_loc2_.numChildren > 0)
               {
                  _loc2_.removeChildAt(0);
               }
            }
            _loc3_ = this.var_59.findChildByName("sideContainer") as IWindowContainer;
            if(_loc3_ != null)
            {
               while(_loc3_.numChildren > 0)
               {
                  _loc3_.removeChildAt(0);
               }
            }
            this.var_24 = null;
         }
      }
      
      public function getFrame(param1:Array, param2:String = null) : IFrameWindow
      {
         if(this.var_85)
         {
            this.var_85.visible = true;
            this.var_85.activate();
            return this.var_85;
         }
         if(this.var_85)
         {
            this.var_85.dispose();
            this.var_85 = null;
         }
         var _loc3_:XmlAsset = this.var_24.manager.assets.getAssetByName("AvatarEditorFrame") as XmlAsset;
         if(_loc3_)
         {
            this.var_85 = this.var_24.manager.windowManager.buildFromXML(_loc3_.content as XML) as IFrameWindow;
         }
         if(this.var_85 == null)
         {
            Logger.log("Failed to construct Avatar editor window!");
            return null;
         }
         var _loc4_:IWindowContainer = this.var_85.findChildByName("maincontent") as IWindowContainer;
         if(!this.embedToContext(_loc4_,param1))
         {
            this.var_85.dispose();
            this.var_85 = null;
            return null;
         }
         if(param2)
         {
            this.var_85.header.title.text = param2;
         }
         this.var_85.position = const_1521;
         this.var_85.findChildByName("header_button_close").procedure = this.windowEventProc;
         return this.var_85;
      }
      
      public function embedToContext(param1:IWindowContainer, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         if(!this.validateAvailableCategories(param2))
         {
            Logger.log("Could not validate categories for avatar editor!");
            return false;
         }
         if(param1)
         {
            _loc3_ = param1.getChildIndex(this.var_59);
            if(_loc3_)
            {
               param1.removeChildAt(_loc3_);
            }
            param1.addChild(this.var_59);
         }
         else
         {
            if(this.var_639 == null)
            {
               this.var_639 = this.var_24.manager.windowManager.createWindow("avatarEditorContainer","",HabboWindowType.const_71,HabboWindowStyle.const_30,0 | 0,new Rectangle(0,0,2,2),null,0) as IWindowContainer;
               this.var_639.addChild(this.var_59);
            }
            _loc3_ = this.var_639.getChildIndex(this.var_59);
            if(_loc3_)
            {
               param1.removeChildAt(_loc3_);
            }
            this.var_639.visible = true;
         }
         return true;
      }
      
      public function validateAvailableCategories(param1:Array) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return this.validateAvailableCategories(this.var_1435);
         }
         if(param1.length != this.var_1234.length)
         {
            return false;
         }
         for each(_loc2_ in param1)
         {
            if(this.var_1234.indexOf(_loc2_) < 0)
            {
               return false;
            }
         }
         return true;
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         this._saveTimer.stop();
         if(this.var_59)
         {
            this.var_59.findChildByName("save").enable();
         }
      }
      
      public function show() : void
      {
         if(this.var_85)
         {
            this.var_85.visible = true;
         }
         else if(this.var_59)
         {
            this.var_59.visible = true;
         }
      }
      
      public function hide() : void
      {
         if(this.var_85)
         {
            this.var_85.visible = false;
         }
         else if(this.var_59)
         {
            this.var_59.visible = false;
         }
      }
      
      private function createWindow() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_59 == null)
         {
            this.var_59 = this.var_24.manager.windowManager.buildFromXML((this.var_24.manager.assets.getAssetByName("AvatarEditorContent") as XmlAsset).content as XML) as IWindowContainer;
         }
         this.var_59.procedure = this.windowEventProc;
         this.var_243 = this.var_59.findChildByName("mainTabs") as ITabSelectorWindow;
         var _loc1_:int = this.var_243.numSelectables - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this.var_243.getSelectableAt(_loc1_);
            if(_loc2_ != null && this.var_1234.indexOf(_loc2_.name) < 0)
            {
               _loc3_ = this.var_243.removeSelectable(_loc2_);
               _loc4_ = _loc1_ + 1;
               while(_loc4_ < this.var_243.numSelectables)
               {
                  this.var_243.getSelectableAt(_loc4_).x = this.var_243.getSelectableAt(_loc4_).x - _loc3_.width;
                  _loc4_++;
               }
            }
            _loc1_--;
         }
         this.var_243.setSelected(this.var_243.getSelectableAt(0));
         this.attachImages();
         this.update();
      }
      
      private function attachImages() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc1_:Array = this.var_1435;
         var _loc2_:Point = new Point();
         for each(_loc3_ in _loc1_)
         {
            _loc4_ = this.var_59.findChildByName(_loc3_) as IWindowContainer;
            if(_loc4_ != null)
            {
               _loc5_ = _loc4_.findChildByTag("BITMAP") as IBitmapWrapperWindow;
               if(_loc5_ != null)
               {
                  _loc6_ = this.var_24.manager.assets.getAssetByName("ae_tabs_" + _loc3_) as BitmapDataAsset;
                  _loc7_ = _loc6_.content as BitmapData;
                  _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
                  _loc2_.x = (_loc5_.width - _loc7_.width) / 2;
                  _loc2_.y = (_loc5_.height - _loc7_.height) / 2;
                  _loc5_.bitmap.copyPixels(_loc7_,_loc7_.rect,_loc2_);
               }
            }
         }
      }
      
      public function update() : void
      {
         var _loc1_:IWindowContainer = this.var_24.figureData.view.window;
         var _loc2_:IWindowContainer = this.var_59.findChildByName("figureContainer") as IWindowContainer;
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         if(_loc2_ != null)
         {
            _loc2_.addChild(_loc1_);
         }
         var _loc3_:IContainerButtonWindow = this.var_59.findChildByName("wardrobe") as IContainerButtonWindow;
         if(_loc3_ && this.var_24.manager.sessionData)
         {
            _loc3_.visible = this.var_24.manager.sessionData.clubLevel >= HabboClubLevelEnum.const_38 && this.var_24.isSideContentEnabled();
         }
         var _loc4_:String = "null";
         if(this.var_24.manager.sessionData && this.var_24.manager.sessionData.clubLevel >= HabboClubLevelEnum.const_38 && (this.var_1496 == AvatarEditorSideCategory.const_113 || this.var_2520))
         {
            _loc4_ = "null";
         }
         if(this.var_24.isClubTryoutAllowed() && this.var_24.clubMemberLevel <= 0)
         {
            _loc4_ = "null";
         }
         if(!this.var_24.isSideContentEnabled())
         {
            _loc4_ = "null";
         }
         this.setSideContent(_loc4_);
         this.setViewToCategory(this.var_417);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = false) : void
      {
         if(!param2)
         {
         }
         this.setViewToCategory(param1);
      }
      
      private function toggleWardrobe() : void
      {
         if(this.var_1496 == AvatarEditorSideCategory.const_113)
         {
            this.var_2520 = false;
            this.setSideContent(AvatarEditorSideCategory.const_519);
         }
         else
         {
            this.setSideContent(AvatarEditorSideCategory.const_113);
         }
      }
      
      private function setSideContent(param1:String) : void
      {
         var _loc5_:int = 0;
         if(this.var_1496 == param1)
         {
            return;
         }
         var _loc2_:IWindowContainer = this.var_59.findChildByName("sideContainer") as IWindowContainer;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarEditorSideCategory.const_519:
               break;
            case AvatarEditorSideCategory.const_529:
               _loc3_ = this.var_24.getSideContentWindowContainer(AvatarEditorSideCategory.const_529);
               break;
            case AvatarEditorSideCategory.const_113:
               _loc3_ = this.var_24.getSideContentWindowContainer(AvatarEditorSideCategory.const_113);
         }
         var _loc4_:IWindow = _loc2_.removeChildAt(0);
         if(_loc4_)
         {
            this.var_59.width -= _loc4_.width;
         }
         if(_loc3_)
         {
            _loc2_.addChild(_loc3_);
            _loc3_.visible = true;
            _loc2_.width = _loc3_.width;
         }
         else
         {
            _loc2_.width = 0;
         }
         this.var_1496 = param1;
         if(this.var_85)
         {
            _loc5_ = 8;
            this.var_85.content.width = this.var_59.width + _loc5_;
         }
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         var _loc2_:IWindowContainer = this.var_59.findChildByName("contentArea") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.getChildAt(0) as IWindowContainer;
         _loc2_.removeChild(_loc3_);
         _loc2_.invalidate();
         var _loc4_:IWindowContainer = this.var_24.getCategoryWindowContainer(param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.visible = true;
         _loc2_.addChild(_loc4_);
         this.var_417 = param1;
         this.var_243.setSelected(this.var_243.getSelectableByName(param1));
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowEvent.const_48)
         {
            _loc3_ = param2.name;
            Logger.log("Select tab: " + _loc3_);
            if(_loc3_ != this.var_417)
            {
               this.var_24.toggleAvatarEditorPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "save":
                  if(this.var_24.hasInvalidClubItems())
                  {
                     this.displayStripClubDialog();
                     return;
                  }
                  this._saveTimer.start();
                  this.var_59.findChildByName("save").disable();
                  this.var_24.saveCurrentSelection();
                  this.var_24.manager.close(this.var_24.instanceId);
                  break;
               case "cancel":
                  this.var_24.manager.close(this.var_24.instanceId);
                  break;
               case "wardrobe":
                  this.toggleWardrobe();
                  break;
               case "header_button_close":
                  this.var_24.manager.close(this.var_24.instanceId);
            }
         }
      }
      
      private function displayStripClubDialog() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!this.var_318)
         {
            _loc1_ = this.var_24.manager.assets.getAssetByName("StripClubItemsInfo");
            if(!_loc1_)
            {
               Logger.log("Failed to initialize strip club info dialog; missing asset!");
               return;
            }
            _loc2_ = _loc1_.content as XML;
            this.var_318 = this.var_24.manager.windowManager.buildFromXML(_loc2_,2) as IFrameWindow;
            this.var_318.procedure = this.stripClubDialogEventProc;
            this.var_318.center();
         }
         else
         {
            this.var_318.visible = true;
            this.var_318.center();
         }
      }
      
      private function stripClubDialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "header_button_close":
                  this.var_318.visible = false;
                  if(this.var_24.manager.communication)
                  {
                     this.var_24.manager.communication.getHabboMainConnection(null).send(new EventLogMessageComposer("AvatarEditor","click","strip_club_items_close",""));
                  }
                  break;
               case "strip_button_ok":
                  if(this.var_24)
                  {
                     this.var_24.stripClubItems();
                  }
                  this.var_318.visible = false;
                  if(this.var_24.manager.communication)
                  {
                     this.var_24.manager.communication.getHabboMainConnection(null).send(new EventLogMessageComposer("AvatarEditor","click","strip_club_items_ok",""));
                  }
                  break;
               case "strip_button_club_info":
                  this.openCatalogClubPage();
                  this.var_318.visible = false;
                  if(this.var_24.manager.communication)
                  {
                     this.var_24.manager.communication.getHabboMainConnection(null).send(new EventLogMessageComposer("AvatarEditor","click","strip_club_items_info",""));
                  }
            }
         }
      }
      
      private function openCatalogClubPage() : void
      {
         if(this.var_24.manager.catalog)
         {
            this.var_24.manager.catalog.openCatalogPage(CatalogPageName.const_188,true);
         }
      }
   }
}
