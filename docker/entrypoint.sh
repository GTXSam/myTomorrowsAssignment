#!/bin/bash

exec flask run --host=0.0.0.0 --port="$FLASK_RUN_PORT"