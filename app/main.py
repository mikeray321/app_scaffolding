from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def hello_world():
    return jsonify({
        "message": "Welcome to the Golden Path!",
        "status": "Healthy",
        "version": "1.0.0"
    })

if __name__ == '__main__':
    # Standard port for Flask apps
    app.run(host='0.0.0.0', port=5000)
