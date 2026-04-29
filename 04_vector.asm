org $809361
	JML dma_text
	
org $80ADFE
	LDA #$15
	STA $212C
	STA $04A0
	
org $809626
	LDA #$15
	STA $04A0
	
org $88E8FA
	dw $7C00, $FFFF
	
org $008050
	JML new_nmi
	
org $808124
	JML change_army
	
org $809619
	JML enable_text_tilemap
	
org $838128
	JML init_bg3_setting
	
org $818766
	JML disable_bg3_1
	
org $80DD0A
	JML disable_bg3_2
	
org $8CC59E
	JML disable_bg3_3
	
org $80C755
	JML restore_bg3_1
	
org $80CADD
	JML restore_bg3_2