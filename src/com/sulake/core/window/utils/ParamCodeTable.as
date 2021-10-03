package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["com.sulake.habbo.session.furniture"] = const_189;
         param1["bound_to_parent_rect"] = const_104;
         param1["child_window"] = const_1308;
         param1["embedded_controller"] = const_1182;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_750;
         param1["mouse_dragging_target"] = const_297;
         param1["mouse_dragging_trigger"] = const_402;
         param1["mouse_scaling_target"] = const_324;
         param1["mouse_scaling_trigger"] = const_515;
         param1["horizontal_mouse_scaling_trigger"] = const_271;
         param1["vertical_mouse_scaling_trigger"] = const_254;
         param1["observe_parent_input_events"] = const_1223;
         param1["optimize_region_to_layout_size"] = const_508;
         param1["parent_window"] = const_1318;
         param1["relative_horizontal_scale_center"] = const_232;
         param1["relative_horizontal_scale_fixed"] = const_156;
         param1["relative_horizontal_scale_move"] = const_393;
         param1["relative_horizontal_scale_strech"] = const_446;
         param1["relative_scale_center"] = const_1349;
         param1["relative_scale_fixed"] = const_920;
         param1["relative_scale_move"] = const_1294;
         param1["relative_scale_strech"] = const_1222;
         param1["relative_vertical_scale_center"] = const_214;
         param1["relative_vertical_scale_fixed"] = const_169;
         param1["relative_vertical_scale_move"] = const_255;
         param1["relative_vertical_scale_strech"] = const_358;
         param1["on_resize_align_left"] = const_922;
         param1["on_resize_align_right"] = const_524;
         param1["on_resize_align_center"] = const_553;
         param1["on_resize_align_top"] = const_951;
         param1["on_resize_align_bottom"] = const_613;
         param1["on_resize_align_middle"] = const_628;
         param1["on_accommodate_align_left"] = const_1274;
         param1["on_accommodate_align_right"] = const_618;
         param1["on_accommodate_align_center"] = const_967;
         param1["on_accommodate_align_top"] = const_1375;
         param1["on_accommodate_align_bottom"] = const_506;
         param1["on_accommodate_align_middle"] = const_993;
         param1["route_input_events_to_parent"] = const_563;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1296;
         param1["scalable_with_mouse"] = const_1368;
         param1["reflect_horizontal_resize_to_parent"] = const_532;
         param1["reflect_vertical_resize_to_parent"] = const_495;
         param1["reflect_resize_to_parent"] = const_371;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1265;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
