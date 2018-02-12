#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QFile>
#include <QList>
#include <QNetworkReply>
#include <QUrl>
#include <QObject>

class DataObject : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name NOTIFY nameChanged)
    Q_PROPERTY(QString desc READ desc WRITE setDesc NOTIFY descChanged)

public:
    DataObject(QString name, QString desc);
    QString name();
    QString desc();
    void setDesc(QString ndesc);
private:
    QString m_name;
    QString m_desc;
signals:
    void nameChanged();
    void descChanged();

};

class FileHandler
{
public:
    FileHandler();
    QList<QObject*> openJSON();
};

#endif // FILEHANDLER_H
