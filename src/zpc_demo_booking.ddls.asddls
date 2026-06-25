@AbapCatalog.sqlViewName: 'ZPC_SQL_DMO_BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOOKING CONSUMPTION'
@Metadata.ignorePropagatedAnnotations: true

define view ZPC_DEMO_BOOKING as select from /dmo/a_booking_d as BOOKING inner join ZPC_DEMO_BP as CUSTOMER on BOOKING.customer_id = CUSTOMER.CustomerId 
{
    key booking_uuid as BookingUuid,
    parent_uuid as ParentUuid,
    booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    booking_status as BookingStatus,
    local_last_changed_at as LocalLastChangedAt
}
