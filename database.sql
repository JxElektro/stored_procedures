// Create a table called item with the following columns: id, name, description, price, and quantity

CREATE TABLE item (
  id serial PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price NUMERIC(10,2) NOT NULL
);

insert into item (name, description, price) values 
('Chocolate Cake', 'Chocolate cake with chocolate frosting', 5.00),
('Vanilla Cake', 'Vanilla cake with vanilla frosting', 5.00),
('Strawberry Cake', 'Strawberry cake with strawberry frosting', 5.00),
('Lemon Cake', 'Lemon cake with lemon frosting', 5.00),
('Carrot Cake', 'Carrot cake with cream cheese frosting', 5.00),
('Red Velvet Cake', 'Red velvet cake with cream cheese frosting', 5.00),
('Pumpkin Cake', 'Pumpkin cake with cream cheese frosting', 5.00),
('Cupcake', 'Vanilla cupcake with vanilla frosting', 2.00),
('Muffin', 'Blueberry muffin', 3.00),
('Brownie', 'Chocolate brownie', 4.00);

SELECT * FROM item 
/Create OR REPLACE procedure discount(
  item_id integer,
  discount_percent numeric(10,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
  -- Update the price of the item with the given id to be the price minus the discount percent
  UPDATE item
  SET price = price * (1 - discount_percent)
  WHERE id = item_id;
END;
$$;

CALL discount(1, 0.1);


SELECT * FROM item;