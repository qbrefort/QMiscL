#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QList>
#include "filehandler.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    FileHandler myFH;
    QList<QObject*> qlist =  myFH.openJSON();


    QQmlContext* context = engine.rootContext();
    context->setContextProperty("myModel", QVariant::fromValue(qlist));
    return app.exec();
}
