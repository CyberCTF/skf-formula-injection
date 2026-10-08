# Overlay of SKF labs' python/Formula-injection/Dockerfile (vendored unchanged in app/). Differences:
# - COPY ./ becomes COPY app/ (the vendored lab sits in app/ of this build folder);
# - pip installs requirements.txt with constraints.txt (Flask-Excel and the pyexcel packages pinned
#   to their versions of 2022-01-24) and adds pyexcel-xls: without that plug-in the lab's own
#   /pages/export answers 500 (OSError: No content, file name. Nothing is given).

### Static layers

FROM alpine:3.7 AS skf-alpine37
LABEL Glenn ten Cate <glenn.ten.cate@owasp.org>

# Installing needed binaries and deps. Then removing unneeded deps:
RUN apk update --no-cache && apk add python3 python3-dev py3-pip bash git dos2unix

### Dynamic layers
FROM skf-alpine37
LABEL Glenn ten Cate <glenn.ten.cate@owasp.org>

RUN addgroup -g 1000 app 
RUN adduser -u 1000 -G app -D -h /home/app app
RUN rm -rf /var/cache/apk/APKINDEX*

COPY app/ /home/app/Formula-injection

# Switching to the new app location:
WORKDIR /home/app/Formula-injection

RUN chown -R app:app /home/app/Formula-injection

# Switching to the limited user
USER app

# Installing needed binaries and deps
# Overlay: install with the pinned constraints (see constraints.txt), plus pyexcel-xls, the plug-in
# the xls export needs.
COPY constraints.txt /tmp/constraints.txt
RUN pip3 install --no-cache-dir  --user -c /tmp/constraints.txt -r requirements.txt pyexcel-xls 

# Fixing Windows line endings for our students:
RUN find . -name "*.sh" -o -name "*.py" -o -name "*.css" -o -name "*.js" | xargs dos2unix

# Setting chmod +x on the scripts:
RUN find . -name "*.sh" -o -name "*.py" | xargs chmod +x

# Starting the actual application:
ENTRYPOINT [ "python3", "./formula.py" ]