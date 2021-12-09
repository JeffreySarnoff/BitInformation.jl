module BitInformation

    export shave, set_one, groom, halfshave, 
        shave!, set_one!, groom!, halfshave!, round!

    export bittranspose, bitbacktranspose,
        xor_delta, unxor_delta, xor_delta!, unxor_delta!,
        signed_exponent
    
    export bitinformation, mutual_information, redundancy, bitpattern_entropy,
        bitcount, bitcount_entropy, bitpaircount, bit_condprobability,
        bit_condentropy

    import StatsBase.entropy

    include("which_uint.jl")
    include("bitstring.jl")
    include("bittranspose.jl")
    include("round_nearest.jl")
    include("shave_set_groom.jl")
    include("xor_delta.jl")
    include("signed_exponent.jl")
    include("bit_information.jl")
    include("mutual_information.jl")
    include("bitpattern_entropy.jl")
    include("binomial.jl")

end
