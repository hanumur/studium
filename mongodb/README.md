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


### Index

    db.students.getIndexes()

    db.students.ensureIndex({class: 1, student_name: 1})

    db.students.ensureIndex({student_id: 1, class_id:1}, {unique:true})

    db.people.ensureIndex({title:1}, {sparse:1})

    db.people.find().sort({title: 1}).hint({$natural: 1})

    db.places.find({location: {$near: [74, 140]}}).limit(3)

    db.system.profile.find({millis: {$gt: 1000}}).sort({ts: -1})


### Aggregation

    db.products.aggregate([{$group: {"_id": "$category", "num_products": {"$sum": 1}}}])

    db.stuff.aggregate([{$group: {_id: {'moe': '$a', 'larry': '$b', 'curly': '$c'}}}])

    db.zips.aggregate([{$group: {_id: "$state", "population": {$sum: "$pop"}}}])

    db.zips.aggregate([{$group: {_id: "$state", "average_pop": {$avg: "$pop"}}}])

    db.zips.aggregate([{$group: {_id: "$city", postal_codes: {$addToSet: "$_id"}}}])

    db.zips.aggregate([{$group: {_id: "$state", "pop": {$max: "$pop"}}}])

    db.fun.aggregate([{$group: {_id: {a: "$a", b: "$b"}, c: {$max: "$c"}}}, {$group: {_id: "$_id.a", c: {$min: "$c"}}}])

    db.zips.aggregate([{$project: {_id: 0, city: {$toLower: "$city"}, pop: 1, state: 1, zip: "$_id"}}])

    db.zips.aggregate([{$match: {pop: {$gt: 100000}}}])

    db.zips.aggregate([{$sort: {state: 1, city: 1}}])

    db.fun.aggregate([
        {$match: {a: 0}},
        {$sort: {c: -1}}, 
        {$group: {_id: "$a", c: {$first: "$c"}}}
    ])



[MongoDB]: http://www.mongodb.org/
[M101P: MongoDB for Developers (Python)]: https://education.10gen.com/courses/10gen/M101P/2013_Spring/about
[Mongo Hacker]: http://tylerbrock.github.com/mongo-hacker/
[PyMongo]: http://api.mongodb.org/python/current/
[Bottle]: http://bottlepy.org/
