from flask import Flask
from flask import json
import os

app = Flask(__name__)

@app.route("/")
def hello():
    data = {"text" : "Hello World!"}
    response = app.response_class(
        response=json.dumps(data),
        status=200,
        mimetype='application/json'
    )
    return response


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True,host='0.0.0.0',port=port)