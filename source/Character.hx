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
		if(FlxG.save.data.antialiasing)
			{
				antialiasing = true;
			}

		switch (curCharacter)
		{
			case 'grunt':
				tex = Paths.getSparrowAtlas('Grunt_GF_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('cheer', 'Grunt Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'Grunt Left Note', 24, false);
				animation.addByPrefix('singRIGHT', 'Grunt Right Note', 24, false);
				animation.addByPrefix('singUP', 'Grunt Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'Grunt Down Note', 24, false);
				animation.addByIndices('sad', 'Grunt Sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'Grunt Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'Grunt Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');
			
			case 'grunt-dead':
				tex = Paths.getSparrowAtlas('Grunt_GF_Dead_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Grunt Dancing Beat', 24, false);
				animation.addByPrefix('singUP', 'Grunt Dancing Beat', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'grunt-spikes':
				tex = Paths.getSparrowAtlas('Grunt_GF_Spikes_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Grunt Dancing Beat', 24, false);
				animation.addByPrefix('singUP', 'Grunt Dancing Beat', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'jebus':
				tex = Paths.getSparrowAtlas('Jebus_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Jebus Idle Dance', 24);
				animation.addByPrefix('singUP', 'Jebus UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Jebus RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Jebus DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Jebus LEFT NOTE', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'sanford-deimos':
				tex = Paths.getSparrowAtlas('Sanford_Deimos_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('singUP', 'Sanford Deimos UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Sanford Deimos DOWN NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Sanford Deimos LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Sanford Deimos RIGHT NOTE', 24, false);
				animation.addByPrefix('idle', 'Sanford Deimos Idle Dance', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'tricky':
				tex = Paths.getSparrowAtlas('Tricky_Assets','shared',true);
				frames = tex;

				animation.addByPrefix('idle', 'Tricky Idle Dance', 24);
				animation.addByPrefix('singUP', 'Tricky UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Tricky RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Tricky DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Tricky LEFT NOTE', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'tricky-train':
				tex = Paths.getSparrowAtlas('Tricky_Train_Assets','shared',true);
				frames = tex;

				animation.addByPrefix('idle', 'Tricky Idle Dance', 24);
				animation.addByPrefix('singUP', 'Tricky UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Tricky RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Tricky DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Tricky LEFT NOTE', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'mustache-grunt':
				tex = Paths.getSparrowAtlas('Mustache_Grunt_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Mustache Grunt Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'Mustache Grunt UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Mustache Grunt DOWN NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Mustache Grunt LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Mustache Grunt RIGHT NOTE', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'engineer':
				tex = Paths.getSparrowAtlas('Engineer_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Engineer Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'Engineer UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Engineer LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Engineer RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Engineer DOWN NOTE', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'hank':
				var tex = Paths.getSparrowAtlas('Hank_Assets','shared',true);
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

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'hank-train':
				var tex = Paths.getSparrowAtlas('Hank_Train_Assets','shared',true);
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

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'jebus-tricky-duet':
				frames = Paths.getSparrowAtlas('Jebus_Tricky_Assets','shared',true);
				animation.addByPrefix('idle', 'Jebus Tricky Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'Jebus Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'Jebus Down Note', 24, false);
				animation.addByPrefix('singLEFT', 'Jebus Left Note', 24, false);
				animation.addByPrefix('singRIGHT', 'Jebus Right Note', 24, false);

				animation.addByPrefix('singUP-alt', 'Tricky Up Note', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Tricky Down Note', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Tricky Left Note', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Tricky Right Note', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'tricky-jebus-dead':
				frames = Paths.getSparrowAtlas('Tricky_Jebus_Dead_Assets','shared',true);
				animation.addByPrefix('idle', 'Tricky Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'Jebus UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Jebus DOWN NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Jebus LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Jebus RIGHT NOTE', 24, false);

				animation.addByPrefix('singUP-alt', 'Tricky UP NOTE', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Tricky DOWN NOTE', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Tricky LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Tricky RIGHT NOTE', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'auditor':
				tex = Paths.getSparrowAtlas('Auditor_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Auditor Idle Dance', 24);
				animation.addByPrefix('singUP', 'Auditor UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Auditor RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Auditor DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Auditor LEFT NOTE', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'auditor-large':
				tex = Paths.getSparrowAtlas('Auditor_Phase2_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Auditor Idle Dance', 24);
				animation.addByPrefix('singUP', 'Auditor UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Auditor RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Auditor DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Auditor LEFT NOTE', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'auditor-tricky':
				tex = Paths.getSparrowAtlas('Auditor_Tricky_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Tricky Idle Dance', 24);
				animation.addByPrefix('singUP', 'Tricky UP NOTE', 24);
				animation.addByPrefix('singRIGHT', 'Tricky RIGHT NOTE', 24);
				animation.addByPrefix('singDOWN', 'Tricky DOWN NOTE', 24);
				animation.addByPrefix('singLEFT', 'Tricky LEFT NOTE', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');
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

	public function loadOffsetFile(character:String, library:String = 'shared')
	{
		var offset:Array<String> = CoolUtil.coolTextFile(Paths.txt('images/characters/' + character + "Offsets", library));

		for (i in 0...offset.length)
		{
			var data:Array<String> = offset[i].split(' ');
			addOffset(data[0], Std.parseInt(data[1]), Std.parseInt(data[2]));
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
				trace('dance');
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
	public function dance(forced:Bool = false)
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'grunt':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				default:
					playAnim('idle', forced);
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
