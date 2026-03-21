	.arch armv8-a
	.file	"main.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	wzr, [sp, 12]
	str	wzr, [sp, 16]
	str	wzr, [sp, 20]
	str	wzr, [sp, 24]
	str	wzr, [sp, 28]
	ldr	w1, [sp, 16]
	ldr	w0, [sp, 20]
	add	w0, w1, w0
	str	w0, [sp, 12]
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 28]
	sub	w0, w1, w0
	str	w0, [sp, 24]
	mov	w0, 0
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
