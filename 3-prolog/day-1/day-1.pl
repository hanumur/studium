
% Find some free Prolog tutorials
    % http://www.learnprolognow.org/
    % http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/contents.html


% A support forum (there are several)
    % 


% One online reference for the Prolog version you’re using
    % GNU Prolog. http://www.gprolog.org/


% Make a simple knowledge base. Represent some of your favorite books and authors.
book('Paul Auster', 'Moon Palace').
book('Paul Auster', 'The Book of Illusions').
book('Stefan Zweig', 'The World of Yesterday').


% Find all books in your knowledge base written by one author.
book('Paul Auster', Title).


% Make a knowledge base representing musicians and instruments.
musician('Sarah', 'Guitar').
musician('Mike', 'Piano').
musician('Erin', 'Guitar').
musician('David', 'Drums').


% Also represent musicians and their genre of music.
genre('Sarah', 'Pop').
genre('Mike', 'Classic').
genre('Erin', 'Folk').
genre('David', 'Rock').


% Find all musicians who play the guitar and folk songs.
musician_instrument_genre(Musician, Instrument, Genre) :- musician(Musician, Instrument), genre(Musician, Genre).
musician_instrument_genre(Name, 'Guitar', 'Folk').
