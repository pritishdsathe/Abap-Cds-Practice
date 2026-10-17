@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item Consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_SALESORDERITEM_OV as select from ZI_SALESORDERITEM_OV
{   
    key SalesDocument,
    key SalesDocumentItem,
    SoldToParty,
    CustomerName,
    Material,
    @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
    OrderQuantity,
    OrderQuantityUnit,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    NetAmount,
    TransactionCurrency,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    UnitPrice,
    /* Associations */
    _Customer,
    @EndUserText.label: 'City'
    _Customer.CityName as City,
    @EndUserText.label: 'Country'
    _Customer.Country as Country
};
