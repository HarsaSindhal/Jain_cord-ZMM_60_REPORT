@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PRODUCT f4'
@Search.searchable: true
@ObjectModel.dataCategory: #VALUE_HELP
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//@ObjectModel.resultSet.sizeCategory: #XS
define root view entity ZPRODUCT_GROUP_F4 as select from I_Product as a 
left outer join I_ProductGroupText_2 as b on (b.ProductGroup = a.ProductGroup and b.Language = 'E' )

{
 @ObjectModel.text.element: ['ProductGroup']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
key a.ProductGroup,
 @Search.defaultSearchElement: true 
 @Search.ranking: #LOW 
 @Search.fuzzinessThreshold: 0.8   
 b.ProductGroupName
      
}

group by 
a.ProductGroup,
b.ProductGroupName
