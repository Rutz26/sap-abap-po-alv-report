REPORT  ZPO_REPORT.

TABLES: ekko, ekpo.

TYPE-POOLS: slis.

DATA: it_final TYPE TABLE OF ekko,
      wa_final TYPE ekko.

SELECT * FROM ekko into TABLE it_final UP TO 100 rows.

*ALV declerations
DATA: fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv.

*Build fieldcat
wa_fieldcat-fieldname = 'EBELN'. "Purchase order no
wa_fieldcat-seltext_m = 'Company Code'.
APPEND wa_fieldcat to fieldcat.

wa_fieldcat-fieldname = 'BUKRS'. "PO type
wa_fieldcat-seltext_m = 'PO Type'.
APPEND wa_fieldcat to fieldcat.

wa_fieldcat-fieldname = 'AEDAT'. "Date
wa_fieldcat-seltext_m = 'Created On'.
APPEND wa_fieldcat to fieldcat.

*Call ALV
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
EXPORTING
  it_fieldcat = fieldcat
  TABLES
    t_outtab = it_final.