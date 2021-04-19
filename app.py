from flask import Flask, request, make_response, abort
import subprocess
app = Flask(__name__)


@app.route("/", methods=["POST"])
def update():
    # needs some extra validation on the structure of the payload
    try:
        payload = request.get_data()
        with open("graphin", "wb") as f:
            f.write(payload)
        process = subprocess.Popen(
                ['graph-easy', '--as=ascii', 'graphin'],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE)
        stdout, stderror = process.communicate()
        response = make_response(stdout, 200)
        response.mimetype = "text/plain"
        return response
    except Exception as e:
        print(e)
        abort(400)


if __name__ == "__main__":
    app.run(port=8008, host="0.0.0.0")
