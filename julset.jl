"""This is a Julia module that provides functions for set theory and other things"""


function setpush!(S, s)
	"""A special function for adding elements to arrays that treats them as sets 
	so pushing won't result in repeated elements"""
	
	
	# if s not in A
	if !(s in S)
		push!(S, s)
	end
end


function productset(A,B)
	"""Returns the product set (or power set) as defined by: AxB = {<a,b>: aeA, beB}"""
	
	ps = []
	
	for a in A
		for b in B
			push!(ps, [a,b])
		end
	end
	
	return ps
end


function is_relation(R, A, B)
	"""Returns true is R is a binary relation from A to B"""
	
	return issubset(R, productset(A,B))
end


function get_domain(R)
	"""Returns the domain of R as a set"""
	
	domain = []
	
	for e in R
		setpush!(domain, e[1])
	end
	
	return domain
end

function get_range(R)
	"""Returns the range of R as a set"""
	
	range = []
	
	for e in R
		setpush!(range, e[2])
	end
	
	return range
end


function get_inverse(R)
 """Returns the inverse of R as a set"""
 
	inverse = []
	
	for e in R
		setpush!(inverse, reverse(r))
	end
	
	return inverse
end


function identity_relation(A)
	"""Returns the identity set of A where {<a,a>: aeA}"""
	
	ir = []
	
	for e in productset(A,A)
		if e[1]==e[2]
			setpush!(ir, e)
		end
	end
	
	return ir
end


function is_reflexive(R,A)
	"""Returns true if for every aeA, <a,a>eR, R is a subset of AxA"""
	
	for a in A
		if !([a,a] in R)
			return false
		end
	end
	
	return true
end


function is_symmetric(R,A)
	"""Returns true if <a,b>eR, then <b,a>eR, R is a subset of AxA"""
	
	for e in R
		if !([e[2],e[1]] in R)
			return false
		end
	end
	
	return true
end


function is_transitive(R,A)
	"""Returns true if <a,b>eR and <b,c>eR, then <a,c>eR, R is a subset of AxA"""
	
	for e in R
		ending_pairs = []
		for p in R
			if p[1]==e[2]
				setpush!(ending_pairs, p)
			end
		end
		
		for p in ending_pairs
			if !([e[1],p[2]] in R)
				return false
			end
		end
	end
	
	return true
end


function is_equivalence_relation(R,A)
	"""Returns true if the relation meets the following 3 axioms:

1: relation is reflexive
2: relation is symmetric
3: relation is transitive"""

	if is_reflexive(R,A)
		if is_symmetric(R,A)
			if is_transitive(R,A)
				return true
			end
		end
	end
	
	return false
end

function equivalence_class(a, A, R)
	"""Returns the equivalence class of an element, which is the set of all elements that a is related to.
It is required that R be an equivalence relation"""

	if a in A
		if is_equivalence_relation(R,A)
			eq_class = []
			for r in R
				if r[1]==a
					setpush!(eq_class, r[2])
				end
			end
			return eq_class
		end
	end
	return []
end


function quotient_set(R,A)
	"""Returns all the equivalence classes of a set A by a relation R"""
	
	quotient = []
	
	for a in A
		set_to_add = equivalence_class(a, A, R)
		setpush!(quotient, set_to_add)
	end
	
	return quotient
end


# TODO: Partition


function julset_test()
	"""Runs example tests for all module functions"""
	
	println()
	# product set
	A = [1,2,3]
	B = ['a', 'b']
	println("A = ", [1,2,3], " B = ", B)
	println("AxB = ", productset(A,B))
	
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
	
	# TODO: Partition testing
	
	
end
	
	