SELECT 
    CustKey as customer_key,
    TIMESTAMP(DateKey) as LoadDate,
    "AMZ" as RecordSource,
    DATE(Invoice_Date) as invoice_date,
    Invoice_Number as invoice_number,
    ROW_NUMBER() OVER ( PARTITION BY CustKey, Invoice_Number ) as line_item,
    Item_Number as item_number,
    Item as item_name,
    List_Price as item_price,
    Sales_Quantity as quantity,
    Discount_Amount as discount



FROM 
    {{ source('townhall_3','salesdata') }}
Where Item_Number != 0
