@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CONSUMPTION LAYER FOR BOOKSUPP PROCESSOR'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPC_BOOKSUPPL_PROCESSOR_M
  as projection on ZPI_BOOKSUPPL_M
{
  key travel_id                   as TravelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,

      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,

      currency_code               as CurrencyCode,
      last_changed_at             as LastChangedAt,

      /* Associations */
      _Travel  : redirected to ZPC_TRAVEL_PROCESSOR_M,
      _Booking : redirected to parent ZPC_BOOKING_PROCESSOR_M,
      _Product
}
