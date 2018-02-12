#include "backend.h"
#include <QTimer>
#include <QDebug>

BackEnd::BackEnd(QObject *parent) : QObject(parent)
{
}

QString BackEnd::userName()
{
    return m_userName;
}

void BackEnd::setUserName(const QString &userName)
{
    if (userName == m_userName)
            return;
    m_userName = userName;
    emit userNameChanged();
}

DemoData::DemoData()
{

}

DemoData::~DemoData()
{

}

void DemoData::generateData()
{
    m_number = 0;
    while(1){
        QThread::sleep(2);
        m_number++;
        qDebug()<<m_number;
        emit numberChanged();
    }

}

QString DemoData::getN()
{
    return QString::number(m_number);
}
