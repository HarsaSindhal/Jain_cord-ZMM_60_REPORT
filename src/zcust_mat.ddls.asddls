@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'I_CustomerMaterial'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCUST_MAT as select from I_CustomerMaterial_2 as A
left outer join I_Customer as b on ( b.Customer = A.Customer )
{
   key A.SalesOrganization ,
   key A.DistributionChannel ,
   key A.Customer ,
   key A.Product ,
   key A.Plant ,
       b.CustomerName ,
    A.MaterialByCustomer ,
    A.MaterialDescriptionByCustomer 
}
