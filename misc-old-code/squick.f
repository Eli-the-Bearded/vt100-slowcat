C---------------------------------------------------------------------------
C	SQUICK.F            STARTS HERE
C
C	ORIGINAL GRAPHICS BY HEATH DOERR
C	ANIMATION BY LONELY VICIOUS
C
C	I'D LIKE TO DEDICATE THIS PROGRAM TO THOSE POLITICALLY CORRECT
C	PEOPLE WHO CAN'T ENJOY A JOKE, BUT INSTEAD THEY MUST GO CRYING
C	TO COMPLAIN TO A RANDOMLY SELECTED SYSTEM ADMINISTRATOR. THEIR
C	BRAINS ARE USEFUL ONLY FOR THIS.
C
C	CLEAR THE SCREEN
	INTEGER CHARACTERS/0/,SPEED,I,J,K,L,FARSIDE/50/,NEXTI/1/
	CHARACTER*1 ESC,SLASH
	CHARACTER*8 AT,RCHAIN/'%&#@>{]*'/
	CHARACTER*13 HEAD(8)
	COMMON /PARTICLES/ SCREEN,TYPE,X,Y,VX,VY,SEED,N,W
	CHARACTER*1 SCREEN(22,78),TYPE(100)
	REAL*4 X(100),Y(100),VX(100),VY(100)
	INTEGER SEED/34567/,N/0/,W(100)


C	INCREASE  THE VARIABLE SPEED TO RUN SLOWER.
	SPEED=300


	ESC=CHAR(27)
	SLASH=CHAR(92)
C	START ; CLEAR THE SCREEN
	WRITE (*,*) AT(1,1)//ESC//'[2J'
	DO 1 I=1,22
		DO 2 J=1,78
			SCREEN(I,J)=' '
2		CONTINUE
1	CONTINUE
C	HEAD AT THE BEGINNING
	HEAD(1)='  ________   '
	HEAD(2)=' ////////'//SLASH//SLASH//'  '
	HEAD(3)='/         '//SLASH//SLASH//' '
	HEAD(4)='|  o  o    | '
	HEAD(5)='|   /_    @| '
	HEAD(6)=' '//SLASH//'        /  '
	HEAD(7)='  '//SLASH//' '//SLASH//'__/ /'//SLASH//'  '
	HEAD(8)='   '//SLASH//'____/    '
	CALL DRAW_HEAD(50,CHARACTERS,HEAD)
	CALL FRAME(SPEED,CHARACTERS)
C	DRILL
	DO 10 I=1,37
		CALL OUT (I,14,CHARACTERS,' ,--------.')
		CALL OUT (I,15,CHARACTERS,'-| O-  ___|'//SLASH
     *	//SLASH//SLASH//SLASH//SLASH//SLASH//SLASH//'>')
		CALL OUT (I,16,CHARACTERS,' '//SLASH//'  ,-/')
		CALL OUT (I,17,CHARACTERS,'  | |/')
		CALL OUT (I,18,CHARACTERS,'  |_/')
		IF (I.EQ.15) THEN
C			STRAIGHT MOUTH
			HEAD(7)='  '//SLASH//' ---- /'//SLASH//'  '
			CALL DRAW_HEAD(50,CHARACTERS,HEAD)
		ELSE IF (I.EQ.25) THEN
C			LARGE EYES
			HEAD(4)='|  O  O    | '
			CALL DRAW_HEAD(50,CHARACTERS,HEAD)
		ELSE IF (I.EQ.35) THEN
C			SAD FACE
			HEAD(6)=' '//SLASH//'   __   /  '
			HEAD(7)='  '//SLASH//' /__'//SLASH//' /'//SLASH//'  '
			CALL DRAW_HEAD(50,CHARACTERS,HEAD)
		END IF
		CALL FRAME(SPEED,CHARACTERS)
10	CONTINUE
	CALL OUT(55,15,CHARACTERS,')')
C	PAUSE
	DO 20 I=1,20
		CALL FRAME(SPEED,CHARACTERS)
		CALL CREATE_PARTICLE(55.,15.,1,1.7,4.84,2.,1,'R')
		CALL CREATE_PARTICLE(55.,15.,1,1.7,4.84,2.,1,'R')
20	CONTINUE
C	DRILL GOES OFF; STOP SHOUTING AND MAKE HOLE
	HEAD(7)='  '//SLASH//' /  '//SLASH//' /'//SLASH//'  '
	HEAD(3)='/   ()    '//SLASH//SLASH//' '
	DO 30 I=37,1,-1
		CALL DRAW_HEAD(50,CHARACTERS,HEAD)
		CALL OUT (I,14,CHARACTERS,' ,--------. ')
		CALL OUT (I,15,CHARACTERS,'-| O-  ___|'//SLASH
     *	//SLASH//SLASH//SLASH//SLASH//SLASH//SLASH//'> ')
		CALL OUT (I,16,CHARACTERS,' '//SLASH//'  ,-/ ')
		CALL OUT (I,17,CHARACTERS,'  | |/ ')
		CALL OUT (I,18,CHARACTERS,'  |_/ ')
		CALL FRAME(SPEED,CHARACTERS)
30	CONTINUE
C	ERASE DRILL
	DO 40 I=14,18
		CALL OUT(1,I,CHARACTERS,'                   ')
40	CONTINUE
C	RELAX EYES AND MOUTH
	HEAD(4)='|  o  o    | '
	HEAD(6)=' '//SLASH//'        /  '
	HEAD(7)='  '//SLASH//' ---- /'//SLASH//'  '
	CALL DRAW_HEAD(50,CHARACTERS,HEAD)
	CALL FRAME(SPEED,CHARACTERS)
C	DRAW GUY
	CALL OUT(12,11,CHARACTERS,'|           |')
	CALL OUT(12,12,CHARACTERS,'|           |')
	CALL OUT(12,13,CHARACTERS,'|           ##')
	CALL OUT(12,14,CHARACTERS,'|           #------'//SLASH)
	CALL OUT(11,15,CHARACTERS,'/            .'//SLASH//'-----/')
	CALL OUT(10,16,CHARACTERS,'|             ..|')
	CALL OUT(10,17,CHARACTERS,'|            '//SLASH//'_/')
	CALL OUT(11,18,CHARACTERS,SLASH//'___         |')
	CALL OUT(15,19,CHARACTERS,'|        |')
	CALL OUT(15,20,CHARACTERS,'|        |')
C	AMAZED EYES
	HEAD(4)='| (o)(o)   | '
	CALL DRAW_HEAD(50,CHARACTERS,HEAD)
C	QUESTION MARKS
	CALL OUT(55,11,CHARACTERS,'??')
	DO 50 I=1,20
		CALL FRAME(SPEED,CHARACTERS)
50	CONTINUE
C	ERASE QUESTION MARKS
	CALL OUT(55,11,CHARACTERS,'  ')
C	LARGE EYES
	HEAD(4)='|  O  O    | '
	CALL DRAW_HEAD(50,CHARACTERS,HEAD)
C	START SQUICKING; 11 IN-OUTS
	DO 60 I=1,11
C		MOVE HEAD TOWARDS DICK
		DO 70 J=FARSIDE,27,-1
			CALL COMPUTE_DICK(I,J,HEAD,-1)
			CALL DRAW_HEAD(J,CHARACTERS,HEAD)
			CALL FRAME(SPEED,CHARACTERS)
70		CONTINUE
		CALL CREATE_PARTICLE(32.,15.,1,2.,4.,1.,1,'R')
		CALL CREATE_PARTICLE(32.,15.,1,2.,4.,1.,1,'R')
		CALL CREATE_PARTICLE(32.,15.,1,2.,4.,1.,1,'R')
C		FROM NOW ON, THE HEAD WON'T GO AWAY SO FAR
		FARSIDE=40
		IF (I.EQ.2) THEN
C			AGAIN, SAD MOUTH
			HEAD(6)=' '//SLASH//'   __   /  '
			HEAD(7)='  '//SLASH//' /  '//SLASH//' /'//SLASH//'  '
		ELSE IF (I.EQ.3) THEN
C			DEAD EYES
			HEAD(4)='|  X  X    | '
		ELSE IF (I.EQ.4) THEN
C			DEAD MOUTH
			HEAD(6)=' '//SLASH//' ''.__   /  '
			HEAD(7)='  '//SLASH//' ///~ /'//SLASH//'  '
			HEAD(8)='   '//SLASH//SLASH//'/__/    '
		END IF
C		MOVE HEAD AWAY FROM DICK
		DO 80 J=1,8
			HEAD(J)=' '//HEAD(J)
80		CONTINUE
		DO 90 J=27,FARSIDE
			CALL COMPUTE_DICK(I,J,HEAD,1)
			CALL DRAW_HEAD(J,CHARACTERS,HEAD)
			CALL FRAME(SPEED,CHARACTERS)
90		CONTINUE
		DO 100 J=1,8
			HEAD(J)=HEAD(J)(2:13)//' '
100		CONTINUE
60	CONTINUE
C	MOVE THE HEAD A LITTLE BIT FURTHER
	DO 110 J=1,8
		HEAD(J)=' '//HEAD(J)
110	CONTINUE
	DO 120 J=41,55
		CALL COMPUTE_DICK(I,J,HEAD,1)
		CALL DRAW_HEAD(J,CHARACTERS,HEAD)
		CALL FRAME(SPEED,CHARACTERS)
120	CONTINUE
C	GUY CUMS 12 TIMES
	DO 130 I=1,12
	  CALL CREATE_PARTICLE(42.,15.,0,1.,0.,0.,0,'O')
	  DO 140 J=1,3
C	    SEE WHETHER THE SEMEN HAS ARRIVED TO THE
C	    VICTIM'S FACE
	    DO 150 K=1,N
	      IF (W(K).EQ.0) THEN
		IF (VX(K).EQ.1.) THEN
		  IF (X(K).GE.54.+FLOAT(NEXTI)) THEN
		    NEXTI=NEXTI+1
		    CALL KILL_PARTICLE(K)
		    DO 160 L=1,4
		      HEAD(L)(NEXTI  :NEXTI  )=' '
		      FARSIDE=1+INT(8.*RAN(SEED))
		      HEAD(L)(NEXTI+1:NEXTI+1)=RCHAIN(FARSIDE:FARSIDE)
160		    CONTINUE
		    FARSIDE=1+INT(8.*RAN(SEED))
		    HEAD(5)(NEXTI:NEXTI)=RCHAIN(FARSIDE:FARSIDE)
		    CALL DRAW_HEAD(55,CHARACTERS,HEAD)
C		    CREATE 10 NEW PARTICLES
		    DO 170 L=1,10
		      CALL CREATE_PARTICLE 
     *		      (54.+FLOAT(NEXTI),15.,1,0.,3.14,2.,1,'R')
170		    CONTINUE
		    GOTO 180
		  END IF
		END IF
	      END IF
150	    CONTINUE
180	    CALL FRAME(SPEED,CHARACTERS)
140	  CONTINUE
130	CONTINUE
	DO 1000 I=1,40
		IF (MOD(I,4).EQ.0) THEN
			CALL OUT(43-I/4,14,CHARACTERS,SLASH//' ')
			CALL OUT(43-I/4,15,CHARACTERS,'/ ')
		END IF
		CALL FRAME(SPEED,CHARACTERS)
1000	CONTINUE
	STOP
	END

	SUBROUTINE CREATE_PARTICLE(XX,YY,FLAG,VVX,VVY,V,WW,TT)
	COMMON /PARTICLES/ SCREEN,TYPE,X,Y,VX,VY,SEED,N,W
	CHARACTER*1 SCREEN(22,78),TYPE(100)
	REAL*4 X(100),Y(100),VX(100),VY(100)
	INTEGER SEED,N,W(100)
	REAL*4 VVX,VVY,V,ANGLE,XX,YY
	INTEGER FLAG,I,WW
	CHARACTER*1 TT
	CHARACTER*8 AT
	CHARACTER*31 CHAIN/'Oo0~@#$^*-_=+[]|\/.,'';:vXxIHYMW'/
	IF (N.EQ.100) RETURN
	N=N+1
	X(N)=XX
	Y(N)=YY
	IF (FLAG.EQ.1) THEN
		ANGLE=VVX+(VVY-VVX)*RAN(SEED)
		VX(N)=V*COS(ANGLE)
		VY(N)=-V*SIN(ANGLE)
	ELSE
		VX(N)=VVX
		VY(N)=VVY
	END IF
	TYPE(N)=TT
	IF (TT.EQ.'R') THEN
		I=INT(1.+31.*RAN(SEED))
		TYPE(N)=CHAIN(I:I)
	END IF
	W(N)=WW
	WRITE (*,*) AT(INT(YY+.5),INT(XX+.5))//TYPE(N)
	RETURN
	END

	SUBROUTINE KILL_PARTICLE(I)
	COMMON /PARTICLES/ SCREEN,TYPE,X,Y,VX,VY,SEED,N,W
	CHARACTER*1 SCREEN(22,78),TYPE(100)
	REAL*4 X(100),Y(100),VX(100),VY(100)
	INTEGER SEED,N,W(100)
	INTEGER I
		X(I)=X(N)
		Y(I)=Y(N)
		VX(I)=VX(N)
		VY(I)=VY(N)
		W(I)=W(N)
		TYPE(I)=TYPE(N)
		N=N-1
	RETURN
	END

	SUBROUTINE UPDATE_PARTICLES(CHARACTERS)
C	THIS SUBROUTINE MOVES THE PARTICLES, RESTORING THE ORIGINAL
C	BACKGROUND (WHICH IS STORED IN THE MATRIX SCREEN)
	COMMON /PARTICLES/ SCREEN,TYPE,X,Y,VX,VY,SEED,N,W
	CHARACTER*1 SCREEN(22,78),TYPE(100)
	REAL*4 X(100),Y(100),VX(100),VY(100)
	INTEGER SEED,N,W(100)
	INTEGER I,OLDX,OLDY,XX,YY,CHARACTERS
	CHARACTER*8 AT
	I=1
10	IF (I.GT.N) RETURN
	OLDX=INT(X(I)+.5)
	OLDY=INT(Y(I)+.5)
	X(I)=X(I)+VX(I)
	Y(I)=Y(I)+VY(I)
C	PARTICLES WITH W(I)=0 DON'T FALL
	IF (W(I).NE.0) VY(I)=VY(I)+.1
	XX=INT(X(I)+.5)
	YY=INT(Y(I)+.5)
	CALL OUT(OLDX,OLDY,CHARACTERS,SCREEN(OLDY,OLDX))
C	IF THE PARTICLE WILL STAY WITHIN THE SCREEN, MOVE IT; 
C	OTHERWISE, IT WILL BE FORGOTTEN.
	IF ((1.LE.XX).AND.(XX.LE.78).AND.(1.LE.YY).AND.(YY.LE.22)) THEN
		WRITE (*,*) AT(YY,XX)//TYPE(I)
		I=I+1
		GOTO 10
	ELSE
		CALL KILL_PARTICLE(I)
		GOTO 10
	END IF
	END

	SUBROUTINE COMPUTE_DICK(I,J,HEAD,SPEED)
	INTEGER I,J,LI,K,SPEED
	CHARACTER*13 HEAD(8)
	CHARACTER*1 SLASH
	CHARACTER*13 HA,HB
C	THIS SUBROUTINE CHANGES THE HEAD VARIABLE, SO THAT THE DICK
C	IS SEEN PROPERLY. I IS THE LENGTH OF THE DICK, AND J THE HEAD
C	POSITION. SPEED IS THE SPEED OF THE HEAD; IT'S USED TO ERASE
C	IN THE SIDE FROM WHERE THE HEAD IS MOVING AWAY. LI=LENGTH OF
C	THE DICK INSIDE THE GRAPHIC MATRIX HEAD.
	SLASH=CHAR(92)
	HA=' ////////'//SLASH//SLASH//'  '
	HB='/   ()    '//SLASH//SLASH//' '
	LI=I-J+31
	IF (SPEED.EQ.1) LI=LI-1
	IF (LI.EQ.1) THEN
		HA(1:1)=SLASH
		HB(1:1)='/'
	ELSE IF ((LI.GT.1).AND.(LI.LE.5)) THEN
		DO 10 K=1,LI-1
			HA(K:K)='-'
			HB(K:K)='-'
10		CONTINUE
		HA(LI:LI)=SLASH
		HB(LI:LI)='/'
	ELSE IF (LI.GT.5) THEN
		DO 20 K=1,5
			HA(K:K)='-'
			HB(K:K)='-'
20		CONTINUE
		HA(6:6)='.'
		HB(6:6)=''''
	END IF
	IF (LI.EQ.12) THEN
		HA(12:12)=SLASH
	ELSE IF (LI.EQ.13) THEN
		HA(12:13)='-'//SLASH
		HB(13:13)='/'
	ELSE IF (LI.GT.13) THEN
		HA(12:13)='--'
		HB(13:13)='-'
	END IF
	IF (SPEED.EQ.-1) THEN
		HEAD(2)=HA
		HEAD(3)=HB
	ELSE
		HEAD(2)=' '//HA
		HEAD(3)=' '//HB
		IF (LI.EQ.0) THEN
			HEAD(2)(1:1)=SLASH
			HEAD(3)(1:1)='/'
		ELSE IF (LI.GT.0) THEN
			HEAD(2)(1:1)='-'
			HEAD(3)(1:1)='-'
		END IF
	END IF
	RETURN
	END

	SUBROUTINE FRAME(SPEED,CHARACTERS)
	COMMON /PARTICLES/ SCREEN,TYPE,X,Y,VX,VY,SEED,N,W
	CHARACTER*1 SCREEN(22,78),TYPE(100)
	REAL*4 X(100),Y(100),VX(100),VY(100)
	INTEGER SEED,N,W(100)
C	THIS SUBROUTINE ADJUSTS THE SPEED OF THE MOVIE, AND CAN BE USED
C	FOR DEBUGGING THE PROGRAM.
	INTEGER SPEED,CHARACTERS,COUNTER
	CHARACTER*8 AT
	CHARACTER*1 OP
	COUNTER=COUNTER+1
	IF (COUNTER.EQ.1) THEN
		CALL OUT(45,6,CHARACTERS,'So I have to be tied to')
		CALL OUT(45,7,CHARACTERS,'play squicking ? Why ?')
	ELSE IF (COUNTER.EQ.2) THEN
		CALL OUT(10,8,CHARACTERS,'Ha, ha, ha')
	ELSE IF (COUNTER.EQ.17) THEN
		CALL OUT(48,21,CHARACTERS,'No!')
	ELSE IF (COUNTER.EQ.20) THEN
		CALL OUT(30,13,CHARACTERS,'SHHRRRRRREEEEEEE')
	ELSE IF (COUNTER.EQ.21) THEN
		CALL OUT(60,21,CHARACTERS,'STOP IT!')
	ELSE IF (COUNTER.EQ.29) THEN
		CALL OUT(48,21,CHARACTERS,'   ')
	ELSE IF (COUNTER.EQ.30) THEN
		CALL OUT(45,6,CHARACTERS,'                       ')
		CALL OUT(45,7,CHARACTERS,'                      ')
	ELSE IF (COUNTER.EQ.31) THEN
		CALL OUT(62,15,CHARACTERS,'I DON''T WANNA PLAY')
		CALL OUT(62,16,CHARACTERS,'SQUICKING ANY MORE!')
	ELSE IF (COUNTER.EQ.39) THEN
		CALL OUT(50,11,CHARACTERS,'WROK, BOOF')
	END IF
	IF (COUNTER.EQ.40) THEN
		CALL OUT(63,18,CHARACTERS,'AAAHHH!')
	ELSE IF (COUNTER.EQ.41) THEN
		CALL OUT(60,21,CHARACTERS,'        ')
	ELSE IF (COUNTER.EQ.50) THEN
		CALL OUT(10,8,CHARACTERS,'          ')
	ELSE IF (COUNTER.EQ.58) THEN
		CALL OUT(62,15,CHARACTERS,'                  ')
		CALL OUT(62,16,CHARACTERS,'                   ')
	ELSE IF (COUNTER.EQ.60) THEN
		CALL OUT(50,11,CHARACTERS,'          ')
	ELSE IF (COUNTER.EQ.66) THEN
		CALL OUT(63,18,CHARACTERS,'       ')
	ELSE IF (COUNTER.EQ.70) THEN
		CALL OUT(30,13,CHARACTERS,'                 ')
	ELSE IF (COUNTER.EQ.83) THEN
		CALL OUT(60,5,CHARACTERS,'Poor guy, shall')
		CALL OUT(60,6,CHARACTERS,'we let him go ?')
	ELSE IF (COUNTER.EQ.97) THEN
		CALL OUT(9,9,CHARACTERS,'Come here, pussyhead')
	ELSE IF (COUNTER.EQ.117) THEN
		CALL OUT(9,9,CHARACTERS,'                    ')
	END IF
	IF (COUNTER.EQ.135) THEN
		CALL OUT(65,1,CHARACTERS,'Wha, ha, ha!')
	ELSE IF (COUNTER.EQ.140) THEN
		CALL OUT(30,2,CHARACTERS,'Go! Go! Go!')
	ELSE IF (COUNTER.EQ.164) THEN
		CALL OUT(45,10,CHARACTERS,'LET ME LEAVE')
	ELSE IF (COUNTER.EQ.168) THEN
		CALL OUT(30,15,CHARACTERS,'+')
	ELSE IF (COUNTER.EQ.169) THEN
		CALL OUT(30,21,CHARACTERS,'Agghh!')
	ELSE IF (COUNTER.EQ.180) THEN
		CALL OUT(1,1,CHARACTERS,'Hu, ha, hee')
	ELSE IF (COUNTER.EQ.196) THEN
		CALL OUT(32,10,CHARACTERS,'Blopf')
	ELSE IF (COUNTER.EQ.206) THEN
		CALL OUT(32,10,CHARACTERS,'     ')
	ELSE IF (COUNTER.EQ.207) THEN
		CALL OUT(30,21,CHARACTERS,'      ')
	ELSE IF (COUNTER.EQ.211) THEN
		CALL OUT(47,11,CHARACTERS,'PLEASE !')
	END IF	
	IF (COUNTER.EQ.225) THEN
		CALL OUT(30,8,CHARACTERS,'Has he passed')
		CALL OUT(30,9,CHARACTERS,'away so soon?')
	ELSE IF (COUNTER.EQ.265) THEN
		CALL OUT(1,1,CHARACTERS,'           ')
	ELSE IF (COUNTER.EQ.278) THEN
		CALL OUT(45,10,CHARACTERS,'            ')
		CALL OUT(47,11,CHARACTERS,'        ')
	ELSE IF (COUNTER.EQ.292) THEN
		CALL OUT(15,6,CHARACTERS,'Aaa...')
	ELSE IF (COUNTER.EQ.300) THEN
		CALL OUT(40,5,CHARACTERS,'Is he being sweet?')
	ELSE IF (COUNTER.EQ.301) THEN
		CALL OUT(60,5,CHARACTERS,'               ')
		CALL OUT(60,6,CHARACTERS,'               ')
	ELSE IF (COUNTER.EQ.334) THEN
		CALL OUT(12,7,CHARACTERS,'Aaaaaaaa.....')
	ELSE IF (COUNTER.EQ.336) THEN
		DO 1 I=1,30
			CALL CREATE_PARTICLE
     *			(38.,11.,1,-1.,1.,4.-2.*RAN(SEED),1,'R')
1		CONTINUE
	END IF
	IF (COUNTER.EQ.350) THEN
		CALL OUT(30,8,CHARACTERS,'             ')
		CALL OUT(30,9,CHARACTERS,'             ')
	ELSE IF (COUNTER.EQ.351) THEN
		CALL OUT(60,5,CHARACTERS,'OUCH! That''s')
		CALL OUT(60,6,CHARACTERS,'got to hurt!')
	ELSE IF (COUNTER.EQ.355) THEN
		CALL OUT(60,9,CHARACTERS,'I don''t think so,')
		CALL OUT(60,10,CHARACTERS,'he''s not complaining')
	ELSE IF (COUNTER.EQ.365) THEN
		CALL OUT(9,8,CHARACTERS,'AAaaahaaahhaa......')
	ELSE IF (COUNTER.EQ.396) THEN
		CALL OUT(6,9,CHARACTERS,'AAAAAAAAAAAAAHHHHHH.....')
	ELSE IF (COUNTER.EQ.421) THEN
		CALL OUT(30,2,CHARACTERS,'           ')
	ELSE IF (COUNTER.EQ.422) THEN
		CALL OUT(40,5,CHARACTERS,'                  ')
	ELSE IF (COUNTER.EQ.423) THEN
		CALL OUT(65,1,CHARACTERS,'            ')
	END IF
	IF (COUNTER.EQ.425) THEN
		CALL OUT(60,9,CHARACTERS,'               ')
		CALL OUT(60,10,CHARACTERS,'                    ')
	ELSE IF (COUNTER.EQ.429) THEN
		CALL OUT(60,5,CHARACTERS,'            ')
		CALL OUT(60,6,CHARACTERS,'            ')
	ELSE IF (COUNTER.EQ.430) THEN
		CALL OUT(15,6,CHARACTERS,'      ')
	ELSE IF (COUNTER.EQ.431) THEN
		CALL OUT(12,7,CHARACTERS,'             ')
	ELSE IF (COUNTER.EQ.432) THEN
		CALL OUT(9,8,CHARACTERS,'                   ')
	ELSE IF (COUNTER.EQ.433) THEN
		CALL OUT(6,9,CHARACTERS,'                        ')
	ELSE IF (COUNTER.EQ.434) THEN
		CALL OUT(60,9,CHARACTERS,'                 ')
		CALL OUT(60,10,CHARACTERS,'                     ')
	ELSE IF (COUNTER.EQ.435) THEN
		CALL OUT(20,5,CHARACTERS,'So, we need a new "volunteer".')
	ELSE IF (COUNTER.EQ.440) THEN
		CALL OUT
     *		(20,7,CHARACTERS,'Say, why don''t we try at NAMBLA''s ?')
	END IF
	CALL UPDATE_PARTICLES(CHARACTERS)
	IF (COUNTER.LT.0) THEN
		CHARACTER=0
		RETURN
	END IF
C	WRITE (*,*) AT(2,1),COUNTER
10	IF (CHARACTERS.LT.SPEED) THEN
		CALL OUT(1,1,CHARACTERS,' ')
		GOTO 10
	END IF
	CHARACTERS=0
C	READ (*,20) OP
C20	FORMAT (1A1)
	RETURN
	END

	SUBROUTINE DRAW_HEAD(X,CHARACTERS,HEAD)
	INTEGER X,CHARACTERS,I
	CHARACTER*13 HEAD(8)
	DO 10 I=1,8
		CALL OUT(X,12+I,CHARACTERS,HEAD(I))
10	CONTINUE
	RETURN
	END

	SUBROUTINE OUT (XX,YY,CHARACTERS,STRING)
	INTEGER XX,YY,CHARACTERS
	CHARACTER*8 AT
	CHARACTER*(*) STRING
	COMMON /PARTICLES/ SCREEN,TYPE,X,Y,VX,VY,SEED,N,W
	CHARACTER*1 SCREEN(22,78),TYPE(100)
	REAL*4 X(100),Y(100),VX(100),VY(100)
	INTEGER SEED,N,W(100)
	INTEGER I
	WRITE (*,*) AT(YY,XX)//STRING
	CHARACTERS=CHARACTERS+8+LEN(STRING)
	DO 10 I=1,LEN(STRING)
		SCREEN(YY,XX+I-1)=STRING(I:I)
10	CONTINUE
	RETURN
	END

	CHARACTER*8 FUNCTION AT(I,J)
C	THIS SUBROUTINE PROVIDES A ESCAPE SEQUENCE TO START WRITING AT THE
C	POSITION (I,J) OF THE SCREEN.
	INTEGER I,J
	CHARACTER*1 ESC,D(0:9)/'0','1','2','3','4','5','6','7','8','9'/
	ESC=CHAR(27)
	AT=ESC//'['//D(I/10)//D(MOD(I,10))//';'//D(J/10)//D(MOD(J,10))//'H'
	RETURN
	END
