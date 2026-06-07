@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'TRAVEL ANALYTICAL ENTITY DATA DEFINITION'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

define view entity ZPI_TRAVEL_M_ANA
  as select from ZPI_TRAVEL_M

{
      /*DIMENSIONS*/
  key agency_id        as AgencyID,
  key currency_code    as CurrencyCode,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(total_price) as TotalPrice
}

//where currency_code = USD
group by agency_id,
         currency_code
