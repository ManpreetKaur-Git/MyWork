using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class Sorting
    {

        //        - bubble Sort
        //- Selection
        //- insertion
        //- tree sort, bucket sort

        //O(n.sq) = 256

        //- Merge sort
        //- Quick sort
        //- Heap sort

        //O(nlogn) = 16 * 4 = 64 //Hume nLogn wali aani chaiye

        public void test(int c)
        {
            c = c + 10;
            Console.WriteLine(c);

        }


        //Important Concept:
        //Sorting objPQ = new Sorting();
        //int x = 10;
        //objPQ.test(x);
        //Console.WriteLine(x);


        /// Important: Array's are passed as an object by ref. Therefore, any change in  myArray(inside bubble sort function) also changes the actual myArray.
        /// Changes done to myArray in a function modifies  the original myArray. 
        //int[] myArray = { 5, 7, 7, 2, 4, 1 };
        ////int myvar;
        //objPQ.bubblesort(myArray); // o/p 
        //Console.WriteLine();
        //foreach (int a in myArray)
        //{
        //    Console.Write(a + "<--");
        //}



        public void bubblesort(int[] myArray) //O(nsquare)
        {
            //int[] myArray = { 5, 7, 7, 2, 4, 1 };
            int temp;
            int[] myArray2 = myArray;
            //Console.WriteLine("my old Array:" + myArray);
            for (int i = 0; i < myArray2.Length - 1; i++) //pases 6elements require 5 passes. 
            {

                for (int j = 0; j < myArray2.Length - 1; j++) // swaping
                {
                    temp = 0;
                    if (myArray2[j] >= myArray2[j + 1])
                    {
                        temp = myArray2[j];
                        myArray2[j] = myArray2[j + 1];
                        myArray2[j + 1] = temp;
                    }

                    //0-1
                    //1-2
                    //2-3
                    //3-4
                    //4-5
                }
            }
            foreach (int wi in myArray2)
            {
                Console.Write(wi + "<--");
            }
        }


        public void selectionSort()
        {
            int[] myArray = { 5, 7, 3, 2, 4, 1 };
            int minindex;
            int temp;
            for (int i = 0; i < myArray.Length - 1; i++)
            {
                minindex = i;
                temp = 0;
                for (int j = i + 1; j < myArray.Length; j++)
                {
                    if (myArray[j] < myArray[minindex])
                    {
                        minindex = j;
                    }
                }

                temp = myArray[i];
                myArray[i] = myArray[minindex];
                myArray[minindex] = temp;
            }

            foreach (int wi in myArray)
            {
                Console.Write(wi + "<--");
            }
        }


        public void mergeSort()
        {

        }
    }
}
