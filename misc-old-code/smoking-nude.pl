#!/usr/bin/perl
$sp_par=0.05;
$esc="\x1B";
$nscreen=$esc."[H\n";
print $esc."[H".$esc."[J\n";
print $esc."[1\n";
if ($ARGV[0] ne '') {$sp_par=$sp_par/$ARGV[0];}
$mv="1 1 0 20 1 2n1 1 2 1 3 2 4 1 5 2 6 1 7 2 8 1 9 2 10 1 11 2 12 1 13 2 14 1 1
5 1 16 3 17 2 18 5 19 3 20 3 21 3 22 3 23 10 22 2 21 1 20 1 19 3 18 2 17 5 16 1 
15 1 14 1 2 1 3 2 4 1 5 2 6 1 7 2 8 1 9 2 10 1 11 2 12 1 13 2 14 1 15 1 16 3 17 
2 18 5 19 3 20 3 21 3 22 3 23 10n1 1 23 2 24 2 25 2 26 2 27 2 28 2 29 2n1 1 29 2
 30 2 31 2 32 2 33 2 34 2 35 2 36 2 37 2 38 2 39 2 40 2 41 2 42 2 43 2 44 2 45 2
 46 2 47 2 48 2 49 2 50 2 51 2 52 2 53 2 50 2 49 2 48 2 46 2 45 3 44 3 42 3 41 3
 54 3 55 3n4 1 56 1 57 1 56 1 57 1n1 1 55 2 54 2 58 2 59 2 60 2 61 2 62 2 41 2n3
 1 39 2 63 2 38 2 37 2 64 2 65 3 66 3 67 3 68 3 69 3 37 2 38 2 39 2n1 1 70 15 71
 15n3 1 39 2 63 2 38 2 37 2 64 2 72 3 73 3 74 3 75 3 76 3 37 2 38 2 39 2n1 1 77 
2 78 2 79 2 80 2 81 2 82 2 83 2 84 2 85 2n1 1 86 2 87 2 88 2 89 2 90 2 91 2 92 2
 93 2 94 2 95 2 96 10n1 1 96 2 97 2 98 2 99 2 100 2 101 2 102 2 103 2 104 2 103 
2 102 2 97 2 105 2 106 2 107 2 108 2n3 1 108 2 109 2 110 2n1 1 111 2 112 2n4 1 1
12 2 113 2n1 1 113 2 114 2 115 2 116 2 117 6n1 1 117 2 118 2 119 2 120 2n5 1 120
 2 121 2 122 2n6 1 123 2 124 2n3 1 120 2 121 2 122 2n1 1 121 2 120 2 119 2 118 2
 117 2n1 2 125 4 117 2n1 1 117 2 126 2 127 2 128 2 129 2 130 2 131 2 132 2 133 2
 134 2 135 15n1 1 135 4 136 6 135 6 136 8 137 1 138 10 139 1n1 20 135 20";
#Copyright (c) YA all rights reserved
$bdiff=<<'E';
/*V/+e/,s/-t/.a//l/0e/4s/5o/6u/7s/;c/<o/=n/>t/?r/@a/Ai/Bn/Ct/De/Es0I(0JE0Kx0Le0M
r0Nc0Oi0Pc0Qe1!l1"u1#d1$i1%q1&u1'e1()=/C=0o=1p=2y=3r=4i=5g=6h=7t=9(=:c=;)==Y=>Y>
MA>Nl>Ol>Qr>Ri?!g?"h?#t?$s?&r?'e?(s?)e?*r?+v?,e?-d}}}/* /+ /, /- /. // /0 /4 /5 
/6 /7 /; /< /= /> /? /@ /A /B /C /D /E 0I 0J 0K 0L 0M 0N 0O 0P 0Q 1! 1" 1# 1$ 1%
 1& 1' 1( =/ =0 =1 =2 =3 =4 =5 =6 =7 =9 =: =; == => >M >N >O >Q >R ?! ?" ?# ?$ ?
& ?' ?( ?) ?* ?+ ?, ?- }}})3/)4|*F_*G_*H_*I_*Jo*Ko*L/*N|,.\,1o,2),3),4o,6|-I\-J_
-K\-Lo-Mo-No-Oo-P'/5o/6o/7o/8'0L|0Oo0Po0Qo24'26|27o28o29o3M/3Po3Qo3Ro54/56.58.59
o5:o6=_6>_6?_6@_6A_6B_6C_6D_6E_6F_6G_6H_6I^6J_6Ko6L_6M_6N\6O_6P_6Q.6R_7!_7"_7#o7
$_7%_7&_7'_7(_7)_7*_7+_7,_7-_7._7/_70_71_72_73_74_75_76_77_78_79_}}},2(,3(3R|5: 
5;\7#/}}},2)29 59 }}},2(3P 3Q }}},3)28 29'}}},2),3(0Q/27 28'29 }}},2(0P }}},2)-P
 0O }}},3)/7 }}},2(-P'/5 }}},2)/6 }}}'I_'J_'K_)0/)3 *L ,2\,3o,6'-P }}}'I 'L_)0 )
1/)4 )5|*N *O|,6 -P/}}})1(,7|}}}'M_)5 )6/*I/*O/,2o,6/,7 -O'-P }}}'J 'K 'N_'O_)1 
)2/)6 )8/*I(*O *Q/,6 ,7/}}}'L 'M 'N 'O )2_)3_)4_)5_)8 *I/*K/*Lo*O/*Q ,6/,7 }}})1
\*Ko*L }}})1 )2 )3 )4 )5 *E_*H/*I *O ,-\,. ,6 -H\-I_-O_/5o/6o/8\0R_1!\}}}*E *F *
G *H ,- -H -I /1/0J/0R 22\2;/4!_4"/}}}0J 0K|22 23\}}})0o)1o*I6*J *Lo*Mo,0:,1_,2 
,3j,5o-K -L|-M|-N /5 /6 0N|}}})/o)1 *H6*I *Jo*M ,/:,0_,1 ,2j,3o,5 -I_-J -K|-M -N
_-O /0//1 0I/0K 0L 21\22_23`24 3R\56 57.58 59.6Q_6R.}}}/7\/8 0K|0P|1! 2,_2-_2._2
/_20/21 22 28|2; 3E/4! 4" 6F^6Ho6I_6K_}}}0G.2./22\3E(3G/3M\3R 4!\5./5//54 57 58.
59 5:.5; 5<\6E.6F_6Go6H_6R_7!.7#_7$/7:_}}}).o)0 *G6*H *Io*L ,.:,/_,0 ,1j,2o,4 -I
 -J|-L_-N /0 /1//5`/7 0G_0I.0K 0L/0N 0O|0P 0Q 2, 2- 2/ 20 23/26 27|28 3E 3G(3H_3
I_3J_3K_3L/3R\4! 58 5: 5;\5< 6G/6N_6O\7!_7#/7$_7: }}}). )/ *G *Ho*J *K ,. ,/6,1o
-H:-I_-J -Kj-Lo-Mo/1 /2|/3|/4_/5 0O 2+)2,_27\5;|}}}*Fo*Go*H *I ,-6,/o,0o,2 ,3 -F
:-G_-Hj-Io-Jo-Ko-L -M /0\/1\/2_/3 /4 0G 0H_0J/0L 0M\2+ 2, 2._2//22`26\27 3G 3H(3
J)3M`3Q\3R 5. 51/53\56`5:|5; 6E_6G.6H/6I/6N\6O.6R 7!/7#_7:_}}}*Eo*G ,,6,- ,.o,1 
-E:-F_-Gj-Ho-K //_0G/0J 2./2/_}}}2//3B_3C_3D_3E_3F_3G/3J_5)/}}}*Do*F ,+6,, ,-o,0
 -D:-E_-Fj-Go-J //\/1_/2 0G 0H'3B 3C 3D 3E 3F 5) 5*_5+_5,_5-_5./6C(}}}6C/}}}6B-6
C(}}}2))2*-3D\5* 5+ 5, 5-\6B_6C_}}}*D *Fo,+ ,,6,- ,0o-D -E:-F_-Gj-Jo// /1\/2_0A-
0B(2) 2* 2+\3D 3F\5- 5. }}}*E *Go,, ,-6,. ,1o-E -F:-G_-Hj-Ko0A 0B 0E-0F(0H_0I 0J
/2+ 2.|3F 3G 3J.}}}/+-/,(0E 0F|}}}-D--E(/+ /, /-|0F 0G|2. }}}*Eo*G ,,6,- ,.o,1 -
E:-F_-Gj-Ho-K /- //_0G/0I.0J 2./2/_3J)}}}*E *Go,, ,-6,. ,1o-D -E--F:-G_-Hj-Ko/0|
/1|}}},-o,.o,/ ,0u,1 -E -Fo-Go-Ho-Ig-J_-K:-L-}}}// /0_/2|/3_0G 0I/0M 0N\2._2//20
_26|3H/3I 3J_3K)53/6L/}}}23 24/3L 3M/53\54/6L_6M/}}}*F *Ho,- ,/o,0 ,1u-F -Io-Jg-
K_-L:-M-0N 0O\24 25)26/27|3M`3O/54 56/6M_6O/}}}*G *Io,. ,0o,1 ,2u-G -Jo-Kg-L_-M:
-N-/0 /1_/3|/4_0O 0P|25*26)27/3O 3P/56 57/}}})/o)0o*Ku,1o,2g,3_,4:,5--H -I -J_-K
|-L|-M -N_/1//2 /3 /4 /8\0H.0I_0J/0K(0L*0P*0Q)0R|22 23\25 26 27 29/3M 3N\3O_3P_3
Q 3R/56(57 5: 5;|6O_6R_7! 7"/7;_}}})/ )0 *H *I *Jo*Ko,/ ,0 ,2o,3 ,4u,5 -Jo-Ko-Lo
-Mg-O:-P-/1 /2_/3|/4|/6_/8 29 2:|3O 3P 3R\4#\56 5>\5?_5@_7; }}}*J *K *Lo*Mo,1 ,2
 ,3o,4o,6u-J -K -Mo-No-Og-P_-Q:-R-/2 /3 /4_/5|/6|/8_0J 0K 0L/0P 0Q 0R 1!|25(26*2
:*2;)3R 4!/4# 4$\5> 5?\5A_}}}1!\2<\4$ 4%\4&_4'_4(_4)_5? 5@ 5A 5D\}}}*L *M *No*Oo
,3 ,4 ,5o,6o,8u-L -M -Oo-Po-Qg-R_.!:."-/4 /5_/6 /7//8/0L 0M/1!`24/2< 2=\4% 4&\4'
 4( 4) 5A\5B_5C_5D_5E_7.\7;_7<_}}}7.)}}}7-=7.\}}}*Fo*Go*N *O ,-6,/o,0o,1o,5 ,6 ,
8 -E--F:-G_-Hj-Io-Jo-Ko-N -O -P -Q -R .! ." //_/0|/1|/2_/5 /7 /8 0G)0H_0I.0M\1! 
2./2/_20\22`23/24 25 26\2: 2; 2= 3J)3K\3L/3M`3N 3Q\4! 4& 56`5:|5; 5A 5B 5C 5D 5E
 6O.6R 7!/7"_7-_7._7; 7< }}}-D_/-\0G 0H\0I 0K/2. 2//20_21\22/23 3J 3K 3L)}}}-D&}
}}-D#}}}-D /- 0F=0G)0H_0I.0K 2./2/_20\21 22`23/3J)3K\3L/}}}0F)0G 2*#}}}0F 0G)2* 
3?#}}}0G/20 3? 3H(3I_3K_5##}}},1 5# 6=#}}},1o-C--D(-E /-|// /0\/1\0G|0I 0J/2. 2/
/3J.6=_}}}-C -D /- 0G 0I.2._3J)3K-}}}-Ba-Di}}},%x-Ai-B -Ca-D }}}*8z*:q*<y-Au-Ce}
}}'8k':l'<m(Mv(Oi(Qr*8o*:l*< ,%s-At-C }}}!/a!1b!3c!5d"Qe#!f##g#%h#'i%Kj%Mk%Ql'8m
':n'<o(Mp(Oq)!s*8t*:u,#v,%w-A }}}!/ !1 !3 !5 "Q #! ## #% #' %K %M %Q '8 ': '< 'L
B'Me'Na'Ou'Pc'Qo'Ru(!p(#t($r(%o(&p((m()o(*d(+e(,r(-n(.e(0c(1e(3t(4r(5u(6c(8.(9.(
:.(M (O (Q )! *8 *: ,# ,% ,1 -D--E(/-|0G|0I 2. 3J.3K_}}}*Eo,,o,-@,.|,/@-F -G\-H-
-I/-J -K }}}'L 'M 'N 'O 'P 'Q 'R (! (# ($ (% (& (( () (* (+ (, (- (. (0 (1 (3 (4
 (5 (6 (8 (9 (: *E ,, ,-6,. ,/o,1o-B.-D.-E -F:-G_-Hj-Io-Jo-Ko/- 0G 0I.2._3J)3K-}
}},%_-A.-B -C.-D }}}*8.*::*<;-A_}}}'8-':-'<-(M_(O_(Q-*< -C }}}"Q-#!-##-#%-#'-%K-
%M-%Q_,% -A }}}"Q #! ## #% #' %K %M %Q '8 ': '< (M (O (Q *8 *: ,1 -C--D(/-|0G|0I
 2. 3J.3K_}}}-B--C(-D /,\/- 0G\}}}-B\-C^}}}-B -C%-D-}}}->\-B_-C_-D }}}-> 1R/}}}-
B /*/1R 4R|}}}-C /* /, //_0G/0J 2./2/_3J)4R 69\}}}69 }}}}}}*F *Ho,- ,.6,/ ,1o-F 
-G:-H_-Ij-Lo// /0_/1|/2|/3_0G 0I/0M 0N\2._2//20_23 24/26 27|3J_3K)3L_3M/3N`56 57
`}}})0o)1o*G *H *I6*Ko*Lo,. ,0:,1_,2j,3o,4o,5o-G -H -I -J -K_-L|-M|-N_/0 /1 /2//
3 /7|0H 0I_0K*0M/0N 0P/2. 2/_20'21_22_27/3H/3I 3J 3K 3L 3M }}})0 )2o*I *Jo*Mo,0 
,1 ,2\-K -L/-M }}})1 )3o*J *No,2 ,3\,6o-K_-L -M/-N -O_/7 /9\0E_0F_0G_0K/0L*0M 0O
|0P 0Q/1"\2,/2//20 21 22`24 27 28/2;/3Q 3R\4!/5: 5;|6R_7!_7"/7;_}}})2 )3 *K *L ,
3 ,7o-K -M_-N\-Oo-Po-Qo/2 /3//9 /:\0E 0F 0G 0K 0L/0O 0P/0Q 1!/1" 1#\2, 2/ 20/22 
23`25|28 29/2; 2</3H 3I/3N 3O\3R 4!\4"/5/ 50/51 52/53|6G 6H.6J/}}}*M *Oo,4 ,8o-N
 -R/0I 0K_0M'20 22'23 24`25 27/29 2:/2< 2=/3I 3K|3M/3O 4! 4"\4#/50 52 56.57 58.5
; 5<|6G_6H_6I_6J_6O_6Q.7"_7#/7<_}}}*N *Po,5 ,8 ,9u-Rg.!_.":/3 /4//: /;`0L 0M/0N'
0P 0Q/1! 1"/1# 1$\2= 2?\2@_2A_2B_2C_4# 4,\}}}*O *Qo,6 ,8o,9 ,:e-M -N_-O -Ro.!g."
_.#:/; /<`0K 0M 0N/22 24 25'27 3K 53 54|}}}-N -Rg.! /4 /5//;\/< 0N 0O/0Q 0R/1" 1
#/1$ 2: 2;/2>\2? 2@ 2A 2B 2C 3L/3M 4'\4, 53|54 56^58 5B\5C_5D_5E_6Q\7.\7=_}}}*P 
*Q ,7 ,8 ,: -P -Q -R ." .# /5 /; /<o/=o0O 0R 1#o1$o1%o1&o24-25-2; 2<_2=\2>o2?o2@
o2A)3Q\4!_4"_4#/4'o4(o4)\53 54>56 57:5< 5?/5B 5C 5D\5E 6= 6> 6I^6J/6Q_7#_7*/7-\7
._77 78 79 7: 7; 7< 7= }}}."o.#o/;6/< />o/?o1":1#_1$ 1%j1'o2=_2>\2? 2@_2A 4' 4( 
5? 5@/6G-6H-6J_}}}/8_/9_0R\2;\6Ko82/}}}-O_-P_-Q_-R_.!_/7\/8 /9 }}}*O_*P_,6/-O/-P
 -Q -R .! }}}*O *P ,7\}}},6 ,7 -O_-P_-Q_-R_.!/2< }}}-O -P -Q -R .! /7 /8_/9_/:_/
;o/<_/=/}}}/8|/9\/: /;6/< /=o/? 0R|1#\1$_}}}-N_-O_-P_-Q_-R(/6\/8 /9 /?o0Q\0R 1#_
1$ 2:\2; 2<_}}}-N -O/-P -Q -R /6|0P|0Q 28\29_2:_2;_}}}-M\-O }}}-M /6 0P 27)28 29
 2: 2; 2< 3R\4$/5;\5<_5=/}}}27\}}}26_27_}}}26 27 3R 59_5:_5;_6R/}}}59 5: 5; 5< 6
R^7$/}}}6R-}}}4$|5= 5>|6R_7"-7$_7&|}}}6E-6F-6Go6H_6I_6K_82 }}}24_25_3G/5./6E^6F 
}}}*Oo*Po,66,8o,9o,:o-O:-P_-Qj-Ro.!o.# /9|/:|/; /= /> /? 0H-0R'1"\1#\1% 1& 1' 2.
/22\24 25 28*29_2=\2> 2@ 3J\3L 3N\3Q 3R.4! 4" 4# 4$ 4&\4) 50/53\54 57 58`59.5>.5
?'5@ 5A\5D 6E.6F_6G/6H/7"_7%/7&_7*\7,-7-_72 73 74 75 76 }}}/1_0J/0L`25|3D.3E_3O|
}}}//_/1 0J 0K\0L 24\25 3C.3D_3E/3O`}}}/'./(_/)_/*_/+_/,_0?_0@/0B-3C 3D 3E }}}/$
./%_/'-/(./-_// /0_0? 0@ 0B^0C-}}}->./$ /% /&`/'\0B }}})$.)%_)&_)'.*@^*A\*B\,)`,
+\-> -D\-F\/& /' /( /) /* /+ /, /- //`/0 0C }}}'?i)$ )% )&')'|*@ }}}'? )& )' *A 
*B *No,) ,+ ,5o,7|,86,: -D -F -O -P\-Qo-R/.! ." // 0K 24 3O 5=.5>'5? }}}*N *O *Q
o,5 ,6 ,76,8 ,:o,;o-P:-Q_-Rj.!o."o.#o/9 /;|0R 1!'1" 1$\28 29*2:_2= 2>\3R 4!.4& 4
'\5= 5>.5?'5A|7)|7*_7+-7,_72_73_}}}*P *Ro,7 ,86,9 ,<o-P -Q:-R_.!j.$o/: /;/}}}*Q 
*R ,8 ,: -Q -R .! ."6.# .%o.&o/;:/<_/=j/>o/?o/@o1! 1# 1$/1%/29 2:*2;_2> 2?`4&\4'
 4(|5A 5B|7&-7)_7*|7+_74_}}}4(\5B 5C\7&_7'-7*_7,\}}},:o.!o.#|.$6.& /; /<\/=-/>//
? /@ 7&-7'_74 }}}0J_0R_1!_21/22 24\29/3J/3N 3O\3R/4!_4"_4#_4& 4*\51/53|5>)6J/}}}
,: ,; ,< .! ."o.#o.$o.% /;o/<6/=|/>6/?o0J 0R 1! 1#_1$\1%-1&/21 22_23\24_29 2:/2;
 2? 2A`3J\3K/3R 4!/4" 4#(4$*4(*4))4* 4+\51 52/53 55`58 59\5;\5> 5?.5@'5C 5E/6J_6
K/6L/7$\7*-7,/74_75_}}}0H 2. 22-23 24.3G 3I/3J 3K 3Q_5-_5. 52 55'56-59 6C^6E_6G_
6H_6K 6L_6M/6N_6O 6R\}}}." .# .$ /; /<o/=o/>o/? 1#o1$61%|1&61'o22 24 2: 2=_2>\2?
-2@/2A 3I 3L-3N.3O 3Q 4! 4"/4# 4$ 4( 4)`4+ 5- 50 52/55 56 57\59_5;/5=(5>*5? 5@ 5
B*5C)5E\6C_6G/6H\6K/6L 6M 6N 6R_7#\7$_7%_7&_7*^7,_7.\80\81\82/86/8>\9K\9L_9N/:')
}}}.!o."o/9o/:o/;o/< /=_/> 1!o1"o1#g1$ 1%_1&:1' 2<_2=|2>|2?_2@ 4)\5D\5E 7*_7-\7.
_75 8G/:.(}}}.! ." .#o.$o/9 /: /; /<6/= />o/?o/@o1! 1" 1#:1$_1% 1&j1'o1(o2= 2>/2
?/2@_}}}.# .$ /<o/=o/> /? /@ 1#61$ 1%o1&o1( 2<:2=_2> 2?j2@o2Ao4" 4#_4%/4&/4'_4) 
5= 5> 5B 5C\5D 7"/7#_7$(7%*7**7+)7,\7-_74 8=\8> 8F/8G :&):' :-(:. }}}/< /= 1"o1#
o1$o1% 1& 1' 2;o2<@2=|2>@2?o2@ 2A 4$\4%o5B\5C 7)*7*)7+\7,_73 8<\8= 8E/8F :%):& :
,(:- }}}8D/8E :+/:, 
E
$oscr=((' ' x 75) . "\n")x 22;
$bdiff=~ s/\n//g;
@ec=split(/}}}/,$bdiff);
for $i (0 .. $#ec) {
$d=$ec[$i];
@d=split(//,$d);
$nscr=$oscr;@ns=split(//,$nscr);
if ($d ne '') {
for $j (0 .. int(($#d - 1)/3)){
$ns[(ord($d[$j*3])-33)*50 + (ord($d[$j*3+1]) - 33) ]=$d[$j*3+2];
}}
$nscr=join('',@ns);$ec[$i]=$nscr;$oscr=$nscr;
}
$mv=~s/\n//g;@sc=split(/n/,$mv);
for (@sc) {
@scf=();@scdl=();
$_=~ s/(\d+) (\d+)//;$it=$1;$gd=$2;
while ($_=~ s/(\d+) (\d+)//) {push(@scf,$1);push(@scdl,$gd*$2);}
for $i (1 .. $it) {push(@scr,@scf);push(@dl,@scdl);}
}
for $i (0 .. $#scr) {print $ec[$scr[$i]];
select(undef,undef,undef,$dl[$i] * $sp_par);
print $nscreen;
}
exit 0;