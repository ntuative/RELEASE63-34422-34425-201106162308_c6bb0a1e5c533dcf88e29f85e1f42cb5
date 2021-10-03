package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_412:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1174:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1214:String = "RWOCM_PIXELS";
      
      public static const const_1334:String = "RWOCM_CREDITS";
      
      public static const const_1193:String = "RWOCM_SHELLS";
       
      
      private var var_2676:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_412);
         this.var_2676 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2676;
      }
   }
}
