@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View (root) for Article'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_ARTICLE
  provider contract transactional_query
  as projection on ZR_ARTICLE
  association [1..1] to ZR_ARTICLE as _BaseEntity on $projection.Id = _BaseEntity.Id
{
  key Id,
      Name,
      Description,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
      CurrencyCode,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_UnitOfMeasure', element: 'UnitOfMeasure' } }]
      UnitOfMeasure,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      UnitPrice,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Quantity,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Amount,
      @Semantics.user.createdBy: true
      CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      CreatedAt,
      @Semantics.user.lastChangedBy: true
      ChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      ChangedOn,
      /* Associations */
      _Currency,
      _UnitOfMeasure,
      _BaseEntity
}
