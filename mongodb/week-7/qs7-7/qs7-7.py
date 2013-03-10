import pymongo

connection = pymongo.Connection("mongodb://localhost", safe=True)

db = connection.photosharing
albumsCollection = db.albums
imagesCollection = db.images

images = imagesCollection.aggregate([
    {"$project": {"_id": 1}}
])['result']

albums = albumsCollection.aggregate([
    {"$unwind": "$images"},
])['result']

for image in images:
    found = None
    if any(image["_id"] == album["images"] for album in albums):
        found = True

    if found == None:
        imagesCollection.remove({'_id': image['_id']})
