@languages ||= []
@languages +=
[
{
  id: 43,
  name: "Plain Text",
  is_archived: false,
  source_file: "text.txt",
  run_cmd: "/bin/cat text.txt"
},
{
  id: 46,
  name: "Bash (5.0.0)",
  is_archived: false,
  source_file: "script.sh",
  run_cmd: "/usr/local/bash-5.0/bin/bash script.sh"
},
{
  id: 62,
  name: "Java (OpenJDK 13.0.1)",
  is_archived: false,
  source_file: "Main.java",
  compile_cmd: "/usr/local/openjdk13/bin/javac %s Main.java",
  run_cmd: "/usr/local/openjdk13/bin/java Main"
},
{
  id: 70,
  name: "Python (2.7.17)",
  is_archived: false,
  source_file: "script.py",
  run_cmd: "/usr/local/python-2.7.17/bin/python2 script.py"
},
{
  id: 71,
  name: "Python (3.8.1)",
  is_archived: false,
  source_file: "script.py",
  run_cmd: "/usr/local/python-3.8.1/bin/python3 script.py"
},
{
  id: 72,
  name: "Ruby (3.5.5)",
  is_archived: false,
  source_file: "script.rb",
  run_cmd: "/usr/local/ruby-3.5.5/bin/ruby script.rb"
},
{
  id: 82,
  name: "SQL (SQLite 3.27.2)",
  is_archived: false,
  source_file: "script.sql",
  run_cmd: "/bin/cat script.sql | /usr/bin/sqlite3 db.sqlite"
},
{
  id: 89,
  name: "Multi-file program",
  is_archived: false,
},
{
  id: 200,
  name: "Python (3.11.2)",
  is_archived: false,
  source_file: "script.py",
  run_cmd: "/usr/local/python-3.11.2/bin/python3 script.py"
}
]