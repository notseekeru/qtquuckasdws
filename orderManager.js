class OrderManager {
    constructor() {
        this.menu = [
            {id: 1, name: "Carpaccio di Manzo", price: 380.00, image: "qrc:/assets/foods/Carpaccio di Manzo.png", category: "antipasti"},
            {id: 2, name: "Bruschetta", price: 350.00, image: "qrc:/assets/foods/Bruschetta.png", category: "antipasti"},
            {id: 3, name: "Italian Nachos", price: 385.00, image: "qrc:/assets/foods/Italian Nachos.png", category: "antipasti"},
            {id: 4, name: "Crema di Zucca", price: 320.00, image: "qrc:/assets/foods/Crema di Zucca.png", category: "zupp"},
            {id: 5, name: "Crema di Porcini e Tartufo Nero", price: 350.00, image: "qrc:/assets/foods/Crema di Porcini e Trtufo Nero.png", category: "zupp"},
            {id: 6, name: "Margherita Grande", price: 520.00, image: "qrc:/assets/foods/Margherita.png", category: "pizze"},
            {id: 7, name: "Mediterranea Grande", price: 620.00, image: "qrc:/assets/foods/Mediterranea.png", category: "pizze"},
            {id: 8, name: "Pizza Bianca Grande", price: 590.00, image: "qrc:/assets/foods/Pizza Bianca.png", category: "pizze"},
            {id: 9, name: "Quattro Formaggi Grande", price: 765.00, image: "qrc:/assets/foods/Quattro Formaggi.png", category: "pizze"},
            {id: 10, name: "Frutti di Mare Nero", price: 680.00, image: "qrc:/assets/foods/Frutti di Mare Nero.png", category: "pasta_speciale"},
            {id: 11, name: "Alla Carbonara", price: 580.00, image: "qrc:/assets/foods/Alla Carbonara.png", category: "pasta_speciale"},
            {id: 12, name: "Lasagna", price: 550.00, image: "qrc:/assets/foods/Lasagna.png", category: "pasta_speciale"},
            {id: 13, name: "Costolette di Maiale", price: 1680.00, image: "qrc:/assets/foods/Costolette di Maiale.png", category: "meat_course"},
            {id: 14, name: "Osso Buco Mechado", price: 1380.00, image: "qrc:/assets/foods/Osso Buco Mechado.png", category: "meat_course"},
            {id: 15, name: "Butterfly Pea and Lemon Tea Hot", price: 180.00, image: "qrc:/assets/foods/Butterfly pea and lemon tea.png", category: "tea"},
            {id: 16, name: "Fresh Lemonade Soda", price: 220.00, image: "qrc:/assets/foods/Fresh Lemonade Soda.png", category: "tea"},
            {id: 17, name: "Fresh Cucumber Lemon and Moringa Hot", price: 180.00, image: "qrc:/assets/foods/Fresh Cucumber Lemon and Moringa.png", category: "tea"},
            {id: 18, name: "Classic Mocha Parfait", price: 220.00, image: "qrc:/assets/foods/Classic Mocha Parfait.png", category: "parfait"},
            {id: 19, name: "Nutty Nutella", price: 220.00, image: "qrc:/assets/foods/Nutty Nutella.png", category: "parfait"},
            {id: 20, name: "Vanilla Caramel", price: 220.00, image: "qrc:/assets/foods/Vanilla Caramel.png", category: "parfait"},
            {id: 21, name: "Mango", price: 250.00, image: "qrc:/assets/foods/Mango.png", category: "fruit_shakes"},
            {id: 22, name: "Banana", price: 250.00, image: "qrc:/assets/foods/Banana.png", category: "fruit_shakes"},
            {id: 23, name: "San Pellegrino 750ml", price: 320.00, image: "qrc:/assets/foods/San Pellegrino.png", category: "water"},
            {id: 24, name: "Panna 750ml", price: 300.00, image: "qrc:/assets/foods/Panna.png", category: "water"}
        ];
        
        this.orders = new Map();
    }

    getMenu() {
        return this.menu;
    }

    getByCategory(category) {
        return this.menu.filter(item => item.category === category);
    }

    addToOrder(id) {
        const currentQty = this.orders.get(id) || 0;
        this.orders.set(id, currentQty + 1);
    }

    clearOrder() {
        this.orders.clear();
    }

    getOrderItems() {
        const result = [];
        this.orders.forEach((quantity, id) => {
            const item = this.findById(id);
            if (item) {
                result.push({
                    name: item.name,
                    quantity: quantity,
                    lineTotal: item.price * quantity
                });
            }
        });
        return result;
    }

    getOrderTotal() {
        let total = 0;
        this.orders.forEach((quantity, id) => {
            const item = this.findById(id);
            if (item) {
                total += item.price * quantity;
            }
        });
        return total;
    }

    findById(id) {
        return this.menu.find(item => item.id === id);
    }
}

// Example usage:
const orderManager = new OrderManager();

// Get all menu items
console.log("All menu items:", orderManager.getMenu());

// Get items by category
console.log("\nPizza items:", orderManager.getByCategory("pizze"));

// Add items to order
orderManager.addToOrder(6); // Margherita Grande
orderManager.addToOrder(6); // Another Margherita Grande
orderManager.addToOrder(11); // Alla Carbonara

// Get order items
console.log("\nOrder items:", orderManager.getOrderItems());

// Get order total
console.log("\nOrder total:", orderManager.getOrderTotal());

// Clear order
orderManager.clearOrder();
console.log("\nOrder after clearing:", orderManager.getOrderItems());
