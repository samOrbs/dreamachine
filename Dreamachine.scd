/*
Dream Machine Sound Engine Prototype.
Copyright (C) <2020> <Sam Conran>
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

/***
 *       . .       . .       . .       . .       . .    .       . .       . .       . .    .       . .       . .
 *    .+'|=|`+. .+'|=|`+. .+'|=|`+. .+'|=|`+. .+'|=|`+.=|`+. .+'|=|`+. .+'|=|`+. .+'| |`+. |`+. .+'|=|`+. .+'|=|`+.
 *    |  | `+ | |  | |  | |  | `+.| |  | |  | |  | `+ | `+ | |  | |  | |  | `+.| |  | |  | |  | |  | `+ | |  | `+.|
 *    |  |  | | |  |'. '. |  |=|`.  |  |=|  | |  |  | |  | | |  |=|  | |  |      |  |=|  | |  | |  |  | | |  |=|`.
 *    |  |  | | |  | |  | |  | `.|  |  | |  | |  |  | |  | | |  | |  | |  |      |  | |  | |  | |  |  | | |  | `.|
 *    |  |  | | |  | |  | |  |    . |  | |  | |  |  | |  | | |  | |  | |  |    . |  | |  | |  | |  |  | | |  |    .
 *    |  | .+ | |  | |  | |  | .+'| |  | |  | |  |  | |  | | |  | |  | |  | .+'| |  | |  | |  | |  |  | | |  | .+'|
 *    `+.|=|.+' `+.| |.+' `+.|=|.+' `+.| |..| `+.|  |.|  |+' `+.| |..| `+.|=|.+' `+.| |..| |.+' `+.|  |.| `+.|=|.+'
 *
 */

// binaural beats for brain manipulation, to be expanded to be run from the command line using thisProcess.argv
// Instructions: line 31 changes beat, line 32 changes root. Highlight all and run!

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
	//{Mix.ar(LPF.ar(BrownNoise.ar(0.05),500),LPF.ar(PinkNoise(0.05),770))!2}.play;
	{SinOsc.ar([left,right],0,0.5)}.play;
	s.scope;
}