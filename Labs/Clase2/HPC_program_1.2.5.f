	REAL*4 X,Y
	X = 1.25E8
	Y = X + 7.5E-3
	IF (X .EQ. Y) THEN
		PRINT *,'Am I nuts or what?'
	ENDIF
	PRINT *,X,Y
	END