package funkin.vis.audioclip.frontends;

#if (flixel >= "5.3.0")
import flixel.sound.FlxSound;
#else
import flixel.system.FlxSound;
#end
import flixel.math.FlxMath;

/**
 * Implementation of AudioClip for Flixel.
 */
class FlixelAudioClip extends funkin.vis.audioclip.frontends.LimeAudioClip
{
	var flxSound:FlxSound;

	public function new(snd:FlxSound)
	{
		flxSound = snd;
		@:privateAccess
		super(#if (openfl >= "9.3.2") snd._channel.__audioSource #else snd._channel.__source #end);
	}

	private override function get_currentFrame():Int
	{
		var dataLength:Int = 0;

		#if web
		dataLength = source.length;
		#else
		dataLength = audioBuffer.data.length;
		#end

		return Std.int(Math.max(FlxMath.remapToRange(flxSound.time, 0, flxSound.length, 0, dataLength), -1));
	}
}