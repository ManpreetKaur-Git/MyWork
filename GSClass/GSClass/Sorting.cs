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



        public void bubblesort(int[] myArray) //O(nsquare) //play with data
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


        public void selectionSort() //play with indexes
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


        public void factorial(int num)
        {
            int fact = 1;
            for (int i = 1; i <= num; i++)
            {
                fact = fact * i;
            }

            Console.WriteLine("Factorial of " + num + " is " + fact);
        }

        public int factorialviaRecursion(int num)
        {
            //10! = 10 * 9!
            //9! = 9 * 8!
            //.........1!

            //Termination or point where it should return should be clear in our minds.ear in our min

            int result = 1;

            if (num == 1) //end recursion
                return 1;

            result = num * factorialviaRecursion(num - 1); //generic recursive solution
            return result;
            //res = 5 * 4 * 3* 2 * 1
            //                                  
            //                                          
        }


        public void mergeSort(int[] arr) //7
        {
            if (arr.Length == 1)
                return;
            else
            {
                int[] leftArray = new int[arr.Length / 2];
                for (int i = 0; i < leftArray.Length; i++)
                {
                    leftArray[i] = arr[i];
                }

                int[] rightArray = new int[arr.Length - leftArray.Length];
                for (int j = 0; j < rightArray.Length; j++)
                {
                    rightArray[j] = arr[leftArray.Length + j];
                }

                mergeSort(leftArray);
                mergeSort(rightArray);
                merge(arr, leftArray, rightArray);
            }


        }

        public void merge(int[] arr, int[] leftArray, int[] rightArray)
        {
            //int[] leftArray i
            //int[] rightArray j
            // int[] arr  k
            int i = 0;
            int j = 0;
            int k = 0;
            while (i < leftArray.Length && j < rightArray.Length)
            {
                if (leftArray[i] <= rightArray[j])
                {
                    arr[k] = leftArray[i];
                    k++;
                    i++;
                }
                else
                {
                    arr[k] = rightArray[j];
                    k++;
                    j++;
                }

            }

            while (i < leftArray.Length)
            {
                arr[k] = leftArray[i];
                k++;
                i++;
            }

            while (j < rightArray.Length)
            {
                arr[k] = rightArray[j];
                j++;
                k++;
            }

        }

        public void QuickSort(int[] arr, int low, int high)
        {
            //partition around pivot
            //call q.s on left array
            //call q.s on right array
            if (low < high) // jab tak array has two elements
            {
                //int partition = partiton(arr, 0, arr.Length - 1); //this partition is the index of correctly sorte ONE Element
                int p = partition(arr, low, high); //this partition is the index of correctly sorte ONE Element
                QuickSort(arr, low, p - 1);//left call
                QuickSort(arr, p + 1, high);
            }
        }

        public int partition(int[] arr, int low, int high)
        {
            int pos = low;  // 0 in case of first partion
            int pivot = arr[high];  ////arr[arr.Length - 1]; //ye high hai

            //for (int i = 0; i < arr.Length - 1; i++)
            for (int i = low; i < high; i++)
            {
                if (arr[i] < pivot)
                {
                    int temp1 = arr[pos];
                    arr[pos] = arr[i];
                    arr[i] = temp1;
                    pos++;
                }
                //else if (arr[i] > pivot)
                //{
                //    //do nothing pos stays
                //}
            }

            int temp = arr[pos];
            arr[pos] = pivot;
            arr[high] = temp;// pivot ke index mei temp value daldo. 

            return pos;//index of our sorted element
        }

        public void HeapSort(int[] arr) /// nlogn
        {
            // tep 1-- build Max Heap
            //2,1,0
            for (int i = arr.Length / 2 - 1; i >= 0; i--) // i says max heap mei kitne trees honge,for 6 elements,2 i.e. 0,1,2
            {                                           // where in,0 1 2 are the indexes of parent nodes of tree.and sabse pehle 
                                                        //hum 2 se heapifyr krnge.kyunki 2 is the sabse lowest wala sub tree.
                heapify(arr, arr.Length, i);
            }
            //Swap + recursively build Max Heap
            // swap a[0], a[5] + call heapify(arr,5,0)
            for (int i = arr.Length - 1; i > 0; i--)
            {
                                int temp = arr[i];
                arr[i] = arr[0];
                arr[0] = temp;
                heapify(arr, i, 0);/// here i is total no. of elements jisme humne manipulation krni haiq
                                   /// and 0 because 0 se heapify honana shuru hyrha hai
            }
        }

        public void heapify(int[] arr, int n, int i) // i is the index of root node. from where the heapify should start
        {
            int parentindex = i;
            int leftindex = 2 * i + 1;
            int rightindex = 2 * i + 2;

            if ((leftindex < n) && arr[leftindex] > arr[parentindex]) // leftindex is less than total no. of elements.matlab out of bound array
            {
                parentindex = leftindex;
            }
            if ((rightindex < n) && arr[rightindex] > arr[parentindex])
            {
                parentindex = rightindex;

            }

            if (parentindex != i)
            {
                int temp = arr[parentindex];
                arr[parentindex] = arr[i];
                arr[i] = temp;
                heapify(arr, n, parentindex);
            }
        }


        


    }


}
