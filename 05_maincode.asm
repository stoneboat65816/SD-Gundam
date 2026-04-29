org $208000
define	text_map			$7FFA00
define	map_trigger		$7FF9F0
define	army					$0D14
define	total_brick		$0324
define	bg3_xpos			$0495
define	bg3_ypos			$049B
define	value_flag			$7FFAE0


dma_text:
	SEP #$20
	REP #$10
	LDX #$1801
	STX $4300
	LDA.b #(text_chr>>16)
	STA $4304
	LDX #(text_chr)
	STX $4302
	LDX #$0400
	STX $4305
	LDX #$4200
	STX $2116
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	REP #$30
	JSR write_textmap
	JSR dma_textmap
	REP #$20
	LDA #$9E00
	JML $809366
	
write_textmap:
	LDX #$0000
-
	LDA textmap,x
	STA {text_map},x
	INX #2
	CPX #$00E0
	BNE -
	RTS
	
dma_textmap:
	PHP
	SEP #$20
	REP #$10
	LDA #$7F
	STA $4304
	LDX #({text_map})
	STX $4302
	LDX #$1801
	STX $4300
	LDX #$00E0
	STX $4305
	LDX #$5840
	STX $2116
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	PLP
	RTS
	
new_nmi:
	PHP
	PHX
	SEP #$20
	PHA
	LDA $004210
	LDA {map_trigger}
	BEQ +
	JSR dma_text_map
+
	LDA #$01
	STA $001FFE
	PLA
	PLX
	PLP
	RTI
	
dma_text_map:
	PHP
	SEP #$20
	REP #$10
	LDA #$7F
	STA $4304
	LDX #$1801
	STX $4300
	LDX #({text_map})
	STX $4302
	LDX #$00E0
	STX $4305
	LDX #$5840
	STX $2116
	LDA #$80
	STA $2115
	LDA #$01
	STA $420B
	PLP
	RTS
	
change_army:
	REP #$20
	JSR display_army
	LDA $C6
	BIT #$0020
	BEQ +
	LDA {army}
	CMP #$0009
	BCC _1
	LDA #$0009
	BRA _2
	
_1:
	INC
_2:
	STA {army}
	SEP #$20
	LDA $046E
	JML $808129
	
+
	BIT #$0010
	BEQ +
	LDA {army}
	BEQ _3
	DEC
	BRA _4
	
_3:
	LDA #$0000
_4:
	STA {army}
	SEP #$20
	LDA $046E
	JML $808129
+
	SEP #$20
	LDA $046E
	JML $808129
	
	
	
	
display_army:
	PHX
	PHY
	LDA {value_flag}
	BNE +
	LDA {army}
	AND #$00FF
	ASL
	CLC
	ADC #$2450
	STA {text_map}+0x14
	INC
	STA {text_map}+0x54
	JSR get_block_level
	TXA
	ASL
	CLC
	ADC #$2450
	STA {text_map}+0x94
	INC
	STA {text_map}+0xD4
+
	PLY
	PLX
	RTS
	
get_block_level:
	PHP
	REP #$30
	LDA $00
	PHA
	SEP #$30
	LDY #$06
	STY $01
	STZ $00
	LDX #$21
	JSR check_block
	LDX #$29
	JSR check_block
	LDX #$31
	JSR check_block
	LDX #$39
	JSR check_block
	LDX #$41
	JSR check_block
	LDX #$49
	JSR check_block
	LDX #$51
	JSR check_block
	LDX #$59
	JSR check_block
	REP #$30
	LDA $00
	AND #$00FF
	TAX
	PLA
	STA $00
	PLP
	RTS
	
check_block:
	LDA $00,x
	BEQ +
	INX
	DEY
	BEQ increment_level
	BRA check_block
+
	LDY $01
	RTS
increment_level:
	INC $00
	LDY $01
	RTS
	
enable_text_tilemap:
	SEP #$30
	LDA #$01
	STA {map_trigger}
	LDA #$00
	STA $2100
	STA {value_flag}
	STA {value_flag}+1
	JML $809620
	
init_bg3_setting:
	LDA #$0000
	STA {map_trigger}
	STA {value_flag}
	PEA $0000
	PLB #2
	JML $83812D
	
disable_bg3_1:
	REP #$30
	JSR init_textmap
	LDA #$0000
	STA {map_trigger}
	SEP #$20
	LDA #$13
	STA $04A0
	JML $81876D
	
init_textmap:
	LDX #$0000
	TXA
-
	STA {text_map},x
	INX #2
	CPX #$00E0
	BNE -
	LDA #$FFFF
	STA {value_flag}
	RTS
	
disable_bg3_2:
	JSR init_textmap
	LDY $0CB5
	LDX $0D14,y
	JML $80DD10
	
disable_bg3_3:
	JSR init_textmap
	SEP #$20
	LDA #$02
	STA $2130
	JML $8CC5A5
	
restore_bg3_1:
	PHX
	LDA #$0000
	STA {bg3_xpos}
	STA {bg3_ypos}
	STA {value_flag}
	LDA #$0001
	STA {map_trigger}
	JSR write_textmap
	SEP #$20
	LDA #$00
	STA $2124
	REP #$20
	PLX
	LDA $80C834,x
	STA $0D03
	JML $80C75C
	
restore_bg3_2:
	REP #$20
	LDA #$0000
	STA {bg3_xpos}
	STA {bg3_ypos}
	STA {value_flag}
	LDA #$0001
	STA {map_trigger}
	JSR write_textmap
	SEP #$20
	LDA #$15
	STA $04A0
	PLP
	JML $80CAE5