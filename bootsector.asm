org 0x7c00]

mov bp, 0xffff
mov sp, bp

call set_video_mode
call get_char_input

jmp $

set_video_mode:
	mov ah, 0x00
	mov al, 0x03
	int 0x10
	ret

get_char_input:
	xor ah, ah 		; same as mov ah, 0x00
	int 0x16

	mov ah, 0x0e
	int 0x10

	jmp get_char_input

times 0x1fe-($-$$) db 0
dw 0xaa55
