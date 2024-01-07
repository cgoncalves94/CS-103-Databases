-- Queries to test the Restaurant Menu Database

-- 1. Query all dishes in the 'Starters' category
SELECT * FROM dishes WHERE category_id = (SELECT category_id FROM categories WHERE name = 'Starters');

-- 2. Query all non-alcoholic drinks
SELECT * FROM drinks WHERE alcohol_content IS NULL;

-- 3. Find all ingredients for 'Mojito'
SELECT i.name
FROM ingredients i
JOIN drink_ingredients di ON di.ingredient_id = i.ingredient_id
JOIN drinks d ON di.drink_id = d.drink_id
WHERE d.name = 'Mojito';

-- 4. Update the price of 'Espresso'
UPDATE drinks SET price = 2.75 WHERE name = 'Espresso';

-- 5. Delete a dish from the menu
DELETE FROM dishes WHERE name = 'Caesar Salad';

-- 6. List all dishes and their respective categories
SELECT d.name, c.name as category
FROM dishes d
JOIN categories c ON d.category_id = c.category_id;

-- 7. Add a new ingredient and associate it with a drink
INSERT INTO ingredients (name) VALUES ('Mint');
INSERT INTO drink_ingredients (drink_id, ingredient_id) VALUES 
((SELECT drink_id FROM drinks WHERE name = 'Mojito'), (SELECT ingredient_id FROM ingredients WHERE name = 'Mint'));

-- 8. Find the average price of all dishes
SELECT AVG(price) as average_dish_price FROM dishes;

-- 9. Count the number of drinks for each type of beverage category
SELECT c.name, COUNT(d.drink_id) as drinks_count
FROM categories c
JOIN drinks d ON c.category_id = d.category_id
GROUP BY c.name;

-- 10. List all ingredients that contain allergens
SELECT * FROM ingredients WHERE allergens IS NOT NULL;
