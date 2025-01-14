printf proto
ExitProcess proto

.data
	a struct
		b dq ?
	a ends
	c a <>
	d struct
		e dq ?
		f dq ?
	d ends
	g d <>
	i db "Hello", 10, 0
	k db "World", 10, 0
	m db "Hello, World!", 10, 0
	n struct
		o db ?
		p dw ?
	n ends
	q n <>
	r n <>
	fmt db "%d", 0

.code
mainCRTStartup proc
	sub		rsp, 40

	lea		rax, g
	mov		[c.b], rax

	mov		rcx, c
	call	l

	lea		rcx, c
	mov		rax, [g.e]
	call	rax

	lea		rcx, c
	mov		rax, [g.f]
	call	rax

	mov		q.o, 127
	mov		r.o, 255
	lea		rcx, fmt
	mov		dl, q.o
	call	printf
	
	xor		ecx, ecx
	call	ExitProcess
mainCRTStartup endp
h proc
	sub		rsp, 40

	lea		rcx, i
	call	printf

	add		rsp, 40

	ret
h endp
j proc
	sub		rsp, 40

	lea		rcx, k
	call	printf

	add		rsp, 40

	ret
j endp
l proc
	sub rsp, 40

	lea		rax, g
	mov		[c.b], rax
	lea		rax, h
	mov		[g.e], rax
	lea		rax, j
	mov		[g.f], rax
	
	lea		rcx, m
	call	printf

	add rsp, 40

	ret
l endp
end