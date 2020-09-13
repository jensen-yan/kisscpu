package hello
import chisel3._

class HelloWorld extends Module{
  val io = IO(new Bundle{})
  printf("Hello World\n")
}

object HelloWorld extends App{
  chisel3.Driver.execute(args, () => new HelloWorld)
}
