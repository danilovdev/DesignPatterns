class Product {
    var name:String
    var price:Double
    var stock:Int {
        get {
            return stockBackingValue
        }
        set {
            stockBackingValue = max(0, newValue)
        }
    }
    private var stockBackingValue: Int = 0
    init(name:String, price:Double, stock:Int) {
        self.name = name;
        self.price = price;
        self.stock = stock;
    }
    func calculateTax(rate: Double) -> Double {
        return min(10, self.price * rate);
    }
    var stockValue: Double {
        get {
            return self.price * Double(self.stock);
        }
    }
    
    
}

var products = [
    Product(name: "Kayak", price: 275, stock: 10),
    Product(name: "Lifejacket", price: 48.95, stock: 14),
    Product(name: "Soccer Ball", price: 19.5, stock: 32)
];

func calculateTax(product: Product) -> Double {
    return product.price * 0.2;
}

func calculateStockValue(_ productsArray: [Product]) -> Double {
    return productsArray.reduce(0, {
        (total, product) -> Double in
            return total + product.stockValue
    })
}

print("Sales tax for Kayak: $\(products[0].calculateTax(rate: 0.2))")
print("Total value of stock: $\(calculateStockValue(products))")

products[0].stock = -50;
print("Stock Level for Kayak: \(products[0].stock)");
