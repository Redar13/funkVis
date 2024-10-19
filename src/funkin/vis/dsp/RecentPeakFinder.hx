package funkin.vis.dsp;

import openfl.Vector;

class RecentPeakFinder
{
	private var buffer:Vector<Float>;
	private var bufferIndex:Int = 0; // We circle arround to avoid reallocating
	public var peak(default, null):Float = 0;
	public var lastValue(get, never):Float;

	public function new(length:Int = 30) {
		buffer = new Vector();
		buffer.length = length;
	}

	public function push(value:Float) {
		buffer[bufferIndex] = value;
		if (value > peak)
		{
			peak = value;
		}
		else
		{
			peak = buffer[0];
			for (i in buffer)
				peak = Math.max(i, peak);
		}
		if (bufferIndex == buffer.length - 1)
			bufferIndex = 0;
		else
			bufferIndex++;
	}

	private function get_lastValue():Float {
		return buffer[bufferIndex == 0 ? buffer.length - 1 : bufferIndex - 1];
	}
}