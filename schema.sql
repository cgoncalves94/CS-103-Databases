-- Categories Table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50)
);

-- Dishes Table
CREATE TABLE dishes (
    dish_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(5, 2),
    category_id INTEGER REFERENCES categories(category_id)
);

-- Drinks Table
CREATE TABLE drinks (
    drink_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(5, 2),
    category_id INTEGER REFERENCES categories(category_id),
    alcohol_content NUMERIC(3, 1)
);

-- Ingredients Table
CREATE TABLE ingredients (
    ingredient_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    allergens TEXT
);

-- Dish_Ingredients Junction Table
CREATE TABLE dish_ingredients (
    dish_id INTEGER REFERENCES dishes(dish_id),
    ingredient_id INTEGER REFERENCES ingredients(ingredient_id),
    PRIMARY KEY (dish_id, ingredient_id)
);

-- Drink_Ingredients Junction Table
CREATE TABLE drink_ingredients (
    drink_id INTEGER REFERENCES drinks(drink_id),
    ingredient_id INTEGER REFERENCES ingredients(ingredient_id),
    PRIMARY KEY (drink_id, ingredient_id)
);


