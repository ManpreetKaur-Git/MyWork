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
        int[] Myarray1 = { 1, 2, 3, 4, 5, 7, 8, 9, 10 };

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

        public void findMin()
        {
            int[] Myarray1 = { 33, 4, 16, 34, 25, 36, 17, 38, 21, 8 };
            int MinElement = Int32.MaxValue;
            int maxElement = Int32.MinValue;

            foreach (int i in Myarray1)
            {
                if (i < MinElement)
                    MinElement = i;
                if (i > maxElement)
                    maxElement = i;
            }

            Console.WriteLine("Min Element: " + MinElement);
            Console.WriteLine("Max Element: " + maxElement);

        }

        public void findcommonelements()
        {
            int[] Myarray = { 1, 2, 3, 4 };
            int[] Myarray1 = { 3, 7, 8, 9, 2 };

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
            int[] Myarray = { 33, 4, 16, 34, 25, 36, 17, 38, 21, 8 };
            int[] Myarray1 = { 1, 2, 3, 4, 5, 7, 8, 9, 10 };

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
            int[] Myarray = { 33, 4, 16, 34, 25, 36, 17, 38, 21, 8 };
            int[] Myarray1 = { 1, 2, 3, 4, 5, 7, 8, 9, 10 };

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
            int seclargest = Int32.MinValue; //19

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

        public void findMissingNum1to10()
        {
            // Logic Find sum of all the numbers from 1 to 10
            //Find sum of all the numbers in array. Sub Total sum - SumofNUMinarray= missing element.

            int sumofAllelements;
            int sumofArrayElements = 0;
            int n; //if 1to 10;
            n = 10;
            int missingelemnts = 0;

            sumofAllelements = n * (n + 1) / 2;

            foreach (int i in Myarray1)
            {
                sumofArrayElements = sumofArrayElements + i;
            }

            missingelemnts = sumofAllelements - sumofArrayElements;

            Console.WriteLine("Missing Element:" + missingelemnts);
        }

        public void ExactlyoneDuplicateElement1to10()
        {
            int duplicateElement;
            int[] Myarray1 = { 1, 5, 6, 8, 5 };

            for (int j = 0; j < Myarray1.Length - 1; j++)
            {
                duplicateElement = Myarray1[j];

                for (int i = j + 1; i < Myarray1.Length; i++)
                {
                    if (duplicateElement == Myarray1[i])
                    {
                        Console.WriteLine("Duplicate Element: " + duplicateElement);
                        break;
                    }


                    //return duplicateElement;
                }
            }


            //return duplicateElement;
        }

        public void SetofElementsWhoseSumismax()
        {
            int[] myArray1 = { 4, 8, 9, 3, 7, 2 };

            int largetsElement = Int32.MinValue;
            int secLargestElement = Int32.MinValue;
            int num;

            foreach (int i in myArray1)
            {
                if (i > largetsElement)
                {
                    num = largetsElement;
                    largetsElement = i;
                    secLargestElement = num;
                }
                else if (i > secLargestElement)
                {
                    secLargestElement = i;
                }
            }

            Console.WriteLine("Largest Element: " + largetsElement);
            Console.WriteLine("Second Largest Element: " + secLargestElement);

        }

        public void pairWhosesumislarest()
        {
            //[4,8]
            //[4,
            int[] myArray1 = { 4, 8, 9, 3, 7, 2 };
            int element;
            int paire1 = 0;
            int paire2 = 0;
            int largestelement = Int32.MinValue;

            for (int j = 0; j < myArray1.Length - 1; j++)
            {
                element = myArray1[j];

                for (int i = j + 1; i < myArray1.Length; i++)
                {
                    Console.WriteLine("[" + element + "," + myArray1[i] + "]");

                    if (largestelement < element + myArray1[i])
                    {
                        largestelement = element + myArray1[i];
                        paire1 = element;
                        paire2 = myArray1[i];
                    }
                }
            }
            Console.WriteLine("Largest Element pair is: [" + paire1 + "," + paire2 + "]");
        }

        public void printAllSubsets()
        {
            /*
             * Input: 
S = {a, b, c, d}
Output:
{}, {a} , {b}, {c}, {d}, {a,b}, {a,c},
{a,d}, {b,c}, {b,d}, {c,d}, {a,b,c}, 
{a,b,d}, {a,c,d}, {b,c,d}, {a,b,c,d}
             */
        }

        public void findAllDuplicates()
        {
            Dictionary<int, int> myDict = new Dictionary<int, int>();
            int[] myArray1 = { 4, 8, 9, 3, 8, 4, 8 };

            for (int i = 0; i < myArray1.Length; i++)
            {
                if (myDict.ContainsKey(myArray1[i]))
                {

                    myDict.TryGetValue(myArray1[i], out int value);
                    value += 1;
                    /// myDict.Add(myArray1[i], value);
                    myDict[myArray1[i]] = value;
                }
                else
                    myDict.Add(myArray1[i], 1);

            }

            foreach (int key in myDict.Keys)
            {
                myDict.TryGetValue(key, out int value);
                if (value > 1)
                {
                    Console.WriteLine("Key:" + key + ",frequency:" + value);
                }

            }

        }

        public void WhichElementisnotpresentinother()   //1,2,3,4,5 and 2,3,1,0,5 find which number is not present in the second array.
        {
            int[] myArray1 = { 1, 2, 3, 4, 5 };
            int[] myArray2 = { 2, 3, 1, 0, 5 };

            int flag = 0;
            foreach (int i in myArray1)
            {
                flag = 0;
                foreach (int j in myArray2)
                {

                    if (i == j)
                    {
                        flag = 1;
                        break;
                    }

                }
                if (flag == 0)
                    Console.WriteLine("Element Not Present: " + i);
            }


        }

        public void mergeTwoSortedArrays()
        {
            int[] array1 = { 1, 2, 3, 6, 7, 10 }; //i =6
            int[] array2 = { 4, 5, 8, 9, 13, 15, 17, 18 }; //j

            int[] array3 = new int[array1.Length + array2.Length];  //k
            int i = 0;
            int j = 0;
            int k = 0;

            //1 - compare 2 pointers until one array is finisshed
            //2  if rray1 is finshed, copy rest of the 2nd array
            //3 if array2 is finished copy rest of the first array

            while (i < array1.Length && j < array2.Length)
            {
                if (array1[i] < array2[j])
                {
                    array3[k] = array1[i];
                    i++;
                    k++;
                }
                else
                {
                    array3[k] = array2[j];
                    j++;
                    k++;
                }
            }

            while (i < array1.Length) //i=6 length = 6
            {
                array3[k] = array1[i];
                k++;
                i++;
            }

            while (j < array2.Length)
            {
                array3[k] = array2[j];
                k++;
                j++;
            }

            foreach (int m in array3)
            {
                Console.WriteLine(m);
            }

        }


        public void EnterValuefrouser()
        {
            string[] myInputarray = new string[20];
            for (int i = 1; i <= 20; i++)
            {
                Console.WriteLine("Enter Value" + i + " :");
                myInputarray[i - 1] = Console.ReadLine();
                while (myInputarray[i - 1] == "" && string.IsNullOrEmpty(myInputarray[i - 1]) == true)
                {
                    Console.WriteLine("Please enter valid value.");
                    myInputarray[i - 1] = Console.ReadLine();
                }
                // myInputarray[i - 1] = myInputarray[i - 1].Equals(null) ? "0" : myInputarray[i - 1];
            }
            foreach (string s in myInputarray)
            {
                Console.WriteLine(s);
            }

        }

        public void rotateArray(int[] myArr1, int n)
        {
            //int[] myArr = { 1,2,3,4,5,6,7};
            // n = 8;
            n = n % myArr1.Length;


            for (int j = 1; j <= n; j++)
            {
                if (true)
                {
                    int temp = 0;

                    int i = myArr1.Length - 1;
                    temp = myArr1[0];
                    myArr1[0] = myArr1[i];
                    for (; i >= 2; i--)
                    {
                        myArr1[i] = myArr1[i - 1];
                    }
                    myArr1[i] = temp;

                } //it is shifting 1 place

            }
            foreach (int i in myArr1)
            {
                Console.WriteLine(i);
            }



        }

        public void rotateArray2(int[] myArr1, int n)
        {
            int[] myArr2 = new int[myArr1.Length];
            //int[] myArr = { 1,2,3,4,5,6,7};
            n = n % myArr1.Length;
            //myArr1[0]-- myArr2[2];
            //myArr1[1]-- myArr2[3];
            //myArr1[2]-- myArr2[4];
            //myArr1[3]-- myArr2[5];
            //myArr1[4]-- myArr2[6];
            //myArr1[5]-- myArr2[0];
            //myArr1[6]-- myArr2[1];
            for (int i = 0; i <= myArr2.Length - 1; i++)
            {
                myArr2[(i + n) % myArr2.Length] = myArr1[i];
            }

            for (int i = 0; i < myArr1.Length; i++)
            {
                myArr1[i] = myArr2[i];
            }

            foreach (int i in myArr1)
            {
                Console.WriteLine(i);
            }



        }

        public int largestnumformed(int[] myArr)
        {
            //Write a program to form the largest number from a given array
            //ex : {64,5,1,2,,8} = 865412

            int num = 0;

            Dictionary<int, int> mydict = new Dictionary<int, int>();

            for (int j = 1; j <= myArr.Length; j++)
            {
                int largestnum = Int32.MinValue;
                for (int i = 0; i < myArr.Length; i++)
                {
                    if (largestnum < myArr[i] && !mydict.ContainsKey(myArr[i]))
                    {
                        largestnum = myArr[i];
                    }

                }

                mydict.Add(largestnum, j);
            }


            foreach (int key in mydict.Keys)
            {
                num = num * 10 + key;
            }





            return num;
        }

        public void segregateArray(int[] myarr)
        {
            //{0,0,1,0,1,0,1,1,0}= 000001111
            int[] newArray = new int[myarr.Length];
            int j = 0;
            for (int i = 0; i < myarr.Length; i++)
            {
                if (myarr[i] != 1)
                {
                    newArray[j] = myarr[i];
                    j++;
                }

            }

            for (int i = 0; i < myarr.Length; i++)
            {
                if (myarr[i] != 0)
                {
                    newArray[j] = myarr[i];
                    j++;
                }
            }

            foreach(int i in newArray)
            {
                Console.WriteLine(i);
            }
            
        }

        ///********************** 2D-Array********************************** *\

        public void print2DArray()
        {
            int[,] my2DArray = new int[3, 5]; //row,column. It also means we have  3 arrays of lenght 5 each.
            int[,] my2DArray1 = { { 1, 2, 3, 4, 5 }, { 21, 22, 23, 24, 25 }, { 31, 32, 33, 34, 35 } };

            for (int j = 0; j < 3; j++)
            {
                Console.Write("{");
                for (int i = 0; i < 5; i++)
                {
                    Console.Write(my2DArray1[j, i] + ",");
                }
                Console.Write("}");
                Console.WriteLine();
            }
        }

        public void sumOfEachRow()
        {
            int[,] my2DArray1 = { { 1, 2, 3, 4, 5 }, { 21, 22, 23, 24, 25 }, { 31, 32, 33, 34, 35 } };
            int sumofrow = 0;

            for (int i = 0; i < my2DArray1.Length; i++) //print rows wise
            {
                sumofrow = 0;
                Console.WriteLine();
                for (int j = 0; j < 5; j++)
                {
                    Console.Write(my2DArray1[i, j] + ",");
                    sumofrow = my2DArray1[i, j] + sumofrow;

                }
                Console.Write(". Sum of row: " + sumofrow);
            }

            Console.WriteLine("Columns ka whatever");

            //00 01 02 03 04
            //10 11 12 13 14
            //20 21 22 23 24 

            int sumofCOlumns;
            for (int j = 0; j < 5; j++)  //column wise
            {
                sumofCOlumns = 0;
                Console.WriteLine();
                for (int i = 0; i < 3; i++)
                {
                    Console.WriteLine(my2DArray1[i, j] + ",");
                    sumofCOlumns = sumofCOlumns + my2DArray1[i, j];
                }
                Console.Write(". Sum of columns: " + sumofCOlumns);
            }
        }
    }
}
