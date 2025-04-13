# Use official Python image
FROM python:3.11-slim

# Set work directory
WORKDIR /code

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Collect static (optional, for admin)
RUN python app/manage.py collectstatic --noinput || true

# Start server
CMD ["python", "app/manage.py", "runserver", "0.0.0.0:8000"]
