//クイズゲーム

use core.Console;
use core.Program;
use core.type.Array;
use core.type.Primitive;

question = [
	"パンはパンでも食べられるパンは？",
	"室町幕府を開いた将軍は？",
	"5 × 5の答えは？"
];
ans_group = [
	[
		"フライパン",
		"鉄板焼き",
		"パイナップル"
	],
	[
		"源 頼朝",
		"徳川 家康",
		"足利 尊氏"
	],
	[
		"20",
		"25",
		"5"
	]
];
answer = [
	0,
	2,
	1
];
score = 0;
Program.command( "cls" );
Console.println( "--クイズ開始！--" );
for( i = 0;i < Array.length( question );i += 1 ){
	Console.println( "第" + ( i + 1 ) + "問目!" );
	Console.println( question[ i ] );
	for( j = 0;j < Array.length( ans_group[ i ] );j += 1 ){
		Console.print( j + ": " + ans_group[ i ][ j ] + " " );
	}
	Console.print( "\n0～2の番号で答えてください：" );
	ans = Primitive.to_integer( Console.in() );
	if( ans == answer[ i ] ){
		Console.println( "正解！" );
		score += 1;
	}else{
		Console.println( "残念！" );
	}
	Console.println( "--------------" );
}

Console.println( "あなたのスコアは：" + score + "/3 でした！" );