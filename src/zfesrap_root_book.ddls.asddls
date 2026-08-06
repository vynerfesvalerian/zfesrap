@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root entity for books'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZFESRAP_ROOT_BOOK as select from zfesrap_book
{

  key book_id as ID,
  name         as Name,
  author       as Author,
  publish_date as PublishDate,
  book_count   as BookCount,
  @Semantics.user.createdBy: true
  created_by   as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at   as CreatedAt,
  @Semantics.user.lastChangedBy: true
  changed_by   as ChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  changed_on   as ChangedOn
    
}
