## MongoDB for Developers (Python)

Study [MongoDB] a scalable, high-performance, open source NoSQL database.

Exercise from the course [M101P: MongoDB for Developers (Python)].



### Resources

- [Mongo Hacker]. MongoDB Shell Enhancements for Hackers.
- [PyMongo] is a Python distribution containing tools for working with MongoDB.
- [Bottle]: Python Web Framework.



### Learning by example

#### Insert

	db.fruit.insert({"name": "apple", "color": "red", "shape": "round"})


#### Find

	db.collection.find().pretty()

	db.users.findOne({"username": "dwight"}, {"email": true, _id: false})

	db.scores.find({type: "essay", score: 50}, {student: true, _id: false})

	db.scores.find({score: {$gte: 50 , $lte: 60 }});

	db.users.find({name: {$gte: "F" , $lte: "Q" }});

	db.users.find({name: {$regex: "q"}, email: {$exists: true}})

	db.scores.find({$or: [{score: {$lt: 50}}, {score: {$gt: 90}}]})

	db.users.find({friends: {$all: ["Joe", "Bob"] }, favorites: {$in: ["running", "pickles"]}})

	db.catalog.find({price: {$gt: 10000}, "reviews.rating": {$gte: 5}})

	db.scores.find({type: "exam"}).sort({score: -1}).skip(50).limit(20)


#### Count

	db.scores.count({type: "essay", score: {$gt: 90}})


#### Update

	db.foo.update({_id:"Texas"}, {population:30000000})

	db.users.update({username: "splunker"}, {$set: {country: "RU"}})

	db.users.update({username: "jimmy"}, {$unset: {interests: 1}})

	db.friends.update({_id: "Mike"}, {$push: {interests: "skydiving"}});

	db.friends.update({_id: "Mike"}, {$pop: {interests: -1}});

	db.friends.update({_id: "Mike"}, {$addToSet: {interests: "skydiving"}});

	db.friends.update({_id: "Mike"}, {$pushAll: {interests: ["skydiving" , "skiing"]}});

	db.foo.update({username: 'bar'}, {$set: {'interests': ['cat', 'dog']}}, {upsert: true})

	db.scores.update({score: {$lt: 70}}, {$inc: {score: 20}}, {multi: true})


#### Remove

	db.collection.remove()

	db.collection.drop()

	db.scores.remove({score: {$lt: 60}})


#### LastError

	db.runCommand({getlasterror: 1})



[MongoDB]: http://www.mongodb.org/
[M101P: MongoDB for Developers (Python)]: https://education.10gen.com/courses/10gen/M101P/2013_Spring/about
[Mongo Hacker]: http://tylerbrock.github.com/mongo-hacker/
[PyMongo]: http://api.mongodb.org/python/current/
[Bottle]: http://bottlepy.org/
