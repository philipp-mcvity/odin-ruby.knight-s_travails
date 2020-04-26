### The Odin Project
#### Ruby
[##### Project: Knight’s Travails (Project 2)](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms)

remarks:
  1) for the sake of moving from the Knight's current position, the target parameter comes before start, which has a default parameter:
  ```ruby
  def knight_moves(target, start = (no_start = true))
    # code
  end
  ```
  2) there is some stuff not in use yet, like the board, it's not yet interconnected with the knight piece on it. It was build for some testing for the upcoming chess project and left in there

  3) hopefully the garbage collection takes good care of all these knights...

    > I noticed that huge amounts of Knight objects are created by running knight_moves, and therefore I tried to understand if these objects are dumped to garbage immediately afterwards or remain somewhere. At first I figured that running Knight.all.size right after running the function is not informative about whether garbage collection is handling this or not. I added an additional function which checked the queue each iteration if it already includes an element with the final target in its possible_moves list, and if so, moves this element to queue[0]. That would make it the next move to be handled by the function itself and therefore end it. By this, the amount of created Knight objects was reduced by a significant amount, from up to a few thousand to less than one or two dozen. I then benchmarked the function, with and without queue-shortcut, 100 times each. I learned two things: First, it takes significantly longer to check the queue each iteration, that only reduces the number of created objects. And above all second: By running Knight.all.size before and after running the function 100 times in the benchmark, I learned that there's the same (or twice the) amount of created Knight-objects after running the function 100 times, as by running it once. Now I understand that the garbage collection takes good care of all these knights! :) Anyway, I should at least 'uniq' the queue.


  4. having learned: optimization
  I reintroduced the queue-manipulation as
  ```ruby
  def def clean_queue(queue, target, new_objects)
    # only reviews the targets of newly added objects!
    # moves the first found element with the target as possible_move to queue[0]
    # removes all objects with duplicate coordinates
  end
  ```
  This is significantly the fastest approach, and as well the one with the least created objects.
