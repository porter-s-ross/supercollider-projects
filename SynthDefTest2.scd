s.boot;

s.reboot;

(
SynthDef.new(\SynthDefTest, {
	arg ampHz=4, noiseRate = 4, fund = 40, maxPartial = 4, width=0.5;
	var amp1, amp2, freq1, freq2, sig1, sig2;
	amp1 = LFPulse.kr(ampHz, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(ampHz, 0, 0.12) *0.75;
	freq1 = LFNoise0.kr(noiseRate).exprange(fund, fund*maxPartial).round(fund);
	freq2 = LFNoise0.kr(noiseRate).exprange(fund, fund*maxPartial).round(fund);
	sig1 = SinOsc.ar(freq1);
	sig2 = SinOsc.ar(freq2);
	sig1 = DelayN.ar(sig1);
	sig2 = DelayN.ar(sig2)
	sig1 = FreeVerb.ar(sig1, 0.7, 0.8, 0.25);
	sig2 = FreeVerb.ar(sig1, 0.7, 0.8, 0.25);
	Out.ar(0, sig1);
	Out.ar(1, sig2);
}).add;
)

x = Synth.new(\SynthDefTest)


// These make some weird glitchy sub bass / kick sounds
x.set(\fund, 50);
x.set(\maxPartial, 10);
x.set(\noiseRate, 3);

x.free