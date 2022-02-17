#!/usr/bin/env bash
rpwg -n 1 -l 16 ${@} | vim - -c 'norm v$hy' -R --not-a-term
