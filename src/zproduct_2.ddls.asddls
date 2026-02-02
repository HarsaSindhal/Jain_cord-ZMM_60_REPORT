@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for MM60 Report'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED 
}
@UI: { headerInfo: { typeName: 'Report', typeNamePlural: 'MM60 Report'  } }
define root view entity ZPRODUCT_2
  as select distinct from ZPRODUCT_1 as A
    left outer join       ZUSER_F4   as B on(
      B.UserID = A.CreatedByUser
    )
{

         @UI.selectionField : [{position: 10}]
         @UI.lineItem   : [{ position: 10 }]
         @EndUserText.label: 'Product'
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZPRODUCT_F4_N', element: 'Product' } }]
  key    A.Product,
         @UI.lineItem   : [{ position: 20 }]
  key    A.ProductDescription,

         @UI.lineItem   : [{ position: 30 }]
  key    A.ProductOldID,

         @UI.selectionField : [{position: 40}]
         @UI.lineItem   : [{ position: 40 }]
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZPLANT_F4', element: 'Plant' } }]
  key    A.Plant, //4

         @UI.lineItem   : [{ position: 41 }]
  key    A.ProfitCenter,

         @UI.lineItem   : [{ position: 50 }]
  key    A.BaseUnit,

         @UI.selectionField : [{position: 30}]
         @UI.lineItem   : [{ position: 60 }]
  key    A.CreationDate,

         @UI.selectionField : [{position: 40}]
         @UI.lineItem   : [{ position: 70 }]
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZUSER_F4', element: 'UserID' } }]
  key    A.CreatedByUser, 

         @UI.lineItem   : [{ position: 80 }]
         @EndUserText.label: 'User Description'
  key    B.UserDescription,

         @UI.selectionField : [{position: 50}]
         @UI.lineItem   : [{ position: 90 }]
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZPRODUCT_F4_N', element: 'ProductType' } }]
  key    A.ProductType_1,

         @UI.lineItem   : [{ position: 100 }]
  key    A.ProductTypeText_1,

         @UI.selectionField : [{position: 60}]
         @UI.lineItem   : [{ position: 110 }]
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZPRODUCT_GROUP_F4', element: 'ProductGroup' } }]
  key    A.ProductGroup,

         @UI.lineItem   : [{ position: 110 }]
  key    A.ProductGroupText,

         @UI.lineItem   : [{ position: 120 }]
         @Semantics.amount.currencyCode: 'Currency'
         //    @Aggregation.default: #SUM
  key    A.MovingAveragePrice,

         @UI.lineItem   : [{ position: 130 }]
         @Semantics.amount.currencyCode: 'Currency'
         //    @Aggregation.default: #SUM
  key    A.StandardPrice,

         @UI.lineItem   : [{ position: 140 }]
  key    A.Currency,

         //    @UI.lineItem   : [{ position: 150 }]
         //    key  A.AllowedPackagingWeightQtyUnit,

         @UI.lineItem   : [{ position: 160 }]
  key    A.AvailabilityCheckType,

         @UI.lineItem   : [{ position: 170 }]
  key    A.MatlCompIsMarkedForBackflush,

         @UI.lineItem   : [{ position: 180 }]
         @EndUserText.label: 'Batch Management'
  key    A.IsInternalBatchManaged,

         @UI.lineItem   : [{ position: 190 }]
  key    A.ConsumptionTaxCtrlCode,

         @UI.lineItem   : [{ position: 200 }]
  key    A.PurchasingGroup,

         @UI.lineItem   : [{ position: 210 }]
  key    A.Division,

         @UI.lineItem   : [{ position: 220 }]
  key    A.TransportationGroup,

         @UI.selectionField : [{position: 70}]
         @UI.lineItem   : [{ position: 230 }]
  key    A.ValuationClass,

         @UI.selectionField : [{position: 80}]
         @UI.lineItem   : [{ position: 240 }]
  key    A.ValuationType,

         @UI.lineItem   : [{ position: 241 }]
         @EndUserText.label: 'Production Location'
  key    A.ProductionInvtryManagedLoc,
         @UI.lineItem   : [{ position: 250 }]
  key    A.ValuationArea,

         @UI.lineItem   : [{ position: 260 }]
  key    A.ItemCategoryGroup,

         @UI.lineItem   : [{ position: 270 }]
  key    A.LoadingGroup,

         @UI.lineItem   : [{ position: 280 }]
  key    A.LotSizingProcedure,

         @UI.lineItem   : [{ position: 290 }]
  key    A.IsMarkedForDeletion,

         //    @UI.lineItem   : [{ position: 280 }]
         //    key  A.ProductGroupText,

         @UI.selectionField : [{position: 90}]
         @UI.lineItem   : [{ position: 300 }]
         @EndUserText.label: 'Customer Part Number'
  key    A.ProductManufacturerNumber,

         @UI.lineItem   : [{ position: 310 }]
  key    A.MRPController,
         @UI.lineItem   : [{ position: 311 }]
         @EndUserText.label: 'Quality Active'
  key    A.IsActiveEntity,

         //    @UI.lineItem   : [{ position: 320 }]
         //    key  A.MRPGroup,

         @UI.lineItem   : [{ position: 330 }]
  key    A.MRPType,

         @UI.lineItem   : [{ position: 340 }]
  key    A.PriceDeterminationControl,

         @UI.lineItem   : [{ position: 341 }]
  key    A.InventoryValnProcedure,

         @UI.lineItem   : [{ position: 342 }]
  key    A.ValuationCategory,

         @UI.lineItem   : [{ position: 350 }]
  key    A.OverDelivToleranceLimit,

         @UI.lineItem   : [{ position: 360 }]
         //    @Aggregation.default: #SUM
  key    A.PriceUnitQty,

         @UI.lineItem   : [{ position: 370 }]
  key    A.ProcurementType,

         @UI.lineItem   : [{ position: 380 }]
  key    A.ProductIsLocked,

         //    @UI.lineItem   : [{ position: 390 }]
         //    key  A.SpecialProcurementType,

         @UI.lineItem   : [{ position: 400 }]
  key    A.UnderDelivToleranceLimit,

         @UI.lineItem   : [{ position: 410 }]
  key    A.Weight,


         @UI.lineItem   : [{ position: 420 }]
         @EndUserText.label: 'Production Scheduling Profile'
         A.ProductionSchedulingProfile,

         @UI.lineItem   : [{ position: 430 }]
         @EndUserText.label: 'Pitch'
         @UI.selectionField: [{ position: 40 }]
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZExtProdGrpF4', element: 'ExternalProductGroup' } }]
         A.ExternalProductGroup,

         @UI.lineItem: [{ position: 431 }]
         @EndUserText.label: 'Pitch Name'
         A.ExternalProductGroupName,

         //    @UI.lineItem   : [{ position: 440 }]
         @EndUserText.label: 'Customer Code'
         A.Customer,

         //    @UI.lineItem   : [{ position: 450 }]
         @EndUserText.label: 'Customer Name'
         A.CustomerName,
         @EndUserText.label: 'Customer Reference'
         A.MaterialByCustomer,
         @EndUserText.label: 'Customer Reference Des.'
         A.MaterialDescriptionByCustomer,
         @EndUserText.label: 'SizeOrDimensionText'
         A.SizeOrDimensionText


}
