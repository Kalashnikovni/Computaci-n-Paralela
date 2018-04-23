	REAL*4 X,Y
	X = 0.1
	Y = 0
	DO I=1,10
		Y = Y+X
	ENDDO
	IF (Y .EQ. 1.0) THEN
		PRINT *,'Algebra is truth'
	ELSE
		PRINT *,'Not here'
	ENDIF
	PRINT *,1.0-Y
	END
