package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferData;
   
   public class HabboExtendClubOfferMessageParser implements IMessageParser
   {
       
      
      private var var_103:ClubOfferData;
      
      private var var_1499:int;
      
      public function HabboExtendClubOfferMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_103 = null;
         this.var_1499 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_103 = new ClubOfferData(param1);
         this.var_1499 = param1.readInteger();
         return true;
      }
      
      public function offer() : ClubOfferData
      {
         return this.var_103;
      }
      
      public function pageId() : int
      {
         return this.var_1499;
      }
   }
}
