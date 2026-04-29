arch snes.cpu
lorom

org $FFD7
	db $0B
	
org $208000
	fill $100000
	
	incsrc "04_vector.asm"
	incsrc "05_maincode.asm"
	incsrc "06_incbin.asm"
	
