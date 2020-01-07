# Ruby Enumerable methods
A comprehensive rebuild on basic Enumerable methods in Ruby for a better understanding in block passing, enumerator and classes and regular expressions as arguments.


### This scripts rebuilds ruby Enumerable methods:

- #each as #my_each
- #each_with_index as #my_each_with_index
- #select as #my_select
- #all? as #my_all?
- #any? as #my_any?
- #none? as #my_none?
- #count as #my_count
- #map as #my_map
- #inject as #my_inject

each of them can be used as default Enumerable methods working the exact same way

## Rspec testing for all methods, check (./spec/enumerable_spec.rb) .
### Rspec test cases:
 1. #my_each with no block passed returns an enumerator
 2. #my_each with block passed do a loop routine
 3. #my_each_with_index with no block passed returns an enumerator
 4. #my_each_with_index with block passed counts index elements
 5. #my_select with no block passed returns an enumerator
 6. #my_each with block passed returns an Array
 7. #my_each with block passed returns an even number array
 8. #my_each with block passed fails an .odd? on array
 9. #my_all? with no block passed returns true
 10. #my_all? with block passed returns true
 11. #my_all? with block passed returns true
 12. #my_all? with block passed returns false
 13. #my_all? with regexp passed returns false
 14. #my_all? with class passed returns true
 15. #my_any? with no block passed returns true
 16. #my_any? with block passed returns true
 17. #my_any? with block passed returns false
 18. #my_any? with block passed returns false
 19. #my_any? with regexp passed returns not true
 20. #my_any? with class passed returns true
 15. #my_none? with no block passed returns false
 16. #my_none? with block passed returns false
 17. #my_none? with block passed returns true
 18. #my_none? with block passed returns not true
 19. #my_none? with regexp passed returns true
 20. #my_none? with class passed returns true
 21. #my_count with no block passed returns number of elements in an array
 22. #my_count with block passed returns number of .even? elements
 23. #my_count with block passed returns number of .odd? elements
 24. #my_count with block passed returns number of x > 5 elements
 25. #my_count with argument passed returns number of element repetition
 26. #my_map with no block passed returns an Enumerator
 27. #my_map with block passed returns a modified array
 28. #my_map with block passed returns a parsed array
 29. #my_inject with block passed returns an array sum
 30. #my_inject with block passed returns a parsed array
 

## Check out the project specification here: https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks#additional-resources

### Testing project specification can be found at : https://www.theodinproject.com/courses/ruby-programming/lessons/testing-your-ruby-code

Coded by Eduardo 'Usagi' Bonilla:
[GitHub](https://www.github.com/UsagiB)
Testing by Ko Nyan:
[GitHub](https://github.com/konyan)
