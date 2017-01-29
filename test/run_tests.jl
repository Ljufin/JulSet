"""This file will be used for loading different tests"""

using JulSet

function tests()
	"""Runs example tests for all module functions"""
	
	println()
	# product set
	A = [1,2,3]
	B = ['a', 'b']
	println("A = ", [1,2,3], " B = ", B)
	println("AxB = ", productset(A,B))
	
	# powerset
	println()
	A = [1,2,3]
	println("A = ", A)
	println("Powerset(A) = ", powerset(A))
	
	println()
	# is_relation
	"""R = [['a',2],['b',3]]
	println("R = ", R)
	println("is_relation(R,A,B) = ", is_relation(R,A,B))"""
	R = [[1,'a'],[3,'b']]
	println("R = ", R)
	println("is_relation(R,A,B) = ", is_relation(R,A,B))
	
	println()
	# range and domain
	println("Domain = ", get_domain(R), " Range = ", get_range(R))
	
	println()
	# inverse
	println("Inverse = ", get_inverse(R))
	
	println()
	# identity relation
	println("A = ", A)
	println("Identity relation = ", identity_relation(A))
	
	println()
	# is_reflexive
	R = [[1,1],[2,2], [2,1], [3,3]]
	println("R = ", R, " A = ", A)
	println("is_reflexive(R,A) = ", is_reflexive(R,A))
	R = [[1,1], [2,1], [3,3]]
	println("R = ", R, " A = ", A)
	println("is_reflexive(R,A) = ", is_reflexive(R,A))
	
	println()
	# is_symmetric
	R = [[1,2], [2,1]]
	println("R = ", R, " A = ", A)
	println("is_symmetric(R,A) = ", is_symmetric(R,A))
	R = [[1,2], [2,1], [1,3]]
	println("R = ", R, " A = ", A)
	println("is_symmetric(R,A) = ", is_symmetric(R,A))
	
	println()
	# is_transitive
	R = [[1,2],[2,3], [1,3]]
	println("R = ", R, " A = ", A)
	println("is_transitive(R,A) = ", is_transitive(R,A))
	R = [[1,2],[2,3], [1,3], [3,2]]
	println("R = ", R, " A = ", A)
	println("is_transitive(R,A) = ", is_transitive(R,A))
	
	println()
	# is_equivalence_relation
	R = [[1,1],[2,2],[3,3],[2,3],[3,2]]
	println("R = ", R, " A = ", A)
	println("is_equivalence_relation(R,A) = ", is_equivalence_relation(R,A))
	R = [[1,1],[2,2],[3,3],[2,3]]
	println("R = ", R, " A = ", A)
	println("is_equivalence_relation(R,A) = ", is_equivalence_relation(R,A))
	
	println()
	# equivalence_class
	R = [[1,1],[2,2],[3,3],[2,3],[3,2]]
	a = 2
	println("a = ", a, " R = ", R, " A = ", A)
	println("Equivalence class(a,A,R) = ", equivalence_class(a,A,R))
	a = 3
	println("a = ", a, " R = ", R, " A = ", A)
	println("Equivalence class(a,A,R) = ", equivalence_class(a,A,R))
	
	println()
	# quotient_set
	println("R = ", R, " A = ", A)
	println("Quotient set = " , quotient_set(R,A))
	
	
	# is_function
	println()
	f = [[-2,4],[-1,1],[0,0],[1,1],[2,4]]
	println("f = ", f)
	println("is_function(f) = ", is_function(f))
	f = [[-2,4],[-1,1],[0,0],[1,1],[2,4],[0,4]]
	println("f = ", f)
	println("is_function(f) = ", is_function(f))
	
	
	# is_constant_function
	println()
	f = [[0,2],[1,2],[2,2],[3,2],[4,2]]
	println("f = ", f)
	println("is_constant_function(f) = ", is_constant_function(f))
	f = [[-2,4],[-1,1],[0,0],[1,1],[2,4]]
	println("f = ", f)
	println("is_constant_function(f) = ", is_constant_function(f))
	
	# is_onetoone
	println()
	f = [[0,0],[1,1],[2,2],[3,3]]
	println("f = ", f)
	println("is_onetoone(f) = ", is_onetoone(f))
	f = [[0,2],[1,2],[2,2],[3,2],[4,2]]
	println("f = ", f)
	println("is_onetoone(f) = ", is_onetoone(f))
	
	
end

tests()
