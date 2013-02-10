
import pymongo
import sys

connection = pymongo.Connection("mongodb://localhost", safe=True)
db = connection.school
collection = db.students

students = collection.find()

for student in students:
    scores = student["scores"]
    min_score = {"score": 100}
    for score in scores:
        if score["type"] == "homework" and score["score"] < min_score["score"]:
            min_score = score
    scores.remove(min_score)
    collection.update({"_id": student["_id"]}, {"scores": scores})
