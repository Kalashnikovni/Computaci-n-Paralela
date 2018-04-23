	INTEGER X
	DO X=1, 1000
		IF ((1.0/X)*X .NE. 1.0) THEN
			PRINT *, "X^-1*X != 1 for X=", X
		ENDIF
	ENDDO
	END