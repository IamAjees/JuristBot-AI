# Use the Python 3.12 slim base image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Copy application files
COPY . /app
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose application port
EXPOSE 8000

# Start the application
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "app:app", "--timeout", "120", "--log-level", "debug"]