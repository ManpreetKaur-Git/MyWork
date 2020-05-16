using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class RevClass
    {

        public void quickSort(int[] myarr, int low, int high)
        {
            if (low < high)
            {
                partition(myarr, low, high, out int partitionIndex);
                quickSort(myarr, low, partitionIndex - 1);
                quickSort(myarr, partitionIndex + 1, high);
            }


        }


        public void partition(int[] myarr, int low, int high, out int pos)
        {
            pos = low;
            int pivot = myarr[high];

            for (int i = low; i < high; i++)
            {
                if (myarr[i] < pivot)
                {
                    int temp = myarr[pos];
                    myarr[pos] = myarr[i];
                    myarr[i] = temp;
                    pos++;
                }
            }

            int temp1 = myarr[pos]; ;
            myarr[pos] = myarr[high];
            myarr[high] = temp1;

        }


        public void displayArr(int[] myarr)
        {
            foreach (int i in myarr)
            {
                Console.WriteLine(i);
            }
        }

        public void refvar(out int a)
        {
            a = 2;

        }

        public void bubbleSort(int[] myArr)
        {
            for (int i = 1; i <= myArr.Length - 1; i++)
            {
                for (int j = 0; j < myArr.Length - 1; j++)
                {
                    if (myArr[j + 1] < myArr[j])
                    {
                        int temp = myArr[j];
                        myArr[j] = myArr[j + 1];
                        myArr[j + 1] = temp;
                    }
                }
            }
        }

        public void selectionSort(int[] myArr)
        {
            for (int i = 0; i < myArr.Length - 1; i++)
            {
                int minindex = i;
                for (int j = i + 1; j < myArr.Length; j++)
                {
                    if (myArr[minindex] > myArr[j])
                    {
                        minindex = j;
                    }
                }
                int temp = myArr[i];

                myArr[i] = myArr[minindex];
                myArr[minindex] = temp;
            }

        }

        public void MergeSort(int[] myArr)
        {
            if (myArr.Length == 1)
                return;
            else
            {
                int[] leftArray = new int[myArr.Length / 2];
                int[] rightArray = new int[myArr.Length - leftArray.Length];

                for (int i = 0; i < leftArray.Length; i++)
                {
                    leftArray[i] = myArr[i];
                }
                for (int j = 0; j < rightArray.Length; j++)
                {
                    rightArray[j] = myArr[leftArray.Length + j];
                }

                MergeSort(leftArray);
                MergeSort(rightArray);
                Merge(myArr, leftArray, rightArray);

            }
        }

        public void Merge(int[] myArr, int[] leftArray, int[] rightArray)
        {

            int i = 0;
            int j = 0;
            int k = 0;

            while (i < leftArray.Length && j < rightArray.Length)
            {
                if (leftArray[i] <= rightArray[j])
                {
                    myArr[k] = leftArray[i];
                    i++;
                    k++;
                }
                else if (leftArray[i] >= rightArray[j])
                {
                    myArr[k] = rightArray[j];
                    j++;
                    k++;
                }
            }

            while (i < leftArray.Length)
            {
                myArr[k] = leftArray[i];
                k++;
                i++;
            }


            while (j < rightArray.Length)
            {
                myArr[k] = rightArray[j];
                k++;
                j++;
            }

        }


        public void heapSort(int[] myArr)
        {
            for (int i = myArr.Length / 2 - 1; i >= 0; i--)
            {
                heapify(myArr, i, myArr.Length);
            }

            for (int j = myArr.Length - 1; j > 0; j--)
            {
                int temp = myArr[j];
                myArr[j] = myArr[0];
                myArr[0] = temp;

                heapify(myArr, 0, j);
            }

        }


        public void heapify(int[] myArr, int i, int n)
        {
            int leftIndex = i * 2 + 1;
            int rightIndex = i * 2 + 2;
            int largestnodeIndex = i;
            if (leftIndex < n && myArr[leftIndex] > myArr[largestnodeIndex])
            {
                largestnodeIndex = leftIndex;

            }
            if (rightIndex < n && myArr[rightIndex] > myArr[largestnodeIndex])
            {
                largestnodeIndex = rightIndex;
            }

            if (largestnodeIndex != i)
            {
                int temp = myArr[i];
                myArr[i] = myArr[largestnodeIndex];
                myArr[largestnodeIndex] = temp;

                heapify(myArr, largestnodeIndex, n);
            }

        }


        //public void LLSortQuickSort(MyNode Header, int Low, int High)
        //{
        //    LinkedList obj = new LinkedList();
        //    obj.countNodes(out int count);

        //    High = count - 1;
        //    Low = 0;

        //    if (Low < High)
        //    {
        //        int partionIndex = QuickSort(Header, Low, High);
        //        QuickSort(Header, Low, partionIndex - 1);
        //        QuickSort(Header, partionIndex + 1, High);
        //    }

        //}




        public int QuickSort1(MyNode Header, int low, int high)
        {
            LinkedList obj = new LinkedList();
            obj.countNodes(out int count);

            MyNode refHeader = Header;
            MyNode pivot = Header;
            MyNode prevHeader = Header;

            while (Header.next != null)
            {
                pivot = pivot.next;

            }

            int pos = 0;
            for (int i = low; i < high; i++)
            {
                if (Convert.ToInt32(Header.data) < Convert.ToInt32(pivot.data))
                {
                    prevHeader.data = Header.data;
                    prevHeader = prevHeader.next;
                    pos++;
                }

                Header = Header.next;
            }

            string data = prevHeader.data;
            prevHeader.data = pivot.data;
            pivot.data = data;

            Header = refHeader;
            return pos;

        }

        public int partition(MyNode Header, int Low, int High)
        {
            int pos = Low;
            int pivot = getElement(Header, High);
            for (int i = Low; i < High; i++)
            {
                if (getElement(Header, i) < pivot)
                {
                    int temp = getElement(Header, pos);
                    setElement(Header, pos, getElement(Header, i));
                    setElement(Header, i, temp);
                    pos++;
                }

            }

            int temp1 = getElement(Header, pos);
            setElement(Header, pos, getElement(Header, High));
            setElement(Header, High, temp1);
            return pos;

        }

        public int getElement(MyNode Header, int index) //3
        {
            MyNode refHeader = Header; //3,8,9,10,12

            for (int i = 0; i < index; i++)
            {
                Header = Header.next;
            }

            int data = Convert.ToInt32(Header.data);
            Header = refHeader;
            return data;
        }

        public void setElement(MyNode Header, int index, int data)
        {
            MyNode refHeader = Header; //3,8,9,10,12

            for (int i = 0; i < index; i++)
            {
                Header = Header.next;
            }

            Header.data = data.ToString();
            Header = refHeader;
        }



        public void Quicksort(MyNode Header, int low, int high)
        {
            if (low < high)
            {

                int partitionindex = partition(Header, low, high);
                Quicksort(Header, low, partitionindex - 1);
                Quicksort(Header, partitionindex + 1, high);


                //To execute 

                //LinkedList objLL = new LinkedList();

                //objLL.InsertinEnd("1");
                //objLL.InsertinEnd("6");
                //objLL.InsertinEnd("8");
                //objLL.InsertinEnd("2");
                //objLL.InsertinEnd("9");
                //objLL.InsertinEnd("3");
                //objLL.InsertinEnd("4");


                //obj.Quicksort(objLL.getHeader(), 0, 6);//indexes

            }
        }






    }
}
