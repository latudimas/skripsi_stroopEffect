//BUTTON 
int rectX, rectY; //posisi tombol
int rectW, rectH; //tinggi dan lebar button
int textX, textY;
int textW, textH;
String buttonWord = "START HERE";
boolean rectOver;
boolean startProgram; //flag button

//DATA LOGGING
PrintWriter dataLog, dataDebug;
String dataLogName = "Saved_Data/" + "DataLog_[NAMA]_[TANGGAL]_[DATA].txt";

//IMAGE 
PImage[] gambarUji = new PImage[31];
PImage blankScreen; // Blank Screen untuk jeda
int counterImage = 0;
boolean gambarUjiFlag;

//TIMING
int currentTime, lastTimeCheck;
int timeInterval = 2000; //2000ms
String runningTime; //variabel untuk menunjukkant running time program

//INPUT
boolean stateKeyboard, pStateKeyboard; //current state keyboard and previous state keyboard

void setup(){
	background(255);
	size(1366,768);
	//fullScreen();

	//inisialisasi ukuran dan posisi Button
	rectW = 130;
	rectH = 20;
	rectX = (width/2) - (rectW/2);
	rectY = (height/2) - (rectH/2);
	//rect(rectX, rectY, rectW, rectH);
	
	//inisialisasi ukuran dan posisi text
	textW = 160;
	textH = 16;
	textX = rectX + 27	; 
	textY = rectY + 15; 	
	//fill(0);
	//text(buttonWord, textX, textY);

	//loadin Image to Array
	for (int i = 0; i < gambarUji.length; i++){
		gambarUji[i] = loadImage("gambar" + nf(i+1) + ".png");
	}

	// Set Flag
	startProgram = false;
	gambarUjiFlag = false;

	// SetUp nama file
	dataLog = createWriter(dataLogName);
}


// MAIN FUNCTION
void draw(){
	
	//println(mouseX + "\t" + mouseY);
	update(mouseX, mouseY);
	if (startProgram == false){
		//tampilkan button dan text
		showButton();
		//check kondisi mouse
	} else if (startProgram == true){
		currentTime = millis();
		if(currentTime - lastTimeCheck < timeInterval) {
			showImage();
			checkInput();
		} else if(currentTime - lastTimeCheck > timeInterval) {
			lastTimeCheck = millis();
			counterImage++;
			gambarUjiFlag = true;
		}
	}
}

//UPDATE KONDISI
void update(int x, int y) {
	if(overRect(rectX, rectY, rectW, rectH)) {
		rectOver = true;
	} else {
		rectOver = false;
	}
}

//FUNGSI DETEKSI POSISI KURSOR DI MOUSE
boolean overRect(int x, int y, int width, int height){
	if(mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height){
		return true;
	} else{
		return false;
	}
}

//FUNGSI DETEKSI INPUT MOUSE
void mousePressed(){
	if (rectOver){
		println("TRUE");
		startProgram = true;		//set flag startProgram true, program masuk mulai
		lastTimeCheck = millis();	//set patokan millis dari program jalan

		//print to datalog
		dataLog.println("PROGRAM MULAI [START]\t"+hour()+":"+minute()+":"+second()+"."+millis());
		dataLog.flush();
	}
}

//FUNGSI TAMPILKAN BUTTON
void showButton() {
	//Tampilkan Box
	fill(255);
	rect(rectX, rectY, rectW, rectH);
	
	//Tampilkan text button
	fill(0);
	text(buttonWord, textX, textY);
}

//FUNGSI TAMPIL GAMBAR UJI
void showImage() {
	if (counterImage >= 31){
		counterImage = 0;
		dataLog.println("PROGRAM BERHENTI [STOP] "+hour()+":"+minute()+":"+second()+"."+millis());
		dataLog.flush(); 
		startProgram = false;
	}
	//fill(0);
	//rect(rectX, rectY, rectW, rectH);
	image(gambarUji[counterImage], 0, 0);

	//Penanda waktu untuk gambar uji
	if((counterImage+1)%2==0 && gambarUjiFlag == true){
		dataLog.print("Mulai Tampil Gambar "+ (counterImage+1)/2 + "\t" + hour()+":"+minute()+":"+second()+"."+millis() + "\t");
		dataLog.flush();
		gambarUjiFlag = false;
	}
}

//FUNGSI CHECK INPUTva
void checkInput(){
	stateKeyboard = false;
	stateKeyboard = keyPressed;

	if(stateKeyboard != pStateKeyboard && stateKeyboard == true && pStateKeyboard == false && key == CODED){
		if(keyCode == LEFT){
			dataLog.println("INPUT\t"+ (counterImage+1)/2 +"\t"+ "KIRI" + "\t" + hour() + ":" + minute() + ":" + second() + "." + millis());
			dataLog.flush();
		} else if(keyCode == RIGHT){
			dataLog.println("INPUT\t"+ (counterImage+1)/2 +"\t"+ "KANAN" + "\t" + hour() + ":" + minute() + ":" + second() + "." + millis());
			dataLog.flush();
		}
	}
	pStateKeyboard = stateKeyboard;
}

//FUNGSI TIMER 
void showTimer() {
	int t = second();
	runningTime = nf(t, 3);
	println(runningTime);
	fill(0);
	text(runningTime, 0, 0);
}