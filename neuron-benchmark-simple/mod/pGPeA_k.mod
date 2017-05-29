TITLE  All ion channels used in GP models

:
: Na+, K, Ca_T, Leakage and Ca diffusion
: 
: Added AHP current 9/6/2005 Philip Hahn
:


NEURON {
	SUFFIX GPeA_k
	NONSPECIFIC_CURRENT ilk
	USEION ca READ cai, cao WRITE ica, cai
	USEION k READ ki, ko WRITE ik
	USEION na READ nai, nao WRITE ina
	RANGE ina, ik, ica
	RANGE gnabar, gna, ena, m_inf, h_inf, tau_h, tau_m, kna, kk: fast sodium
	RANGE gkdrbar, gkdr, ek, n_inf, tau_n, ikD                 : delayed K rectifier
	RANGE gl, el, ilk                                          : leak
	RANGE gcatbar, gcat, eca, p_inf, tau_p, q_inf, tau_q, icaT : T-type ca current
	RANGE gkcabar, gkca, ek, r_inf, ikAHP                      : ca dependent AHP K current
      RANGE kca, vol, caGain                                       : ca dynamics
}


UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
	(S)  = (siemens)
	(molar) = (1/liter)
	(mM)	= (millimolar)
	FARADAY = (faraday) (coulomb)  :units are really coulombs/mole
	PI	= (pi) (1)
}

PARAMETER {
	R = 8.31441 (Gas constant)
	T 		(Absolute temp)
	celsius		(degC)

:Fast Na channel
	gnabar   = 49e-3 (S/cm2) 
	theta_m = -38 (mV)
	theta_h = -45.5 (mV) 
	k_m = -7 (mV)    
	k_h = 6.4 (mV)   
	:tau_m0 = kna * 0.001 (ms) : 0.001 (ms)
	:tau_m1 = kna * 0.1 (ms) : 0.1 (ms)
	:tau_h0 = kna * 0 (ms) : 0 (ms)
	:tau_h1 = kna * 4.5 (ms) : 4.5 (ms) 
	tht_m = -53 (mV)
	tht_h1 = -50 (mV)
	tht_h2 = -50 (mV)
	sig_m = -0.7 (mV)
	sig_h1 = -15 (mV)
	sig_h2 = 16 (mV)
	kna = 1.0

: delayed K rectifier 
	gkdrbar  = 57e-3	(S/cm2)  
	theta_n = -42 (mV)
	k_n = -14 (mV)     
	:tau_n0 = 0 (ms)
	:tau_n1 = 2.4 (ms) 
	tht_n1 = -40 (mV)
	tht_n2 = -40 (mV)
	sig_n1 = -40 (mV)
	sig_n2 = 50 (mV)
	kk = 1.0

:Leakage current
	gl	= 0.35e-3	(S/cm2)
	el	= -60	(mV)

:Ca dynamics
	kca   = 2        (1/ms)
      area
      vol = 3.355e-11  (L) :~20um radius sphere
      caGain = .1

:T-type ca current
	gcatbar   = 5e-3 (S/cm2)  
	theta_p = -56 (mV)
	theta_q = -85 (mV) 
	k_p = -6.7 (mV)    
	k_q = 5.8 (mV)  
	tau_p0 = 5 (ms)
	tau_p1 = 0.33 (ms)
	tau_q0 = 0 (ms)
	tau_q1 = 400 (ms) 
	tht_p1 = -27 (mV)
	tht_p2 = -102 (mV)
	tht_q1 = -50 (mV)
	tht_q2 = -50 (mV)
	sig_p1 = -10 (mV)
	sig_p2 = 15 (mV)
	sig_q1 = -15 (mV)
	sig_q2 = 16 (mV)

:AHP current (Ca dependent K current)
	gkcabar   = 1e-3 (S/cm2) 
	theta_r = 0.17e-3 (mM)
	k_r = -0.08e-3 (mM)
	tau_r = 2 (ms)
	power_r = 2

}

ASSIGNED {
	v	(mV)
	ina	(mA/cm2)
	ik	(mA/cm2) 
	ikD	(mA/cm2)   
	ikAHP	(mA/cm2)  
	ica	(mA/cm2) 
	icaT	(mA/cm2) 
	ilk	(mA/cm2)

:Fast Na
	h_inf
	tau_h	(ms)
	m_inf
	tau_m	(ms)
	ena           (mV)   := 60
	gna     (S/cm2)
	tau_m0  (ms) : 0.001 (ms)
	tau_m1  (ms) : 0.1 (ms)
	tau_h0  (ms) : 0 (ms)
	tau_h1  (ms) : 4.5 (ms) 
	

:K rectifier
	n_inf
	tau_n	(ms)
	ek         (mV) := -90
	gkdr    (S/cm2)
	tau_n0  (ms) : 0 (ms)
	tau_n1  (ms) : 2.4 (ms)

:T-type ca current
	p_inf
	q_inf
	tau_p	(ms)
	tau_q	(ms)
	eca           (mV)   :calc from Nernst
	gcat    (S/cm2)

:AHP (Ca dependent K current)
	r_inf
	gkca    (S/cm2)	
}

STATE {
	m h n 
	p q
	cai (mM) <1e-10>
	cao (mM) <1e-10>
	nai (mM) <1e-10>
	nao (mM) <1e-10>
	ki (mM) <1e-10>
	ko (mM) <1e-10>
      r
}


BREAKPOINT {
	SOLVE states METHOD cnexp

	T = 273 + celsius - 9.5
	ena = -(R*T)/FARADAY*log(nai/nao)*1000
	ek = (R*T)/FARADAY*log(ko/ki)*1000
	eca = -(R*T)/FARADAY*log(cai/cao)*1000/2

	tau_m0 = kna * 0.001  : 0.001 (ms)
	tau_m1 = kna * 0.1  : 0.1 (ms)
	tau_h0 = kna * 0  : 0 (ms)
	tau_h1 = kna * 4.5  : 4.5 (ms) 

	tau_n0 = kk * 0  : 0 (ms)
	tau_n1 = kk * 2.4  : 2.4 (ms) 
	
	gna = gnabar * m*m*m*h
	ina = gna * (v - ena)
	gkdr = gkdrbar * n^4
	ikD = gkdr * (v - ek)
	gkca = gkcabar * r^(power_r)
	ikAHP = gkca * (v - ek)
	ik=ikD+ikAHP
	ilk = gl * (v - el)
	gcat = gcatbar * p*p*q
	ica = gcat * (v - eca)
}

DERIVATIVE states {   
	evaluate_fct(v)
	h' = (h_inf - h)/tau_h
	m' = (m_inf - m)/tau_m
	n' = (n_inf - n)/tau_n
	p' = (p_inf - p)/tau_p
	q' = (q_inf - q)/tau_q

      :(Ica mA/cm2)*(area um2)*(1e-8 cm2/um2)*(1e-3 A/mA)*(1/(2*F) mol/C)*(1e-3 sec/msec)*(1e3 mMol/mol)(1/volume 1/L)=(mM/msec)
	cai' = caGain*(-ica*area*1e-11/(2*FARADAY*vol) - kca*cai)

	r' = (r_inf - r)/tau_r
}

UNITSOFF

INITIAL {
	evaluate_fct(v)
	m = m_inf 
	h = h_inf 
	n = n_inf   
	p = p_inf 
	q = q_inf   
	r = r_inf 
}

PROCEDURE evaluate_fct(v(mV)) { 

	h_inf = 1/(1+exp((v-theta_h)/k_h))
	m_inf = 1/(1+exp((v-theta_m)/k_m))
	tau_h = tau_h0 + tau_h1/(exp(-(v-tht_h1)/sig_h1) + exp(-(v-tht_h2)/sig_h2)) 
	tau_m = tau_m0 + tau_m1/(1+exp(-(v-tht_m)/sig_m)) 

	n_inf = 1/(1+exp((v-theta_n)/k_n))
	tau_n = tau_n0 + tau_n1/(exp(-(v-tht_n1)/sig_n1) + exp(-(v-tht_n2)/sig_n2))

	p_inf = 1/(1+exp((v-theta_p)/k_p))
	q_inf = 1/(1+exp((v-theta_q)/k_q))
	tau_p = tau_p0 + tau_p1/(exp(-(v-tht_p1)/sig_p1) + exp(-(v-tht_p2)/sig_p2)) 
	tau_q = tau_q0 + tau_q1/(exp(-(v-tht_q1)/sig_q1) + exp(-(v-tht_q2)/sig_q2)) 

	r_inf = 1/(1+exp((cai-theta_r)/k_r))
}

UNITSON