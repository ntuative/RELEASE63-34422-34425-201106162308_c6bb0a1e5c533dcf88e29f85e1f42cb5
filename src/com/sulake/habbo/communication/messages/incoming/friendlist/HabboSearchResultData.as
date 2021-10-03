package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2260:int;
      
      private var var_1692:String;
      
      private var var_2241:String;
      
      private var var_2540:Boolean;
      
      private var var_2537:Boolean;
      
      private var var_2539:int;
      
      private var var_2240:String;
      
      private var var_2538:String;
      
      private var var_1693:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2260 = param1.readInteger();
         this.var_1692 = param1.readString();
         this.var_2241 = param1.readString();
         this.var_2540 = param1.readBoolean();
         this.var_2537 = param1.readBoolean();
         param1.readString();
         this.var_2539 = param1.readInteger();
         this.var_2240 = param1.readString();
         this.var_2538 = param1.readString();
         this.var_1693 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2260;
      }
      
      public function get avatarName() : String
      {
         return this.var_1692;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2241;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2540;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2537;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2539;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2240;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2538;
      }
      
      public function get realName() : String
      {
         return this.var_1693;
      }
   }
}
