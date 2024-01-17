use core.type.Array;
use extra.GUI;

STONE_SIZE = 80;			//�΂̃T�C�Y
FIELD_SIZE = STONE_SIZE * 8;//�t�B�[���h�̃T�C�Y

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
turn = 1;//�^�[��

window = GUI.create_window();//�E�B���h�E���쐬
GUI.set_size( window, FIELD_SIZE + 9, FIELD_SIZE + 30 );//�E�B���h�E�T�C�Y���쐬
GUI.set_title( window, "�I�Z���Q�[��" );

fn draw_field(){
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

draw_field();
draw_stone();