from flask import Flask, jsonify
import os
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)

# Default route
@app.route("/")
def home():
    return "Hello, this is a message from your Python app!"

# New route that uses secrets and configuration from environment variables
@app.route("/config")
def config():
    # Retrieve sensitive and config values from environment variables
    secret_key = os.getenv("SECRET_KEY")
    db_password = os.getenv("DB_PASSWORD")

    # Retrieve non-sensitive config values from environment variables
    api_base_url = os.getenv("API_BASE_URL")
    log_level = os.getenv("LOG_LEVEL")
    max_connections = os.getenv("MAX_CONNECTIONS")
    
    # Return the config information
    return jsonify({
        "message": "Config and secrets accessed",
        "SECRET_KEY": secret_key,
        "DB_PASSWORD": db_password,
        "API_BASE_URL": api_base_url,
        "LOG_LEVEL": log_level,
        "MAX_CONNECTIONS": max_connections
    })

#Sam - Healthcheck & Metrics endpoints
@app.route('/health')
def health():
    return jsonify({"status": "healthy"}), 200

metrics = PrometheusMetrics(app)
metrics.info("app_info", "MyTomorrows Assignment", version="1.0.0")


if __name__ == "__main__":
    #Sam - Added option to var. port
    port = int(os.getenv('FLASK_RUN_PORT', 5000))
    app.run(host="0.0.0.0", port=port)

