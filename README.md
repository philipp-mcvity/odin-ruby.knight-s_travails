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
