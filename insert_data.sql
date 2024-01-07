
-- Categories Table
INSERT INTO categories (name, type) VALUES 
('Starters', 'Food'),
('Mains', 'Food'),
('Desserts', 'Food'),
('Alcoholic Beverages', 'Drink'),
('Non-Alcoholic Beverages', 'Drink');

-- Dishes Table
INSERT INTO dishes (name, description, price, category_id) VALUES 
('Tomato Soup', 'Creamy tomato soup with basil', 5.99, (SELECT category_id FROM categories WHERE name = 'Starters')),
('Steak', 'Ribeye steak with garlic butter', 22.99, (SELECT category_id FROM categories WHERE name = 'Mains')),
('Chocolate Cake', 'Rich chocolate cake with ganache', 6.50, (SELECT category_id FROM categories WHERE name = 'Desserts')),
('Caesar Salad', 'Classic Caesar with croutons', 7.99, (SELECT category_id FROM categories WHERE name = 'Starters')),
('Margherita Pizza', 'Pizza with tomato, mozzarella, and basil', 12.50, (SELECT category_id FROM categories WHERE name = 'Mains'));



-- Drinks Table
INSERT INTO drinks (name, description, price, category_id, alcohol_content) VALUES 
('Red Wine', 'Bottle of Merlot', 18.00, (SELECT category_id FROM categories WHERE name = 'Alcoholic Beverages'), 14.0),
('Iced Tea', 'Fresh brewed iced tea with lemon', 2.99, (SELECT category_id FROM categories WHERE name = 'Non-Alcoholic Beverages'), NULL),
('Mojito', 'White rum, sugar, lime juice, soda water, and mint', 8.50, (SELECT category_id FROM categories WHERE name = 'Alcoholic Beverages'), 10.0),
('Espresso', 'Strong black coffee', 2.50, (SELECT category_id FROM categories WHERE name = 'Non-Alcoholic Beverages'), NULL);



-- Ingredients Table
INSERT INTO ingredients (name, allergens) VALUES 
('Tomato', NULL),
('Basil', NULL),
('Steak', 'Beef'),
('Chocolate', 'Dairy, Soy'),
('Lettuce', NULL),
('Cheese', 'Dairy'),
('Rum', 'Alcohol'),
('Lime', NULL),
('Coffee', NULL),
('Tea Leaves', NULL),
('Sugar', NULL),
('Lemon', NULL);



-- Dish_Ingredients Junction Table
INSERT INTO dish_ingredients (dish_id, ingredient_id) VALUES 
((SELECT dish_id FROM dishes WHERE name = 'Tomato Soup'), (SELECT ingredient_id FROM ingredients WHERE name = 'Tomato')),
((SELECT dish_id FROM dishes WHERE name = 'Tomato Soup'), (SELECT ingredient_id FROM ingredients WHERE name = 'Basil')),
((SELECT dish_id FROM dishes WHERE name = 'Steak'), (SELECT ingredient_id FROM ingredients WHERE name = 'Steak')),
((SELECT dish_id FROM dishes WHERE name = 'Chocolate Cake'), (SELECT ingredient_id FROM ingredients WHERE name = 'Chocolate')),
((SELECT dish_id FROM dishes WHERE name = 'Caesar Salad'), (SELECT ingredient_id FROM ingredients WHERE name = 'Lettuce')),
((SELECT dish_id FROM dishes WHERE name = 'Margherita Pizza'), (SELECT ingredient_id FROM ingredients WHERE name = 'Cheese')),
((SELECT dish_id FROM dishes WHERE name = 'Margherita Pizza'), (SELECT ingredient_id FROM ingredients WHERE name = 'Tomato'));



-- Drink_Ingredients Junction Table
INSERT INTO drink_ingredients (drink_id, ingredient_id) VALUES 
((SELECT drink_id FROM drinks WHERE name = 'Mojito'), (SELECT ingredient_id FROM ingredients WHERE name = 'Rum')),
((SELECT drink_id FROM drinks WHERE name = 'Mojito'), (SELECT ingredient_id FROM ingredients WHERE name = 'Lime')),
((SELECT drink_id FROM drinks WHERE name = 'Espresso'), (SELECT ingredient_id FROM ingredients WHERE name = 'Coffee')),
((SELECT drink_id FROM drinks WHERE name = 'Iced Tea'), (SELECT ingredient_id FROM ingredients WHERE name = 'Tea Leaves')),
((SELECT drink_id FROM drinks WHERE name = 'Iced Tea'), (SELECT ingredient_id FROM ingredients WHERE name = 'Sugar')),
((SELECT drink_id FROM drinks WHERE name = 'Iced Tea'), (SELECT ingredient_id FROM ingredients WHERE name = 'Lemon'));





