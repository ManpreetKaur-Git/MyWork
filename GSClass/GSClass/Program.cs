using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace GSClass
{
    class Program
    {



        static void Main(string[] args)
        {

            //BinarySearch obj = new BinarySearch();

            //Console.WriteLine(obj.ifelementExists(8));


            Sorting objPQ = new Sorting();
            //int x = 10;
            //objPQ.test(x);
            //Console.WriteLine(x);


            /// Important: Array's are passed as an object by ref. Therefore, any change in  myArray(inside bubble sort function) also changes the actual myArray.
            /// Changes done to myArray in a function modifies  the original myArray. 
            int[] myArray = { 5, 7, 7, 2, 4, 1 };
            ////int myvar;
            objPQ.selectionSort(); // o/p 
            //Console.WriteLine();
            //foreach (int a in myArray)
            //{
            //    Console.Write(a + "<--");
            //}





            Console.ReadKey();


        }

    }




}


