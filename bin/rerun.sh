#!/bin/bash
rerun --pattern '{deploy/*,**/*.{rb,ru,txt}}' -- thin start -p 4567 -R config.ru 2> >(grep -v "cache_bust")
