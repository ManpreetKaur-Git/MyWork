using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class Array
    {

        int[] Myarray = { 33, 4, 16, 34, 25, 36, 17, 38, 21, 8 };
        int[] Myarray1 = { 1, 2, 3, 4, 5 };

        public void findMAX()
        {
            int myLargestElement;
            myLargestElement = Myarray[0];
            //foreach (int i in Myarray)
            //{
            //    if (myLargestElement <i)
            //    {
            //        myLargestElement = i;
            //    }

            //}

            for (int i = 0; i < Myarray.Length; i++)
            {
                if (myLargestElement < Myarray[i])
                    myLargestElement = Myarray[i];
            }

            Console.WriteLine(myLargestElement);
        }

        public void findcommonelements()
        {
            //foreach (int i in Myarray)
            //{
            //    foreach (int j in Myarray1)
            //    {
            //        if (i == j)
            //        {
            //            Console.WriteLine("Common Elements:" + i);
            //        }
            //    }
            //}


            for (int i = 0; i < Myarray.Length; i++)
            {
                for (int j = 0; j < Myarray1.Length; j++)
                {
                    if (Myarray[i] == Myarray1[j])
                        Console.WriteLine("CommonElements: " + Myarray[i]);
                }
            }

            Console.ReadKey();
        }

        public void DisplayPair()
        {
            //Pair[33,51]
            foreach (int i in Myarray)
            {
                foreach (int j in Myarray1)
                {
                    if (i + j > 80)
                        Console.WriteLine("Pair[" + i + "," + j + "]");
                }
            }

            Console.ReadKey();

        }

        public void Reversearray()
        {
            int x;


            //Console.ReadKey();

            for (int i = 0; i < Myarray1.Length / 2; i++)
            {
                // Myarray1[0] -- Myarray1[9]
                //     Myarray1[1]-- Myarray1[8]
                //     Myarray1[2]-- Myarray1[7]

                // Myarray1[i]-- Myarray1[Myarray1.Length-1-i]

                int temp = Myarray1[i];
                Myarray1[i] = Myarray1[Myarray1.Length - 1 - i];
                Myarray1[Myarray1.Length - 1 - i] = temp;

            }


            foreach (int i in Myarray1)
            {
                Console.WriteLine("My Reversed array: " + i);
            }
            Console.ReadKey();

        }

        public void JoinArrayList()
        {
            int[] NewArray = new int[Myarray.Length + Myarray1.Length];

            for (int i = 0; i < Myarray.Length; i++)
            {
                NewArray[i] = Myarray[i];
            }

            for (int j = 0; j < Myarray1.Length; j++)
            {
                NewArray[Myarray.Length + j] = Myarray1[j];
            }

            foreach (int i in NewArray)
            {
                Console.WriteLine(i);
            }
        }

        public void FirstMaxandsecondMax()
        {
            int largestElement;
            int secondlargest;

            secondlargest = Myarray1[0];
            largestElement = Myarray1[0];
            foreach (int i in Myarray1)
            {
                if (largestElement < i)
                    largestElement = i;
            }
            Console.WriteLine("Largest Element:" + largestElement);

            foreach (int i in Myarray1)
            {
                if (secondlargest < i && i != largestElement)
                    secondlargest = i;
            }

            Console.WriteLine("Sec Largest Element:" + secondlargest);
        }

        public void FirstMaxandsecondMax2()
        {
            int largestElement = Int32.MinValue; //24
            int seclargest = Int32.MaxValue; //19

            foreach (int num in Myarray1)
            {
                if (num > largestElement) //19,24,56 case 1: when new number is greater than both old numbers
                {
                    seclargest = largestElement;
                    largestElement = num;

                }
                else if (num > seclargest) ///19,24 , 8 case2 : when new number is b/t largest and second largest
                {
                    seclargest = num;
                }
                else { }
            }

            Console.WriteLine("Largest Element: " + largestElement);
            Console.WriteLine("Second Largest Element: " + seclargest);

        }



    }
}
