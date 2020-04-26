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
    > *I noticed that a huge amount of objects was created by running knight_moves, and therefore I tried to understand if these objects are dumped to garbage immediately afterwards or remain somewhere. At first I figured that running Knight.all.size right after running the function is not informative about whether garbage collections is handling this. I added an additional function which checked the queue each iteration if it already includes an element with the final target in its possible moves list, and if so, placed the affected element in front of the queue. That would make it the next element to be handled by the function and therefore end it. By this, the amount of created Knight-objects was reduced by a significant amount, from up to a few thousand to less than one or two dozen. I then benchmarked the function, with and without queue-shortcut, 100 times each. I learned two things: First, it takes significantly longer to check the queue each iteration, it just reduces the number of created objects. And above all second: By running Knight.all.size before and after running the function 100 times in the benchmark, I learned that there's the same (or twice the) amount of created Knight-objects after running the function 100 times, as by running it once. Now I understand that the garbage collection takes good care of all these knights :)*
