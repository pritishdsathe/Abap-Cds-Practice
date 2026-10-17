@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item Consumption'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_SALESORDERITEM_OV as select from ZI_SALESORDERITEM_OV
{   

    @UI.lineItem: [{ position: 10 }]
    @UI.selectionField: [{ position: 10 }]
    @Search.defaultSearchElement: true
    key SalesDocument,
    @UI.lineItem: [{ position: 20 }]
    key SalesDocumentItem,
    @UI.lineItem: [{ position: 30 }]
    @UI.selectionField: [{ position:20 }]
    SoldToParty,
    @UI.lineItem: [{ position: 40 }]
    CustomerName,
    @UI.lineItem: [{ position: 50 }]
    @Search.defaultSearchElement: true
    Material,
    @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
    @UI.lineItem: [{ position: 60 }]
    OrderQuantity,
    OrderQuantityUnit,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    @UI.lineItem: [{ position: 70 }]
    NetAmount,
    TransactionCurrency,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    @UI.lineItem: [{ position: 80 }]
    UnitPrice,
    /* Associations */
    _Customer,
    @EndUserText.label: 'City'
    _Customer.CityName as City,
    @EndUserText.label: 'Country'
    _Customer.Country as Country
};
