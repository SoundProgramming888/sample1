module main

import os
import math
import encoding.binary

const (
	sound_len = 5
	sample_rate = 44100
	tau = 2 * math.pi
	freq = 440
)

fn main(){
	mut f := os.create('sintone_sample')!
	samples := sample_rate * sound_len
	for i := 0; i < samples; i++ {

		sample := math.sin((tau * freq * f64(i) / sample_rate))
		mut buf := []u8{len: 4}

		binary.little_endian_put_u32(mut &buf, math.f32_bits(f32(sample)))
		f.write(buf)!
	}
	f.close()
}
