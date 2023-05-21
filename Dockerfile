FROM python:3.9.0-slim

ENV APP_VERSION="6.1.7" \
    APP="esp32_platformio_core"

LABEL app.name="${APP}" \
    app.version="${APP_VERSION}" \
    maintainer="DaOfficialWizard <pyr0ndet0s97@gmail.com>"

RUN python -m pip install --upgrade pip && \
    pip install distro && \
    pip install -U platformio==${APP_VERSION} && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio && \
    pio upgrade --dev && \
    pio pkg install -g --platform "platformio/espressif32@^6.3.0" && \
    pio pkg update --global && \
    apt update && apt install -y git unzip && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /workspace

ENTRYPOINT ["platformio"] 
