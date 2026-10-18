@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item Overview'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_SALESORDERITEM_OV 
as select from I_SalesDocumentItem
association [0..1] to I_Customer as _Customer
on $projection.SoldToParty = _Customer.Customer
{
    _Customer,
    _ProductText,
    key SalesDocument,
    key SalesDocumentItem,
    SoldToParty,
    _Customer.CustomerName as CustomerName,
    Product,
    Material,
    _ProductText[1: Language = $session.system_language ].ProductName as MaterialName,
    @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
    OrderQuantity,
    OrderQuantityUnit,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    NetAmount,
    TransactionCurrency,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    cast(case
    when OrderQuantity = 0
    then
    cast(0 as abap.dec( 15, 2))
    else
    cast(NetAmount as abap.dec( 15, 2 )) / cast(OrderQuantity as abap.dec( 13, 3 ))
    end as abap.curr( 15, 2 )) as UnitPrice
};
