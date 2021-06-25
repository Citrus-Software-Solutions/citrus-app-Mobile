commit_types = ["feat", "fix", "docs", "refactor", "test"]

commit_type = input("Commit Type: ")

if not commit_type in commit_types:
  raise Exception("Type '%s' is not valid" % commit_type)

commit_title = input("Commit Title: ")

if len(commit_title) > 50:
  raise Exception("Commit title cannot be longer than 50 characters")

commit_body = input("Commit Body: ")

commit_task_id = input("(optional) Commit Task ID: ")

commit_text = "[%s] - %s\n\n%s" % (commit_type, commit_title, commit_body)

if commit_task_id != "":
  commit_text += "\n\nID Tarea: %s" % commit_task_id

print(commit_text)