using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class SortingLLusingQuickSort
    {
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
