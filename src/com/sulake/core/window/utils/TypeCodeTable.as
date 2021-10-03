package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_890;
         param1["badge"] = const_830;
         param1["bitmap"] = const_431;
         param1["border"] = const_745;
         param1["border_notify"] = const_1820;
         param1["bubble"] = const_782;
         param1["bubble_pointer_up"] = const_1255;
         param1["bubble_pointer_right"] = const_1312;
         param1["bubble_pointer_down"] = const_1297;
         param1["bubble_pointer_left"] = const_1344;
         param1["button"] = const_491;
         param1["button_thick"] = const_761;
         param1["button_icon"] = const_1769;
         param1["button_group_left"] = const_896;
         param1["button_group_center"] = const_752;
         param1["button_group_right"] = const_928;
         param1["canvas"] = const_865;
         param1["checkbox"] = const_785;
         param1["closebutton"] = const_1252;
         param1["container"] = const_404;
         param1["container_button"] = const_957;
         param1["display_object_wrapper"] = const_1017;
         param1["dropmenu"] = const_647;
         param1["dropmenu_item"] = const_557;
         param1["frame"] = const_409;
         param1["frame_notify"] = const_1913;
         param1["header"] = const_969;
         param1["html"] = const_1338;
         param1["icon"] = const_1293;
         param1["itemgrid"] = const_1166;
         param1["itemgrid_horizontal"] = const_649;
         param1["itemgrid_vertical"] = const_834;
         param1["itemlist"] = WINDOW_TYPE_ITEMLIST;
         param1["itemlist_horizontal"] = const_420;
         param1["itemlist_vertical"] = const_437;
         param1["label"] = const_909;
         param1["maximizebox"] = const_1832;
         param1["menu"] = const_1766;
         param1["menu_item"] = const_1983;
         param1["submenu"] = const_1281;
         param1["minimizebox"] = const_1739;
         param1["notify"] = const_1881;
         param1["com.sulake.habbo.session.furniture"] = const_994;
         param1["password"] = const_877;
         param1["radiobutton"] = const_934;
         param1["region"] = const_362;
         param1["restorebox"] = const_1939;
         param1["scaler"] = const_617;
         param1["scaler_horizontal"] = const_1714;
         param1["scaler_vertical"] = const_1968;
         param1["scrollbar_horizontal"] = const_525;
         param1["scrollbar_vertical"] = const_937;
         param1["scrollbar_slider_button_up"] = const_1273;
         param1["scrollbar_slider_button_down"] = const_1239;
         param1["scrollbar_slider_button_left"] = const_1388;
         param1["scrollbar_slider_button_right"] = const_1292;
         param1["scrollbar_slider_bar_horizontal"] = const_1366;
         param1["scrollbar_slider_bar_vertical"] = const_1259;
         param1["scrollbar_slider_track_horizontal"] = const_1291;
         param1["scrollbar_slider_track_vertical"] = const_1225;
         param1["scrollable_itemlist"] = const_1938;
         param1["scrollable_itemlist_vertical"] = const_488;
         param1["scrollable_itemlist_horizontal"] = const_1377;
         param1["selector"] = const_825;
         param1["selector_list"] = const_876;
         param1["submenu"] = const_1281;
         param1["tab_button"] = const_806;
         param1["tab_container_button"] = const_1210;
         param1["tab_context"] = const_443;
         param1["tab_content"] = const_1165;
         param1["tab_selector"] = const_902;
         param1["text"] = const_786;
         param1["input"] = const_754;
         param1["toolbar"] = const_1855;
         param1["tooltip"] = const_405;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
