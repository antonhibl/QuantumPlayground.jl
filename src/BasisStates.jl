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
up_state = zero_state
down_state = one_state
left_state = [1/sqrt(2);1/sqrt(2)]
right_state = [1/sqrt(2);-1/sqrt(2)]
upright_state = [1/2;-sqrt(3)/2] 
downleft_state = [sqrt(3)/2;1/2]