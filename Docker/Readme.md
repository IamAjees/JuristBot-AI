# 🐳 Docker Configuration for JuristBot AI  

This documentation explains the Docker configuration for the **JuristBot AI** project. The Dockerfile uses a lightweight Python environment and optimizes the container for performance, reliability, and scalability.

---

## 🛠️ **Dockerfile Explanation**

The following sections explain the key components of the Dockerfile:

---

### **1. Base Image**
* Base Image: We use python:3.12-slim as it is a lightweight version of the Python 3.12 image
* Why slim?: It reduces the image size by excluding unnecessary system libraries, improving build times and resource usage.

### **2. Environment Variables**
* PYTHONUNBUFFERED=1: Ensures that Python output is sent straight to the terminal (no buffering), which is essential for real-time logging.
* PYTHONDONTWRITEBYTECODE=1: Prevents the creation of .pyc files to keep the container clean.

### **3. Install System Dependencies**
* Installs minimal system dependencies required for the application without unnecessary tools or libraries.
* --no-install-recommends: Ensures only the essential packages are installed, keeping the container lightweight.

### **4. 4. Upgrade Pip**
* Ensures the latest version of pip is installed.
* --no-cache-dir: Prevents caching, which reduces the image size.

### **5. Copy Application Files**
* Copies the application source code into the /app directory of the container.
* Sets /app as the working directory where all commands will execute.

### **6. Install Python Dependencies**
* Installs the Python dependencies listed in requirements.txt.
* --no-cache-dir: Prevents cached layers, keeping the image clean and smaller.

### **7. Expose Port**
* Opens port 8000 for incoming traffic.
* Port 8000 is the default port for the Gunicorn WSGI server.
 
### **8. CMD - Application Start Command**
* Gunicorn: The Gunicorn WSGI server is used to serve the Python application.
* Parameters:
        * **-w 2**: Uses 2 worker processes to handle requests concurrently. Adjust based on CPU cores available.
        * **-b 0.0.0.0:8000**: Binds the application to all available IP addresses on port 8000.
        * **app:app:**
                  - The first **app** refers to the file name (**app.py** in this case).
                  - The second **app** refers to the Flask or FastAPI instance inside the **app.py** file.
        * **--timeout 120**: Sets a 120-second timeout for requests. Useful for long-running tasks.
        * **--log-level debug**: Enables detailed logs to help debug issues.

---

## 📊 **Key Highlights:**
1. Lightweight Image: Uses the python:3.12-slim base image.
2. Gunicorn Integration: Handles concurrency and serves the application efficiently.
3. Port Configuration: Exposes port 8000 for external access.
4. Clean and Optimized: Avoids caching layers for minimal image size.

---

## 🏁 **Conclusion**
#### This Docker configuration provides a clean, scalable, and production-ready environment for the JuristBot AI project. It leverages the Gunicorn server for concurrency, ensuring high performance and reliability.