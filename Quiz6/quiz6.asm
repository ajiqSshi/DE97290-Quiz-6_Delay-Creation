  #include<p18F4550.inc>
  

          org 0x00
          goto start
          org 0x08
          retfie
          org 0x18
          retfie
          


dup_nop   macro kk
          variable i

i=0
          while i<kk
          nop

i+=1
          endw
          endm

loop_cnt1 set 0x00
loop_cnt2 set 0x01

Delay		movlw D'90'							;450k instruction cycle that will make 90ms
			movwf loop_cnt1, A
		
again1		movlw D'250'						;this whole include internal loop will take 5000 instruction cycle!1ms
			movwf loop_cnt2, A
again2		dup_nop D'17'						;4microseconds to finish (20 instructuion cycle)
			decfsz loop_cnt2, F, A				;*1 instruction cycle
			bra again2							;* 2 instruction cycle
			decfsz loop_cnt1, F, A
			bra again1		
start
			end			