# Defining orthonormal(orthogonal) computational basis states

# Zero Basis State
"""
    zero = [1;0]

|0⟩ basis state for a qubit of information.

# Examples
```julia-repl
julia> zero
[1;
 0]
 ```
"""
zero = [1;0]

# One Basis State
"""
    one = [0;1]

|1⟩ basis state for a qubit of information.

# Examples
```julia-repl
julia> one
[0;
 1]
 ```
"""
one = [0;1]


# Defining directional basis states

# Up State
"""
    up = zero

Equivalent to the polarization of a bit pointing up.
"""
up = zero
# Down State
"""
    down = one

Equivalent to the polarization of a bit pointing down.
"""
down = one

# Left State
"""
    left = [1/√(2);1/√(2)]

Equivalent to the polarization of a bit pointing to the left.
"""
left = [1/√(2);1/√(2)]

# Right State
"""
    right = [1/√(2);-1/√(2)]

Equivalent to the polarization of a bit pointing to the right.
"""
right = [1/√(2);-1/√(2)]

# Up-right State
"""
    upright = [1/2;-√(3)/2]

Equivalent to the polarization of a bit pointing up to the right.
"""
upright = [1/2;-√(3)/2] 

# Down-left State
"""
    downleft = [√(3)/2;1/2]

Equivalent to the polarization of a bit pointing down to the left.
"""
downleft = [√(3)/2;1/2]
