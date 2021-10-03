package com.sulake.habbo.ui.widget.playlisteditor
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorNowPlayingEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MainWindowHandler
   {
      
      private static const const_1469:int = 6;
      
      private static const const_1470:int = 9;
      
      private static const const_1468:int = 5;
       
      
      private var _widget:PlayListEditorWidget;
      
      private var var_239:IHabboMusicController;
      
      private var var_17:IWindowContainer;
      
      private var var_953:IBorderWindow;
      
      private var var_954:IBorderWindow;
      
      private var var_521:MusicInventoryGridView;
      
      private var var_762:PlayListEditorItemListView;
      
      private var var_238:MusicInventoryStatusView;
      
      private var var_312:PlayListStatusView;
      
      private var var_1767:IScrollbarWindow;
      
      private var var_1768:IScrollbarWindow;
      
      public function MainWindowHandler(param1:PlayListEditorWidget, param2:IHabboMusicController)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         super();
         this._widget = param1;
         this.var_239 = param2;
         var _loc3_:Array = [PlayListEditorWidgetAssetsEnum.const_945,PlayListEditorWidgetAssetsEnum.const_824,PlayListEditorWidgetAssetsEnum.const_484,PlayListEditorWidgetAssetsEnum.const_644,PlayListEditorWidgetAssetsEnum.const_986];
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = this._widget.getImageGalleryAssetBitmap(_loc4_);
            if(_loc5_ != null)
            {
               _loc5_.dispose();
            }
            else
            {
               this._widget.retrieveWidgetImage(_loc4_);
            }
         }
         this.createWindow();
         this.var_521 = new MusicInventoryGridView(param1,this.getMusicInventoryGrid(),param2);
         this.var_762 = new PlayListEditorItemListView(param1,this.getPlayListEditorItemList());
         this.var_238 = new MusicInventoryStatusView(param1,this.getMusicInventoryStatusContainer());
         this.var_312 = new PlayListStatusView(param1,this.getPlayListStatusContainer());
         this.refreshLoadableAsset();
      }
      
      public function get window() : IWindow
      {
         return this.var_17;
      }
      
      public function get musicInventoryView() : MusicInventoryGridView
      {
         return this.var_521;
      }
      
      public function get playListEditorView() : PlayListEditorItemListView
      {
         return this.var_762;
      }
      
      public function destroy() : void
      {
         if(this.var_239)
         {
            this.var_239.stop(HabboMusicPrioritiesEnum.const_387);
            this.var_239 = null;
         }
         if(this.var_521)
         {
            this.var_521.destroy();
            this.var_521 = null;
         }
         if(this.var_762)
         {
            this.var_762.destroy();
            this.var_762 = null;
         }
         if(this.var_312)
         {
            this.var_312.destroy();
            this.var_312 = null;
         }
         if(this.var_238)
         {
            this.var_238.destroy();
            this.var_238 = null;
         }
         this.var_17.destroy();
         this.var_17 = null;
      }
      
      public function hide() : void
      {
         this.var_17.visible = false;
         if(this._widget != null)
         {
            this._widget.stopUserSong();
         }
      }
      
      public function show() : void
      {
         this.var_239.requestUserSongDisks();
         var _loc1_:IPlayListController = this.var_239.getRoomItemPlaylist();
         if(_loc1_ != null)
         {
            _loc1_.requestPlayList();
            this.selectPlayListStatusViewByFurniPlayListState();
         }
         this.var_17.visible = true;
      }
      
      public function refreshLoadableAsset(param1:String = "") : void
      {
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_945)
         {
            this.assignWindowBitmapByAsset(this.var_953,"music_inventory_splash_image",PlayListEditorWidgetAssetsEnum.const_945);
         }
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_824)
         {
            this.assignWindowBitmapByAsset(this.var_954,"playlist_editor_splash_image",PlayListEditorWidgetAssetsEnum.const_824);
         }
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_484)
         {
            this.var_238.setPreviewPlayingBackgroundImage(this._widget.getImageGalleryAssetBitmap(PlayListEditorWidgetAssetsEnum.const_484));
         }
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_644)
         {
            this.var_238.setGetMoreMusicBackgroundImage(this._widget.getImageGalleryAssetBitmap(PlayListEditorWidgetAssetsEnum.const_644));
         }
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_986)
         {
            this.var_312.addSongsBackgroundImage = this._widget.getImageGalleryAssetBitmap(PlayListEditorWidgetAssetsEnum.const_986);
         }
      }
      
      private function assignWindowBitmapByAsset(param1:IWindowContainer, param2:String, param3:String) : void
      {
         var _loc5_:* = null;
         var _loc4_:IBitmapWrapperWindow = param1.getChildByName(param2) as IBitmapWrapperWindow;
         if(_loc4_ != null)
         {
            _loc5_ = this._widget.getImageGalleryAssetBitmap(param3);
            if(_loc5_ != null)
            {
               _loc4_.bitmap = _loc5_;
               _loc4_.width = _loc5_.width;
               _loc4_.height = _loc5_.height;
            }
         }
      }
      
      private function createWindow() : void
      {
         if(this._widget == null)
         {
            return;
         }
         var _loc1_:XmlAsset = this._widget.assets.getAssetByName("playlisteditor_main_window") as XmlAsset;
         Logger.log("Show window: " + _loc1_);
         this.var_17 = this._widget.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         if(this.var_17 == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this.var_17.position = new Point(80,0);
         var _loc2_:IWindowContainer = this.var_17.getChildByName("content_area") as IWindowContainer;
         if(_loc2_ == null)
         {
            throw new Error("Window is missing \'content_area\' element");
         }
         this.var_953 = _loc2_.getChildByName("my_music_border") as IBorderWindow;
         this.var_954 = _loc2_.getChildByName("playlist_border") as IBorderWindow;
         if(this.var_953 == null)
         {
            throw new Error("Window content area is missing \'my_music_border\' window element");
         }
         if(this.var_954 == null)
         {
            throw new Error("Window content area is missing \'playlist_border\' window element");
         }
         this.var_1767 = this.var_953.getChildByName("music_inventory_scrollbar") as IScrollbarWindow;
         this.var_1768 = this.var_954.getChildByName("playlist_scrollbar") as IScrollbarWindow;
         if(this.var_1767 == null)
         {
            throw new Error("Window content area is missing \'music_inventory_scrollbar\' window element");
         }
         if(this.var_1768 == null)
         {
            throw new Error("Window content area is missing \'playlist_scrollbar\' window element");
         }
         var _loc3_:IWindow = this.var_17.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
         }
      }
      
      private function getMusicInventoryGrid() : IItemGridWindow
      {
         return this.var_953.getChildByName("music_inventory_itemgrid") as IItemGridWindow;
      }
      
      private function getPlayListEditorItemList() : IItemListWindow
      {
         return this.var_954.getChildByName("playlist_editor_itemlist") as IItemListWindow;
      }
      
      private function getMusicInventoryStatusContainer() : IWindowContainer
      {
         return this.var_953.getChildByName("preview_play_container") as IWindowContainer;
      }
      
      private function getPlayListStatusContainer() : IWindowContainer
      {
         return this.var_954.getChildByName("now_playing_container") as IWindowContainer;
      }
      
      private function selectPlayListStatusViewByFurniPlayListState() : void
      {
         var _loc1_:IPlayListController = this.var_239.getRoomItemPlaylist();
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.isPlaying)
         {
            this.var_312.selectView(PlayListStatusView.const_561);
         }
         else if(_loc1_.length > 0)
         {
            this.var_312.selectView(PlayListStatusView.const_1352);
         }
         else
         {
            this.var_312.selectView(PlayListStatusView.const_848);
         }
      }
      
      private function selectMusicStatusViewByMusicState() : void
      {
         if(this.isPreviewPlaying())
         {
            this.var_238.show();
            this.var_238.selectView(MusicInventoryStatusView.const_996);
         }
         else if(this.var_239.getSongDiskInventorySize() <= const_1469)
         {
            this.var_238.show();
            this.var_238.selectView(MusicInventoryStatusView.const_835);
         }
         else
         {
            this.var_238.hide();
         }
      }
      
      private function updatePlaylistEditorView() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc1_:IPlayListController = this.var_239.getRoomItemPlaylist();
         var _loc2_:* = [];
         var _loc3_:int = -1;
         if(_loc1_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc1_.length)
            {
               _loc5_ = _loc1_.getEntry(_loc4_);
               if(_loc5_ != null)
               {
                  _loc2_.push(_loc5_);
               }
               _loc4_++;
            }
            _loc3_ = _loc1_.playPosition;
         }
         this.var_762.refresh(_loc2_,_loc3_);
      }
      
      public function onPlayListUpdated() : void
      {
         var _loc3_:* = null;
         this.updatePlaylistEditorView();
         this.selectPlayListStatusViewByFurniPlayListState();
         var _loc1_:IPlayListController = this.var_239.getRoomItemPlaylist();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:int = _loc1_.nowPlayingSongId;
         if(_loc2_ != -1)
         {
            _loc3_ = this.var_239.getSongInfo(_loc2_);
            this.var_312.nowPlayingTrackName = _loc3_.name;
            this.var_312.nowPlayingAuthorName = _loc3_.creator;
         }
         this.var_1768.visible = _loc1_.length > const_1468;
      }
      
      public function onSongDiskInventoryReceived() : void
      {
         this.var_521.refresh();
         this.selectMusicStatusViewByMusicState();
         this.var_1767.visible = this.var_521.itemCount > const_1470;
      }
      
      public function onNowPlayingChanged(param1:RoomWidgetPlayListEditorNowPlayingEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case RoomWidgetPlayListEditorNowPlayingEvent.const_103:
               this.selectPlayListStatusViewByFurniPlayListState();
               this.var_762.setItemIndexPlaying(param1.position);
               if(param1.id != -1)
               {
                  _loc3_ = this.var_239.getSongInfo(param1.id);
                  this.var_312.nowPlayingTrackName = _loc3_ != null ? _loc3_.name : "";
                  this.var_312.nowPlayingAuthorName = _loc3_ != null ? _loc3_.creator : "";
               }
               break;
            case RoomWidgetPlayListEditorNowPlayingEvent.const_136:
               this.var_521.setPreviewIconToPause();
               _loc2_ = this.var_239.getSongInfo(param1.id);
               this.var_238.songName = _loc2_ != null ? _loc2_.name : "";
               this.var_238.songName = _loc2_ != null ? _loc2_.name : "";
               this.var_238.authorName = _loc2_ != null ? _loc2_.creator : "";
               this.selectMusicStatusViewByMusicState();
               break;
            case RoomWidgetPlayListEditorNowPlayingEvent.const_133:
               this.var_521.setPreviewIconToPlay();
               this.selectMusicStatusViewByMusicState();
         }
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         this.hide();
      }
      
      private function isPreviewPlaying() : Boolean
      {
         return this.var_239.getSongIdPlayingAtPriority(HabboMusicPrioritiesEnum.const_387) != -1;
      }
   }
}
