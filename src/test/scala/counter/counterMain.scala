package counter
import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.experimental.BundleLiterals._
import chisel3.tester._
import chisel3.tester.RawTester.test

class counterMain(c: Counter) extends PeekPokeTester(c) {

        poke(c.io.in, 0)     // Set our input to value 0
        expect(c.io.out, 0)  // Assert that the output correctly has 0
        poke(c.io.in, 1)     // Set our input to value 1
        expect(c.io.out, 1)  // Assert that the output correctly has 1
        poke(c.io.in, 2)     // Set our input to value 2
        expect(c.io.out, 2)  // Assert that the output correctly has 2
    println("SUCCESS!!") // Scala Code: if we get here, our tests passed!

//  }
}

object counterMainGen extends App {
        chisel3.iotesters.Driver.execute(args, () => new Counter(8))(c => new counterMain(c))
}

// 终于成功了啊, 哈哈哈
// 在sbt下输入  test:runMain counter.counterMainGen 来进行测试



// 参考如下代码
/*
object AdderTestGen extends App {
        chisel3.iotesters.Driver.execute(args, () => new Adder(8))(c => new AdderTest(c))
}

class AdderTest(c: Adder) extends PeekPokeTester(c) {
        val randNum = new Random
        for(i <- 0 until 10) {
                val a = randNum.nextInt(256)
                val b = randNum.nextInt(256)
                poke(c.io.a, a)
                poke(c.io.b, b)
                step(1)
                expect(c.io.s, (a + b) & 0xff)
                expect(c.io.cout, ((a + b) & 0x100) >> 8)
        }
}*/