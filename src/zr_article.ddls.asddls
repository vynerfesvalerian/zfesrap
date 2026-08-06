@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View (root) for Article'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_ARTICLE
  as select from zdt_article
  association [0..1] to I_Currency      as _Currency      on $projection.CurrencyCode = _Currency.Currency
  association [0..1] to I_UnitOfMeasure as _UnitOfMeasure on $projection.UnitOfMeasure = _UnitOfMeasure.UnitOfMeasure
{
  key id              as Id,
      name            as Name,
      description     as Description,
      currency_code   as CurrencyCode,
      unit_of_measure as UnitOfMeasure,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      unit_price      as UnitPrice,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      quantity        as Quantity,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      changed_by      as ChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_on      as ChangedOn,
      _Currency,
      _UnitOfMeasure
}
