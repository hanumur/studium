# Planning and Architecture

This section is to test your ability to plan a small project and
architect the system and data store.  What follows is a basic brief for
a simple asset management system.

What we would like to see is the process you would go through when
designing and architecting the system. No code is required, although
feel free to include assets such as database schemas or other supporting
material.  We want to know things like how you would implement the
search, what methods of image manipulation could be used etc.  We also
want to know what sort of development methodology you'd use and so on.

Keep in mind that this is a currently a simple system that doesn't have
an endless budget, and will need to be maintained by a number of
different people.  You should be looking to design a maintainable,
responsive (in terms of the load, wait times etc) and extensible system.

The system should be a small file repository to allow shared access to a
number of different assets such as images, Microsoft Excel and Word
files, and Adobe Acrobat PDFs.

There are a number of users who access the system using their email
address and password. Each user can either browse through the assets by
category, or search based on title, keywords or description. The user
can choose to download assets directly to their computer: there is no
"shopping cart" functionality.

For the case of images, users should have the option to download the
image at a size of their choosing. For example, is a hi-res image is
uploaded, the user should be able to choose that they want to receive a
640x480 image back. The system should deliver a resized version to the
user while retaining the original.

New assets can be uploaded by any user. Once uploaded, the asset can be
assigned to one or more categories (the user can create new categories,
in a style of your choice).  The asset will also have an amount of
arbitrary metadata such as title, keywords and description, each of
which are user entered.
