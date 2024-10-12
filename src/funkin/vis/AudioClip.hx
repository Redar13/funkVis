package funkin.vis;

/**
 * Represents a currently playing audio clip
 */
interface AudioClip
{
	public var audioBuffer(default, null):AudioBuffer;
	public var currentFrame(get, never):Int;
	public var audioSource:lime.media.AudioSource;
	public var source:Dynamic;
}