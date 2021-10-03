package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1722:String = "pricing_model_unknown";
      
      public static const const_448:String = "pricing_model_single";
      
      public static const const_451:String = "pricing_model_multi";
      
      public static const const_546:String = "pricing_model_bundle";
      
      public static const const_1900:String = "price_type_none";
      
      public static const const_738:String = "price_type_credits";
      
      public static const const_1331:String = "price_type_activitypoints";
      
      public static const const_1347:String = "price_type_credits_and_activitypoints";
       
      
      private var var_857:String;
      
      private var var_1322:String;
      
      private var var_1236:int;
      
      private var var_2066:String;
      
      private var var_1321:int;
      
      private var var_1323:int;
      
      private var var_2067:int;
      
      private var var_371:ICatalogPage;
      
      private var var_695:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_2101:int = 0;
      
      private var var_2841:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1236 = param1;
         this.var_2066 = param2;
         this.var_1321 = param3;
         this.var_1323 = param4;
         this.var_2067 = param5;
         this.var_371 = param8;
         this.var_2101 = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this.var_2101;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_371;
      }
      
      public function get offerId() : int
      {
         return this.var_1236;
      }
      
      public function get localizationId() : String
      {
         return this.var_2066;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1321;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1323;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2067;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_695;
      }
      
      public function get pricingModel() : String
      {
         return this.var_857;
      }
      
      public function get priceType() : String
      {
         return this.var_1322;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2841;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2841 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1236 = 0;
         this.var_2066 = "";
         this.var_1321 = 0;
         this.var_1323 = 0;
         this.var_2067 = 0;
         this.var_371 = null;
         if(this.var_695 != null)
         {
            this.var_695.dispose();
            this.var_695 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_857)
         {
            case const_448:
               this.var_695 = new SingleProductContainer(this,param1);
               break;
            case const_451:
               this.var_695 = new MultiProductContainer(this,param1);
               break;
            case const_546:
               this.var_695 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_857);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_857 = const_448;
            }
            else
            {
               this.var_857 = const_451;
            }
         }
         else if(param1.length > 1)
         {
            this.var_857 = const_546;
         }
         else
         {
            this.var_857 = const_1722;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1321 > 0 && this.var_1323 > 0)
         {
            this.var_1322 = const_1347;
         }
         else if(this.var_1321 > 0)
         {
            this.var_1322 = const_738;
         }
         else if(this.var_1323 > 0)
         {
            this.var_1322 = const_1331;
         }
         else
         {
            this.var_1322 = const_1900;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_371.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_695.products)
         {
            _loc4_ = this.var_371.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
