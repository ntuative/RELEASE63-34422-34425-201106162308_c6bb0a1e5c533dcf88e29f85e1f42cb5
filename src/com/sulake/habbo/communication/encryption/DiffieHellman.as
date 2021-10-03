package com.sulake.habbo.communication.encryption
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_960:BigInteger;
      
      private var var_2365:BigInteger;
      
      private var var_1748:BigInteger;
      
      private var var_2366:BigInteger;
      
      private var var_1441:BigInteger;
      
      private var var_1747:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1441 = param1;
         this.var_1747 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1441.toString() + ",generator: " + this.var_1747.toString() + ",secret: " + param1);
         this.var_960 = new BigInteger();
         this.var_960.fromRadix(param1,param2);
         this.var_2365 = this.var_1747.modPow(this.var_960,this.var_1441);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1748 = new BigInteger();
         this.var_1748.fromRadix(param1,param2);
         this.var_2366 = this.var_1748.modPow(this.var_960,this.var_1441);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2365.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2366.toRadix(param1);
      }
   }
}
