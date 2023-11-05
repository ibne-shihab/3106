use Sayeeda_Khan


create table CustomersAndSuppliers(
	customer_supplier_ID varchar(20),
	Customer_name varchar(50),
	sold_amount decimal(10,2) default 0.00,
	proc_amount decimal(10,2) default 0.00,
	primary key (customer_supplier_ID))


create table transactions(
	transaction_ID varchar(10),
	customer_supplier_ID varchar(20),
	transaction_type varchar(15),
	amount decimal(10,2),
	transaction_date date,
	foreign key(customer_supplier_ID) references CustomersAndSuppliers(customer_supplier_ID))


CREATE TRIGGER trg_update_customers_suppliers
ON transactions -- Use square brackets to specify the table name
AFTER INSERT
AS
BEGIN
    -- Update the sold_amount or proc_amount based on the transaction type
    UPDATE cs
    SET sold_amount = CASE
                WHEN i.transaction_type = 'Sale' THEN cs.sold_amount + i.amount
                ELSE cs.sold_amount
              END,
        proc_amount = CASE
                WHEN i.transaction_type = 'Purchase' THEN cs.proc_amount + i.amount
                ELSE cs.proc_amount
              END
    FROM CustomersAndSuppliers cs
    JOIN INSERTED i ON cs.customer_supplier_ID = i.customer_supplier_ID;
END;



INSERT INTO transactions (transaction_ID, customer_supplier_ID, transaction_type, amount, transaction_date)
VALUES
    ('1', 'ABC123', 'Sale', 100.00, '2023-10-01'),
    ('2', 'DEF456', 'Purchase', 50.00, '2023-10-02')





-- Create a trigger to update the CustomersAndSuppliers table
-- when a transaction is inserted
/*create trigger trgr_update_customers_suppliers

on transactions
after insert
as
begin
	update CustomersAndSuppliers
	set sold_amount=case
			when transactions.transaction_type= n'Sale'
			then CustomersAndSuppliers.sold_amount+transactions.amount
			else CustomersAndSuppliers.sold_amount
			end
		proc_amount=case
		when transactions.transaction_type= n'Purchase'
			then CustomersAndSuppliers.sold_amount+transactions.amount
			else CustomersAndSuppliers.sold_amount
			end
		from CustomersAndSuppliers */

-- Create a trigger to update the CustomersAndSuppliers table
-- when a transaction is inserted
-- Create a trigger to update the CustomersAndSuppliers table
-- when a transaction is inserted

