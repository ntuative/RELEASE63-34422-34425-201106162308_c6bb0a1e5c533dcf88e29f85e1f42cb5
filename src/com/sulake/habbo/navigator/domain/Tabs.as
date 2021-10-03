package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_374:int = 1;
      
      public static const const_216:int = 2;
      
      public static const const_261:int = 3;
      
      public static const const_342:int = 4;
      
      public static const const_217:int = 5;
      
      public static const const_445:int = 1;
      
      public static const const_766:int = 2;
      
      public static const const_943:int = 3;
      
      public static const const_873:int = 4;
      
      public static const const_264:int = 5;
      
      public static const const_731:int = 6;
      
      public static const const_749:int = 7;
      
      public static const const_257:int = 8;
      
      public static const const_392:int = 9;
      
      public static const const_2162:int = 10;
      
      public static const const_744:int = 11;
      
      public static const const_562:int = 12;
       
      
      private var var_447:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_447 = new Array();
         this.var_447.push(new Tab(this._navigator,const_374,const_562,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_551));
         this.var_447.push(new Tab(this._navigator,const_216,const_445,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_551));
         this.var_447.push(new Tab(this._navigator,const_342,const_744,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1153));
         this.var_447.push(new Tab(this._navigator,const_261,const_264,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_551));
         this.var_447.push(new Tab(this._navigator,const_217,const_257,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_840));
         this.setSelectedTab(const_374);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_342;
      }
      
      public function get tabs() : Array
      {
         return this.var_447;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_447)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_447)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_447)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
