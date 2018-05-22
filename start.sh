#!/bin/bash

# Start Gunicorn processes
echo Starting Gunicorn.

#make sure we are at project root /usr/src/app
cd $PROJECT_ROOT

if [ ! -f $PROJECT_ROOT/.build ]; then
  echo "Collecting statics files"
  pushd tuteria_demo
  python manage.py collectstatic --noinput
  popd
  date > $PROJECT_ROOT/.build
fi

cd tuteria_demo // Change to our Django project
exec gunicorn tuteria_demo.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 3
