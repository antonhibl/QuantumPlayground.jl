# Defining orthonormal(orthogonal) computational basis states

# Zero Basis State
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

# One Basis State
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

# Up State
"""
    up_state = zero_state

Equivalent to the polarization of a bit pointing up.
"""
up_state = zero_state
# Down State
"""
    down_state = one_state

Equivalent to the polarization of a bit pointing down.
"""
down_state = one_state

# Left State
"""
    left_state = [1/sqrt(2);1/sqrt(2)]

Equivalent to the polarization of a bit pointing to the left.
"""
left_state = [1/sqrt(2);1/sqrt(2)]

# Right State
"""
    right_state = [1/sqrt(2);-1/sqrt(2)]

Equivalent to the polarization of a bit pointing to the right.
"""
right_state = [1/sqrt(2);-1/sqrt(2)]

# Up-right State
"""
    upright_state = [1/2;-sqrt(3)/2]

Equivalent to the polarization of a bit pointing up to the right.
"""
upright_state = [1/2;-sqrt(3)/2] 

# Down-left State
"""
    downleft_state = [sqrt(3)/2;1/2]

Equivalent to the polarization of a bit pointing down to the left.
"""
downleft_state = [sqrt(3)/2;1/2]

#
