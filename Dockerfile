FROM python:3.8-alpine

# Create application user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup -u 1001

#switch to application user
USER appuser
WORKDIR /tmp


COPY --chown=appuser:appgroup hello.txt ./

# start command
CMD [ "python", "-m", "http.server", "8080", "--directory", "/tmp/" ]
