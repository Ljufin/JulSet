# JulSet
This module provides several functions for set theory.
An important thing to note is that the sets used here are not the set type
defined by Julia. This modules uses one-dimensional Julia arrays, mostly for the ability
to use nested sets, a feature that the set type does not support.
A list of functions are as follows:

# setpush!
A special function for adding elements to arrays that treats them as sets so that pushing 
won't result in repeated elements

# productset
Returns the product set (or power set) as defined by: AxB = {(a,b): aeA, beB}

# is_relation
Returns true if R is a binary relation from A to B

# get_domain
Returns the domain of R as a set

# get_range
Returns the range of R as a set

# get_inverse
Returns the inverse of R as a set

# identity_relation
Returns the identity set of A where {(a,a): aeA}

# is_reflexive
Returns true if for every aeA, (a,a)eR, R is a subset of AxA

# is_symmetric
Returns true if (a,b)eR, then (b,a)eR, R is a subset of AxA

# is_transitive
Returns true if (a,b)eR and (b,c)eR, then (a,c)eR, R is a subset of AxA

# is_equivalence_relation
Returns true if the relation meets the following 3 axioms:
1: relation is reflexive
2: relation is symmetric
3: relation is transitive

# equivalence_class
Returns the equivalence class of an element, which is the set of all elements that a is 
related to. It is required that R be an equivalence relation

# quotient_set
Returns all the equivalence classes of a set A by a relation R

# julset_test
Runs example tests for all module functions

# is_function
Returns true if the relation R is function by the vertical line test

# is_constant_function
Tests if the function is constant for all values in the domain

# is_onetoone
Returns true if the function passes the horizontal line test