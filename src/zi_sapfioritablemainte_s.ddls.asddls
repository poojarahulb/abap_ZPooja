@EndUserText.label: 'SAP Fiori Table Maintenance App using RA'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Semantics.valueRange.maximum: '1'
@ObjectModel.semanticKey: [ 'SingletonID' ]
@UI: {
  headerInfo: {
    typeName: 'SapFioriTableMaiAll'
  }
}
define root view entity ZI_SapFioriTableMainte_S
  as select from I_Language
    left outer join ZSLS_CONFIG_TAB on 0 = 0
  association [0..*] to I_ABAPTransportRequestText as _ABAPTransportRequestText on $projection.TransportRequestID = _ABAPTransportRequestText.TransportRequestID
  composition [0..*] of ZI_SapFioriTableMainte as _SapFioriTableMainte
{
  @UI.facet: [ {
    id: 'SapFioriTableMainte', 
    purpose: #STANDARD, 
    type: #LINEITEM_REFERENCE, 
    label: 'SAP Fiori Table Maintenance App using RA', 
    position: 1 , 
    targetElement: '_SapFioriTableMainte'
  } ]
  @UI.lineItem: [ {
    position: 1 
  } ]
  key 1 as SingletonID,
  _SapFioriTableMainte,
  @UI.hidden: true
  max( ZSLS_CONFIG_TAB.LAST_CHANGED_AT ) as LastChangedAtMax,
  @ObjectModel.text.association: '_ABAPTransportRequestText'
  @UI.identification: [ {
    position: 1 , 
    type: #WITH_INTENT_BASED_NAVIGATION, 
    semanticObjectAction: 'manage'
  } ]
  @Consumption.semanticObject: 'CustomizingTransport'
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  _ABAPTransportRequestText
}
where I_Language.Language = $session.system_language
