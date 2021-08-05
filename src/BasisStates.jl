# Defining orthonormal(orthogonal) computational basis states

"""
    zero_state = [1;0]

|0⟩ basis state as defined in terms of Quantum Computational Linear Algebra.

# Examples
```julia-repl
julia> zero_state
[1;
 0]
 ```
"""
zero_state = [1;0]

"""
    one_state = [0;1]

|1⟩ basis state as defined in terms of Quantum Computational Linear Algebra.

# Examples
```julia-repl
julia> one_state
[0;
 1]
 ```
"""
one_state = [0;1]


# Defining directional basis states

"""
    up_state = zero_state

Equivalent to the polarization of a bit pointing up.
"""
up_state = zero_state

"""
    down_state = one_state

Equivalent to the polarization of a bit pointing down.
"""
down_state = one_state

"""
    left_state = [1/sqrt(2);1/sqrt(2)]

Equivalent to the polarization of a bit pointing to the left.
"""
left_state = [1/sqrt(2);1/sqrt(2)]

"""
    right_state = [1/sqrt(2);-1/sqrt(2)]

Equivalent to the polarization of a bit pointing to the right.
"""
right_state = [1/sqrt(2);-1/sqrt(2)]

"""
    upright_state = [1/2;-sqrt(3)/2]

Equivalent to the polarization of a bit pointing up to the right.
"""
upright_state = [1/2;-sqrt(3)/2] 

"""
    downleft_state = [sqrt(3)/2;1/2]

Equivalent to the polarization of a bit pointing down to the left.
"""
downleft_state = [sqrt(3)/2;1/2]
