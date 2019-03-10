#!/bin/bash
uuidgen -r | tr -d '\n' | xsel -ib
