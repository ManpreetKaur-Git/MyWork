using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class SortLLusingMergeSort
    {

        public void MergeSort(MyNode Header)
        {
            if (Header.next == null)
                return;
            else
            {
                MyNode leftLL = new MyNode();
                MyNode refleftLL = leftLL;

                MyNode rightLL = new MyNode();
                MyNode refrighLL = rightLL;

                getCount(out int count, Header);
                int leftCount = count / 2;
                int rightCount = count - count / 2;
                MyNode refheader = Header;

                leftLL.data = Header.data;
                leftLL.next = null;
                for (int i = 1; i < leftCount; i++) //1,2,3 ,4
                {
                    Header = Header.next;
                    MyNode tempNode = new MyNode();
                    tempNode.data = Header.data;
                    tempNode.next = null;
                    leftLL.next = tempNode;
                    leftLL = leftLL.next;
                }
                leftLL = refleftLL;

                Header = Header.next;
                rightLL.data = Header.data;
                rightLL.next = null;

                for (int j = 1; j < rightCount; j++)
                {
                    Header = Header.next;
                    MyNode tempNode = new MyNode();
                    tempNode.data = Header.data;
                    tempNode.next = null;
                    rightLL.next = tempNode;
                    rightLL = rightLL.next;
                }
                rightLL = refrighLL;

                Header = refheader;

                MergeSort(leftLL);
                MergeSort(rightLL);
                Merge(Header, leftLL, rightLL);

            }


        }


        public void Merge(MyNode Header, MyNode leftLL, MyNode rightLL)
        {



        }





        public void getCount(out int count, MyNode Header)
        {
            count = 1;
            MyNode refHeader = Header;
            while (Header.next != null)
            {
                Header = Header.next;
                count++;
            }

            Header = refHeader;
        }
    }



}
