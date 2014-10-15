#!/bin/bash

export APP_ROOT=${APP_ROOT:-/data/app/}
export PYTHONPATH=$PYTHONPATH:${APP_ROOT}

if [ -n "${INSTALL_REQUIREMENTS}" ]; then
  if [ -f ${APP_ROOT}/requirements.txt ]; then
    pip install -r ${APP_ROOT}/requirements.txt
  fi
fi

chown celery:celery -R ${APP_ROOT}

supervisord -n -c /etc/supervisor/supervisord.conf