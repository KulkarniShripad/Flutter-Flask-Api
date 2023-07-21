from flask import Flask, jsonify, request 

app = Flask(__name__)

@app.route("/")
def default():
    return "Hello World"

@app.route("/factorial", methods= ["Get"])
def home():
    d = {}
    number = int(request.args['number'])
    
    if number < 0:
        d['output'] = 'Number should be non negative'
        return d, 400
    
    factorial = 1
    for i in range(1, number + 1):
        factorial *= i
    d["output"] = str(factorial)
    
    return d

if __name__ == "__main__":
    app.run(debug= True)