s.boot;

s.reboot;

(
SynthDef.new(\SynthDefTest, {
	arg noiseRate = 4, fund = 40, maxPartial = 4;
	var amp1, amp2, freq1, freq2, sig1, sig2;
	amp1 = LFPulse.kr(ampHz, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(ampHz, 0, 0.12) *0.75;
	freq1 = LFNoise0.kr(noiseRate).exprange(fund, fund*maxPartial).round(fund);
	freq2 = LFNoise0.kr(noiseRate).exprange(fund, fund*maxPartial).round(fund);
	sig1 = SinOsc.ar(freq1);
	sig2 = SinOsc.ar(freq2);
	Out.ar(0, sig1);
	Out.ar(1, sig2);
}).add;
)

x = Synth.new(\synthDefTest)


// These make some weird glitchy sub bass / kick sounds
x.set(\fund, 30);
x.set(\maxPartial, 0.1);
x.set(\noiseRate, 5);

x.free