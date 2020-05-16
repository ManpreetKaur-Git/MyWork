using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    //Write a program to find out if two rectangles R1 and R2 are overlapping?

    class Rectangle
    {
        public coordinates c1;
        public coordinates c2;

        public bool isOverlap(Rectangle R1, Rectangle R2)
        {
            //if 1 rec is on left side of other
            if ((R2.c1.x >= R1.c2.x) || R2.c2.x <= R1.c1.x)
            {
                return false;
            }
            if (R2.c2.y>= R1.c1.y || R2.c1.y<=R1.c2.y )// 1 rec is above of the other
            {
                return false;
            }
            return true;
        }


        public void fillC1(int x, int y)
        {
            c1 = new coordinates(x, y);

        }

        public void fillC2(int x, int y)
        {
            c2 = new coordinates(x, y);

        }

    }


    class coordinates
    {
        public int x;

        public int y;

        public coordinates(int x, int y)
        {
            this.x = x;
            this.y = y;
        }

    }

    //execute 
    //Rectangle R1 = new Rectangle();
    //Rectangle R2 = new Rectangle();

    //R1.fillC1(1, 3);
    //R1.fillC2(3, 1);

    //R2.fillC1(4, 2);
    //R2.fillC2(8, 2);

    //Console.WriteLine(R1.isOverlap(R1, R2));
    // Console.WriteLine(5 + (2  + "7"));


}
