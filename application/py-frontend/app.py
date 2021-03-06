from flask import Flask
import requests
import os
import json

app = Flask(__name__)
api_url = "http://hello-ilb:5000/"
headers = {'Content-Type': 'application/json'}

@app.route("/")
def hello():
    response = requests.get(api_url, headers=headers)
    data = json.loads(response.text)
    return data


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 80))
    app.run(debug=True,host='0.0.0.0',port=port)