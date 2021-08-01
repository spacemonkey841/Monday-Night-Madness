package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('hank', [0, 1], 0, false, isPlayer);
		animation.add('hank-train', [0, 1], 0, false, isPlayer);
		animation.add('grunt', [2, 3], 0, false, isPlayer);
		animation.add('grunt-speaker', [2, 3], 0, false, isPlayer);
		animation.add('jebus', [4, 5], 0, false, isPlayer);
		animation.add('sanford-deimos', [6, 7], 0, false, isPlayer);
		animation.add('mustache-grunt', [8, 9], 0, false, isPlayer);
		animation.add('engineer', [10, 11], 0, false, isPlayer);
		animation.add('tricky', [12, 13], 0, false, isPlayer);
		animation.add('tricky-train', [12, 13], 0, false, isPlayer);
		animation.add('jebus-tricky-duet', [14, 15], 0, false, isPlayer);
		animation.add('tricky-jebus-dead', [16, 17], 0, false, isPlayer);
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
