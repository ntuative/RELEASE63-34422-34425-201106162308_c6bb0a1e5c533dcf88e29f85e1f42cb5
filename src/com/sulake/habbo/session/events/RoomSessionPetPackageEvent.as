package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetPackageEvent extends RoomSessionEvent
   {
      
      public static const const_533:String = "RSOPPE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const const_669:String = "RSOPPE_OPEN_PET_PACKAGE_RESULT";
       
      
      private var var_233:int = -1;
      
      private var var_1212:int = -1;
      
      private var var_1808:int = -1;
      
      private var _color:String = "";
      
      private var var_1932:int = 0;
      
      private var var_1796:String = null;
      
      public function RoomSessionPetPackageEvent(param1:String, param2:IRoomSession, param3:int, param4:int, param5:int, param6:String, param7:int, param8:String, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param2,param9,param10);
         this.var_233 = param3;
         this.var_1212 = param4;
         this.var_1808 = param5;
         this._color = param6;
         this.var_1932 = param7;
         this.var_1796 = param8;
      }
      
      public function get objectId() : int
      {
         return this.var_233;
      }
      
      public function get petType() : int
      {
         return this.var_1212;
      }
      
      public function get breed() : int
      {
         return this.var_1808;
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1932;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1796;
      }
   }
}
