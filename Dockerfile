FROM alectries/univr
RUN apt-get update && \
    apt-get install -y man-db && \
    apt-get install -y --no-install-recommends \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*