use core.Console;
use core.Program;
use core.type.Array;
use extra.GUI;

STONE_SIZE = 80;			//石のサイズ
FIELD_SIZE = STONE_SIZE * 8;//フィールドのサイズ

BLACK_IMG = GUI.create_image( "./img/osero-illust1.png" );
WHITE_IMG = GUI.create_image( "./img/osero-illust2.png" );

field = [
	[ 0,0,0,0,0,0,0,0 ],
	[ 0,0,0,0,0,0,0,0 ],
	[ 0,0,0,0,0,0,0,0 ],
	[ 0,0,0,1,-1,0,0,0 ],
	[ 0,0,0,-1,1,0,0,0 ],
	[ 0,0,0,0,0,0,0,0 ],
	[ 0,0,0,0,0,0,0,0 ],
	[ 0,0,0,0,0,0,0,0 ]
];
turn = 1;//ターン

window = GUI.create_window();//ウィンドウを作成
GUI.set_size( window, FIELD_SIZE + 9, FIELD_SIZE + 30 );//ウィンドウサイズを作成
GUI.set_title( window, "オセロゲーム" );

fn draw_field(){
	GUI.set_draw_color( window, 0, 0, 0 );
	for( x = 1;x < Array.length( field );x += 1 ){
		GUI.draw_line( window, STONE_SIZE * x + 7, 0, STONE_SIZE * x + 7, FIELD_SIZE + 30 );
	}
	for( y = 1;y < Array.length( field );y += 1 ){
		GUI.draw_line( window, 0, STONE_SIZE * y + 30, FIELD_SIZE, STONE_SIZE * y + 30 );
	}
}

fn draw_stone(){
	for( y = 0;y < Array.length( field );y += 1 ){
		for( x = 0;x < Array.length( field );x += 1 ){
			if( field[ y ][ x ] == 0 ){continue;}
			if( field[ y ][ x ] == 1 ){
				GUI.draw_image( window, BLACK_IMG, x * STONE_SIZE - 7, y * STONE_SIZE + 33, STONE_SIZE + 28, STONE_SIZE - 7 );
			}else{
				GUI.draw_image( window, WHITE_IMG, x * STONE_SIZE - 7, y * STONE_SIZE + 33, STONE_SIZE + 28, STONE_SIZE - 7 );
			}
		}
	}
}

fn draw(){
	GUI.clear_rect( window, 0, 0, FIELD_SIZE + 9, FIELD_SIZE + 30 );
	GUI.set_draw_color( window, 0, 128, 0 );
	GUI.draw_rect( window, 0, 0, FIELD_SIZE + 9, FIELD_SIZE + 30 );
	draw_field();
	draw_stone();
}

fn check( mX, mY, vX, vY ){
	nx = mX;
	ny = mY;
	get_count = 0;
	while( true ){
		nx += vX;
		ny += vY;
		if( !( nx < 8 ) ){	//右にオーバー
			return 0;
		}
		if( !( nx > -1 ) ){//左にオーバー
			return 0;
		}
		if( !( ny < 8 ) ){	//下にオーバー
			return 0;
		}
		if( !( ny > -1 ) ){//上にオーバー
			return 0;
		}
		if( field[ ny ][ nx ] == turn * -1 ){//相手の駒
			get_count += 1;
		}
		if( field[ ny ][ nx ] == turn ){	//自分の駒
			break;
		}
		if( field[ ny ][ nx ] == 0 ){		//空白
			return 0;
		}
	}
	nx = mX;
	ny = mY;
	for( i = 0;i < get_count;i += 1 ){
		nx += vX;
		ny += vY;
		field[ ny ][ nx ] = turn;
	}
	return get_count;
}

fn MOUSECLICK_window(){
	mX = 0;
	mY = 0;
	for( x = 0;x < Array.length( field );x += 1 ){
		if( GUI.get_mouse_x( window ) > x * STONE_SIZE + 7 ){
			mX = x;
		}
	}
	for( y = 0;y < Array.length( field );y += 1 ){
		if( GUI.get_mouse_y( window ) > y * STONE_SIZE + 30 ){
			mY = y;
		}
	}
	if( field[ mY ][ mX ] == 0 ){
		n = 0;
		n += check( mX, mY, 0, -1 );
		n += check( mX, mY, 1, -1 );
		n += check( mX, mY, 1, 0 );
		n += check( mX, mY, 1, 1 );
		n += check( mX, mY, 0, 1 );
		n += check( mX, mY, -1, 1 );
		n += check( mX, mY, -1, 0 );
		n += check( mX, mY, -1, -1 );
		if( n != 0 ){
			field[ mY ][ mX ] = turn;
			turn *= -1;
			draw();
		}
	}
}
fn KEYPRESS_window(){
	switch( GUI.get_keycode( window ) ){
		case 32://スペース 置けない場合、ターンを変える
			turn *= -1;
			break;
		case 27://ESC プログラムを終了
			Program.exit();
			break;
	}
}
draw();