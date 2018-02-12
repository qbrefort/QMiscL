#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QThread>
#include <QObject>
#include <QQuickView>

#include "backend.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQuickView view;


    qmlRegisterType<BackEnd>("test3.backend", 1, 0, "BackEnd");
    qmlRegisterType<BackEnd>("test3.demodata", 1, 0, "DemoData");

    QThread* thread = new QThread;
    DemoData* demodata = new DemoData();
    demodata->moveToThread(thread);

    QObject::connect(thread, SIGNAL (started()), demodata, SLOT (generateData()));
    QObject::connect(demodata, SIGNAL (finished()), thread, SLOT (quit()));
    QObject::connect(demodata, SIGNAL (finished()), demodata, SLOT (deleteLater()));
    QObject::connect(thread, SIGNAL (finished()), thread, SLOT (deleteLater()));
    thread->start();




    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QQmlContext* ctx = engine.rootContext();

    QObject *rootObject = engine.rootObjects()[0];
    QObject *txt = rootObject->findChild<QObject*>("numberTxtField");
    if(txt)
        txt->setProperty("text",demodata->getN());

    return app.exec();
}
