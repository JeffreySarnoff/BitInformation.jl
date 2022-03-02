@testset "Bitcount" begin
    @test bitcount(UInt8[1,2,4,8,16,32,64,128]) == ones(8)
    @test bitcount(collect(0x0000:0xffff)) == 2^15*ones(16)

    N = 100_000
    c = bitcount(rand(N))
    @test c[1] == 0         # sign always 0
    @test c[2] == 0         # first expbit always 0, i.e. U(0,1) < 1
    @test c[3] == N         # second expont always 1

    @test all(isapprox.(c[15:50],N/2,rtol=1e-1))
end

@testset "Bitcountentropy" begin

    # test the PRNG on uniformity
    N = 100_000
    H = bitcount_entropy(rand(UInt8,N))
    @test all(isapprox.(H,ones(8),rtol=5e-4))

    H = bitcount_entropy(rand(UInt16,N))
    @test all(isapprox.(H,ones(16),rtol=5e-4))

    H = bitcount_entropy(rand(UInt32,N))
    @test all(isapprox.(H,ones(32),rtol=5e-4))

    H = bitcount_entropy(rand(UInt64,N))
    @test all(isapprox.(H,ones(64),rtol=5e-4))

    # also for random floats
    H = bitcount_entropy(rand(N))
    @test H[1:5] == zeros(5)    # first bits never change
    @test all(isapprox.(H[16:55],ones(40),rtol=1e-4))
end