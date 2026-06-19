@EndUserText.label: 'SAP Fiori Table Maintenance App using RA'
@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
define view entity ZI_SapFioriTableMainte
  as select from ZSLS_CONFIG_TAB
  association to parent ZI_SapFioriTableMainte_S as _SapFioriTableMaiAll on $projection.SingletonID = _SapFioriTableMaiAll.SingletonID
{
  key CONFIG_ID as ConfigId,
  DESCRIPTION as Description,
  CONFIG_ACTIVE as ConfigActive,
  @Semantics.user.createdBy: true
  LOCAL_CREATED_BY as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  LOCAL_CREATED_AT as LocalCreatedAt,
  @Semantics.user.lastChangedBy: true
  LOCAL_LAST_CHANGED_BY as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  @Consumption.hidden: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Consumption.hidden: true
  1 as SingletonID,
  _SapFioriTableMaiAll
}
