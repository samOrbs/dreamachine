// binaural beats, TODO expand to be run from the command line using thisProcess.argv
// Authored by Sam Conran cc -> www.samconran.com

// INSTRUCTIONS
// SET DESIRED BEAT ON LINE 15 BY REPLACING THETA WITH EITHER DELTA,ALPHA,BETA OR GAMMA, SEE COMMENTS ON LINES 14,15,16,17,18.
// SET DESIRED ROOT FREQUENCY, 50 OR LOWER I FIND PERSONALLY QUITE GOOD FOR DELTA, THETA, ALPHA, I USE HIGHER ROOTS FOR BETA AND GAMMA
// HIGHLIGHT THE WHOLE BUFFER (WIN CTRL+A, MAC CMD+A) THEN SHIFT+ENTER.

s.waitForBoot{
	var left = 0, right = 0, beat = 0, delta = 0, theta = 0, alpha = 0, beta = 0, gamma = 0, root = 0;
	delta = rrand(0.5,4); // Delta wavelength, dreamless sleep.
    theta = rrand(4,7);   // Theta wavelength, meditation, creativity, REM.
    alpha = rrand(7,13);  // Alpha wavelength, relaxation.
    beta  = rrand(13,30); // Beta wavelength, concentration, alertness.
    gamma = rrand(30,50); // Gamma pattern, arousal.
	beat = theta;     // <-------------------------------------------------------------- changes beat.
	root = 30*1.5;    // <-------------------------------------------------------------- changes root.
	left = root;
	right = root+beat;
	("binuaral beat = ").post;
	beat.post;
	("hz").postln;
	if( beat >0.4 && beat <4,{
        "Delta... Dreamless Sleep".postln;
    },{if(beat >4 && beat <7,{
		"Theta... Meditation, Creativity & REM".postln;
    },{if(beat >7 && beat <13,{
		"Alpha... Relaxation".postln;
	},{if(beat >13 && beat <30,{
		"Beta... Concentration,Aertness".postln;
	},{if(beat >30 && beat <50,{
		"Gamma... Arousal".postln;
	},{"Out of Range"})})})})});
	{SinOsc.ar([left,right],0,0.5)}.play;
	s.scope;
}