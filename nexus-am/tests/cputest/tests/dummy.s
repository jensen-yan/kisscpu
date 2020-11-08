	.file	"dummy.c"
	.option nopic
	.text
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
