package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1865:int;
      
      private var var_2427:String;
      
      private var var_1866:String;
      
      private var _index:int;
      
      private var _category:FaqCategory;
      
      private var var_2426:Boolean = false;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         this.var_1865 = param1;
         this.var_2427 = param2;
         this._index = param3;
         this._category = param4;
      }
      
      public function get questionId() : int
      {
         return this.var_1865;
      }
      
      public function get questionText() : String
      {
         return this.var_2427;
      }
      
      public function get answerText() : String
      {
         return this.var_1866;
      }
      
      public function get hasAnswer() : Boolean
      {
         return this.var_2426;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get category() : FaqCategory
      {
         return this._category;
      }
      
      public function set answerText(param1:String) : void
      {
         this.var_1866 = param1;
         this.var_2426 = true;
      }
   }
}
