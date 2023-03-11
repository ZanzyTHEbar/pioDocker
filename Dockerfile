FROM python:3.9.0-slim

ENV APP_VERSION="6.1.6" \
    APP="platformio-core"

LABEL app.name="${APP}" \
    app.version="${APP_VERSION}" \
    maintainer="DaOfficialWizard <pyr0ndet0s97@gmail.com>"

RUN python -m pip install --upgrade pip && \
    pip install distro && \
    pip install -U platformio==${APP_VERSION} && \
    pio upgrade --dev && \
    pio pkg update --global && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio && \
    apt update && apt install -y git unzip && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

USER 1001

WORKDIR /workspace

ENTRYPOINT ["platformio"] 
