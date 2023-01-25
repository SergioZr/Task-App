from flask import Flask, render_template, request
import mariadb
import sys

app = Flask(__name__, static_url_path="/static", static_folder='/home/elh/Documents/repos/Task-App/templates/static')

def getUserPasswordFromMariaDB(userName):
    try:
        conn = mariadb.connect(
            user="root",
            password="task",
            host="173.3.0.2",
            port=3306,
            database="task"
        )
    except mariadb.Error as e:
        print(f"Error connecting to MariaDB Platform: {e}")
        sys.exit(1)
    
    cur = conn.cursor()

    
    cur.execute("SELECT password FROM user WHERE username = ?", (userName,))

    for password in cur: 
        print(f"password is: {password}")
        resultPassword = password[0]
        break

    conn.close()

    return resultPassword

def getMapHttpPostAttributes(request):
    return request.form.to_dict()

@app.route("/login", methods=["POST"])
def login():
    dictRequest = getMapHttpPostAttributes(request)

    userName = dictRequest["username"]

    userPassword = getUserPasswordFromMariaDB(userName)

    if userPassword == dictRequest["password"]:
        return render_template("index.html")

    return render_template("login.html")

@app.route("/")
def home():
    return render_template("login.html")
    
if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)