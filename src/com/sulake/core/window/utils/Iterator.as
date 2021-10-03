package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public class Iterator extends Proxy implements IIterator
   {
      
      private static const const_1446:uint = 0;
      
      private static const const_236:uint = 1;
      
      private static const const_234:uint = 2;
      
      private static const const_237:uint = 3;
      
      private static const const_238:uint = 4;
      
      private static const const_235:uint = 5;
       
      
      private var var_40:WindowController;
      
      private var _type:uint;
      
      public function Iterator(param1:WindowController)
      {
         super();
         this.var_40 = param1;
         if(this.var_40 is ITabContextWindow)
         {
            this._type = Iterator.const_235;
         }
         else if(this.var_40 is IItemGridWindow)
         {
            this._type = Iterator.const_238;
         }
         else if(this.var_40 is IItemListWindow)
         {
            this._type = Iterator.const_237;
         }
         else if(this.var_40 is ISelectorWindow)
         {
            this._type = Iterator.const_234;
         }
         else if(this.var_40 is IWindowContainer)
         {
            this._type = Iterator.const_236;
         }
         else
         {
            this._type = Iterator.const_1446;
         }
      }
      
      public function get length() : uint
      {
         switch(this._type)
         {
            case Iterator.const_235:
               return ITabContextWindow(this.var_40).numTabItems;
            case Iterator.const_234:
               return ISelectorWindow(this.var_40).numSelectables;
            case Iterator.const_237:
               return IItemListWindow(this.var_40).numListItems;
            case Iterator.const_238:
               return IItemGridWindow(this.var_40).numGridItems;
            case Iterator.const_236:
               return IWindowContainer(this.var_40).numChildren;
            default:
               return 0;
         }
      }
      
      public function indexOf(param1:*) : int
      {
         switch(this._type)
         {
            case Iterator.const_235:
               return ITabContextWindow(this.var_40).getTabItemIndex(param1);
            case Iterator.const_234:
               return ISelectorWindow(this.var_40).getSelectableIndex(param1);
            case Iterator.const_237:
               return IItemListWindow(this.var_40).getListItemIndex(param1);
            case Iterator.const_238:
               return IItemGridWindow(this.var_40).getGridItemIndex(param1);
            case Iterator.const_236:
               return IWindowContainer(this.var_40).getChildIndex(param1);
            default:
               return -1;
         }
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         switch(this._type)
         {
            case Iterator.const_235:
               return ITabContextWindow(this.var_40).getTabItemAt(uint(param1));
            case Iterator.const_234:
               return this.var_40.getChildAt(uint(param1));
            case Iterator.const_237:
               return IItemListWindow(this.var_40).getListItemAt(uint(param1));
            case Iterator.const_238:
               return IItemGridWindow(this.var_40).getGridItemAt(uint(param1));
            case Iterator.const_236:
               return IWindowContainer(this.var_40).getChildAt(uint(param1));
            default:
               return null;
         }
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         switch(this._type)
         {
            case Iterator.const_235:
               _loc3_ = param2 as ITabButtonWindow;
               _loc4_ = this.var_40 as ITabContextWindow;
               if(_loc4_.getTabItemIndex(_loc3_) > -1)
               {
                  _loc4_.removeTabItem(_loc3_);
               }
               _loc4_.addTabItemAt(_loc3_,uint(param1));
               break;
            case Iterator.const_234:
               _loc5_ = param2 as ISelectableWindow;
               _loc6_ = this.var_40 as ISelectorWindow;
               if(_loc5_)
               {
                  if(_loc6_.getSelectableIndex(_loc5_) > -1)
                  {
                     _loc6_.removeSelectable(_loc5_);
                  }
                  _loc6_.addSelectableAt(_loc5_,uint(param1));
               }
               else
               {
                  this.var_40.addChildAt(param2,uint(param1));
               }
               break;
            case Iterator.const_237:
               _loc7_ = this.var_40 as IItemListWindow;
               _loc8_ = param2 as IWindow;
               if(_loc7_.getListItemIndex(_loc8_) > -1)
               {
                  _loc7_.removeListItem(_loc8_);
               }
               _loc7_.addListItemAt(_loc8_,uint(param1));
               break;
            case Iterator.const_238:
               _loc9_ = this.var_40 as IItemGridWindow;
               _loc10_ = param2 as IWindow;
               if(_loc9_.getGridItemIndex(_loc10_) > -1)
               {
                  _loc9_.removeGridItem(_loc10_);
               }
               _loc9_.addGridItemAt(_loc10_,uint(param1));
               break;
            case Iterator.const_236:
               _loc11_ = this.var_40 as IWindowContainer;
               _loc12_ = param2 as IWindow;
               if(_loc11_.getChildIndex(_loc12_) > -1)
               {
                  _loc11_.removeChild(_loc12_);
               }
               _loc11_.addChildAt(_loc12_,uint(param1));
         }
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         var _loc2_:* = 0;
         switch(this._type)
         {
            case Iterator.const_235:
               _loc2_ = uint(ITabContextWindow(this.var_40).numTabItems);
               break;
            case Iterator.const_234:
               _loc2_ = uint(ISelectorWindow(this.var_40).numSelectables);
               break;
            case Iterator.const_237:
               _loc2_ = uint(IItemListWindow(this.var_40).numListItems);
               break;
            case Iterator.const_238:
               _loc2_ = uint(IItemGridWindow(this.var_40).numGridItems);
               break;
            case Iterator.const_236:
               _loc2_ = uint(IWindowContainer(this.var_40).numChildren);
         }
         if(param1 < _loc2_)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         switch(this._type)
         {
            case Iterator.const_235:
               return ITabContextWindow(this.var_40).getTabItemAt(uint(param1) - 1);
            case Iterator.const_234:
               return ISelectorWindow(this.var_40).getSelectableAt(uint(param1) - 1);
            case Iterator.const_237:
               return IItemListWindow(this.var_40).getListItemAt(uint(param1) - 1);
            case Iterator.const_238:
               return IItemGridWindow(this.var_40).getGridItemAt(uint(param1) - 1);
            case Iterator.const_236:
               return IWindowContainer(this.var_40).getChildAt(uint(param1) - 1);
            default:
               return null;
         }
      }
   }
}
