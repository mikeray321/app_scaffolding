# Stage 1: Build
FROM python:3.11-slim as builder
WORKDIR /build
COPY requirements.txt .
# Install dependencies to a local folder
RUN pip install --user -r requirements.txt

# Stage 2: Runtime
FROM python:3.11-slim as runner
WORKDIR /app
# Only copy the installed dependencies from the builder
COPY --from=builder /root/.local /root/.local
COPY ./app ./app

ENV PATH=/root/.local/bin:$PATH
EXPOSE 5000

# Run as non-root user for security
RUN useradd -m appuser
USER appuser

CMD ["python", "app/main.py"]
