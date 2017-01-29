"""Main file of Julset"""

module JulSet

	function setpush!(S, s)
		"""A special function for adding elements to arrays that treats them as sets 
		so pushing won't result in repeated elements"""
		
		
		# if s not in A
		if !(s in S)
			push!(S, s)
		end
	end


	function productset(A,B)
		"""Returns the product set as defined by: AxB = {<a,b>: aeA, beB}"""
		
		ps = []
		
		for a in A
			for b in B
				push!(ps, [a,b])
			end
		end
		
		return ps
	end


	function union_to_subset(e, T)
		"""Adds the element e to each subset in the set T. This is used in the powerset algorithm"""
		
		for s in T
			setpush!(s, e)
		end
		
		return T
	end


	function powerset(S)
		"""Returns the set of all subsets of S. Recursive algorithm"""
		
		if S == []
			return [[]]
		else
			e = S[length(S)]
			T = setdiff(S, [e])
			return union(powerset(T), union_to_subset(e, powerset(T)))
		end
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
			setpush!(inverse, reverse(e))
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


	function is_function(f)
		"""Returns true if the relation R is function by the vertical line test"""
		
		for e in f
			for p in f
				if (e[1]==p[1])&&(p != e)
					return false
				end
			end
		end
		
		return true
	end


	function is_constant_function(f)
		"""Tests if the function is constant for all values in the domain"""
		
		
		C = f[1][2]
		
		for a in f
			if a[2]!=C
				return false
			end
		end
		
		return is_function(f)
	end


	function is_onetoone(f)
		"""Returns true if the function passes the horizontal line test"""
		
		for e in f
			for p in f
				if (e[2]==p[2])&&(p != e)
					return false
				end
			end
		end
		
		return is_function(f)
	end
	
	
	# exports
	export setpush!
	export productset
	export union_to_subset
	export powerset
	export is_relation
	export get_domain
	export get_range
	export get_inverse
	export identity_relation
	export is_reflexive
	export is_symmetric
	export is_transitive
	export is_equivalence_relation
	export equivalence_class
	export quotient_set
	export is_function
	export is_constant_function
	export is_onetoone

end
