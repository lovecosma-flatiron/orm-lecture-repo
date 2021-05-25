
#When creating the class, first create crud functionality for the table itself using class methods.

-TABLE / CLASS METHODS
    - C .create_table (CREATE TABLE)
    - R .view_table (SELECT * FROM ), .find_by_id(id), .find_by_name(name), .find_by(hash)
    - U .alter_table (ALTER)
    - D .drop_table (DROP)


- ENTRIES/ROWS/INSTANCE METHODS
    - C .new / #save - INSERT INTO (gives instance @id, creates row in tables)
    - R  attr_accessor/readers  
    - U #update(attributes_has) (UPDATE SET)
    - D #drop (DELETE)