@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds for YY1_PRODUCT_1'
@Analytics.dataCategory: #CUBE
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED 
}
define view entity ZPRODUCT_1 as select from I_ProductPlantBasic as A
left outer join I_ProdPlntInptAssistant as B on (B.Plant = A.Plant and B.Product = A.Product)
left outer join I_Product as C on (C.Product = A.Product)
left outer join I_ProductSales as D on (D.Product = A.Product)
left outer join I_Productplantsales as D2 on (D2.Product = A.Product and D2.Plant = A.Plant)
left outer join I_Productplantqtmanagement as PQ on (PQ.Product = A.Product and PQ.Plant = A.Plant)
left outer join I_ProductDescription as E on (E.Product = A.Product and E.Language = 'E')
left outer join I_ProductPlantIntlTrd as F on (F.Product = A.Product and F.Plant = A.Plant)
left outer join I_ProductSupplyPlanning as G on (G.Product = A.Product and G.Plant = A.Plant)
left outer join I_ProductValuationBasic as H on (H.Product = A.Product and H.ValuationArea = A.Plant)  //
left outer join I_ProductTypeText_2 as j on (j.ProductType = B.ProductType and j.Language = 'E')
left outer join I_ProductGroupText_2 as k on (k.ProductGroup = B.ProductGroup and k.Language = 'E')
left outer join I_ProductWorkScheduling as l on (l.Product = A.Product and l.Plant = A.Plant)
left outer join ZCUST_MAT as Z on (Z.Product = A.Product and Z.Plant = A.Plant )
left outer join I_ExtProdGrpText             as ext  on  ext.ExternalProductGroup = C.ExternalProductGroup
                                                         and ext.Language             = 'E'
{
  key A.Product,
  key A.Plant,
      A.ProfitCenter, //
      C.ExternalProductGroup , 
      ext.ExternalProductGroupName ,
      C.CreationDate,
      C.CreatedByUser,
      E.ProductDescription,
      A.BaseUnit                      as BaseUnit_1,
      C.ProductOldID,
      C.Division,
      C.ItemCategoryGroup,
      A.IsBatchManagementRequired     as IsInternalBatchManaged,
      D.TransportationGroup,
      A.PurchasingGroup               as PurchasingGroup_1,
      B.ProductGroup,
      k.ProductGroupText,
      F.ConsumptionTaxCtrlCode,
      B.MRPController,
      B.MRPType,
      B.LotSizingProcedure,
      A.ProcurementType,
      G.MatlCompIsMarkedForBackflush,
      G.PlanningStrategyGroup,
      A.AvailabilityCheckType,
      A.UnderDelivToleranceLimit,
      A.OverDelivToleranceLimit,
      A.ProductionInvtryManagedLoc,
      B.MRPGroup,
      C.IsMarkedForDeletion,
      H.ValuationArea,
      C.ProductManufacturerNumber,
      H.ValuationType,
      H.ValuationClass,
      H.ValuationCategory,
      @Semantics.amount.currencyCode: 'Currency'
      H.StandardPrice,
      @Semantics.amount.currencyCode: 'Currency'
      H.MovingAveragePrice,
      H.PriceUnitQty,
      H.Currency,
      H.PriceDeterminationControl,
      H.InventoryValuationProcedure,
      C.WeightUnit,
      A.PurchasingGroup,
      D.AllowedPackagingWeightQtyUnit,
      C.BaseUnit,
      D2.LoadingGroup,
      A.Plant                         as Plant_1,
      C.ItemCategoryGroup             as ItemCategoryGroup_1,
      C.ItemCategoryGroup             as ItemCategoryGroup_2,
      C.Division                      as Division_1,
      B.ProductType                   as ProductType_1,
      j.ProductTypeName               as ProductTypeText_1,
      B.ProductGroup                  as ProductGroup_1,
      k.ProductGroupText              as ProductGroupText_1,
      B.BaseUnit                      as BaseUnit_2,
      C.WeightUnit                    as WeightUnit_1,
      D.AllowedPackagingWeightQtyUnit as AllowedPackagingWeightQtyUn_1,
      B.BaseUnit                      as BaseUnit_3,
      E.ProductDescription            as ProductDescription_1,
      C.ProductIsLocked,
      A.SpecialProcurementType,
      A.Plant                         as Plant_2,
      A.Plant                         as Plant_3,
      C.ItemCategoryGroup             as ItemCategoryGroup_5,
      //    C.ItemCategoryGroup as ItemCategoryGroupText,
      C.Division                      as Division_3,
      //    C.Division as DivisionText,
      A.PurchasingGroup               as PurchasingGroup_2,
      B.ProductType                   as ProductType_2,
      j.ProductTypeName               as ProductTypeText_2,
      B.ProductGroup                  as ProductGroup_3,
      k.ProductGroupText              as ProductGroupText_3,
      B.BaseUnit                      as BaseUnitOfMeasure_1,
      C.WeightUnit                    as WeightUnitValueHelp,
      //    C.WeightUnit as WeightUnitText
      C.WeightUnit                    as Weight,
      //    C.WeightUnit as WeightText
      //H.InventoryValuationType
      H.ValuationClass                as ValuationClass_2,
      H.InventoryValuationProcedure   as InventoryValnProcedure,
      D.TransportationGroup           as TransportationGroup_1,

      C.TransportationGroup           as TransportationGroup_2,
      C.BaseUnit                      as BaseUnitOfMeasure,
      A.BaseUnit                      as BaseUnitOfMeasure_2,
      B.ProductType                   as ProductType_3,
      j.ProductTypeName               as ProductTypeText_3,
      C.Division                      as Division_2,
      C.ItemCategoryGroup             as ItemCategoryGroup_3,
      A.PurchasingGroup               as PurchasingGroup_3,
      B.ProductGroup                  as ProductGroup_2,
      k.ProductGroupText              as ProductGroupText_2,
      C.WeightUnit                    as WeightUnitValueHelp_1,
      C.WeightUnit                    as Weight_1,
      B.BaseUnit                      as BaseUnitOfMeasure_3,
      //    B.BaseUnit as BaseUnitOfMeasureText,
      C.ItemCategoryGroup             as ItemCategoryGroup_4,
      l.ProductionSchedulingProfile,

      D.LoadingGroup                  as LOADINGGROUP_1 ,
      
      Z.SalesOrganization,
      Z.DistributionChannel,
      Z.Customer,
      Z.CustomerName,  
      Z.MaterialByCustomer,
      Z.MaterialDescriptionByCustomer ,
      case when PQ.ProductPlantHasInspectionSetup = 'X'
       then 'YES' else 'NO' end as IsActiveEntity,
       C.SizeOrDimensionText

}
