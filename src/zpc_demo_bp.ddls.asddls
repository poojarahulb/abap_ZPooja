@AbapCatalog.sqlViewName: 'ZPC_SQL_DEMO_BP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BUSINESS PARTNER CONSUMPTION'
@Metadata.ignorePropagatedAnnotations: true
define view ZPC_DEMO_BP as select from /dmo/customer
{
key customer_id as CustomerId,
first_name as FirstName,
last_name as LastName,
title as Title,
street as Street,
postal_code as PostalCode,
city as City,
country_code as CountryCode,
phone_number as PhoneNumber,
email_address as EmailAddress
}
