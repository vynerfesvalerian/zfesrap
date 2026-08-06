@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZFESRAP_BOOK'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_FESRAP_BOOK
  as select from zfesrap_book
{
  key book_id as BookID,
  name as Name,
  author as Author,
  book_count as BookCount,
  publish_date as PublishDate,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  changed_by as ChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  changed_on as ChangedOn
}
