FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y wkhtmltopdf && apt-get clean

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy application code
COPY . .

# Expose port and run the server
EXPOSE 5000
CMD ["python", "app.py"]
