from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/run', methods=['POST'])
def run_code():
    data = request.json
    code = data.get("code", "")

    try:
        result = subprocess.run(["python", "-c", code], capture_output=True, text=True, check=True)
        return jsonify({"output": result.stdout})
    except subprocess.CalledProcessError as e:
        return jsonify({"error": e.stderr}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
