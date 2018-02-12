#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QThread>
#include <QMutex>

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName  READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString myData  READ myData NOTIFY myDataChanged)

public:
    explicit BackEnd(QObject *parent = nullptr);
    QString userName();
    Q_INVOKABLE void setUserName(const QString &userName);
signals:
    void userNameChanged();
    void numberChanged();

public slots:

private:
    QString m_userName;
    int m_myData = 0;
};

#endif // BACKEND_H

class DemoData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString getN READ getN NOTIFY numberChanged)
public:
    DemoData();
    ~DemoData();
    QString getN();
public slots:
    void generateData();
private:
    int m_number;
    QMutex mutex;
signals:
    void finished();
    numberChanged();
};
