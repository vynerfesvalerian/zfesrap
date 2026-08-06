@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZFESRAP_BOOK'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_FESRAP_BOOK
  provider contract transactional_query
  as projection on ZR_FESRAP_BOOK
  association [1..1] to ZR_FESRAP_BOOK as _BaseEntity on $projection.BookID = _BaseEntity.BookID
{
  key BookID,
  Name,
  Author,
  BookCount,
  PublishDate,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.lastChangedBy: true
  }
  ChangedBy,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  ChangedOn,
  _BaseEntity
}
