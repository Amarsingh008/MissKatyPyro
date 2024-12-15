   FROM python:3.12-slim

   # Install OpenGL and other necessary libraries
   RUN apt-get update && apt-get install -y 
       libgl1-mesa-glx 
       && rm -rf /var/lib/apt/lists/*

   # Set up your application here...
   COPY . /workspace
   WORKDIR /workspace

   # Install Python dependencies
   RUN pip install --no-cache-dir -r requirements.txt

   # Command to run your application
   CMD ["gunicorn", "-b", "0.0.0.0:8080", "your_module:app"]
   
CMD ["python3", "main.py"]
