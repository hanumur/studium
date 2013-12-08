### Architecture

I think that the best way to create good system and applications
is using a kind of Hexagonal Architecture, DCI (Data, Context, Interaction)
or EBI (Entity, Boundary, Interactor) architecture.

This architecture produce a system that are:
- The system should be independent of frameworks, does not depend on the
existence of some library and could be replace any part of the system easily.
- The business rule can be testable independently other elements
like UI, database, web server, etc...
- Independent of UI.
- Independent of database, using repository pattern.
- Independent of external dependencies.
- Extensible or open to modification.


### Technology Stack

This application need to store and search images. I think that the
technology stack could be a relational database like MySQL or PostgreSQL
and ImageMagick for image processing.

Store the pictures on the file system and picture's location, category, title,
description in the database that also manages the user authentication.

With the architecture approach previously described,
these things should be only details of the system.


### Methodology

Is there a better way to build software that is not agile?

The methodology could be very adapttive (Scrum/Kanban) and depends
on many factors but ideally small iteration, test-driven development,
pair programming, continuous integration, continuous deployment.
