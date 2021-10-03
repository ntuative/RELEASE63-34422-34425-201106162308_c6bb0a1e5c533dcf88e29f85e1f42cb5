package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2100:int = 1;
      
      public static const const_1896:int = 2;
       
      
      private var var_959:String;
      
      private var var_2417:int;
      
      private var var_2418:int;
      
      private var var_2416:int;
      
      private var var_2420:int;
      
      private var var_2414:Boolean;
      
      private var var_2269:Boolean;
      
      private var var_2422:int;
      
      private var var_2421:int;
      
      private var var_2423:Boolean;
      
      private var var_2415:int;
      
      private var var_2419:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_959 = param1.readString();
         this.var_2417 = param1.readInteger();
         this.var_2418 = param1.readInteger();
         this.var_2416 = param1.readInteger();
         this.var_2420 = param1.readInteger();
         this.var_2414 = param1.readBoolean();
         this.var_2269 = param1.readBoolean();
         this.var_2422 = param1.readInteger();
         this.var_2421 = param1.readInteger();
         this.var_2423 = param1.readBoolean();
         this.var_2415 = param1.readInteger();
         this.var_2419 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_959;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2417;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2418;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2416;
      }
      
      public function get responseType() : int
      {
         return this.var_2420;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2414;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2269;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2422;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2421;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2423;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2415;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2419;
      }
   }
}
