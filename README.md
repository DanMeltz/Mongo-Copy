Mongo-Copy
==========

Need to copy a DB from one Mongo instance to another? I've just saved you *tens of seconds* of work.

There are actually two scripts here. 

### `mongo-db-copy-tool.sh`

This is the main script.  It takes a Mongo dump (obligatory giggle) from one Mongo DB instance. 
Then it copies that dump to a different instance. It has default setting (currently set to localhost)
so that you can just run it without parameters if you are using it often (like I do).

### `take-a-mongo-dump.sh`

This just takes a Mongo dump (*still* hilarious!) and names it according to the current date and time.