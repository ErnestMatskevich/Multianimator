PImage img;
int xp = 50, yp = xp; //поля 
int nor = 8; //кол-во полей для ввода 
int rxs, rys;//о них ниже 
int sry, hi;//вспомогательные переменные 
int a = 150;//переменная для смещения координаты у у квадравтов 
int x1 = 10; //переменная по х для левых квадратов 
int x2 = 190;//переменная по х для правых квадратов 
int y = 50;//переменная по у для квадратов 
int l1 = 150;//длина для левых квадратов 
int l2 = 850;//длина для правых квадратов 
int w = 100;//ширина для квадратов 
int r = 20; // радиус скругления квадратов 
//цветовая тема для бирюзового цвета(сс=campus color)) по rgb 
int cc1=127; 
int cc2=227; 
int cc3=215; 
//цветовая тема для оранжевого цвета по rgb 
int orange1=255; 
int orange2=193; 
int orange3=36; 
//цветовая тема для белого цвета, r,g,b = 255 
int white=255; 
//цветовая тема для черного цвета r,g,b=0 
int black=0; 
String[] questions = new String[nor];//массив правильных ответов 
boolean keyboard = false;//вспомог. перемен. 
char[] htxt;//вспомог. 
String[] txt = new String[nor];//ма сив введенных ответов 
int score = 0;//кол-во правильных ответов 
int my;//всп. 
int hmx, hmy, hmxs, hmys;//всп. 
void setup() { 
fullScreen(); 
//size(1080,2340);
rys = 100;//размер окон по игрику 
rxs = width-xp*3-rys;//размер по иксу (высчитывается относительно полей и размера по у) 
questions[0] = "2";//правильные ответы 
questions[1] = "100";//придется вводить вручную 
questions[2] = "105"; 
questions[3] = "1862"; 
questions[4] = "501"; 
questions[5] = "18"; 
questions[6] = "37"; 
questions[7] = "1"; 
for (int i = 0; i < nor; i++) { 
txt[i] = "";}//без заполнения пустотой не работает 
img=loadImage("kakao_kvadrat1.jpg");
} 

void draw() { 
background(81,50,48); 
rects();//тут отрисовываются все окна программы 
texts();//а тут - весь текст 
image(img,100,1400,width/1.2,height/3);
} 
void rects() { 
for (int i = 0; i < nor; i++) { 
fill(0); 
rect(xp, yp+i*(yp+rys), rys, rys);// десь всё высчитывается снова от полей и размеров 
rect(xp*2+rys, my = yp+i*(yp+rys), rxs, rys); 
} 
rect(hmx = width-xp-(width-xp*2)/4, hmy = yp*(nor+1)+rys*nor, hmxs = (width-xp*2)/4, hmys = rys);//страшная строчка 
fill(cc1, cc2, cc3); 
//рисуем левые квадраты 
rect(width/80,y,width/7,w,r); 
rect(x1,y+a,l1,w,r); 
rect(x1,y+2*a,l1,w,r); 
rect(x1,y+3*a,l1,w,r); 
rect(x1,y+4*a,l1,w,r); 
rect(x1,y+5*a,l1,w,r); 
rect(x1,y+6*a,l1,w,r); 
rect(x1,y+7*a,l1,w,r); 
//рисуем правые квадраты 
rect(x2,y,width/1.25,w,r); 
rect(x2,y+a,width/1.25,w,r); 
rect(x2,y+2*a,width/1.25, w,r); 
rect(x2,y+3*a,width/1.25,w,r); 
rect(x2,y+4*a,width/1.25, w,r); 
rect(x2, y+5*a,width/1.25,w,r); 
rect(x2,y+6*a,width/1.25,w,r); 
rect(x2,y+7*a,width/1.25,w,r); 
//кнопка подсчет 
rect(width/1.5,height/1.8,l2/2.5,w,r); 
} 
void texts() { 
float txts = rys*0.75; 
for (int i = 0; i < nor; i++) { 
fill(81,50,48); 
textSize(txts); 
text(i+1, xp+txts/2.5, yp+i*(xp+rys)+txts); 
}//столбец с нумерацией 
txts *= 0.75; 
for (int i = 0; i < nor; i++) { 
textSize(txts); 
fill(213,82,75);
text(txt[i], xp*2+yp+txts*1.25, yp+i*(yp+rys)+txts*1.25); 
}//столбец с вводом 
fill(81,50,48);
text("Подсчет", width-xp-(width-xp*2)/4+txts/2-50, yp*(nor+1)+rys*nor+txts*1.25);//кнопка "Подсчет" 
txts *= 2; 
fill(cc1, cc2, cc3); 
textSize(txts); 
text("Баллы: " + score, xp, yp*(nor+1)+rys*nor+txts/1.25);//вывод счёта 
textSize(50); 
} 
void mouseReleased() { 
for (int i = 0; i < nor; i++) { 
if (mouseX > xp*2+rys && mouseY > yp+i*(yp+rys) && mouseX < xp*2+rys+rxs && mouseY < yp+i*(yp+rys)+rys) { 
sry = yp+i*(yp+rys); 
hi = i; 
//Открытие клавиатуры на телефоне 
if (keyboard == false) { 
openKeyboard(); 
keyboard = true; 
} else if (keyboard == true) { 
closeKeyboard(); 
keyboard = false; 
} 
//Коменты закрываются здесь 
}} 
if (mouseX > hmx && mouseY > hmy && mouseX < hmx+hmxs && mouseY < hmy+hmys) { 
scoreCalculating(); 
}} 
void keyPressed() {if (key == 'd' && txt[hi].length() > 0) { 
htxt = txt[hi].toCharArray(); 
htxt = shorten(htxt); 
txt[hi] = new String(htxt); 
} else if (key != 'd' && key != CODED) { 
txt[hi] = txt[hi] + key; 
}} 
void scoreCalculating() { 
score=0; 
for (int i = 0; i < nor; i++) { 
if (questions[i].equals(txt[i])) {score++; 
}} 
for (int i = 0; i < nor; i++) { 
print(questions[i] + " " + txt[i] + " "); 
println(questions[i] == txt[i]); 
}//введенных данных с ответами на консоли 
println("Score: " + score);//счёт на консоль 
println(""); 
}