	.section __DATA, __data

s0:	.asciz	"CPUID: 0x%.6X\n"
s1:	.asciz	"Largest basic function number implemented: 0x%.2X\n"
s2:	.asciz	"Vendor ID: %s\n"

	.section __TEXT, __text
	.align 16
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp,%rbp
	subq	$16,%rsp

	movl	$1,%eax
	cpuid

	movq	s0@GOTPCREL(%rip), %rdi
	movl	%eax,%esi
	xorl	%eax,%eax
	callq	_printf

	xorl	%eax,%eax
	cpuid

	movl	%ebx,0(%rsp)
	movl	%edx,4(%rsp)
	movl	%ecx,8(%rsp)

	movq	s1@GOTPCREL(%rip),%rdi
	movl	%eax,%esi
	xorl	%eax,%eax
	callq	_printf

	movq	s2@GOTPCREL(%rip),%rdi
	movq	%rsp,%rsi
	xorl	%eax,%eax
	callq	_printf

	movq	%rbp,%rsp
	popq	%rbp
	ret
