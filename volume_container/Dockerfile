FROM busybox:latest

ENV APP="esp32_vc_platformio"

LABEL app.name="${APP}" \
    maintainer="DaOfficialWizard <pyr0ndet0s97@gmail.com>"

RUN mkdir -p /.platformio && \
    chmod 777 /.platformio && \
    pio upgrade --dev && \
    pio pkg install -g --platform "platformio/espressif32@^6.1.0"&& \
    pio pkg update --global

VOLUME ["/.platformio"]

CMD ["echo", "Volume container initialized."]