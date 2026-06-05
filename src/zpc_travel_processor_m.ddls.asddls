@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CONSUMPTION LAYER FOR TRAVEL PROCESSOR'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZPC_TRAVEL_PROCESSOR_M
  provider contract transactional_query
  as projection on ZPI_TRAVEL_M
{
  key travel_id                 as TravelID,
      @ObjectModel.text.element: [ 'AgencyName' ] //to display both name and id
      agency_id                 as AgencyID,
      _Agency.Name              as AgencyName,

      @ObjectModel.text.element: [ 'CustomerName' ] //to display both name and id
      customer_id               as CustomerID,

      _Customer.LastName        as CustomerName,

      begin_date                as BeginDate,
      end_date                  as EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode' //to display currencycode along with price
      booking_fee               as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode' //to display currencycode along with price
      total_price               as TotalPrice,

      currency_code             as CurrencyCode,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      overall_status            as OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,

      description               as Description,
      last_changed_at           as LastChangedAt,

      /* Associations */
      _Booking : redirected to composition child ZPC_BOOKING_PROCESSOR_M,
      _Agency,
      _Customer,
      _OverallStatus

      /*  Removed all @UI.* annotations (headerInfo, facets, hidden, etc.)

       */
}
