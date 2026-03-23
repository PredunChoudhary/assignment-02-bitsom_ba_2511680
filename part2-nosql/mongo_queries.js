// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
  {
    product_id: "E1001",
    name: "Samsung Smart TV",
    category: "Electronics",
    price: 20000,
    brand: "Samsung",
    specifications: {
      screen_size: "55 inches",
      resolution: "4K",
      voltage: "220V",
      smart_features: ["Netflix", "YouTube", "Amazon Prime"]
    },
    warranty: {
      period: "2 years",
      type: "Manufacturer"
    },
    stock: 25
  },
  {
    product_id: "C2001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1200,
    brand: "Levi's",
    size_options: ["S", "M", "L", "XL"],
    color_options: ["Blue", "Black", "White"],
    material: "Cotton",
    ratings: {
      average: 4.3,
      reviews: 120
    },
    stock: 100
  },
  {
    product_id: "G3001",
    name: "Amul Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: "2026-04-01",
    weight: "1L",
    nutritional_info: {
      calories: 150,
      protein: "8g",
      fat: "6g"
    },
    storage_instructions: ["Keep refrigerated"],
    stock: 200
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product

db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field

db.products.createIndex({ category: 1 });

// Explanation:
// Creating an index on the 'category' field improves query performance
// by allowing MongoDB to quickly locate documents based on category
// instead of scanning the entire collection.