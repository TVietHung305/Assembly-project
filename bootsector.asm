org 0x7c00
dw 0xaa55

mov bp, 0xffff
mov sp, bp

call video_mode
call input

jmp $

video_mode:
	mov ah, 0x00
	mov al, 0x03
	int 0x10
	ret

input:
	xor ah, ah 		
	int 0x16

	mov ah, 0x0e
	int 0x10

	jmp input

times 0x1fe-($-$$) db 0
