#include "filehandler.h"


FileHandler::FileHandler()
{

}

QList<QObject*> FileHandler::openJSON()
{
    QFile file;
    file.setFileName("C:\\Users\\qbrefort\\test4_JSON\\data.json");
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QString qstr = file.readAll();
    file.close();
    qWarning()<<"Myfile is";
    qWarning()<< qstr;

    QJsonDocument d = QJsonDocument::fromJson(qstr.toUtf8());
    QJsonObject sett2 = d.object();
    QJsonValue value = sett2.value(QString("Hommes"));
    qWarning()<< value;
    QJsonArray array = value.toArray();


    QList<QObject*> dataList;
    foreach (const QJsonValue & v, array)
    {
        dataList.append(new DataObject(v.toObject().value("name").toString(),v.toObject().value("description").toString()));
    }

    return dataList;


}


DataObject::DataObject(QString name, QString desc)
{
    m_name = name;
    m_desc = desc;
}

QString DataObject::name()
{
    return m_name;
}

QString DataObject::desc()
{
    return m_desc;
}

void DataObject::setDesc(QString ndesc)
{
    m_desc = ndesc;
    emit descChanged();
}
