/* Library:  VMW (from IKOS)
 * This library contains the simulation behavior for VMW library cells
 * All cells are modelled as 0-delay cells.
 */

// Buffer

`celldefine
module RTLC_BUF  (Z, A);
    output Z;
    input A;

    buf ( Z, A );
      
endmodule


// Inverter

module RTLC_INV  (Z,A);
    output Z;
    input  A;

	not (Z, A);
endmodule


// And Gates

module RTLC_AND2  (Z, A, B);
    output Z;
    input A,B;

    and (Z, A, B);
endmodule

module RTLC_AND3  (Z, A, B, C);
    output  Z;
    input   A,B,C;

    and (Z, A, B, C);
endmodule

module RTLC_AND4  (Z,A,B,C,D);
    output  Z;
    input   A,B,C,D;

    and (Z, A, B, C, D);
endmodule


module RTLC_AND5  (Z,A,B,C,D,E);
    output  Z;
    input   A,B,C,D,E;

    and (Z, A, B, C, D, E);
endmodule


// Nand Gates

module RTLC_NAND2  (Z, A, B);
    output Z;
    input A,B;

    nand (Z, A, B);
endmodule

module RTLC_NAND3  (Z, A,B,C);
    output  Z;
    input   A,B,C;

    nand (Z, A, B, C);
endmodule

module RTLC_NAND4  (Z,A,B,C,D);
    output  Z;
    input   A,B,C,D;

    nand (Z, A, B, C, D);
endmodule

module RTLC_NAND5  (Z,A,B,C,D,E);
    output  Z;
    input   A,B,C,D,E;

    nand (Z, A, B, C, D, E);
endmodule


// Or Gates

module RTLC_OR2  (Z, A, B);
    output Z;
    input A,B;

    or (Z, A, B);
endmodule

module RTLC_OR3  (Z,A,B,C);
    output  Z;
    input   A,B,C;

    or (Z, A, B, C);
endmodule

module RTLC_OR4  (Z,A,B,C,D);
    output  Z;
    input   A,B,C,D;

    or (Z, A, B, C, D);
endmodule

module RTLC_OR5  (Z,A,B,C,D,E);
    output  Z;
    input   A,B,C,D,E;

    or (Z, A, B, C, D, E);
endmodule


// Nor Gates

module RTLC_NOR2  (Z, A, B);
    output Z;
    input A,B;

    nor (Z, A, B);
endmodule

module RTLC_NOR3  (Z,A,B,C);
    output  Z;
    input   A,B,C;

    nor (Z, A, B, C);
endmodule

module RTLC_NOR4  (Z,A,B,C,D);
    output  Z;
    input   A,B,C,D;

    nor (Z, A, B, C, D);
endmodule

module RTLC_NOR5  (Z, A, B, C, D, E);
    output  Z;
    input   A, B, C, D, E;

    nor (Z, A, B, C, D, E);
endmodule


// Xor Gates

module RTLC_XOR2  (Z, A, B);
    output  Z;
    input   A,B;

    xor (Z, A, B);
endmodule

module RTLC_XOR3 ( Z, A,B,C);
    output Z;
    input A,B,C;

    xor (Z, A, B, C);
endmodule

module RTLC_XOR4  (Z, A, B, C, D);
    output Z;
    input A,B,C,D;

    xor (Z, A, B, C, D);
endmodule


// Xnor Gates

module RTLC_XNOR2  (Z, A, B);
    output Z;
    input  A,B;

    xnor (Z, A, B);
endmodule

module RTLC_XNOR3 ( Z, A,B,C);
    output Z;
    input A, B, C;

    xnor (Z, A, B, C);
endmodule


module RTLC_XNOR4  (Z, A, B, C, D);
    output Z;
    input A,B,C,D;

    xnor (Z, A, B, C, D);
endmodule


// And-Ors

module RTLC_AO21  (Z, A, B, C);
    output Z;
    input A,B,C;

    and g1(t, A, B);
    or g2(Z, t, C);
endmodule

module RTLC_AO211  (Z, A, B, C, D);
    output Z;
    input A, B, C, D;

    and g1(t, A, B);
    or g2(Z, t, C, D);
endmodule

module RTLC_AO22  (Z, A, B, C, D);
    output Z;
    input  A, B, C, D; 

    and o1(t1, A, B);
    and o2(t2, C, D);
    or g1(Z, t1, t2);
endmodule

module RTLC_AO222  (Z, A, B, C, D, E,F);
    output Z;
    input  A, B, C, D, E, F; 

    and o1(t1, A, B),
        o2(t2, C, D),
	o3(t3, E, F);
    or g1(Z, t1, t2, t3);
endmodule


// And-Or Inverts

module RTLC_AOI21  (Z, A, B, C);
    output Z;
    input A,B,C;

    and g1(t, A, B);
    nor g2(Z, t, C);
endmodule

module RTLC_AOI211  (Z, A, B, C, D);
    output Z;
    input A, B, C, D;

    and g1(t, A, B);
    nor g2(Z, t, C, D);
endmodule

module RTLC_AOI22  (Z, A, B, C, D);
    output Z;
    input  A, B, C, D; 

    and o1(t1, A, B),
        o2(t2, C, D);
    nor g1(Z, t1, t2);
endmodule

module RTLC_AOI222  (Z, A, B, C, D, E,F);
    output Z;
    input  A, B, C, D, E, F; 

    RTLC_AND2 o1(.Z(t1), .A(C), .B(D)), o2(.Z(t2), .A(E), .B(F));
    RTLC_AOI211 g1(.Z(Z), .A(A), .B(B), .C(t1), .D(t2));
endmodule

// Or-And
module RTLC_OA31  (Z, A, B, C, D);
    output Z;
    input A,B,C,D;

    or g1(t, A, B, C);
    and g2(Z, t, D);
endmodule


// Or-And Inverts

module RTLC_OAI21  (Z, A, B, C);
    output Z;
    input A,B,C;

    or g1(t, A, B);
    nand g2(Z, t, C);
endmodule

module RTLC_OAI211  (Z, A, B, C, D);
    output Z;
    input A, B, C, D;

    or g1(t, A, B);
    nand g2(Z, t, C, D);
endmodule

module RTLC_OAI22  (Z, A, B, C, D);
    output Z;
    input A,B,C,D;

    or o1(t1, A, B),
       o2(t2, C, D);
    nand g1(Z, t1, t2);
endmodule

// 3-input majority gate
module RTLC_MAJ3  (Z, A, B, C);
    output Z;
    input A, B, C;

    and a1 (t1, A, B);
    and a2 (t2, A, C);
    and a3 (t3, B, C);
    or o1 (Z, t1, t2, t3);
endmodule

// Multiplexors

module RTLC_PRIM_MUX1  (Q, S, A, B);
    output Q;
    input S, A, B;
    reg Q;

    always @(S or A or B)
      if(S)
         Q = B;
      else
         Q = A;
endmodule

 
// simulation udps are used to deal gracefully with undefined selects
/* Vipul -->Synopsys Problem
primitive RTLC_PRIM_MUX1 (Q, S, A, B);
    output Q; 
    input S, A, B;

    table
//      S  A  B    Q
        0  0  ?  : 0 ;
        0  1  ?  : 1 ;
        0  x  ?  : x ;
        1  ?  0  : 0 ;
        1  ?  1  : 1 ;
        1  ?  x  : x ;
        x  0  0  : 0 ; // reducing pessimism...
        x  1  1  : 1 ;

    endtable
endprimitive

primitive RTLC_PRIM_MUX4 (Z, A, B, D0, D1, D2, D3);
    output Z;
    input A, B, D0, D1, D2, D3;
    
    table   
//      A  B  D0  D1  D2  D3   Z
        0  0  1   ?   ?   ?  : 1  ;
        0  0  0   ?   ?   ?  : 0  ;
        0  0  x   ?   ?   ?  : x  ;
        1  0  ?   1   ?   ?  : 1  ;
        1  0  ?   0   ?   ?  : 0  ;
        1  0  ?   x   ?   ?  : x  ;
        0  1  ?   ?   1   ?  : 1  ;
        0  1  ?   ?   0   ?  : 0  ;
        0  1  ?   ?   x   ?  : x  ;
        1  1  ?   ?   ?   1  : 1  ;
        1  1  ?   ?   ?   0  : 0  ;
        1  1  ?   ?   ?   x  : x  ;
        x  0  1   1   ?   ?  : 1  ; // reducing pessimism...
        x  0  0   0   ?   ?  : 0  ;
        x  1  ?   ?   1   1  : 1  ;
        x  1  ?   ?   0   0  : 0  ;
        0  x  1   ?   1   ?  : 1  ;
        0  x  0   ?   0   ?  : 0  ;
        1  x  ?   1   ?   1  : 1  ;
        1  x  ?   0   ?   0  : 0  ;
        x  x  0   0   0   0  : 0  ;
        x  x  1   1   1   1  : 1  ;
    endtable
endprimitive
*/

module RTLC_PRIM_MUX4  (Z, A, B, D0, D1, D2, D3);
    output Z;
    input A, B, D0, D1, D2, D3;
//    reg Z;

    RTLC_PRIM_MUX1 g1(Din1, B, D1, D3);
    RTLC_PRIM_MUX1 g2(Din2, B, D0, D2);
    RTLC_PRIM_MUX1 g3(Z, A, Din2, Din1);
    // mg - modified
    /* mg - nested if not understood by libcomp
    always @(A or B or D0 or D1 or D2 or D3)
    begin
      if(A)
      begin
        if(B)
           Z = D3;
        else
           Z = D1;
      end
      else
      begin
        if(B)
          Z = D2;
        else
          Z = D0;
      end
    end
    */


    /* mg - libcomp does not understand not (!) conditions.
    always @(A or B or D0 or D1 or D2 or D3)
    begin
      if(!A)
      begin
        if(!B)
          Z = D0;
        else
          Z = D2;
      end
      else
      begin
        if(!B)
           Z = D1;
        else
           Z = D3;
       end
    end
    */
endmodule

module RTLC_MUX2  (Z, A, B, S);
    output Z;
    input A, B, S;

    RTLC_PRIM_MUX1 g1(Z, S, A, B);
endmodule

module RTLC_MUX2I  (Z, A, B, S);
    output Z;
    input A, B, S;

    not g1(Z, z_);
    RTLC_PRIM_MUX1 g2(z_, S, A, B);
endmodule

module RTLC_MUX21L  (Z, A, B, S, SN);
    output Z;
    input A, B, S, SN;

    not g1 (z1, S);
    not g2 (z2, SN);
    nand g3 (z3, A, z1, SN);
    nand g4 (z4, B, S, z2);
    and g5 (Z, z3, z4);
endmodule

module RTLC_MUX4  ( Z, A, B, D0, D1, D2, D3);
    output Z;
    input  A, B, D0, D1, D2, D3;

    RTLC_PRIM_MUX4 u1( Z, A, B, D0, D1, D2, D3);
endmodule

module RTLC_OAI2222  (Z, A, B, C, D, E, F, G, H);
    output Z;
    input A, B, C, D, E, F, G, H;

    or g1 ( z1, A, B),
       g2 ( z2, C, D),
       g3 ( z3, E, F),
       g4 ( z4, G, H);
    nand g5 (Z, z1, z2, z3, z4);
endmodule
    
module RTLC_DEC24L  (Z0, Z1, Z2, Z3, A, B);
    output Z0, Z1, Z2, Z3;
    input A, B;

    not g1 (z1, A);
    not g2 (z2, B);

    and g3 (z3, A, z2);
    and g4 (z4, z1, B);
    and g5 (z5, A, B);
    and g6 (z6, z1, z2);

    or g7 (Z0, z3, z4, z5);
    or g8 (Z1, z6, z4, z5);
    or g9 (Z2, z6, z3, z5);
    or g10 (Z3, z6, z3, z4);
endmodule

module RTLC_FADD  ( S, CO, CI, A, B);
    output S, CO;
    input CI, A, B;

   RTLC_MAJ3 maj3 (.Z(CO), .A(A), .B(B), .C(CI));
   RTLC_XOR3 xor3 (.Z(S), .A(A), .B(B), .C(CI));


endmodule

module RTLC_HADD  (S, CO, A, B);
    output S, CO;
    input A, B;

    not g1 ( E, CO);
    and g2 ( S, F, E),
        g3 ( CO, A, B);
    or  g4 ( F, A, B);
endmodule

// Flip-flops
    
/*
primitive RTLC_PRIM_DFF(Q, D, CP, CLR, PRE);
 
    output Q;
    input  D, CP, CLR, PRE;
    reg    Q;
    initial Q = 0;
 
    // Positive edge triggered D flip-flop with active high
    // asynchronous set and clear. Clear dominates.
 
    table
 
    //  D      CP      CLR PRE :   Qt  :   Qt+1
 
        1      (01)    0   ?   :   ?   :   1;  // clocked data
        0      (01)    ?   0   :   ?   :   0;  // clocked data
 
        1       ?      0   *   :   1   :   1;  // pessimism
        ?       0      0   *   :   1   :   1;  // pessimism
        ?       1      0   *   :   1   :   1;  // pessimism

        0       ?      *   0   :   0   :   0;  // pessimism
        ?       0      *   0   :   0   :   0;  // pessimism
        ?       1      *   0   :   0   :   0;  // pessimism
 
        1       p      0   0   :   1   :   1;  // reducing pessimism
        0       p      0   0   :   0   :   0;
 
        ?       ?      1   ?   :   ?   :   0;  // asynchronous clear
        ?       ?      0   1   :   ?   :   1;  // asynchronous set
 
        ?      (?0)    ?   ?   :   ?   :   -;  // ignore falling clock
        0      (?x)    ?   ?   :   0   :   -;  // retain state when D == Qt
        1      (?x)    ?   ?   :   1   :   -;  // retain state when D == Qt
        *       1      ?   ?   :   ?   :   -;  // ignore data edges
        *       0      ?   ?   :   ?   :   -;  // ignore data edges
 
   endtable
endprimitive
*/

module RTLC_PRIM_DFF (Q, D, CP, CD, SD);
 
    output Q;
    input  D, CP, CD, SD;

    reg Q;

    always @(posedge CP or posedge CD or posedge SD)
	begin
		if (CD)
			Q <= 1'b0;
        else if (SD)
			Q <= 1'b1;
	    else 
			Q <= D;
    end
endmodule

module RTLC_PRIM_DFFE (Q, CE, D, CP, CD, SD);
 
    output Q;
    input  CE, D, CP, CD, SD;

    
    RTLC_PRIM_MUX1 g1(Din, CE, Q, D);
    RTLC_PRIM_DFF g2 (Q, Din, CP, CD, SD);

endmodule

// d-flop
module RTLC_FD  (Q, D, CP);
    output Q;
    input D, CP;

    reg Q;

    always @(posedge CP)
	begin
		Q <= D;
    end

endmodule 

// scan d-flop
module RTLC_FD_SCAN  (Q, D, CP, SI, SE);
    output Q;
    input D, CP, SI, SE;

    reg Q;

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    always @(posedge CP)
	begin
		Q <= D_in;
    end

endmodule 
/*
module RTLC_FD2  (Q, QN, D, CP);
    output Q, QN;
    input D, CP;

    RTLC_PRIM_DFF g1 (Q, D, CP, 1'b0, 1'b0);
    not g2 (QN, Q);

endmodule 

module RTLC_FD2_SCAN  (Q, QN, D, CP, SI, SE);
    output Q, QN;
    input D, CP, SI, SE;

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    RTLC_PRIM_DFF g1 (Q, D_in, CP, 1'b0, 1'b0);
    not g2 (QN, Q);

endmodule 

*/
// d-flop w/clock enable
module RTLC_FDE  (Q, D, CP, CE);
    output Q;
    input D, CP, CE;

    RTLC_PRIM_DFFE g1 (Q, CE, D, CP, 1'b0, 1'b0);
endmodule

// d-flop w/clock enable
module RTLC_FDE_SCAN  (Q, D, CP, CE, SI, SE);
    output Q;
    input D, CP, CE, SI, SE;

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    wire CE_in;
    //module RTLC_OR2  (Z, A, B);
    RTLC_OR2 or1 (CE_in, CE, SE);

    RTLC_PRIM_DFFE g1 (Q, CE_in, D_in, CP, 1'b0, 1'b0);
endmodule

// negative-edge d-flop
module RTLC_FDN  (Q, D, CPN);
    output Q;
    input D, CPN;

    RTLC_PRIM_DFF g1 (Q, D, cp, 1'b0, 1'b0);
    not g2 (cp, CPN);

endmodule

// scan negative-edge d-flop
module RTLC_FDN_SCAN  (Q, D, CPN, SI, SE);
    output Q;
    input D, CPN, SI, SE;

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    wire CPN_N;
    not g2 (CPN_N, CPN);
    RTLC_PRIM_DFF g1 (Q, D_in, CPN_N, 1'b0, 1'b0);

endmodule

// d-flop w/async preset
module RTLC_FDP  (Q, D, CP, PRE);
    output Q;
    input D, CP, PRE;

    RTLC_PRIM_DFF g1 (Q, D, CP, 1'b0, PRE);
endmodule

// scan d-flop w/async preset
module RTLC_FDP_SCAN  (Q, D, CP, PRE, SI, SE);
    output Q;
    input D, CP, PRE, SI, SE;

     wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    RTLC_PRIM_DFF g1 (Q, D_in, CP, 1'b0, PRE);
endmodule

//d-flop w/async preset & clear & an enable
module RTLC_FDPCE  (Q, D, CP, PRE, CLR, CE);
    output Q;
    input D, CP, PRE, CLR, CE;
    wire X;

    RTLC_MUX2 mux1 (.Z(X), .A(Q), .B(D), .S(CE));
    RTLC_FDPC fdpc (.Q(Q), .D(X), .CP(CP), .PRE(PRE), .CLR(CLR)); 
endmodule

//scan d-flop w/async preset & clear & an enable
module RTLC_FDPCE_SCAN  (Q, D, CP, PRE, CLR, CE, SI, SE);
    output Q;
    input D, CP, PRE, CLR, CE, SI, SE;
    wire X;

    RTLC_MUX2 mux1 (.Z(X), .A(Q), .B(D), .S(CE));

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux2 (D_in, X, SI, SE);

    RTLC_FDPC fdpc (.Q(Q), .D(D_in), .CP(CP), .PRE(PRE), .CLR(CLR)); 
endmodule

//d-flop async preset and clear and preset has high priority
module RTLC_FDPC(Q, D, CP, PRE, CLR);
    output Q;
    input D, CP, PRE, CLR;
    wire X, Y;

    RTLC_INV i1(.Z(X), .A(PRE));
    RTLC_AND2 a1(.Z(Y), .A(CLR), .B(X));
    RTLC_PRIM_DFF g1 (Q, D, CP, Y, PRE);
endmodule

//d-flop async preset and clear and preset has high priority
module RTLC_FDPC_SCAN(Q, D, CP, PRE, CLR, SI, SE);
    output Q;
    input D, CP, PRE, CLR, SI, SE;
    wire X, Y;

    RTLC_INV i1(.Z(X), .A(PRE));
    RTLC_AND2 a1(.Z(Y), .A(CLR), .B(X));

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    RTLC_PRIM_DFF g1 (Q, D_in, CP, Y, PRE);
endmodule

//d-flop async preset and clear and clear has high priority
module RTLC_FDCP(Q, D, CP, PRE, CLR);
    output Q;
    input D, CP, PRE, CLR;
    wire X, Y;

    RTLC_INV i1(.Z(X), .A(CLR));
    RTLC_AND2 a1(.Z(Y), .A(PRE), .B(X));
    RTLC_PRIM_DFF g1 (Q, D, CP, CLR, Y);
endmodule

//scan d-flop async preset and clear and clear has high priority
module RTLC_FDCP_SCAN(Q, D, CP, PRE, CLR, SI, SE);
    output Q;
    input D, CP, PRE, CLR, SI, SE;
    wire X, Y;

    RTLC_INV i1(.Z(X), .A(CLR));
    RTLC_AND2 a1(.Z(Y), .A(PRE), .B(X));

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    RTLC_PRIM_DFF g1 (Q, D_in, CP, CLR, Y);
endmodule

//d-flop w/async preset & clear & an enable - clear having high priority 
module RTLC_FDCPE(Q, D, CP, PRE, CLR, CE);
    output Q;
    input D, CP, PRE, CLR, CE;
    wire X;

    RTLC_MUX2 mux1 (.Z(X), .A(Q), .B(D), .S(CE));
    RTLC_FDCP fdpc (.Q(Q), .D(X), .CP(CP), .PRE(PRE), .CLR(CLR)); 
endmodule

//scan d-flop w/async preset & clear & an enable - clear having high priority 
module RTLC_FDCPE_SCAN(Q, D, CP, PRE, CLR, CE, SI, SE);
    output Q;
    input D, CP, PRE, CLR, CE, SI, SE;
    wire X;

    RTLC_MUX2 mux1 (.Z(X), .A(Q), .B(D), .S(CE));

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux2 (D_in, X, SI, SE);

    RTLC_FDCP fdpc (.Q(Q), .D(D_in), .CP(CP), .PRE(PRE), .CLR(CLR)); 
endmodule

/*
// d-flop w/async preset w/Qbar
module RTLC_FDP2  (Q, QN, D, CP, S);
    output Q, QN;
    input D, CP, S;

    RTLC_PRIM_DFF g1 (Q, D, CP, 1'b0, S);
    not g2 (QN, Q);

endmodule 

// scan d-flop w/async preset w/Qbar
module RTLC_FDP2_SCAN  (Q, QN, D, CP, S, SI, SE);
    output Q, QN;
    input D, CP, S, SI, SE;

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    RTLC_PRIM_DFF g1 (Q, D_in, CP, 1'b0, S);
    not g2 (QN, Q);

endmodule 
*/

// d-flop w/clock enable, async preset
module RTLC_FDPE  (Q, D, CP, PRE, CE);
    output Q;
    input D, CP, CE, PRE;

    RTLC_PRIM_DFFE g1 (Q, CE, D, CP, 1'b0, PRE);
endmodule

// scan d-flop w/clock enable, async preset
module RTLC_FDPE_SCAN  (Q, D, CP, PRE, CE, SI, SE);
    output Q;
    input D, CP, CE, PRE, SI, SE;

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    wire CE_in;
    //module RTLC_OR2  (Z, A, B);
    RTLC_OR2 or1 (CE_in, CE, SE);

    RTLC_PRIM_DFFE g1 (Q, CE_in, D_in, CP, 1'b0, PRE);
endmodule

// d-flop w/async clear
module RTLC_FDC  (Q, D, CP, CLR);
    output Q;
    input D, CP, CLR;

    RTLC_PRIM_DFF g1 (Q, D, CP, CLR, 1'b0);
endmodule

// scan d-flop w/async clear
module RTLC_FDC_SCAN  (Q, D, CP, CLR, SI, SE);
    output Q;
    input D, CP, CLR, SI, SE;

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    RTLC_PRIM_DFF g1 (Q, D_in, CP, CLR, 1'b0);
endmodule

// d-flop w/clock enable, async clear
module RTLC_FDCE  (Q, D, CP, CLR, CE);
    output Q;
    input D, CP, CE, CLR;

    RTLC_PRIM_DFFE g1 (Q, CE, D, CP, CLR, 1'b0);
endmodule

// scan d-flop w/clock enable, async clear
module RTLC_FDCE_SCAN  (Q, D, CP, CLR, CE, SI, SE);
    output Q;
    input D, CP, CE, CLR, SI, SE;

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    wire CE_in;
    //module RTLC_OR2  (Z, A, B);
    RTLC_OR2 or1 (CE_in, CE, SE);

    RTLC_PRIM_DFFE g1 (Q, CE_in, D_in, CP, CLR, 1'b0);
endmodule


module RTLC_PRIM_LATCH  (Q, G, D, CLR, PRE);
output Q;
input G, D, CLR, PRE;

reg Q;

    always @(G or D or CLR or PRE)
    begin
        if (CLR) 
            Q = 1'b0;
        else if (PRE) 
            Q = 1'b1;
        else if (G) 
            Q = D;

    end
endmodule
        

// positive-enable
module RTLC_LD  (Q, D, G);
    output Q;
    input D, G;

    RTLC_PRIM_LATCH g1 (Q, G, D, 1'b0, 1'b0);
endmodule

module RTLC_LDP  (Q, D, G, PRE);
    output Q;
    input D, G, PRE;

    RTLC_PRIM_LATCH g1 (Q, G, D, 1'b0, PRE);
endmodule

module RTLC_LDC  (Q, D, G, CLR);
    output Q;
    input D, G, CLR;

    RTLC_PRIM_LATCH g1 (Q, G, D, CLR, 1'b0);
endmodule

module RTLC_LDPC  (Q, D, G, PRE, CLR);
    output Q;
    input D, G, PRE, CLR;

    RTLC_PRIM_LATCH g1 (Q, G, D, CLR, PRE);
endmodule

// negative-enable
module RTLC_LDN  (Q, D, GN);
    output Q;
    input  D, GN;

    RTLC_PRIM_LATCH g1 (Q, g, D, 1'b0, 1'b0);
    not g2 (g, GN);

endmodule
/*
module RTLC_LD2  (Q, QN, D, G);
    output Q, QN;
    input D, G;

    RTLC_PRIM_LATCH g1 (Q, G, D, 1'b0, 1'b0);
    not g2(QN, Q);

endmodule
*/
module RTLC_LDN2 (Q, QN, D, GN);
    output Q, QN;
    input D, GN;

    RTLC_PRIM_LATCH g1 (Q, g, D, 1'b0, 1'b0);
    not g2(g, GN);
    not g3(QN, Q);

endmodule


// Pads

// internal tristate driver
module RTLC_BUFIZ  (Z, E, A);
    output Z;
    input E, A;

    bufif1 (Z, A, E);
endmodule

// tristateable output pad
module RTLC_OBUFZ  (Z, E, A);
    inout Z;
    input E, A;

    bufif1 (Z, A, E);
endmodule

// input pad
module RTLC_IBUF  (Z, A);
    output Z;
    input A;

    buf (Z, A);
endmodule


// output pad
module RTLC_OBUF  (Z, A);
    output Z;
    input A;

    buf (Z, A);
endmodule


// pullup/pulldown: can be used on pads, internal tristate busses,
// and undriven nets to set default behavior

module RTLC_PULLUP  (Z);
    inout Z;

//synopsys translate_off
    pullup(Z);
//synopsys translate_on
endmodule

module RTLC_PULLDOWN  (Z);
 inout Z;

//synopsys translate_off

    pulldown(Z);
//synopsys translate_on
endmodule



// internal tristate bus state preserver
module RTLC_KEEPER  (Z);
    inout Z;
//synopsys translate_off
    trireg Z;
//synopsys translate_on
endmodule


module RTLC_FDPC_INIT1  (Q, D, CP, PRE, CLR);
    output Q;
    input D, CP, PRE, CLR;
    reg Q;

//ikos translate_off
        initial
        begin
            Q = 1;
        end
//ikos translate_on
    always @(posedge CP or posedge CLR or posedge PRE)
    begin
        if (CLR)
            Q <= 1'b0;
        else if (PRE)
            Q <= 1'b1;
        else
            Q <= D;
    end

endmodule

module RTLC_FDPC_INIT1_SCAN  (Q, D, CP, PRE, CLR, SI, SE);
    output Q;
    input D, CP, PRE, CLR, SI, SE;
    reg Q;

//ikos translate_off
        initial
        begin
            Q = 1;
        end
//ikos translate_on

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    always @(posedge CP or posedge CLR or posedge PRE)
    begin
        if (CLR)
            Q <= 1'b0;
        else if (PRE)
            Q <= 1'b1;
        else
            Q <= D_in;
    end

endmodule

module RTLC_FDPC_INIT0  (Q, D, CP, PRE, CLR);
    output Q;
    input D, CP, PRE, CLR;
    reg Q;

//ikos translate_off
        initial
        begin
            Q = 0;
        end
//ikos translate_on
    always @(posedge CP or posedge CLR or posedge PRE)
    begin
        if (CLR)
            Q <= 1'b0;
        else if (PRE)
            Q <= 1'b1;
        else
            Q <= D;
    end

endmodule

module RTLC_FDPC_INIT0_SCAN  (Q, D, CP, PRE, CLR, SI, SE);
    output Q;
    input D, CP, PRE, CLR, SI, SE;
    reg Q;

//ikos translate_off
        initial
        begin
            Q = 0;
        end
//ikos translate_on

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D, SI, SE);

    always @(posedge CP or posedge CLR or posedge PRE)
    begin
        if (CLR)
            Q <= 1'b0;
        else if (PRE)
            Q <= 1'b1;
        else
            Q <= D_in;
    end

endmodule

/*
//
// Xilinx Virtex primitives
//

module RTLC_MUXF5  (O, I0, I1, S);
//  function : "(S'I0+S I1)";
output O;
input  I0, I1, S;
RTLC_MUX2 mux2 (.Z(O), .A(I0), .B(I1), .S(S));
endmodule

module RTLC_MUXF6  (O, I0, I1, S);
//  function : "(S'I0+S I1)";
output O;
input  I0, I1, S;
RTLC_MUX2 mux2 (.Z(O), .A(I0), .B(I1), .S(S));
endmodule

module RTLC_MUXCY (O,DI,CI,S);
output O;
input DI;
input CI;
input S;
RTLC_MUX2 mux2 (.Z(O), .A(DI), .B(CI), .S(S));
endmodule//RTLC_MUXCY

module RTLC_MUXCY_L (LO,DI,CI,S);
output LO;
input CI;
input DI;
input S;
RTLC_MUX2 mux2 (.Z(LO), .A(DI), .B(CI), .S(S));
endmodule//RTLC_MUXCY_L

module RTLC_XORCY (O,LI,CI);
output O;
input CI;
input LI;
RTLC_XOR2 xor2 (.Z(O), .A(LI), .B(CI));
endmodule//RTLC_XORCY

module RTLC_MULT_AND (LO,I0,I1);
output LO;
input I0,I1;
RTLC_AND2 and2 (.Z(LO), .A(I0), .B(I1));
endmodule //RTLC_MULT_AND

*/
module RTLC_PRIM_SYNC_DFF (Q, D, CP, CD, SD);
 
    output Q;
    input  D, CP, CD, SD;

    reg Q;
    wire not_CD;
    wire OR_out;
    wire D_in;

    RTLC_INV inv1 (.Z(not_CD), .A(CD));
    RTLC_OR2 or2 (.Z(OR_out), .A(SD), .B(D));
    RTLC_AND2 and2 (.Z(D_in), .A(not_CD), .B(OR_out));
    always @(posedge CP)
        Q <= D_in;

endmodule


module RTLC_PRIM_SYNC_DFFE (Q, CE, D, CP, CD, SD);
 
    output Q;
    input  CE, D, CP, CD, SD;
    
    RTLC_PRIM_MUX1 g1(Din, CE, Q, D);
    RTLC_PRIM_SYNC_DFF g2 (Q, Din, CP, CD, SD);

endmodule


module RTLC_FDSP  (Q, D, CP, PRE);
   output Q;
   reg    Q;
   input  D, CP, PRE;

   RTLC_OR2 or2 (.Z(D_in), .A(PRE), .B(D));

   always @(posedge CP)
     Q <= D_in;

endmodule // RTLC_FDSP

module RTLC_FDSP_SCAN  (Q, D, CP, PRE, SI, SE);
   output Q;
   reg    Q;
   input  D, CP, PRE, SI, SE;

   wire D_in0;
   RTLC_OR2 or2 (.Z(D_in0), .A(PRE), .B(D));

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D_in0, SI, SE);

   always @(posedge CP)
     Q <= D_in;

endmodule // RTLC_FDSP

module RTLC_FDSC  (Q, D, CP, CLR);
   output Q;
   reg    Q;
   input  D, CP, CLR;
   wire not_CLR;

   RTLC_INV inv1 (.Z(not_CLR), .A(CLR));
   RTLC_AND2 and2 (.Z(D_in), .A(not_CLR), .B(D));

   always @(posedge CP)
     Q <= D_in;

endmodule // RTLC_FDSC

module RTLC_FDSC_SCAN  (Q, D, CP, CLR, SI, SE);
   output Q;
   reg    Q;
   input  D, CP, CLR, SI, SE;
   wire not_CLR;
   wire D_in0;

   RTLC_INV inv1 (.Z(not_CLR), .A(CLR));
   RTLC_AND2 and2 (.Z(D_in0), .A(not_CLR), .B(D));

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D_in0, SI, SE);

   always @(posedge CP)
     Q <= D_in;

endmodule // RTLC_FDSC

module RTLC_FDSPC  (Q, D, CP, PRE, CLR);
   output Q;
   input  D, CP, PRE, CLR;

   RTLC_PRIM_SYNC_DFF g1 (Q, D, CP, CLR, PRE);

endmodule // RTLC_FDSPC

module RTLC_FDSPC_SCAN  (Q, D, CP, PRE, CLR, SI, SE);
   output Q;
   reg Q;
   input  D, CP, PRE, CLR, SI, SE;

   wire not_CLR;
   wire OR_out;
   wire D_in0;

   RTLC_INV inv1 (.Z(not_CLR), .A(CLR));
   RTLC_OR2 or2 (.Z(OR_out), .A(PRE), .B(D));
   RTLC_AND2 and2 (.Z(D_in0), .A(not_CLR), .B(OR_out));

    wire D_in;
    //module RTLC_MUX2  (Z, A, B, S);
    RTLC_MUX2 mux1 (D_in, D_in0, SI, SE);

   always @(posedge CP)
       Q <= D_in;

endmodule // RTLC_FDSPC_SCAN

module RTLC_FDSPE  (Q, D, CP, PRE, CE);
   output Q;
   input  D, CP, PRE, CE;

   RTLC_PRIM_SYNC_DFFE g1 (Q, CE, D, CP, 1'b0, PRE);

endmodule // RTLC_FDSPE

module RTLC_FDSPE_SCAN  (Q, D, CP, PRE, CE, SI, SE);
   output Q;
   input  D, CP, PRE, CE, SI, SE;
   reg Q;

   wire D_Q_in;
   RTLC_PRIM_MUX1 g1(D_Q_in, CE, Q, D);

   wire D_in0;
   RTLC_OR2 or2 (.Z(D_in0), .A(PRE), .B(D_Q_in));

   wire D_in;
   //module RTLC_MUX2  (Z, A, B, S);
   RTLC_MUX2 mux1 (D_in, D_in0, SI, SE);

   always @(posedge CP)
       Q <= D_in;

endmodule // RTLC_FDSPE_SCAN

module RTLC_FDSCE  (Q, D, CP, CLR, CE);
   output Q;
   input  D, CP, CLR, CE;

   RTLC_PRIM_SYNC_DFFE g1 (Q, CE, D, CP, CLR, 1'b0);

endmodule // RTLC_FDSCE

module RTLC_FDSCE_SCAN  (Q, D, CP, CLR, CE, SI, SE);
   output Q;
   input  D, CP, CLR, CE, SI, SE;
   reg Q;

   wire D_Q_in;
   RTLC_PRIM_MUX1 g1(D_Q_in, CE, Q, D);

   wire not_CLR;
   wire D_in0;
   RTLC_INV inv1 (.Z(not_CLR), .A(CLR));
   RTLC_AND2 and2 (.Z(D_in0), .A(not_CLR), .B(D_Q_in));

   wire D_in;
   //module RTLC_MUX2  (Z, A, B, S);
   RTLC_MUX2 mux1 (D_in, D_in0, SI, SE);

   always @(posedge CP)
       Q <= D_in;

endmodule // RTLC_FDSCE_SCAN

module RTLC_FDSPCE  (Q, D, CP, PRE, CLR, CE);
   output Q;
   input  D, CP, PRE, CLR, CE;

   RTLC_PRIM_SYNC_DFFE g1 (Q, CE, D, CP, CLR, PRE);

endmodule // RTLC_FDSPCE

module RTLC_FDSPCE_SCAN  (Q, D, CP, PRE, CLR, CE, SI, SE);
   output Q;
   input  D, CP, PRE, CLR, CE, SI, SE;
   reg Q;

   wire D_Q_in;
   RTLC_PRIM_MUX1 g1(D_Q_in, CE, Q, D);

   wire not_CLR;
   wire OR_out;
   wire D_in0;
   RTLC_INV inv1 (.Z(not_CLR), .A(CLR));
   RTLC_OR2 or2 (.Z(OR_out), .A(PRE), .B(D_Q_in));
   RTLC_AND2 and2 (.Z(D_in0), .A(not_CLR), .B(OR_out));

   wire D_in;
   //module RTLC_MUX2  (Z, A, B, S);
   RTLC_MUX2 mux1 (D_in, D_in0, SI, SE);

   always @(posedge CP)
       Q <= D_in;

endmodule // RTLC_FDSPCE_SCAN

/*
module RTLC_RTL_BUF16(Z, A);
  output [15:0] Z;
  wire [15:0] Z;
  input [15:0]  A;
  wire [15:0] A;

   RTLC_BUF inst0 (.Z(Z[0]), .A(A[0]));
   RTLC_BUF inst1 (.Z(Z[1]), .A(A[1]));
   RTLC_BUF inst2 (.Z(Z[2]), .A(A[2]));
   RTLC_BUF inst3 (.Z(Z[3]), .A(A[3]));
   RTLC_BUF inst4 (.Z(Z[4]), .A(A[4]));
   RTLC_BUF inst5 (.Z(Z[5]), .A(A[5]));
   RTLC_BUF inst6 (.Z(Z[6]), .A(A[6]));
   RTLC_BUF inst7 (.Z(Z[7]), .A(A[7]));
   RTLC_BUF inst8 (.Z(Z[8]), .A(A[8]));
   RTLC_BUF inst9 (.Z(Z[9]), .A(A[9]));
   RTLC_BUF inst10 (.Z(Z[10]), .A(A[10]));
   RTLC_BUF inst11 (.Z(Z[11]), .A(A[11]));
   RTLC_BUF inst12 (.Z(Z[12]), .A(A[12]));
   RTLC_BUF inst13 (.Z(Z[13]), .A(A[13]));
   RTLC_BUF inst14 (.Z(Z[14]), .A(A[14]));
   RTLC_BUF inst15 (.Z(Z[15]), .A(A[15]));

endmodule // RTLC_RTL_BUF16

module RTLC_RTL_FD16(Q, D, CP);
  output [15:0] Q;
  input [15:0]  D;
  input         CP;

  RTLC_FD rtlcI9 (.Q(Q[0]), .D(D[0]), .CP(CP));
  RTLC_FD rtlcI10 (.Q(Q[1]), .D(D[1]), .CP(CP));
  RTLC_FD rtlcI11 (.Q(Q[2]), .D(D[2]), .CP(CP));
  RTLC_FD rtlcI12 (.Q(Q[3]), .D(D[3]), .CP(CP));
  RTLC_FD rtlcI13 (.Q(Q[4]), .D(D[4]), .CP(CP));
  RTLC_FD rtlcI14 (.Q(Q[5]), .D(D[5]), .CP(CP));
  RTLC_FD rtlcI15 (.Q(Q[6]), .D(D[6]), .CP(CP));
  RTLC_FD rtlcI16 (.Q(Q[7]), .D(D[7]), .CP(CP));
  RTLC_FD rtlcI17 (.Q(Q[8]), .D(D[8]), .CP(CP));
  RTLC_FD rtlcI18 (.Q(Q[9]), .D(D[9]), .CP(CP));
  RTLC_FD rtlcI19 (.Q(Q[10]), .D(D[10]), .CP(CP));
  RTLC_FD rtlcI20 (.Q(Q[11]), .D(D[11]), .CP(CP));
  RTLC_FD rtlcI21 (.Q(Q[12]), .D(D[12]), .CP(CP));
  RTLC_FD rtlcI22 (.Q(Q[13]), .D(D[13]), .CP(CP));
  RTLC_FD rtlcI23 (.Q(Q[14]), .D(D[14]), .CP(CP));
  RTLC_FD rtlcI24 (.Q(Q[15]), .D(D[15]), .CP(CP));
endmodule // RTLC_RTL_FD16

module RTLC_RTL_FD16_SCAN(Q, SO, D, CP, SI, SE);
  output [15:0] Q;
  output SO;
  input [15:0]  D;
  input         CP, SI, SE;

  RTLC_FD_SCAN  rtlcI9 (.Q(Q[0]),  .D(D[0]),  .CP(CP), .SI(SI),    .SE(SE));
  RTLC_FD_SCAN rtlcI10 (.Q(Q[1]),  .D(D[1]),  .CP(CP), .SI(Q[0]),  .SE(SE));
  RTLC_FD_SCAN rtlcI11 (.Q(Q[2]),  .D(D[2]),  .CP(CP), .SI(Q[1]),  .SE(SE));
  RTLC_FD_SCAN rtlcI12 (.Q(Q[3]),  .D(D[3]),  .CP(CP), .SI(Q[2]),  .SE(SE));
  RTLC_FD_SCAN rtlcI13 (.Q(Q[4]),  .D(D[4]),  .CP(CP), .SI(Q[3]),  .SE(SE));
  RTLC_FD_SCAN rtlcI14 (.Q(Q[5]),  .D(D[5]),  .CP(CP), .SI(Q[4]),  .SE(SE));
  RTLC_FD_SCAN rtlcI15 (.Q(Q[6]),  .D(D[6]),  .CP(CP), .SI(Q[5]),  .SE(SE));
  RTLC_FD_SCAN rtlcI16 (.Q(Q[7]),  .D(D[7]),  .CP(CP), .SI(Q[6]),  .SE(SE));
  RTLC_FD_SCAN rtlcI17 (.Q(Q[8]),  .D(D[8]),  .CP(CP), .SI(Q[7]),  .SE(SE));
  RTLC_FD_SCAN rtlcI18 (.Q(Q[9]),  .D(D[9]),  .CP(CP), .SI(Q[8]),  .SE(SE));
  RTLC_FD_SCAN rtlcI19 (.Q(Q[10]), .D(D[10]), .CP(CP), .SI(Q[9]),  .SE(SE));
  RTLC_FD_SCAN rtlcI20 (.Q(Q[11]), .D(D[11]), .CP(CP), .SI(Q[10]), .SE(SE));
  RTLC_FD_SCAN rtlcI21 (.Q(Q[12]), .D(D[12]), .CP(CP), .SI(Q[11]), .SE(SE));
  RTLC_FD_SCAN rtlcI22 (.Q(Q[13]), .D(D[13]), .CP(CP), .SI(Q[12]), .SE(SE));
  RTLC_FD_SCAN rtlcI23 (.Q(Q[14]), .D(D[14]), .CP(CP), .SI(Q[13]), .SE(SE));
  RTLC_FD_SCAN rtlcI24 (.Q(Q[15]), .D(D[15]), .CP(CP), .SI(Q[14]), .SE(SE));
  RTLC_BUF buf1 (SO, Q[15]);
  
endmodule // RTLC_RTL_FD16


module RTLC_CLKGAT_AND ( GCK , FE , TE , CK ) ;
  output GCK ;
  input FE , TE , CK ;

  wire D_in;
  RTLC_OR2 or1 (.Z(D_in), .A(TE), .B(FE));

  wire G_EN;
  RTLC_LDN lat1 (.Q(G_EN), .D(D_in), .GN(CK));

  RTLC_AND2 and1 (.Z(GCK), .A(G_EN), .B(CK));

endmodule // RTLC_CLKGAT_AND


module RTLC_CLKGAT_OR ( GCK , FE , TE , CK ) ;
  output GCK ;
  input FE , TE , CK ;

  wire D_in;
  RTLC_OR2 or1 (.Z(D_in), .A(TE), .B(FE));

  wire G_EN;
  RTLC_LD lat1 (.Q(G_EN), .D(D_in), .G(CK));

  wire G_EN_N;
  RTLC_INV inv1 (.Z(G_EN_N) ,.A(G_EN));

  RTLC_OR2 or2 (.Z(GCK), .A(G_EN_N), .B(CK));

endmodule // RTLC_CLKGAT_OR

*/
`endcelldefine
