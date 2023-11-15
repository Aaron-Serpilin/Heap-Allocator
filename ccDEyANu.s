	.file	"tests.c"
	.text
.Ltext0:
	.file 0 "/code" "test_framework/tests.c"
	.type	test_heap_fill, @function
test_heap_fill:
.LFB60:
	.file 1 "test_framework/tests.c"
	.loc 1 389 1 view -0
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 390 5 view .LVU1
.LVL0:
	.loc 1 391 5 view .LVU2
	.loc 1 392 5 view .LVU3
	.loc 1 392 44 is_stmt 0 view .LVU4
	movq	max_brk_size(%rip), %rax
	.loc 1 392 18 view .LVU5
	movq	%rax, %rbp
	shrq	$6, %rbp
.LVL1:
	.loc 1 393 5 is_stmt 1 view .LVU6
	.loc 1 395 5 view .LVU7
	.loc 1 395 43 is_stmt 0 view .LVU8
	movl	$1, checked_alloc_disable_integrity_check(%rip)
	.loc 1 396 5 is_stmt 1 view .LVU9
.LVL2:
	.loc 1 396 19 view .LVU10
	cmpq	$63, %rax
	jbe	.L2
	.loc 1 396 12 is_stmt 0 view .LVU11
	movl	$0, %ebx
.LVL3:
.L3:
	.loc 1 397 9 is_stmt 1 discriminator 3 view .LVU12
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL4:
	.loc 1 396 34 discriminator 3 view .LVU13
	addq	$1, %rbx
.LVL5:
	.loc 1 396 19 discriminator 3 view .LVU14
	cmpq	%rbx, %rbp
	ja	.L3
.LVL6:
.L2:
	.loc 1 398 5 view .LVU15
	.loc 1 398 43 is_stmt 0 view .LVU16
	movl	$0, checked_alloc_disable_integrity_check(%rip)
	.loc 1 399 1 view .LVU17
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL7:
	.loc 1 399 1 view .LVU18
	ret
	.cfi_endproc
.LFE60:
	.size	test_heap_fill, .-test_heap_fill
	.type	test_malloc_orders, @function
test_malloc_orders:
.LFB44:
	.loc 1 54 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 55 5 view .LVU20
.LVL8:
	.loc 1 56 5 view .LVU21
	.loc 1 57 5 view .LVU22
	.loc 1 57 27 view .LVU23
	.loc 1 57 16 is_stmt 0 view .LVU24
	movl	$0, %ebx
	.loc 1 58 9 view .LVU25
	movl	$1, %ebp
.LVL9:
.L7:
	.loc 1 58 9 is_stmt 1 discriminator 3 view .LVU26
	movq	%rbp, %rdi
	movl	%ebx, %ecx
	salq	%cl, %rdi
	call	checked_alloc@PLT
.LVL10:
	.loc 1 57 45 discriminator 3 view .LVU27
	addl	$1, %ebx
.LVL11:
	.loc 1 57 27 discriminator 3 view .LVU28
	cmpl	$26, %ebx
	jne	.L7
	.loc 1 59 1 is_stmt 0 view .LVU29
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL12:
	.loc 1 59 1 view .LVU30
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE44:
	.size	test_malloc_orders, .-test_malloc_orders
	.type	test_malloc_simple, @function
test_malloc_simple:
.LFB42:
	.loc 1 37 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 38 5 view .LVU32
	movl	$1, %edi
	call	checked_alloc@PLT
.LVL13:
	.loc 1 39 5 view .LVU33
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL14:
	.loc 1 40 5 view .LVU34
	movl	$128, %edi
	call	checked_alloc@PLT
.LVL15:
	.loc 1 41 5 view .LVU35
	movl	$4096, %edi
	call	checked_alloc@PLT
.LVL16:
	.loc 1 42 5 view .LVU36
	movl	$4097, %edi
	call	checked_alloc@PLT
.LVL17:
	.loc 1 43 1 is_stmt 0 view .LVU37
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	test_malloc_simple, .-test_malloc_simple
	.type	test_malloc_zero, @function
test_malloc_zero:
.LFB43:
	.loc 1 46 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 47 5 view .LVU39
	call	test_malloc_simple
.LVL18:
	.loc 1 48 5 view .LVU40
	movl	$0, %edi
	call	checked_alloc@PLT
.LVL19:
	.loc 1 49 5 view .LVU41
	movl	$0, %edi
	call	checked_alloc@PLT
.LVL20:
	.loc 1 50 5 view .LVU42
	call	test_malloc_simple
.LVL21:
	.loc 1 51 1 is_stmt 0 view .LVU43
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	test_malloc_zero, .-test_malloc_zero
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"test_framework/tests.c"
.LC1:
	.string	"num_brk_increase_calls < 8"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Assertion \"%s\" at %s:%d failed: Calls to brk not batched, got %lu brk increases for %zu allocations\n"
	.text
	.type	test_batch, @function
test_batch:
.LFB54:
	.loc 1 261 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 261 1 is_stmt 0 view .LVU45
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	.loc 1 262 5 is_stmt 1 view .LVU46
.LVL22:
	.loc 1 263 5 view .LVU47
	.loc 1 263 18 is_stmt 0 view .LVU48
	movq	$1, (%rsp)
	movq	$8, 8(%rsp)
	movq	$16, 16(%rsp)
	movq	$32, 24(%rsp)
	.loc 1 264 5 is_stmt 1 view .LVU49
	.loc 1 266 5 view .LVU50
.LVL23:
	.loc 1 266 19 view .LVU51
	.loc 1 263 18 is_stmt 0 view .LVU52
	movl	$32, %r12d
	leaq	32(%rsp), %rbp
	jmp	.L15
.LVL24:
.L22:
	.loc 1 266 39 is_stmt 1 discriminator 2 view .LVU53
	.loc 1 266 19 discriminator 2 view .LVU54
	subq	$1, %r12
.LVL25:
	.loc 1 266 19 is_stmt 0 discriminator 2 view .LVU55
	je	.L17
.LVL26:
.L15:
	.loc 1 267 23 is_stmt 1 view .LVU56
	movq	%rsp, %rbx
.LVL27:
.L16:
	.loc 1 268 13 discriminator 3 view .LVU57
	movq	(%rbx), %rdi
	call	checked_alloc@PLT
.LVL28:
	.loc 1 267 29 discriminator 3 view .LVU58
	.loc 1 267 23 discriminator 3 view .LVU59
	addq	$8, %rbx
	cmpq	%rbp, %rbx
	jne	.L16
	jmp	.L22
.L17:
	.loc 1 270 5 view .LVU60
	.loc 1 270 5 view .LVU61
	movq	num_brk_increase_calls(%rip), %rax
	cmpq	$7, %rax
	ja	.L23
	.loc 1 273 1 is_stmt 0 view .LVU62
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L24
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL29:
	.loc 1 273 1 view .LVU63
	ret
.LVL30:
.L23:
	.cfi_restore_state
	.loc 1 270 5 is_stmt 1 discriminator 1 view .LVU64
	.loc 1 270 5 discriminator 1 view .LVU65
.LBB46:
.LBI46:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 103 1 discriminator 1 view .LVU66
.LBB47:
	.loc 2 105 3 discriminator 1 view .LVU67
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU68
	pushq	$128
	.cfi_remember_state
	.cfi_def_cfa_offset 88
	pushq	%rax
	.cfi_def_cfa_offset 96
	movl	$270, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC1(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL31:
	.loc 2 105 10 discriminator 1 view .LVU69
.LBE47:
.LBE46:
	.loc 1 270 5 is_stmt 1 discriminator 1 view .LVU70
	movl	$1, %edi
	call	orig_exit@PLT
.LVL32:
.L24:
	.cfi_restore_state
	.loc 1 273 1 is_stmt 0 view .LVU71
	call	__stack_chk_fail@PLT
.LVL33:
	.cfi_endproc
.LFE54:
	.size	test_batch, .-test_batch
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"tmp == gen1[dealloc_order[4 - i]]"
	.align 8
.LC4:
	.string	"Assertion \"%s\" at %s:%d failed: Expected allocation %d to go in slot %d (%p), got %p\n"
	.text
	.type	test_locality, @function
test_locality:
.LFB57:
	.loc 1 299 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$80, %rsp
	.cfi_def_cfa_offset 112
	.loc 1 299 1 is_stmt 0 view .LVU73
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	.loc 1 300 5 is_stmt 1 view .LVU74
	.loc 1 300 15 is_stmt 0 view .LVU75
	movl	$0, (%rsp)
	movl	$4, 4(%rsp)
	movl	$3, 8(%rsp)
	movl	$1, 12(%rsp)
	movl	$2, 16(%rsp)
	.loc 1 301 5 is_stmt 1 view .LVU76
	.loc 1 302 5 view .LVU77
	.loc 1 304 5 view .LVU78
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL34:
	.loc 1 305 5 view .LVU79
	.loc 1 305 19 view .LVU80
	leaq	32(%rsp), %rbx
	leaq	72(%rsp), %rbp
.LVL35:
.L26:
	.loc 1 306 9 discriminator 3 view .LVU81
	.loc 1 306 19 is_stmt 0 discriminator 3 view .LVU82
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL36:
	.loc 1 306 17 discriminator 3 view .LVU83
	movq	%rax, (%rbx)
	.loc 1 307 9 is_stmt 1 discriminator 3 view .LVU84
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL37:
	.loc 1 305 25 discriminator 3 view .LVU85
	.loc 1 305 19 discriminator 3 view .LVU86
	addq	$8, %rbx
.LVL38:
	.loc 1 305 19 is_stmt 0 discriminator 3 view .LVU87
	cmpq	%rbp, %rbx
	jne	.L26
	movq	%rsp, %rbp
	leaq	20(%rsp), %r12
	.loc 1 305 19 view .LVU88
	movq	%rbp, %rbx
.LVL39:
.L27:
	.loc 1 311 9 is_stmt 1 discriminator 3 view .LVU89
	movslq	(%rbx), %rax
	movq	32(%rsp,%rax,8), %rdi
	call	checked_free@PLT
.LVL40:
	.loc 1 310 25 discriminator 3 view .LVU90
	.loc 1 310 19 discriminator 3 view .LVU91
	addq	$4, %rbx
.LVL41:
	.loc 1 310 19 is_stmt 0 discriminator 3 view .LVU92
	cmpq	%r12, %rbx
	jne	.L27
	.loc 1 313 12 view .LVU93
	movl	$0, %ebx
.LVL42:
.L29:
	.loc 1 314 9 is_stmt 1 view .LVU94
	.loc 1 314 15 is_stmt 0 view .LVU95
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL43:
	.loc 1 315 9 is_stmt 1 view .LVU96
	.loc 1 315 9 view .LVU97
	movl	16(%rbp), %edx
	movslq	%edx, %rcx
	movq	32(%rsp,%rcx,8), %rcx
	cmpq	%rax, %rcx
	jne	.L35
	.loc 1 315 9 discriminator 2 view .LVU98
	.loc 1 315 9 discriminator 2 view .LVU99
	.loc 1 313 25 discriminator 2 view .LVU100
	addl	$1, %ebx
.LVL44:
	.loc 1 313 19 discriminator 2 view .LVU101
	subq	$4, %rbp
	cmpl	$5, %ebx
	jne	.L29
	.loc 1 319 1 is_stmt 0 view .LVU102
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
.LVL45:
	.loc 1 319 1 view .LVU103
	jne	.L36
	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL46:
	.loc 1 319 1 view .LVU104
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.LVL47:
.L35:
	.cfi_restore_state
	.loc 1 315 9 is_stmt 1 discriminator 1 view .LVU105
	.loc 1 315 9 discriminator 1 view .LVU106
.LBB48:
.LBI48:
	.loc 2 103 1 discriminator 1 view .LVU107
.LBB49:
	.loc 2 105 3 discriminator 1 view .LVU108
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU109
	pushq	%rax
	.cfi_def_cfa_offset 120
	pushq	%rcx
	.cfi_def_cfa_offset 128
	pushq	%rdx
	.cfi_def_cfa_offset 136
	pushq	%rbx
	.cfi_def_cfa_offset 144
	movl	$315, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC3(%rip), %rcx
	leaq	.LC4(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL48:
	.loc 2 105 10 discriminator 1 view .LVU110
	call	__fprintf_chk@PLT
.LVL49:
	.loc 2 105 10 discriminator 1 view .LVU111
.LBE49:
.LBE48:
	.loc 1 315 9 is_stmt 1 discriminator 1 view .LVU112
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	movl	$1, %edi
	call	orig_exit@PLT
.LVL50:
.L36:
	.loc 1 319 1 is_stmt 0 view .LVU113
	call	__stack_chk_fail@PLT
.LVL51:
	.cfi_endproc
.LFE57:
	.size	test_locality, .-test_locality
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"buf >= bigbuf && buf < bigbuf_end"
	.align 8
.LC6:
	.string	"Assertion \"%s\" at %s:%d failed: New 8-byte alloc %p did not come out of old freed chunk %p-%p\n"
	.text
	.type	test_free_reuse_split, @function
test_free_reuse_split:
.LFB49:
	.loc 1 136 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 137 5 view .LVU115
.LVL52:
	.loc 1 138 5 view .LVU116
	.loc 1 139 5 view .LVU117
	.loc 1 140 5 view .LVU118
	.loc 1 142 5 view .LVU119
	.loc 1 142 14 is_stmt 0 view .LVU120
	movl	$4096, %edi
	call	checked_alloc@PLT
.LVL53:
	movq	%rax, %rbp
.LVL54:
	.loc 1 143 5 is_stmt 1 view .LVU121
	.loc 1 143 16 is_stmt 0 view .LVU122
	leaq	4096(%rax), %r12
.LVL55:
	.loc 1 144 5 is_stmt 1 view .LVU123
	movq	%rax, %rdi
	call	checked_free@PLT
.LVL56:
	.loc 1 146 5 view .LVU124
	.loc 1 146 19 view .LVU125
	.loc 1 144 5 is_stmt 0 view .LVU126
	movl	$64, %ebx
.LVL57:
.L40:
	.loc 1 147 9 is_stmt 1 view .LVU127
	.loc 1 147 15 is_stmt 0 view .LVU128
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL58:
	.loc 1 148 9 is_stmt 1 view .LVU129
	.loc 1 148 9 view .LVU130
	cmpq	%rax, %rbp
	ja	.L41
	cmpq	%rax, %r12
	jbe	.L41
	.loc 1 148 9 discriminator 2 view .LVU131
	.loc 1 148 9 discriminator 2 view .LVU132
	.loc 1 146 33 discriminator 2 view .LVU133
.LVL59:
	.loc 1 146 19 discriminator 2 view .LVU134
	subl	$1, %ebx
.LVL60:
	.loc 1 146 19 is_stmt 0 discriminator 2 view .LVU135
	jne	.L40
	.loc 1 151 1 view .LVU136
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
.LVL61:
	.loc 1 151 1 view .LVU137
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL62:
	.loc 1 151 1 view .LVU138
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL63:
	.loc 1 151 1 view .LVU139
	ret
.LVL64:
.L41:
	.cfi_restore_state
	.loc 1 148 9 is_stmt 1 discriminator 1 view .LVU140
	.loc 1 148 9 discriminator 1 view .LVU141
.LBB50:
.LBI50:
	.loc 2 103 1 discriminator 1 view .LVU142
.LBB51:
	.loc 2 105 3 discriminator 1 view .LVU143
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU144
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbp
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	movl	$148, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC5(%rip), %rcx
	leaq	.LC6(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL65:
	.loc 2 105 10 discriminator 1 view .LVU145
	call	__fprintf_chk@PLT
.LVL66:
	.loc 2 105 10 discriminator 1 view .LVU146
.LBE51:
.LBE50:
	.loc 1 148 9 is_stmt 1 discriminator 1 view .LVU147
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	movl	$1, %edi
	call	orig_exit@PLT
.LVL67:
	.cfi_endproc
.LFE49:
	.size	test_free_reuse_split, .-test_free_reuse_split
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"low < ptrs[i] && ptrs[i] < high"
	.align 8
.LC8:
	.string	"Assertion \"%s\" at %s:%d failed: Allocation %d at %p not between first and last allocation %p and %p\n"
	.section	.rodata.str1.1
.LC9:
	.string	"num_brk_decrease_calls == 0"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Assertion \"%s\" at %s:%d failed: Got %lu brk calls that decrease heap while no object have been freed yet\n"
	.align 8
.LC11:
	.string	"Assertion \"%s\" at %s:%d failed: Got %lu brk calls that decrease heap while the last object has not been freed\n"
	.section	.rodata.str1.1
.LC12:
	.string	"num_brk_decrease_calls > 0"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"Assertion \"%s\" at %s:%d failed: Heap size not decreased while all objects are freed\n"
	.section	.rodata.str1.1
.LC14:
	.string	"cur_brk < ptrs[i]"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Assertion \"%s\" at %s:%d failed: Allocation %p (#%d/%d) has been freed but is still part of the allocated heap (brk=%p)\n"
	.text
	.type	test_unmap, @function
test_unmap:
.LFB58:
	.loc 1 322 1 view -0
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	.loc 1 322 1 is_stmt 0 view .LVU149
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.loc 1 323 5 is_stmt 1 view .LVU150
.LVL68:
	.loc 1 324 5 view .LVU151
	.loc 1 325 5 view .LVU152
	.loc 1 326 5 view .LVU153
	.loc 1 326 11 is_stmt 0 view .LVU154
	movq	%rsp, %rax
.L45:
	cmpq	%rax, %rsp
	je	.L46
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L45
.L46:
	subq	$512, %rsp
	orq	$0, 504(%rsp)
	leaq	7(%rsp), %r14
	movq	%r14, %r15
	shrq	$3, %r15
	andq	$-8, %r14
.LVL69:
	.loc 1 327 5 is_stmt 1 view .LVU155
	.loc 1 328 5 view .LVU156
	.loc 1 330 5 view .LVU157
	.loc 1 330 12 is_stmt 0 view .LVU158
	movl	$512, %edi
	call	checked_alloc@PLT
.LVL70:
	movq	%rax, -72(%rbp)
.LVL71:
	.loc 1 331 5 is_stmt 1 view .LVU159
	.loc 1 331 19 view .LVU160
	movq	%r14, %r12
	leaq	512(%r14), %r13
	.loc 1 330 12 is_stmt 0 view .LVU161
	movq	%r14, %rbx
.LVL72:
.L48:
	.loc 1 332 9 is_stmt 1 discriminator 3 view .LVU162
	.loc 1 332 19 is_stmt 0 discriminator 3 view .LVU163
	movl	$512, %edi
	call	checked_alloc@PLT
.LVL73:
	.loc 1 332 17 discriminator 3 view .LVU164
	movq	%rax, (%rbx)
	.loc 1 331 34 is_stmt 1 discriminator 3 view .LVU165
.LVL74:
	.loc 1 331 19 discriminator 3 view .LVU166
	addq	$8, %rbx
.LVL75:
	.loc 1 331 19 is_stmt 0 discriminator 3 view .LVU167
	cmpq	%r13, %rbx
	jne	.L48
	.loc 1 333 5 is_stmt 1 view .LVU168
	.loc 1 333 12 is_stmt 0 view .LVU169
	movl	$512, %edi
	call	checked_alloc@PLT
.LVL76:
	.loc 1 335 5 is_stmt 1 view .LVU170
	.loc 1 335 9 is_stmt 0 view .LVU171
	movq	-72(%rbp), %rsi
	cmpq	%rax, %rsi
	movq	%rsi, %rcx
	cmova	%rax, %rcx
.LVL77:
	.loc 1 336 5 is_stmt 1 view .LVU172
	.loc 1 336 10 is_stmt 0 view .LVU173
	movq	%rsi, %rbx
.LVL78:
	.loc 1 336 10 view .LVU174
	cmovb	%rax, %rbx
.LVL79:
	.loc 1 337 5 is_stmt 1 view .LVU175
	.loc 1 337 19 view .LVU176
	.loc 1 336 10 is_stmt 0 view .LVU177
	movl	$0, %eax
.LVL80:
.L51:
	.loc 1 336 10 view .LVU178
	movl	%eax, %esi
.LVL81:
	.loc 1 338 9 is_stmt 1 view .LVU179
	.loc 1 338 9 view .LVU180
	movq	(%r14,%rax,8), %rdx
	cmpq	%rbx, %rdx
	jnb	.L60
	cmpq	%rcx, %rdx
	jbe	.L60
	.loc 1 338 9 discriminator 4 view .LVU181
	.loc 1 338 9 discriminator 4 view .LVU182
	.loc 1 337 34 discriminator 4 view .LVU183
.LVL82:
	.loc 1 337 19 discriminator 4 view .LVU184
	addq	$1, %rax
.LVL83:
	.loc 1 337 19 is_stmt 0 discriminator 4 view .LVU185
	cmpq	$64, %rax
	jne	.L51
	.loc 1 342 5 is_stmt 1 view .LVU186
	.loc 1 342 5 view .LVU187
	movq	num_brk_decrease_calls(%rip), %rax
	testq	%rax, %rax
	jne	.L67
.LVL84:
.L52:
	.loc 1 346 9 discriminator 3 view .LVU188
	movq	(%r12), %rdi
	call	checked_free@PLT
.LVL85:
	.loc 1 345 34 discriminator 3 view .LVU189
	.loc 1 345 19 discriminator 3 view .LVU190
	addq	$8, %r12
.LVL86:
	.loc 1 345 19 is_stmt 0 discriminator 3 view .LVU191
	cmpq	%r13, %r12
	jne	.L52
	.loc 1 348 5 is_stmt 1 view .LVU192
	.loc 1 348 5 view .LVU193
	movq	num_brk_decrease_calls(%rip), %rax
	testq	%rax, %rax
	jne	.L68
	.loc 1 348 5 discriminator 2 view .LVU194
	.loc 1 348 5 discriminator 2 view .LVU195
	.loc 1 351 5 discriminator 2 view .LVU196
	movq	%rbx, %rdi
	call	checked_free@PLT
.LVL87:
	.loc 1 352 5 discriminator 2 view .LVU197
	.loc 1 352 5 discriminator 2 view .LVU198
	cmpq	$0, num_brk_decrease_calls(%rip)
	je	.L69
	.loc 1 352 5 discriminator 2 view .LVU199
	.loc 1 352 5 discriminator 2 view .LVU200
	.loc 1 356 5 discriminator 2 view .LVU201
	.loc 1 356 8 is_stmt 0 discriminator 2 view .LVU202
	movq	0(,%r15,8), %rax
	.loc 1 361 19 discriminator 2 view .LVU203
	cmpq	504(,%r15,8), %rax
	sbbl	%ecx, %ecx
	andl	$56, %ecx
	addl	$8, %ecx
	cmpq	504(,%r15,8), %rax
	sbbl	%eax, %eax
.LVL88:
	.loc 1 363 5 is_stmt 1 discriminator 2 view .LVU204
	.loc 1 363 29 discriminator 2 view .LVU205
	.loc 1 364 9 is_stmt 0 discriminator 2 view .LVU206
	movq	cur_brk(%rip), %rsi
	andl	$56, %eax
.LVL89:
.L57:
	.loc 1 364 9 is_stmt 1 view .LVU207
	.loc 1 364 9 view .LVU208
	movq	(%r14,%rax,8), %rdx
	cmpq	%rsi, %rdx
	jbe	.L70
	.loc 1 364 9 discriminator 2 view .LVU209
	.loc 1 364 9 discriminator 2 view .LVU210
	.loc 1 363 43 discriminator 2 view .LVU211
.LVL90:
	.loc 1 363 29 discriminator 2 view .LVU212
	addq	$1, %rax
.LVL91:
	.loc 1 363 29 is_stmt 0 discriminator 2 view .LVU213
	cmpl	%eax, %ecx
	jg	.L57
	.loc 1 368 1 view .LVU214
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L71
	leaq	-40(%rbp), %rsp
	popq	%rbx
.LVL92:
	.loc 1 368 1 view .LVU215
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
.LVL93:
	.loc 1 368 1 view .LVU216
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
.LVL94:
	.loc 1 368 1 view .LVU217
	ret
.LVL95:
.L60:
	.cfi_restore_state
	.loc 1 338 9 is_stmt 1 discriminator 3 view .LVU218
	.loc 1 338 9 discriminator 3 view .LVU219
.LBB52:
.LBI52:
	.loc 2 103 1 discriminator 3 view .LVU220
.LBB53:
	.loc 2 105 3 discriminator 3 view .LVU221
	.loc 2 105 10 is_stmt 0 discriminator 3 view .LVU222
	pushq	%rbx
.LVL96:
	.loc 2 105 10 discriminator 3 view .LVU223
	pushq	%rcx
	pushq	%rdx
	pushq	%rsi
	movl	$338, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC7(%rip), %rcx
.LVL97:
	.loc 2 105 10 discriminator 3 view .LVU224
	leaq	.LC8(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
.LVL98:
	.loc 2 105 10 discriminator 3 view .LVU225
	movl	$0, %eax
.LVL99:
	.loc 2 105 10 discriminator 3 view .LVU226
	call	__fprintf_chk@PLT
.LVL100:
	.loc 2 105 10 discriminator 3 view .LVU227
.LBE53:
.LBE52:
	.loc 1 338 9 is_stmt 1 discriminator 3 view .LVU228
	addq	$32, %rsp
	.loc 1 338 9 is_stmt 0 discriminator 3 view .LVU229
	movl	$1, %edi
	call	orig_exit@PLT
.LVL101:
.L67:
	.loc 1 342 5 is_stmt 1 discriminator 1 view .LVU230
	.loc 1 342 5 discriminator 1 view .LVU231
.LBB54:
.LBI54:
	.loc 2 103 1 discriminator 1 view .LVU232
.LBB55:
	.loc 2 105 3 discriminator 1 view .LVU233
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU234
	subq	$8, %rsp
	pushq	%rax
.LVL102:
	.loc 2 105 10 discriminator 1 view .LVU235
	movl	$342, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC9(%rip), %rcx
.LVL103:
	.loc 2 105 10 discriminator 1 view .LVU236
	leaq	.LC10(%rip), %rdx
	movl	$1, %esi
.LVL104:
	.loc 2 105 10 discriminator 1 view .LVU237
	movq	stderr(%rip), %rdi
.LVL105:
	.loc 2 105 10 discriminator 1 view .LVU238
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL106:
	.loc 2 105 10 discriminator 1 view .LVU239
.LBE55:
.LBE54:
	.loc 1 342 5 is_stmt 1 discriminator 1 view .LVU240
	movl	$1, %edi
	call	orig_exit@PLT
.LVL107:
.L68:
	.loc 1 348 5 discriminator 1 view .LVU241
	.loc 1 348 5 discriminator 1 view .LVU242
.LBB56:
.LBI56:
	.loc 2 103 1 discriminator 1 view .LVU243
.LBB57:
	.loc 2 105 3 discriminator 1 view .LVU244
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU245
	subq	$8, %rsp
	pushq	%rax
.LVL108:
	.loc 2 105 10 discriminator 1 view .LVU246
	movl	$348, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC9(%rip), %rcx
	leaq	.LC11(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
.LVL109:
	.loc 2 105 10 discriminator 1 view .LVU247
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL110:
	.loc 2 105 10 discriminator 1 view .LVU248
.LBE57:
.LBE56:
	.loc 1 348 5 is_stmt 1 discriminator 1 view .LVU249
	movl	$1, %edi
	call	orig_exit@PLT
.LVL111:
.L69:
	.loc 1 352 5 discriminator 1 view .LVU250
	.loc 1 352 5 discriminator 1 view .LVU251
.LBB58:
.LBI58:
	.loc 2 103 1 discriminator 1 view .LVU252
.LBB59:
	.loc 2 105 3 discriminator 1 view .LVU253
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU254
	movl	$352, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC12(%rip), %rcx
	leaq	.LC13(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL112:
	.loc 2 105 10 discriminator 1 view .LVU255
.LBE59:
.LBE58:
	.loc 1 352 5 is_stmt 1 discriminator 1 view .LVU256
	movl	$1, %edi
	call	orig_exit@PLT
.LVL113:
.L70:
	.loc 1 364 9 discriminator 1 view .LVU257
	.loc 1 364 9 discriminator 1 view .LVU258
.LBB60:
.LBI60:
	.loc 2 103 1 discriminator 1 view .LVU259
.LBB61:
	.loc 2 105 3 discriminator 1 view .LVU260
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU261
	pushq	%rsi
.LVL114:
	.loc 2 105 10 discriminator 1 view .LVU262
	pushq	$64
	pushq	%rax
	pushq	%rdx
	movl	$364, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC14(%rip), %rcx
.LVL115:
	.loc 2 105 10 discriminator 1 view .LVU263
	leaq	.LC15(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
.LVL116:
	.loc 2 105 10 discriminator 1 view .LVU264
	movl	$0, %eax
.LVL117:
	.loc 2 105 10 discriminator 1 view .LVU265
	call	__fprintf_chk@PLT
.LVL118:
	.loc 2 105 10 discriminator 1 view .LVU266
.LBE61:
.LBE60:
	.loc 1 364 9 is_stmt 1 discriminator 1 view .LVU267
	addq	$32, %rsp
	.loc 1 364 9 is_stmt 0 discriminator 1 view .LVU268
	movl	$1, %edi
	call	orig_exit@PLT
.LVL119:
.L71:
	.loc 1 368 1 view .LVU269
	call	__stack_chk_fail@PLT
.LVL120:
	.loc 1 368 1 view .LVU270
	.cfi_endproc
.LFE58:
	.size	test_unmap, .-test_unmap
	.section	.rodata.str1.1
.LC16:
	.string	"newbuf == buf[i]"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Assertion \"%s\" at %s:%d failed: New size 128 of %p would have fit in old allocation size %zu for %p\n"
	.align 8
.LC18:
	.string	"Assertion \"%s\" at %s:%d failed: New size 16 of %p would have fit in old allocation size 128 for %p\n"
	.text
	.type	test_realloc_opt, @function
test_realloc_opt:
.LFB53:
	.loc 1 235 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$144, %rsp
	.cfi_def_cfa_offset 176
	.loc 1 235 1 is_stmt 0 view .LVU272
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	.loc 1 236 5 is_stmt 1 view .LVU273
	.loc 1 236 18 is_stmt 0 view .LVU274
	movq	$1, (%rsp)
	movq	$2, 8(%rsp)
	movq	$8, 16(%rsp)
	movq	$64, 24(%rsp)
	movq	$96, 32(%rsp)
	movq	$128, 40(%rsp)
	movq	$4096, 48(%rsp)
	movq	$4097, 56(%rsp)
	.loc 1 237 5 is_stmt 1 view .LVU275
	.loc 1 238 5 view .LVU276
	.loc 1 239 5 view .LVU277
	.loc 1 241 5 view .LVU278
.LVL121:
	.loc 1 241 19 view .LVU279
	.loc 1 236 18 is_stmt 0 view .LVU280
	movl	$0, %ebx
.LVL122:
.L73:
	.loc 1 242 9 is_stmt 1 discriminator 3 view .LVU281
	.loc 1 242 18 is_stmt 0 discriminator 3 view .LVU282
	movq	(%rsp,%rbx), %rdi
	call	checked_alloc@PLT
.LVL123:
	.loc 1 242 16 discriminator 3 view .LVU283
	movq	%rax, 64(%rsp,%rbx)
	.loc 1 241 25 is_stmt 1 discriminator 3 view .LVU284
.LVL124:
	.loc 1 241 19 discriminator 3 view .LVU285
	addq	$8, %rbx
.LVL125:
	.loc 1 241 19 is_stmt 0 discriminator 3 view .LVU286
	cmpq	$64, %rbx
	jne	.L73
.LVL126:
	.loc 1 244 19 is_stmt 1 view .LVU287
	.loc 1 245 9 view .LVU288
	.loc 1 245 18 is_stmt 0 view .LVU289
	movl	$128, %esi
	movq	64(%rsp), %rdi
	call	checked_realloc@PLT
.LVL127:
	.loc 1 246 9 is_stmt 1 view .LVU290
	.loc 1 247 13 view .LVU291
	.loc 1 247 13 view .LVU292
	.loc 1 245 18 is_stmt 0 view .LVU293
	movl	$8, %ebx
	.loc 1 250 16 view .LVU294
	leaq	56(%rsp), %r12
.LVL128:
.L82:
	.loc 1 247 13 is_stmt 1 discriminator 2 view .LVU295
	.loc 1 247 13 discriminator 2 view .LVU296
	.loc 1 250 9 discriminator 2 view .LVU297
	.loc 1 250 16 is_stmt 0 discriminator 2 view .LVU298
	movq	%rax, (%r12,%rbx)
	.loc 1 244 25 is_stmt 1 discriminator 2 view .LVU299
.LVL129:
	.loc 1 244 19 discriminator 2 view .LVU300
	cmpq	$64, %rbx
	je	.L86
	.loc 1 245 9 view .LVU301
	.loc 1 245 18 is_stmt 0 view .LVU302
	movq	64(%rsp,%rbx), %rbp
	movl	$128, %esi
	movq	%rbp, %rdi
	call	checked_realloc@PLT
.LVL130:
	.loc 1 246 9 is_stmt 1 view .LVU303
	.loc 1 246 15 is_stmt 0 view .LVU304
	movq	(%rsp,%rbx), %rdx
	.loc 1 247 13 is_stmt 1 view .LVU305
	.loc 1 247 13 view .LVU306
	addq	$8, %rbx
.LVL131:
	.loc 1 247 13 is_stmt 0 view .LVU307
	cmpq	%rax, %rbp
	je	.L82
	cmpq	$127, %rdx
	jbe	.L82
	.loc 1 247 13 is_stmt 1 discriminator 1 view .LVU308
	.loc 1 247 13 discriminator 1 view .LVU309
.LVL132:
.LBB62:
.LBI62:
	.loc 2 103 1 discriminator 1 view .LVU310
.LBB63:
	.loc 2 105 3 discriminator 1 view .LVU311
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU312
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	pushq	%rbp
	.cfi_def_cfa_offset 192
	pushq	%rdx
	.cfi_def_cfa_offset 200
	pushq	%rax
	.cfi_def_cfa_offset 208
	movl	$247, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC16(%rip), %rcx
	leaq	.LC17(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL133:
	.loc 2 105 10 discriminator 1 view .LVU313
	call	__fprintf_chk@PLT
.LVL134:
	.loc 2 105 10 discriminator 1 view .LVU314
.LBE63:
.LBE62:
	.loc 1 247 13 is_stmt 1 discriminator 1 view .LVU315
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	movl	$1, %edi
	call	orig_exit@PLT
.LVL135:
.L86:
	.loc 1 247 13 is_stmt 0 discriminator 1 view .LVU316
	leaq	64(%rsp), %rbx
.LVL136:
	.loc 1 247 13 discriminator 1 view .LVU317
	leaq	128(%rsp), %r12
.LVL137:
.L78:
	.loc 1 254 9 is_stmt 1 view .LVU318
	.loc 1 254 18 is_stmt 0 view .LVU319
	movq	(%rbx), %rbp
	movl	$16, %esi
	movq	%rbp, %rdi
	call	checked_realloc@PLT
.LVL138:
	.loc 1 255 9 is_stmt 1 view .LVU320
	.loc 1 255 9 view .LVU321
	cmpq	%rax, %rbp
	jne	.L87
	.loc 1 255 9 discriminator 2 view .LVU322
	.loc 1 255 9 discriminator 2 view .LVU323
	.loc 1 253 25 discriminator 2 view .LVU324
.LVL139:
	.loc 1 253 19 discriminator 2 view .LVU325
	addq	$8, %rbx
.LVL140:
	.loc 1 253 19 is_stmt 0 discriminator 2 view .LVU326
	cmpq	%r12, %rbx
	jne	.L78
	.loc 1 258 1 view .LVU327
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
.LVL141:
	.loc 1 258 1 view .LVU328
	jne	.L88
	addq	$144, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL142:
	.loc 1 258 1 view .LVU329
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.LVL143:
.L87:
	.cfi_restore_state
	.loc 1 255 9 is_stmt 1 discriminator 1 view .LVU330
	.loc 1 255 9 discriminator 1 view .LVU331
.LBB64:
.LBI64:
	.loc 2 103 1 discriminator 1 view .LVU332
.LBB65:
	.loc 2 105 3 discriminator 1 view .LVU333
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU334
	pushq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 184
	pushq	%rax
	.cfi_def_cfa_offset 192
	movl	$255, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC16(%rip), %rcx
	leaq	.LC18(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL144:
	.loc 2 105 10 discriminator 1 view .LVU335
	call	__fprintf_chk@PLT
.LVL145:
	.loc 2 105 10 discriminator 1 view .LVU336
.LBE65:
.LBE64:
	.loc 1 255 9 is_stmt 1 discriminator 1 view .LVU337
	movl	$1, %edi
	call	orig_exit@PLT
.LVL146:
.L88:
	.cfi_restore_state
	.loc 1 258 1 is_stmt 0 view .LVU338
	call	__stack_chk_fail@PLT
.LVL147:
	.cfi_endproc
.LFE53:
	.size	test_realloc_opt, .-test_realloc_opt
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"buf4 == buf1 || buf5 == buf1 || buf6 == buf1"
	.align 8
.LC20:
	.string	"Assertion \"%s\" at %s:%d failed: No reuse for freed realloc\n"
	.align 8
.LC21:
	.string	"buf4 == buf2 || buf5 == buf2 || buf6 == buf2"
	.align 8
.LC22:
	.string	"buf4 == buf3 || buf5 == buf3 || buf6 == buf3"
	.text
	.type	test_realloc_zero, @function
test_realloc_zero:
.LFB52:
	.loc 1 212 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.loc 1 213 5 view .LVU340
	.loc 1 214 5 view .LVU341
	.loc 1 214 12 is_stmt 0 view .LVU342
	movl	$10, %edi
	call	checked_alloc@PLT
.LVL148:
	movq	%rax, %rbx
.LVL149:
	.loc 1 215 5 is_stmt 1 view .LVU343
	.loc 1 215 12 is_stmt 0 view .LVU344
	movl	$10, %esi
	movl	$0, %edi
	call	checked_realloc@PLT
.LVL150:
	.loc 1 215 12 view .LVU345
	movq	%rax, %rbp
.LVL151:
	.loc 1 216 5 is_stmt 1 view .LVU346
	.loc 1 216 12 is_stmt 0 view .LVU347
	movl	$10, %edi
	call	checked_alloc@PLT
.LVL152:
	.loc 1 216 12 view .LVU348
	movq	%rax, %r12
.LVL153:
	.loc 1 218 5 is_stmt 1 view .LVU349
	movl	$0, %esi
	movq	%rbp, %rdi
	call	checked_realloc@PLT
.LVL154:
	.loc 1 219 5 view .LVU350
	movl	$0, %esi
	movq	%rbx, %rdi
	call	checked_realloc@PLT
.LVL155:
	.loc 1 220 5 view .LVU351
	movl	$0, %esi
	movq	%r12, %rdi
	call	checked_realloc@PLT
.LVL156:
	.loc 1 222 5 view .LVU352
	.loc 1 222 12 is_stmt 0 view .LVU353
	movl	$10, %edi
	call	checked_alloc@PLT
.LVL157:
	movq	%rax, %r14
.LVL158:
	.loc 1 223 5 is_stmt 1 view .LVU354
	.loc 1 223 12 is_stmt 0 view .LVU355
	movl	$10, %esi
	movl	$0, %edi
	call	checked_realloc@PLT
.LVL159:
	.loc 1 223 12 view .LVU356
	movq	%rax, %r13
.LVL160:
	.loc 1 224 5 is_stmt 1 view .LVU357
	.loc 1 224 12 is_stmt 0 view .LVU358
	movl	$10, %edi
	call	checked_alloc@PLT
.LVL161:
	.loc 1 226 5 is_stmt 1 view .LVU359
	.loc 1 226 5 view .LVU360
	cmpq	%r14, %rbx
	setne	%cl
	cmpq	%r13, %rbx
	setne	%dl
	testb	%dl, %cl
	je	.L90
	cmpq	%rax, %rbx
	jne	.L94
.L90:
	.loc 1 226 5 discriminator 4 view .LVU361
	.loc 1 226 5 discriminator 4 view .LVU362
	.loc 1 228 5 discriminator 4 view .LVU363
	.loc 1 228 5 discriminator 4 view .LVU364
	cmpq	%r14, %rbp
	setne	%cl
	cmpq	%r13, %rbp
	setne	%dl
	testb	%dl, %cl
	je	.L91
	cmpq	%rax, %rbp
	jne	.L95
.L91:
	.loc 1 228 5 discriminator 4 view .LVU365
	.loc 1 228 5 discriminator 4 view .LVU366
	.loc 1 230 5 discriminator 4 view .LVU367
	.loc 1 230 5 discriminator 4 view .LVU368
	cmpq	%r14, %r12
	setne	%cl
	cmpq	%r13, %r12
	setne	%dl
	testb	%dl, %cl
	je	.L89
	cmpq	%rax, %r12
	jne	.L96
.L89:
	.loc 1 232 1 is_stmt 0 view .LVU369
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
.LVL162:
	.loc 1 232 1 view .LVU370
	popq	%rbp
	.cfi_def_cfa_offset 32
.LVL163:
	.loc 1 232 1 view .LVU371
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL164:
	.loc 1 232 1 view .LVU372
	popq	%r13
	.cfi_def_cfa_offset 16
.LVL165:
	.loc 1 232 1 view .LVU373
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL166:
	.loc 1 232 1 view .LVU374
	ret
.LVL167:
.L94:
	.cfi_restore_state
	.loc 1 226 5 is_stmt 1 discriminator 3 view .LVU375
	.loc 1 226 5 discriminator 3 view .LVU376
.LBB66:
.LBI66:
	.loc 2 103 1 discriminator 3 view .LVU377
.LBB67:
	.loc 2 105 3 discriminator 3 view .LVU378
	.loc 2 105 10 is_stmt 0 discriminator 3 view .LVU379
	movl	$226, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC19(%rip), %rcx
	leaq	.LC20(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL168:
	.loc 2 105 10 discriminator 3 view .LVU380
	call	__fprintf_chk@PLT
.LVL169:
	.loc 2 105 10 discriminator 3 view .LVU381
.LBE67:
.LBE66:
	.loc 1 226 5 is_stmt 1 discriminator 3 view .LVU382
	movl	$1, %edi
	call	orig_exit@PLT
.LVL170:
.L95:
	.loc 1 228 5 discriminator 3 view .LVU383
	.loc 1 228 5 discriminator 3 view .LVU384
.LBB68:
.LBI68:
	.loc 2 103 1 discriminator 3 view .LVU385
.LBB69:
	.loc 2 105 3 discriminator 3 view .LVU386
	.loc 2 105 10 is_stmt 0 discriminator 3 view .LVU387
	movl	$228, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC21(%rip), %rcx
	leaq	.LC20(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL171:
	.loc 2 105 10 discriminator 3 view .LVU388
	call	__fprintf_chk@PLT
.LVL172:
	.loc 2 105 10 discriminator 3 view .LVU389
.LBE69:
.LBE68:
	.loc 1 228 5 is_stmt 1 discriminator 3 view .LVU390
	movl	$1, %edi
	call	orig_exit@PLT
.LVL173:
.L96:
	.loc 1 230 5 discriminator 3 view .LVU391
	.loc 1 230 5 discriminator 3 view .LVU392
.LBB70:
.LBI70:
	.loc 2 103 1 discriminator 3 view .LVU393
.LBB71:
	.loc 2 105 3 discriminator 3 view .LVU394
	.loc 2 105 10 is_stmt 0 discriminator 3 view .LVU395
	movl	$230, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC22(%rip), %rcx
	leaq	.LC20(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL174:
	.loc 2 105 10 discriminator 3 view .LVU396
	call	__fprintf_chk@PLT
.LVL175:
	.loc 2 105 10 discriminator 3 view .LVU397
.LBE71:
.LBE70:
	.loc 1 230 5 is_stmt 1 discriminator 3 view .LVU398
	movl	$1, %edi
	call	orig_exit@PLT
.LVL176:
	.cfi_endproc
.LFE52:
	.size	test_realloc_zero, .-test_realloc_zero
	.type	test_realloc, @function
test_realloc:
.LFB51:
	.loc 1 198 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$152, %rsp
	.cfi_def_cfa_offset 192
	.loc 1 198 1 is_stmt 0 view .LVU400
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	.loc 1 199 5 is_stmt 1 view .LVU401
	.loc 1 199 18 is_stmt 0 view .LVU402
	movq	$1, (%rsp)
	movq	$2, 8(%rsp)
	movq	$8, 16(%rsp)
	movq	$64, 24(%rsp)
	movq	$96, 32(%rsp)
	movq	$128, 40(%rsp)
	movq	$4096, 48(%rsp)
	movq	$4097, 56(%rsp)
	.loc 1 200 5 is_stmt 1 view .LVU403
	.loc 1 201 5 view .LVU404
	.loc 1 203 5 view .LVU405
.LVL177:
	.loc 1 203 19 view .LVU406
	.loc 1 199 18 is_stmt 0 view .LVU407
	movl	$0, %ebx
.LVL178:
.L98:
	.loc 1 204 9 is_stmt 1 discriminator 3 view .LVU408
	.loc 1 204 18 is_stmt 0 discriminator 3 view .LVU409
	movq	(%rsp,%rbx), %rdi
	call	checked_alloc@PLT
.LVL179:
	.loc 1 204 16 discriminator 3 view .LVU410
	movq	%rax, 64(%rsp,%rbx)
	.loc 1 203 25 is_stmt 1 discriminator 3 view .LVU411
.LVL180:
	.loc 1 203 19 discriminator 3 view .LVU412
	addq	$8, %rbx
.LVL181:
	.loc 1 203 19 is_stmt 0 discriminator 3 view .LVU413
	cmpq	$64, %rbx
	jne	.L98
	movq	%rsp, %rbp
	leaq	64(%rsp), %r13
	leaq	128(%rsp), %r12
.LVL182:
.L99:
	.loc 1 207 23 is_stmt 1 view .LVU414
	leaq	64(%rsp), %rbx
.LVL183:
.L100:
	.loc 1 208 13 discriminator 3 view .LVU415
	.loc 1 208 22 is_stmt 0 discriminator 3 view .LVU416
	movq	0(%rbp), %rsi
	movq	(%rbx), %rdi
	call	checked_realloc@PLT
.LVL184:
	.loc 1 208 20 discriminator 3 view .LVU417
	movq	%rax, (%rbx)
	.loc 1 207 29 is_stmt 1 discriminator 3 view .LVU418
.LVL185:
	.loc 1 207 23 discriminator 3 view .LVU419
	addq	$8, %rbx
.LVL186:
	.loc 1 207 23 is_stmt 0 discriminator 3 view .LVU420
	cmpq	%r12, %rbx
	jne	.L100
	.loc 1 206 25 is_stmt 1 discriminator 2 view .LVU421
.LVL187:
	.loc 1 206 19 discriminator 2 view .LVU422
	addq	$8, %rbp
.LVL188:
	.loc 1 206 19 is_stmt 0 discriminator 2 view .LVU423
	cmpq	%r13, %rbp
	jne	.L99
	.loc 1 209 1 view .LVU424
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L106
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL189:
	.loc 1 209 1 view .LVU425
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL190:
	.loc 1 209 1 view .LVU426
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL191:
.L106:
	.cfi_restore_state
	.loc 1 209 1 view .LVU427
	call	__stack_chk_fail@PLT
.LVL192:
	.cfi_endproc
.LFE51:
	.size	test_realloc, .-test_realloc
	.type	test_free_random, @function
test_free_random:
.LFB47:
	.loc 1 82 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 83 5 view .LVU429
.LVL193:
	.loc 1 84 5 view .LVU430
	.loc 1 85 5 view .LVU431
	.loc 1 86 5 view .LVU432
	.loc 1 87 5 view .LVU433
	movl	$0, %edi
	call	srand@PLT
.LVL194:
	.loc 1 88 5 view .LVU434
	.loc 1 88 12 is_stmt 0 view .LVU435
	movl	$8000, %edi
	call	malloc@PLT
.LVL195:
	movq	%rax, %rbx
.LVL196:
	.loc 1 89 5 is_stmt 1 view .LVU436
	.loc 1 89 19 view .LVU437
	movq	%rax, %rbp
	leaq	8000(%rax), %r12
	.loc 1 88 12 is_stmt 0 view .LVU438
	movq	%rax, %r13
.LVL197:
.L108:
	.loc 1 90 9 is_stmt 1 discriminator 3 view .LVU439
	.loc 1 90 41 is_stmt 0 discriminator 3 view .LVU440
	call	rand@PLT
.LVL198:
	.loc 1 90 19 discriminator 3 view .LVU441
	movl	%eax, %edi
	andl	$1023, %edi
	call	checked_alloc@PLT
.LVL199:
	.loc 1 90 17 discriminator 3 view .LVU442
	movq	%rax, 0(%r13)
	.loc 1 89 33 is_stmt 1 discriminator 3 view .LVU443
.LVL200:
	.loc 1 89 19 discriminator 3 view .LVU444
	addq	$8, %r13
.LVL201:
	.loc 1 89 19 is_stmt 0 discriminator 3 view .LVU445
	cmpq	%r12, %r13
	jne	.L108
	movq	%rbx, %r13
.LVL202:
.L109:
	.loc 1 93 9 is_stmt 1 discriminator 3 view .LVU446
	movq	0(%r13), %rdi
	call	checked_free@PLT
.LVL203:
	.loc 1 92 33 discriminator 3 view .LVU447
	.loc 1 92 19 discriminator 3 view .LVU448
	addq	$8, %r13
.LVL204:
	.loc 1 92 19 is_stmt 0 discriminator 3 view .LVU449
	cmpq	%r12, %r13
	jne	.L109
.LVL205:
.L110:
	.loc 1 96 9 is_stmt 1 discriminator 3 view .LVU450
	.loc 1 96 41 is_stmt 0 discriminator 3 view .LVU451
	call	rand@PLT
.LVL206:
	.loc 1 96 19 discriminator 3 view .LVU452
	movl	%eax, %edi
	andl	$1023, %edi
	call	checked_alloc@PLT
.LVL207:
	.loc 1 96 17 discriminator 3 view .LVU453
	movq	%rax, (%rbx)
	.loc 1 95 33 is_stmt 1 discriminator 3 view .LVU454
.LVL208:
	.loc 1 95 19 discriminator 3 view .LVU455
	addq	$8, %rbx
.LVL209:
	.loc 1 95 19 is_stmt 0 discriminator 3 view .LVU456
	cmpq	%r12, %rbx
	jne	.L110
.LVL210:
.L111:
	.loc 1 99 9 is_stmt 1 discriminator 3 view .LVU457
	movq	0(%rbp), %rdi
	call	checked_free@PLT
.LVL211:
	.loc 1 98 33 discriminator 3 view .LVU458
	.loc 1 98 19 discriminator 3 view .LVU459
	addq	$8, %rbp
.LVL212:
	.loc 1 98 19 is_stmt 0 discriminator 3 view .LVU460
	cmpq	%r12, %rbp
	jne	.L111
	.loc 1 101 1 view .LVU461
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL213:
	.loc 1 101 1 view .LVU462
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL214:
	.loc 1 101 1 view .LVU463
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE47:
	.size	test_free_random, .-test_free_random
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"low < bufs[i] && bufs[i] < high"
	.section	.rodata.str1.1
.LC24:
	.string	"low < bigbuf && bigbuf < high"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"Assertion \"%s\" at %s:%d failed: Big allocation at %p not in freed area %p-%p\n"
	.section	.rodata.str1.1
.LC26:
	.string	"old_alloc"
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"Assertion \"%s\" at %s:%d failed: Big alloc %p did not reuse any freed memory\n"
	.text
	.type	test_free_reuse_merge, @function
test_free_reuse_merge:
.LFB50:
	.loc 1 154 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.loc 1 155 5 view .LVU465
.LVL215:
	.loc 1 156 5 view .LVU466
	.loc 1 157 5 view .LVU467
	.loc 1 158 5 view .LVU468
	.loc 1 159 5 view .LVU469
	.loc 1 160 5 view .LVU470
	.loc 1 161 5 view .LVU471
	.loc 1 163 5 view .LVU472
	.loc 1 163 5 view .LVU473
	.loc 1 163 5 view .LVU474
	.loc 1 163 5 view .LVU475
	.loc 1 165 5 view .LVU476
	.loc 1 165 12 is_stmt 0 view .LVU477
	movl	$1024, %edi
	call	malloc@PLT
.LVL216:
	movq	%rax, %rbp
.LVL217:
	.loc 1 167 5 is_stmt 1 view .LVU478
	.loc 1 167 12 is_stmt 0 view .LVU479
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL218:
	.loc 1 167 12 view .LVU480
	movq	%rax, %r12
.LVL219:
	.loc 1 168 5 is_stmt 1 view .LVU481
	.loc 1 168 19 view .LVU482
	leaq	1024(%rbp), %r13
	.loc 1 167 12 is_stmt 0 view .LVU483
	movq	%rbp, %rbx
.LVL220:
.L118:
	.loc 1 169 9 is_stmt 1 discriminator 3 view .LVU484
	.loc 1 169 19 is_stmt 0 discriminator 3 view .LVU485
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL221:
	.loc 1 169 17 discriminator 3 view .LVU486
	movq	%rax, (%rbx)
	.loc 1 168 33 is_stmt 1 discriminator 3 view .LVU487
.LVL222:
	.loc 1 168 19 discriminator 3 view .LVU488
	addq	$8, %rbx
.LVL223:
	.loc 1 168 19 is_stmt 0 discriminator 3 view .LVU489
	cmpq	%r13, %rbx
	jne	.L118
	.loc 1 170 5 is_stmt 1 view .LVU490
	.loc 1 170 12 is_stmt 0 view .LVU491
	movl	$8, %edi
	call	checked_alloc@PLT
.LVL224:
	.loc 1 172 5 is_stmt 1 view .LVU492
	.loc 1 172 9 is_stmt 0 view .LVU493
	cmpq	%rax, %r12
	movq	%rax, %r13
	cmovbe	%r12, %r13
.LVL225:
	.loc 1 173 5 is_stmt 1 view .LVU494
	.loc 1 173 10 is_stmt 0 view .LVU495
	cmovb	%rax, %r12
.LVL226:
	.loc 1 174 5 is_stmt 1 view .LVU496
	.loc 1 174 19 view .LVU497
	.loc 1 173 10 is_stmt 0 view .LVU498
	movl	$0, %eax
.LVL227:
.L121:
	.loc 1 173 10 view .LVU499
	movl	%eax, %ecx
.LVL228:
	.loc 1 175 9 is_stmt 1 view .LVU500
	.loc 1 175 9 view .LVU501
	movq	0(%rbp,%rax,8), %rdx
	cmpq	%r12, %rdx
	jnb	.L129
	cmpq	%r13, %rdx
	jbe	.L129
	.loc 1 175 9 discriminator 4 view .LVU502
	.loc 1 175 9 discriminator 4 view .LVU503
	.loc 1 174 33 discriminator 4 view .LVU504
.LVL229:
	.loc 1 174 19 discriminator 4 view .LVU505
	addq	$1, %rax
.LVL230:
	.loc 1 174 19 is_stmt 0 discriminator 4 view .LVU506
	cmpq	$128, %rax
	jne	.L121
	leaq	256(%rbp), %r14
	.loc 1 174 19 view .LVU507
	movq	%rbp, %rbx
.LVL231:
.L122:
	.loc 1 180 9 is_stmt 1 discriminator 3 view .LVU508
	movq	(%rbx), %rdi
	call	checked_free@PLT
.LVL232:
	.loc 1 179 26 discriminator 3 view .LVU509
	.loc 1 179 19 discriminator 3 view .LVU510
	addq	$8, %rbx
.LVL233:
	.loc 1 179 19 is_stmt 0 discriminator 3 view .LVU511
	cmpq	%r14, %rbx
	jne	.L122
	leaq	512(%rbp), %rbx
.LVL234:
	.loc 1 179 19 discriminator 3 view .LVU512
	leaq	768(%rbp), %r14
.L123:
.LVL235:
	.loc 1 182 9 is_stmt 1 discriminator 3 view .LVU513
	movq	(%rbx), %rdi
	call	checked_free@PLT
.LVL236:
	.loc 1 181 35 discriminator 3 view .LVU514
	.loc 1 181 24 discriminator 3 view .LVU515
	addq	$8, %rbx
.LVL237:
	.loc 1 181 24 is_stmt 0 discriminator 3 view .LVU516
	cmpq	%r14, %rbx
	jne	.L123
	leaq	504(%rbp), %rbx
.LVL238:
	.loc 1 181 24 discriminator 3 view .LVU517
	leaq	248(%rbp), %r14
.L124:
.LVL239:
	.loc 1 184 9 is_stmt 1 discriminator 3 view .LVU518
	movq	(%rbx), %rdi
	call	checked_free@PLT
.LVL240:
	.loc 1 183 38 discriminator 3 view .LVU519
	.loc 1 183 30 discriminator 3 view .LVU520
	subq	$8, %rbx
.LVL241:
	.loc 1 183 30 is_stmt 0 discriminator 3 view .LVU521
	cmpq	%r14, %rbx
	jne	.L124
	leaq	1016(%rbp), %rbx
.LVL242:
	.loc 1 183 30 discriminator 3 view .LVU522
	leaq	760(%rbp), %r14
.L125:
.LVL243:
	.loc 1 186 9 is_stmt 1 discriminator 3 view .LVU523
	movq	(%rbx), %rdi
	call	checked_free@PLT
.LVL244:
	.loc 1 185 42 discriminator 3 view .LVU524
	.loc 1 185 30 discriminator 3 view .LVU525
	subq	$8, %rbx
.LVL245:
	.loc 1 185 30 is_stmt 0 discriminator 3 view .LVU526
	cmpq	%r14, %rbx
	jne	.L125
	.loc 1 188 5 is_stmt 1 view .LVU527
	.loc 1 188 14 is_stmt 0 view .LVU528
	movl	$1024, %edi
	call	checked_alloc@PLT
.LVL246:
	movq	%rax, %rbx
.LVL247:
	.loc 1 190 5 is_stmt 1 view .LVU529
	.loc 1 190 5 view .LVU530
	cmpq	%rax, %r13
	jnb	.L130
	cmpq	%rax, %r12
	jbe	.L130
	.loc 1 190 5 discriminator 2 view .LVU531
	.loc 1 190 5 discriminator 2 view .LVU532
	.loc 1 192 5 discriminator 2 view .LVU533
	.loc 1 192 13 is_stmt 0 discriminator 2 view .LVU534
	movq	%rax, %rsi
	leaq	allocs(%rip), %rdi
	call	memlist_find@PLT
.LVL248:
	.loc 1 192 13 discriminator 2 view .LVU535
	movq	%rax, %rsi
.LVL249:
	.loc 1 193 5 is_stmt 1 discriminator 2 view .LVU536
	.loc 1 193 17 is_stmt 0 discriminator 2 view .LVU537
	leaq	freed_allocs(%rip), %rdi
	call	memlist_find_overlap_unsorted@PLT
.LVL250:
	.loc 1 194 5 is_stmt 1 discriminator 2 view .LVU538
	.loc 1 194 5 discriminator 2 view .LVU539
	testq	%rax, %rax
	je	.L138
	.loc 1 195 1 is_stmt 0 view .LVU540
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
.LVL251:
	.loc 1 195 1 view .LVU541
	popq	%rbp
	.cfi_def_cfa_offset 32
.LVL252:
	.loc 1 195 1 view .LVU542
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL253:
	.loc 1 195 1 view .LVU543
	popq	%r13
	.cfi_def_cfa_offset 16
.LVL254:
	.loc 1 195 1 view .LVU544
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL255:
	.loc 1 195 1 view .LVU545
	ret
.LVL256:
.L129:
	.cfi_restore_state
	.loc 1 175 9 is_stmt 1 discriminator 3 view .LVU546
	.loc 1 175 9 discriminator 3 view .LVU547
.LBB72:
.LBI72:
	.loc 2 103 1 discriminator 3 view .LVU548
.LBB73:
	.loc 2 105 3 discriminator 3 view .LVU549
	.loc 2 105 10 is_stmt 0 discriminator 3 view .LVU550
	pushq	%r12
	.cfi_def_cfa_offset 56
	pushq	%r13
	.cfi_def_cfa_offset 64
	pushq	%rdx
	.cfi_def_cfa_offset 72
	pushq	%rcx
	.cfi_def_cfa_offset 80
	movl	$175, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC23(%rip), %rcx
	leaq	.LC8(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL257:
	.loc 2 105 10 discriminator 3 view .LVU551
	call	__fprintf_chk@PLT
.LVL258:
	.loc 2 105 10 discriminator 3 view .LVU552
.LBE73:
.LBE72:
	.loc 1 175 9 is_stmt 1 discriminator 3 view .LVU553
	addq	$32, %rsp
	.cfi_def_cfa_offset 48
	movl	$1, %edi
	call	orig_exit@PLT
.LVL259:
.L130:
	.loc 1 190 5 discriminator 1 view .LVU554
	.loc 1 190 5 discriminator 1 view .LVU555
.LBB74:
.LBI74:
	.loc 2 103 1 discriminator 1 view .LVU556
.LBB75:
	.loc 2 105 3 discriminator 1 view .LVU557
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU558
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	pushq	1016(%rbp)
	.cfi_def_cfa_offset 64
	pushq	0(%rbp)
	.cfi_def_cfa_offset 72
	pushq	%rbx
	.cfi_def_cfa_offset 80
	movl	$190, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC24(%rip), %rcx
	leaq	.LC25(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL260:
	.loc 2 105 10 discriminator 1 view .LVU559
	call	__fprintf_chk@PLT
.LVL261:
	.loc 2 105 10 discriminator 1 view .LVU560
.LBE75:
.LBE74:
	.loc 1 190 5 is_stmt 1 discriminator 1 view .LVU561
	addq	$32, %rsp
	.cfi_def_cfa_offset 48
	movl	$1, %edi
	call	orig_exit@PLT
.LVL262:
.L138:
	.loc 1 194 5 discriminator 1 view .LVU562
	.loc 1 194 5 discriminator 1 view .LVU563
.LBB76:
.LBI76:
	.loc 2 103 1 discriminator 1 view .LVU564
.LBB77:
	.loc 2 105 3 discriminator 1 view .LVU565
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU566
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	pushq	%rbx
	.cfi_def_cfa_offset 64
	movl	$194, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC26(%rip), %rcx
	leaq	.LC27(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	call	__fprintf_chk@PLT
.LVL263:
	.loc 2 105 10 discriminator 1 view .LVU567
.LBE77:
.LBE76:
	.loc 1 194 5 is_stmt 1 discriminator 1 view .LVU568
	movl	$1, %edi
	call	orig_exit@PLT
.LVL264:
	.cfi_endproc
.LFE50:
	.size	test_free_reuse_merge, .-test_free_reuse_merge
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"Assertion \"%s\" at %s:%d failed: New allocation did not reuse any freed memory (size=%zu, new=%p)\n"
	.text
	.type	test_free_reuse, @function
test_free_reuse:
.LFB48:
	.loc 1 104 1 view -0
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.loc 1 104 1 is_stmt 0 view .LVU570
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	.loc 1 105 5 is_stmt 1 view .LVU571
.LVL265:
	.loc 1 106 5 view .LVU572
	.loc 1 106 18 is_stmt 0 view .LVU573
	movq	$64, (%rsp)
	movq	$96, 8(%rsp)
	movq	$128, 16(%rsp)
	movq	$4097, 24(%rsp)
	.loc 1 107 5 is_stmt 1 view .LVU574
.LVL266:
	.loc 1 108 5 view .LVU575
	.loc 1 109 5 view .LVU576
	.loc 1 111 5 view .LVU577
	.loc 1 111 19 view .LVU578
	.loc 1 106 18 is_stmt 0 view .LVU579
	movl	$500, %r12d
	leaq	32(%rsp), %rbp
	jmp	.L140
.LVL267:
.L152:
	.loc 1 111 33 is_stmt 1 discriminator 2 view .LVU580
	.loc 1 111 19 discriminator 2 view .LVU581
	subl	$1, %r12d
.LVL268:
	.loc 1 111 19 is_stmt 0 discriminator 2 view .LVU582
	je	.L142
.LVL269:
.L140:
	.loc 1 112 23 is_stmt 1 view .LVU583
	movq	%rsp, %r13
	.loc 1 104 1 is_stmt 0 view .LVU584
	movq	%r13, %rbx
.LVL270:
.L141:
	.loc 1 113 13 is_stmt 1 discriminator 3 view .LVU585
	movq	(%rbx), %rdi
	call	checked_alloc@PLT
.LVL271:
	.loc 1 112 34 discriminator 3 view .LVU586
	.loc 1 112 23 discriminator 3 view .LVU587
	addq	$8, %rbx
.LVL272:
	.loc 1 112 23 is_stmt 0 discriminator 3 view .LVU588
	cmpq	%rbp, %rbx
	jne	.L141
	jmp	.L152
.L142:
	.loc 1 116 5 is_stmt 1 view .LVU589
	.loc 1 116 17 is_stmt 0 view .LVU590
	movq	allocs(%rip), %rbx
.LVL273:
	.loc 1 117 5 is_stmt 1 view .LVU591
	.loc 1 117 12 view .LVU592
	testq	%rbx, %rbx
	je	.L143
.L144:
.LBB78:
	.loc 1 118 9 view .LVU593
.LVL274:
	.loc 1 119 9 view .LVU594
	movq	%rbx, %rax
	.loc 1 119 21 is_stmt 0 view .LVU595
	movq	24(%rbx), %rbx
.LVL275:
	.loc 1 120 9 is_stmt 1 view .LVU596
	movq	(%rax), %rdi
	call	checked_free@PLT
.LVL276:
	.loc 1 120 9 is_stmt 0 view .LVU597
.LBE78:
	.loc 1 117 12 is_stmt 1 view .LVU598
	testq	%rbx, %rbx
	jne	.L144
.L143:
.LVL277:
	.loc 1 123 28 view .LVU599
	leaq	-32(%r13), %r15
.LBB79:
	.loc 1 128 17 is_stmt 0 view .LVU600
	leaq	allocs(%rip), %r14
	.loc 1 129 21 view .LVU601
	leaq	freed_allocs(%rip), %r12
.LVL278:
.L146:
	.loc 1 124 9 is_stmt 1 view .LVU602
	.loc 1 125 9 view .LVU603
	.loc 1 127 9 view .LVU604
	.loc 1 127 31 is_stmt 0 view .LVU605
	movq	24(%r13), %rbp
	.loc 1 127 15 view .LVU606
	movq	%rbp, %rdi
	call	checked_alloc@PLT
.LVL279:
	movq	%rax, %rbx
.LVL280:
	.loc 1 128 9 is_stmt 1 view .LVU607
	.loc 1 128 17 is_stmt 0 view .LVU608
	movq	%rax, %rsi
	movq	%r14, %rdi
	call	memlist_find@PLT
.LVL281:
	.loc 1 128 17 view .LVU609
	movq	%rax, %rsi
.LVL282:
	.loc 1 129 9 is_stmt 1 view .LVU610
	.loc 1 129 21 is_stmt 0 view .LVU611
	movq	%r12, %rdi
	call	memlist_find_overlap_unsorted@PLT
.LVL283:
	.loc 1 130 9 is_stmt 1 view .LVU612
	.loc 1 130 9 view .LVU613
	testq	%rax, %rax
	je	.L153
	.loc 1 130 9 discriminator 2 view .LVU614
	.loc 1 130 9 discriminator 2 view .LVU615
.LBE79:
	.loc 1 123 35 discriminator 2 view .LVU616
.LVL284:
	.loc 1 123 28 discriminator 2 view .LVU617
	subq	$8, %r13
.LVL285:
	.loc 1 123 28 is_stmt 0 discriminator 2 view .LVU618
	cmpq	%r13, %r15
	jne	.L146
	.loc 1 133 1 view .LVU619
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
.LVL286:
	.loc 1 133 1 view .LVU620
	jne	.L154
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL287:
	.loc 1 133 1 view .LVU621
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL288:
	.loc 1 133 1 view .LVU622
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL289:
.L153:
	.cfi_restore_state
.LBB82:
	.loc 1 130 9 is_stmt 1 discriminator 1 view .LVU623
	.loc 1 130 9 discriminator 1 view .LVU624
.LBB80:
.LBI80:
	.loc 2 103 1 discriminator 1 view .LVU625
.LBB81:
	.loc 2 105 3 discriminator 1 view .LVU626
	.loc 2 105 10 is_stmt 0 discriminator 1 view .LVU627
	pushq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 120
	pushq	%rbp
	.cfi_def_cfa_offset 128
	movl	$130, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC26(%rip), %rcx
	leaq	.LC28(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	call	__fprintf_chk@PLT
.LVL290:
	.loc 2 105 10 discriminator 1 view .LVU628
.LBE81:
.LBE80:
	.loc 1 130 9 is_stmt 1 discriminator 1 view .LVU629
	movl	$1, %edi
	call	orig_exit@PLT
.LVL291:
.L154:
	.cfi_restore_state
	.loc 1 130 9 is_stmt 0 discriminator 1 view .LVU630
.LBE82:
	.loc 1 133 1 view .LVU631
	call	__stack_chk_fail@PLT
.LVL292:
	.cfi_endproc
.LFE48:
	.size	test_free_reuse, .-test_free_reuse
	.type	test_calloc, @function
test_calloc:
.LFB46:
	.loc 1 69 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 70 5 view .LVU633
	.loc 1 70 16 is_stmt 0 view .LVU634
	movl	$1, use_calloc(%rip)
	.loc 1 71 5 is_stmt 1 view .LVU635
	movl	$1, %esi
	movl	$0, %edi
	call	checked_alloc_array@PLT
.LVL293:
	.loc 1 72 5 view .LVU636
	movl	$0, %esi
	movl	$1, %edi
	call	checked_alloc_array@PLT
.LVL294:
	.loc 1 73 5 view .LVU637
	movl	$1, %esi
	movl	$1, %edi
	call	checked_alloc_array@PLT
.LVL295:
	.loc 1 74 5 view .LVU638
	movl	$8, %esi
	movl	$1, %edi
	call	checked_alloc_array@PLT
.LVL296:
	.loc 1 75 5 view .LVU639
	movl	$1, %esi
	movl	$8, %edi
	call	checked_alloc_array@PLT
.LVL297:
	.loc 1 76 5 view .LVU640
	movl	$127, %esi
	movl	$128, %edi
	call	checked_alloc_array@PLT
.LVL298:
	.loc 1 77 5 view .LVU641
	movl	$128, %esi
	movl	$127, %edi
	call	checked_alloc_array@PLT
.LVL299:
	.loc 1 78 5 view .LVU642
	movl	$4096, %esi
	movl	$127, %edi
	call	checked_alloc_array@PLT
.LVL300:
	.loc 1 79 1 is_stmt 0 view .LVU643
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE46:
	.size	test_calloc, .-test_calloc
	.globl	randomized_allocs
	.hidden	randomized_allocs
	.type	randomized_allocs, @function
randomized_allocs:
.LVL301:
.LFB40:
	.loc 1 14 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 14 1 is_stmt 0 view .LVU645
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movq	%rdx, %r13
	.loc 1 15 5 is_stmt 1 view .LVU646
	.loc 1 16 5 view .LVU647
	movl	%esi, %edi
.LVL302:
	.loc 1 16 5 is_stmt 0 view .LVU648
	call	srand@PLT
.LVL303:
	.loc 1 17 5 is_stmt 1 view .LVU649
	leaq	allocs(%rip), %rdi
	call	memlist_check_data@PLT
.LVL304:
	.loc 1 18 5 view .LVU650
	.loc 1 18 43 is_stmt 0 view .LVU651
	movl	$1, checked_alloc_disable_integrity_check(%rip)
	.loc 1 19 5 is_stmt 1 view .LVU652
.LVL305:
	.loc 1 19 19 view .LVU653
	testq	%r12, %r12
	je	.L158
	.loc 1 19 12 is_stmt 0 view .LVU654
	movl	$0, %ebx
	.loc 1 20 23 view .LVU655
	leaq	-1(%r13), %r14
.LVL306:
.L159:
	.loc 1 20 9 is_stmt 1 discriminator 3 view .LVU656
	.loc 1 20 23 is_stmt 0 discriminator 3 view .LVU657
	call	rand@PLT
.LVL307:
	cltq
	movl	$0, %edx
	divq	%rbp
	leaq	(%rdx,%r14), %rdi
	movq	%r13, %rax
	negq	%rax
	.loc 1 20 9 discriminator 3 view .LVU658
	andq	%rax, %rdi
	call	checked_alloc@PLT
.LVL308:
	.loc 1 19 34 is_stmt 1 discriminator 3 view .LVU659
	addq	$1, %rbx
.LVL309:
	.loc 1 19 19 discriminator 3 view .LVU660
	cmpq	%rbx, %r12
	jne	.L159
.LVL310:
.L158:
	.loc 1 22 5 view .LVU661
	.loc 1 22 43 is_stmt 0 view .LVU662
	movl	$0, checked_alloc_disable_integrity_check(%rip)
	.loc 1 23 5 is_stmt 1 view .LVU663
	leaq	allocs(%rip), %rdi
	call	memlist_check_data@PLT
.LVL311:
	.loc 1 24 1 is_stmt 0 view .LVU664
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
.LVL312:
	.loc 1 24 1 view .LVU665
	popq	%r12
	.cfi_def_cfa_offset 24
.LVL313:
	.loc 1 24 1 view .LVU666
	popq	%r13
	.cfi_def_cfa_offset 16
.LVL314:
	.loc 1 24 1 view .LVU667
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	randomized_allocs, .-randomized_allocs
	.type	test_system_malloc, @function
test_system_malloc:
.LFB59:
	.loc 1 371 1 is_stmt 1 view -0
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 372 5 view .LVU669
.LVL315:
	.loc 1 373 5 view .LVU670
	.loc 1 375 5 view .LVU671
	.loc 1 375 22 is_stmt 0 view .LVU672
	movl	$1, use_system_alloc(%rip)
	.loc 1 377 5 is_stmt 1 view .LVU673
	.loc 1 377 16 is_stmt 0 view .LVU674
	movl	$0, use_calloc(%rip)
	.loc 1 378 5 is_stmt 1 view .LVU675
	movl	$1, %edx
	movl	$8192, %esi
	movl	$10, %edi
	call	randomized_allocs
.LVL316:
	.loc 1 380 5 view .LVU676
	.loc 1 380 16 is_stmt 0 view .LVU677
	movl	$1, use_calloc(%rip)
	.loc 1 381 5 is_stmt 1 view .LVU678
	movl	$1, %edx
	movl	$8192, %esi
	movl	$10, %edi
	