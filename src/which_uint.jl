function whichUInt(n::Integer)
    n == 8 && return UInt8
    n == 16 && return UInt16
    n == 32 && return UInt32
    n == 64 && return UInt64
    throw(error("Only n=8,16,32,64 bits supported."))
end

whichUInt(::Type{T}) where T = whichUInt(sizeof(T)*8)

# define the uints for various formats
Base.uinttype(::Type{UInt8}) = UInt8
Base.uinttype(::Type{UInt16}) = UInt16
Base.uinttype(::Type{UInt32}) = UInt32
Base.uinttype(::Type{UInt64}) = UInt64

Base.uinttype(::Type{Int8}) = UInt8
Base.uinttype(::Type{Int16}) = UInt16
Base.uinttype(::Type{Int32}) = UInt32
Base.uinttype(::Type{Int64}) = UInt64

