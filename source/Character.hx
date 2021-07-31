package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'hank';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "hank", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'grunt':
				tex = Paths.getSparrowAtlas('characters/Grunt_GF_Assets');
				frames = tex;
				animation.addByPrefix('cheer', 'Grunt Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'Grunt Left Note', 24, false);
				animation.addByPrefix('singRIGHT', 'Grunt Right Note', 24, false);
				animation.addByPrefix('singUP', 'Grunt Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'Grunt Down Note', 24, false);
				animation.addByIndices('sad', 'Grunt Sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'Grunt Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'Grunt Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				

				addOffset('cheer', -9, 90);
				addOffset('sad', -12, -111);
				addOffset('danceLeft', -6, -105);
				addOffset('danceRight', -6, -105);

				addOffset("singUP", -9, -108);
				addOffset("singRIGHT", -7, -135);
				addOffset("singLEFT", -7, -124);
				addOffset("singDOWN", -10, -127);

				playAnim('danceRight');

			case 'grunt-dead':
				tex = Paths.getSparrowAtlas('characters/Grunt_GF_Dead_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Grunt Dancing Beat', 24, false);
				animation.addByPrefix('singUP', 'Grunt Dancing Beat', 24, false);

				addOffset('idle', 136, -65);

				playAnim('idle');

			case 'jebus':
				tex = Paths.getSparrowAtlas('characters/Jebus_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Jebus Idle Dance', 24);
				animation.addByPrefix('singUP', 'Jebus UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Jebus RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Jebus DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Jebus LEFT NOTE', 24);

				addOffset('idle', -5, 90);
				addOffset("singUP", -83, 112);
				addOffset("singRIGHT", -52, 82);
				addOffset("singLEFT", 40, 105);
				addOffset("singDOWN", -27, 74);

				playAnim('idle');

			case 'sanford-deimos':
				tex = Paths.getSparrowAtlas('characters/Sanford_Deimos_Assets');
				frames = tex;
				animation.addByPrefix('singUP', 'Sanford Deimos UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Sanford Deimos DOWN NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Sanford Deimos LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Sanford Deimos RIGHT NOTE', 24, false);
				animation.addByPrefix('idle', 'Sanford Deimos Idle Dance', 24, false);

				addOffset('idle', -5, 120);

				addOffset("singUP", 50, 120);
				addOffset("singRIGHT", 40, 121);
				addOffset("singLEFT", 53, 126);
				addOffset("singDOWN", -11, 53);

				playAnim('idle');

			case 'tricky':
				tex = Paths.getSparrowAtlas('characters/Tricky_Assets');
				frames = tex;

				animation.addByPrefix('idle', 'Tricky Idle Dance', 24);
				animation.addByPrefix('singUP', 'Tricky UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Tricky RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Tricky DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Tricky LEFT NOTE', 24);

				addOffset('idle', -5, 80);
				addOffset("singUP", -40, 125);
				addOffset("singRIGHT", -85, 110);
				addOffset("singLEFT", 20, 155);
				addOffset("singDOWN", -50, 100);

				playAnim('idle');

			case 'tricky-train':
				tex = Paths.getSparrowAtlas('characters/Tricky_Train_Assets');
				frames = tex;

				animation.addByPrefix('idle', 'Tricky Idle Dance', 24);
				animation.addByPrefix('singUP', 'Tricky UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Tricky RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Tricky DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Tricky LEFT NOTE', 24);

				addOffset('idle', -5, 80);
				addOffset("singUP", -40, 125);
				addOffset("singRIGHT", -85, 110);
				addOffset("singLEFT", 20, 155);
				addOffset("singDOWN", -50, 100);

				playAnim('idle');
			
			case 'mustache-grunt':
				tex = Paths.getSparrowAtlas('characters/Mustache_Grunt_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Mustache Grunt Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'Mustache Grunt UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Mustache Grunt DOWN NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Mustache Grunt LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Mustache Grunt RIGHT NOTE', 24, false);

				addOffset('idle', -5, 60);
				addOffset("singUP", -70, 129);
				addOffset("singRIGHT", -48, 34);
				addOffset("singLEFT", 38, 128);
				addOffset("singDOWN", -32, 69);

				playAnim('idle');
			
			case 'engineer':
				tex = Paths.getSparrowAtlas('characters/Engineer_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Engineer Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'Engineer UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Engineer LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Engineer RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Engineer DOWN NOTE', 24, false);

				addOffset('idle', -9, 80);
				addOffset("singUP", -70, 106);
				addOffset("singRIGHT", -56, 74);
				addOffset("singLEFT", 35, 66);
				addOffset("singDOWN", -27, 49);

				playAnim('idle');


			case 'hank':
				var tex = Paths.getSparrowAtlas('characters/Hank_Assets');
				frames = tex;

				animation.addByPrefix('idle', 'Hank Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'Hank UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Hank LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Hank RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Hank DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'Hank UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Hank LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Hank RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Hank DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'Hank Hey', 24, false);

				animation.addByPrefix('firstDeath', "Hank Dies", 24, false);
				animation.addByPrefix('deathLoop', "Hank Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "Hank Dead Confirm", 24, false);

				animation.addByPrefix('scared', 'Hank Scared', 24);

				addOffset('idle', -5, 90);
				addOffset("singUP", -29, 117);
				addOffset("singRIGHT", -58, 102);
				addOffset("singLEFT", 24, 84);
				addOffset("singDOWN", -14, 69);
				addOffset("singUPmiss", -29, 117);
				addOffset("singRIGHTmiss", -58, 102);
				addOffset("singLEFTmiss", 24, 102);
				addOffset("singDOWNmiss", -14, 87);
				addOffset("hey", -9, 94);
				addOffset('firstDeath', 9, 94);
				addOffset('deathLoop', 9, 94);
				addOffset('deathConfirm', 9, 139);
				addOffset('scared',-23, 102);

				playAnim('idle');

				flipX = true;

			case 'hank-train':
				var tex = Paths.getSparrowAtlas('characters/Hank_Train_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'Hank Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'Hank UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Hank LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Hank RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Hank DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'Hank UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Hank LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Hank RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Hank DOWN MISS', 24, false);

				addOffset('idle', -5, 90);
				addOffset("singUP", -29, 117);
				addOffset("singRIGHT", -58, 102);
				addOffset("singLEFT", 24, 84);
				addOffset("singDOWN", -14, 69);
				addOffset("singUPmiss", -29, 117);
				addOffset("singRIGHTmiss", -58, 102);
				addOffset("singLEFTmiss", 24, 102);
				addOffset("singDOWNmiss", -14, 87);

				playAnim('idle');

				flipX = true;
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('hank'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('hank'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'jebus')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'grunt':
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'grunt')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
