#!/bin/bash
#

PATH=/bin:/usr/bin

DT=`date`
ENV=`env | sort`

/bin/mail mferreira@webcointernet.com <<MAIL
To: ferreira.mv@gmail.com
Subject: Teste do cron


Testando

$DT

$ENV


MAIL

exit 0

