#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QIcon>
#include <vector>
#include <map>
#include <string>
#include <algorithm>
#include <optional>

using namespace std;

struct MenuItem {
    int id;
    string name;
    double price;
    string image;
    string category;
};

struct OrderItem {
    string name;
    int quantity;
    double lineTotal;
};

class OrderManager {
public:
    OrderManager() {
        initializeMenu();
    }

    void initializeMenu() {
        menu = {
            {1, "Carpaccio di Manzo", 380.00, "qrc:/assets/foods/Carpaccio di Manzo.png", "antipasti"},
            {2, "Bruschetta", 350.00, "qrc:/assets/foods/Bruschetta.png", "antipasti"},
            {3, "Italian Nachos", 385.00, "qrc:/assets/foods/Italian Nachos.png", "antipasti"},
            {4, "Crema di Zucca", 320.00, "qrc:/assets/foods/Crema di Zucca.png", "zupp"},
            {5, "Crema di Porcini e Tartufo Nero", 350.00, "qrc:/assets/foods/Crema di Porcini e Trtufo Nero.png", "zupp"},
            {6, "Margherita Grande", 520.00, "qrc:/assets/foods/Margherita.png", "pizze"},
            {7, "Mediterranea Grande", 620.00, "qrc:/assets/foods/Mediterranea.png", "pizze"},
            {8, "Pizza Bianca Grande", 590.00, "qrc:/assets/foods/Pizza Bianca.png", "pizze"},
            {9, "Quattro Formaggi Grande", 765.00, "qrc:/assets/foods/Quattro Formaggi.png", "pizze"},
            {10, "Frutti di Mare Nero", 680.00, "qrc:/assets/foods/Frutti di Mare Nero.png", "pasta_speciale"},
            {11, "Alla Carbonara", 580.00, "qrc:/assets/foods/Alla Carbonara.png", "pasta_speciale"},
            {12, "Lasagna", 550.00, "qrc:/assets/foods/Lasagna.png", "pasta_speciale"},
            {13, "Costolette di Maiale", 1680.00, "qrc:/assets/foods/Costolette di Maiale.png", "meat_course"},
            {14, "Osso Buco Mechado", 1380.00, "qrc:/assets/foods/Osso Buco Mechado.png", "meat_course"},
            {15, "Butterfly Pea and Lemon Tea Hot", 180.00, "qrc:/assets/foods/Butterfly pea and lemon tea.png", "tea"},
            {16, "Fresh Lemonade Soda", 220.00, "qrc:/assets/foods/Fresh Lemonade Soda.png", "tea"},
            {17, "Fresh Cucumber Lemon and Moringa Hot", 180.00, "qrc:/assets/foods/Fresh Cucumber Lemon and Moringa.png", "tea"},
            {18, "Classic Mocha Parfait", 220.00, "qrc:/assets/foods/Classic Mocha Parfait.png", "parfait"},
            {19, "Nutty Nutella", 220.00, "qrc:/assets/foods/Nutty Nutella.png", "parfait"},
            {20, "Vanilla Caramel", 220.00, "qrc:/assets/foods/Vanilla Caramel.png", "parfait"},
            {21, "Mango", 250.00, "qrc:/assets/foods/Mango.png", "fruit_shakes"},
            {22, "Banana", 250.00, "qrc:/assets/foods/Banana.png", "fruit_shakes"},
            {23, "San Pellegrino 750ml", 320.00, "qrc:/assets/foods/San Pellegrino.png", "water"},
            {24, "Panna 750ml", 300.00, "qrc:/assets/foods/Panna.png", "water"}
        };
    }

    vector<MenuItem> getByCategory(const string category) const {
        vector<MenuItem> result;
        for (const auto item : menu) {xc
            if (item.category == category) {
                result.push_back(item);
            }
        }
        return result;
    }

    void addToOrder(int id) {
        orders[id]++;
    }

    void clearOrder() {
        orders.clear();
    }

    vector<OrderItem> getOrderItems() const {
        vector<OrderItem> result;
        for (const auto [id, qty] : orders) {
            auto item = findById(id);
            if (item) {
                result.push_back({item->name, qty, item->price * qty});
            }
        }
        return result;
    }

    double getOrderTotal() const {
        double total = 0.0;
        for (const auto [id, qty] : orders) {
            auto item = findById(id);
            if (item) {
                total += item->price * qty;
            }
        }
        return total;
    }

private:
    vector<MenuItem> menu;
    map<int, int> orders;

    optional<MenuItem> findById(int id) const {
        for (const auto item : menu) {
            if (item.id == id) {
                return item;
            }
        }
        return nullopt;
    }
};

//QT RELATED STUFF
class QtOrderManager : public QObject {
        Q_OBJECT

    public slots:

        QVariantList getMenuItemsByCategory(const QString& category) {
            return toQt(core.getByCategory(category.toStdString()));
        }

        void addToOrder(int id) {
            core.addToOrder(id);
            emit orderChanged();
        }

        void clearOrder() {
            core.clearOrder();
            emit orderChanged();
        }

        QVariantList getOrderItems() {
            QVariantList result;
            for (const auto item : core.getOrderItems()) {
                result.append(QVariantMap{
                    {"name", QString::fromStdString(item.name)},
                    {"quantity", item.quantity},
                    {"lineTotal", item.lineTotal}
                });
            }
            return result;
        }

        double getOrderTotal() {
            return core.getOrderTotal();
        }

    signals:
        void orderChanged();

    private:
        OrderManager core;

        QVariantList toQt(const vector<MenuItem>& items) const {
            QVariantList result;
            for (const auto item : items) {
                result.append(QVariantMap{
                    {"id", item.id},
                    {"name", QString::fromStdString(item.name)},
                    {"price", item.price},
                    {"image", QString::fromStdString(item.image)},
                    {"category", QString::fromStdString(item.category)}
                });
            }
            return result;
        }
    };

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/assets/applogo.ico"));

    QQmlApplicationEngine engine;

    QtOrderManager orderManager;

    engine.rootContext()->setContextProperty("orderManager", &orderManager);

    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));

    return app.exec();
}

#include "main.moc"