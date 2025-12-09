#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QQmlContext>
#include <QObject>

struct Product {
    int id;
    QString name;
    double price;
    QString image;
};

class Backend : public QObject {
    Q_OBJECT

public:
    QString customer_order_method = "N/A";
    QString customer_payment_method = "N/A";
    QString customer_serving_method = "N/A";

public slots:
    void click_order(const QString &type) {
        customer_order_method = type;
        qDebug() << "Order method:" << customer_order_method;
    }
    void click_payment(const QString &type) {
        customer_payment_method = type;
        qDebug() << "Payment method:" << customer_payment_method;
    }
    void click_serving(const QString &type) {
        customer_serving_method = type;
        qDebug() << "Serving method:" << customer_serving_method;
    }
};

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/assets/applogo.ico"));

    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    Backend backend;
    engine.rootContext()->setContextProperty("backend", &backend);

    return app.exec();
}

#include "main.moc"
