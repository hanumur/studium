
import pymongo
import sys

connection = pymongo.Connection("mongodb://localhost", safe=True)
db = connection.students
collection = db.grades

grades = collection.find({"type": "homework"})
grades.sort([("student_id", pymongo.ASCENDING), ("score", pymongo.ASCENDING)])

previous_grade = {"student_id": None}
for grade in grades:
    if previous_grade["student_id"] != grade["student_id"]:
        collection.remove(grade)
        previous_grade = grade
