echo off

echo Extracting keys from javascript code
xgettext --omit-header --default-domain=javascript --language=Perl --keyword=_ --keyword=n_ --keyword=gettext_noop --keyword=gettext_lazy --keyword=ngettext_lazy --from-code=UTF-8 -o locales\en\LC_MESSAGES\javascript.pot *.js
xgettext --omit-header --default-domain=javascript --language=Perl --keyword=_ --keyword=n_ --keyword=gettext_noop --keyword=gettext_lazy --keyword=ngettext_lazy --from-code=UTF-8 -o locales\fr\LC_MESSAGES\javascript.pot *.js

echo Merging new keys with existing keys
msgmerge --quiet --update locales\fr\LC_MESSAGES\javascript.po locales\fr\LC_MESSAGES\javascript.pot
msgmerge --quiet --update locales\en\LC_MESSAGES\javascript.po locales\en\LC_MESSAGES\javascript.pot

echo Converting message files to binary
msgfmt -v -o locales\en\LC_MESSAGES\javascript.mo  locales\en\LC_MESSAGES\javascript.po
msgfmt -v -o locales\fr\LC_MESSAGES\javascript.mo  locales\fr\LC_MESSAGES\javascript.po

echo Converting binary files to JSON
rem Usage:  mo2json.py domain . locale output-filename
python mo2json.py javascript locales en javascript.en.json
python mo2json.py javascript locales fr javascript.fr.json

echo Removing temp files
del locales\en\LC_MESSAGES\javascript.pot
del locales\en\LC_MESSAGES\javascript.po~
del locales\fr\LC_MESSAGES\javascript.pot
del locales\fr\LC_MESSAGES\javascript.po~