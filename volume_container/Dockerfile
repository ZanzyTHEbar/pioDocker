FROM busybox:latest

ENV APP="busybox"

LABEL app.name="${APP}" \
    maintainer="DaOfficialWizard <pyr0ndet0s97@gmail.com>"

RUN mkdir -p /.platformio && \
    chmod 777 /.platformio

VOLUME ["/.platformio"]

CMD ["echo", "Volume container initialized."]