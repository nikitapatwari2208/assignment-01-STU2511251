// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: 1,
    name: "Samsung Galaxy S24",
    category: "Electronics",
    price: 74999,
    brand: "Samsung",
    specifications: {
      warranty_years: 1,
      voltage: "220V",
      storage: "256GB",
      ram: "8GB"
    },
    features: ["5G", "AMOLED Display", "Fast Charging"],
    stock: 20
  },
  {
    _id: 2,
    name: "Men's Denim Jacket",
    category: "Clothing",
    price: 2499,
    brand: "Levis",
    specifications: {
      size_options: ["S", "M", "L", "XL"],
      material: "Denim",
      color: "Blue"
    },
    features: ["Slim Fit", "Machine Washable"],
    stock: 50
  },
  {
    _id: 3,
    name: "Organic Almond Milk",
    category: "Groceries",
    price: 180,
    brand: "Healthy Farm",
    specifications: {
      expiry_date: "2024-12-20",
      weight: "1L",
      nutritional_info: {
        calories: 60,
        protein: "2g",
        fat: "3g"
      }
    },
    tags: ["vegan", "dairy-free", "organic"],
    stock: 100
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
  "specifications.expiry_date": { $lt: "2025-01-01" }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: 1 },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });