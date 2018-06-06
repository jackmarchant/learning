# Collection Concurrency
Concurrency is when multiple instructions execute at the same time (concurrently)
It could be in: 
- __Multple Threads__
Executing within a single process. Race conditions may occur.
- __Multiple Processes__
On a single system could be accessing a common file.
- __Multiple Systems__
could be accessing a common resource such as a table in a database.

An example of single-threaded execution is a queue processing jobs one at a time. 
An example of multi-threaded execution is when a queue could process many jobs at the same time.
Race conditions might exist where a multi-threaded execution of processing a queue might access the queue at the same time.

## Caller Synchronisation
The collection makes no effort to be thread safety, to make sure there's no extra overhead on the collection type.
Some type of lock (e.g. monitor or mutex) can be used to synchronise.
__Pros__
- Non-threadsafe collections can safely be used in multi-threaded environment
__Cons__
- Callers are responsible for locking
- Readers will block other readers

Lock should only take as long as checking the count and dequeuing an item. Check the count twice, once outside the lock and once inside, to verify count has not changed since locking. When outside of the lock scope you can then process the item that was dequeued, rather than inside the lock. This is called double-check locking.

## Monitor Synchronisation
Locking can be done at the method level of the collection.
__Pros__
- Caller does not need to be responsible for locking
- Readers will not block other readers
__Cons__
- Deceptively safe because there could be other concurrency issues.

## Reader Writer Lock Synchronisation
Done at the method level
__Pros__
- Readers do not block other readers
- Caller doesn't need to implement locking
__Cons__
- More overhead than monitor
- Deceptively safe, like monitoring