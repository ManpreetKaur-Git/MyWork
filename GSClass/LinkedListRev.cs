using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class LinkedListRev
    {
        MyNode Header;

        public void InsertElementinFront(string data)
        {
            if (Header is null)
            {
                Header = new MyNode();
                Header.data = data;
                Header.next = null;
            }
            else
            {
                MyNode tempNode = new MyNode();
                tempNode.data = data;
                tempNode.next = Header;
                Header = tempNode;
            }
        }

        public void InsertElementinEnd(string data)
        {
            MyNode refHeader = Header;

            if (Header is null)
            {
                Header = new MyNode();
                Header.data = data;
                Header.next = null;

            }
            else
            {
                while (Header.next != null)
                {
                    Header = Header.next;
                }

                MyNode tempNode = new MyNode();
                tempNode.data = data;
                tempNode.next = null;
                Header.next = tempNode;

                Header = refHeader;
            }
        }

        public void DeleteElemetinFront()
        {
            if (Header != null)
            {
                MyNode tempNode = new MyNode();
                tempNode = Header.next;
                Header = tempNode;
            }
        }

        public void DeleteElementinEnd()
        {
            MyNode prevElement = Header;
            MyNode refHeader = Header;

            while (Header.next != null)
            {
                prevElement = Header;
                Header = Header.next;
            }

            prevElement.next = null;
            Header = refHeader;

        }

        public void ReverseLinkeList()
        {
            MyNode newLL = new MyNode();
            MyNode tempNode = new MyNode();

            newLL.data = Header.data;
            newLL.next = null;

            while (Header.next != null)
            {
                Header = Header.next;

                tempNode = new MyNode();
                tempNode.data = Header.data;
                tempNode.next = newLL;
                newLL = tempNode;
            }

            Header = newLL;
        }

        public void DisplayNode()
        {
            MyNode refheader = Header;
            while (Header.next != null)
            {
                Console.Write(Header.data + "->");
                Header = Header.next;
            }

            Console.Write(Header.data);
            Header = refheader;
        }

        public void countNodes(out int count)
        {
            count = 0;
            MyNode refHeader = Header;
            while (Header.next != null)
            {
                count++;
                Header = Header.next;
            }
            count++;
            Header = refHeader;
            Console.WriteLine("Total Number of Nodes:" + count);
        }

        public void InsertNodeatPos(string data, int pos)
        {
            countNodes(out int count);
            if (pos == 1)
            {
                InsertElementinFront(data);
            }
            else if (pos > count)
            {
                InsertElementinEnd(data);
            }
            else if (pos > 1 || pos <= count)
            {
                MyNode prevHeader = Header;
                MyNode refhedaer = Header;
                int iter = 1;

                while (Header.next != null)
                {
                    if (iter <= pos - 1)
                    {
                        prevHeader = Header;
                        Header = Header.next;
                        iter++;
                    }
                    else
                        break;


                }

                MyNode tempNode = new MyNode();
                tempNode.data = data;
                tempNode.next = Header;
                prevHeader.next = tempNode;

                Header = refhedaer;

            }
        }

        public void deleteNodeatPos(string data, int pos)
        {
            countNodes(out int count);
            if (pos == 1)
            {

            }
            else if (pos == count)
            { }
            else if (pos > 1 && pos < count)
            {
                MyNode prevHeader = Header;
                MyNode refheade = Header;
                int iter = 1;
                while (Header.next != null)
                {
                    if (iter < pos)
                    {
                        prevHeader = Header;
                        Header = Header.next;
                        iter++;
                    }
                    else
                        break;

                }

                prevHeader.next = Header.next;
                Header = refheade;
            }
        }


        public void MiddleNodesinglepass()
        {
            int nodeNum = 1;
            MyNode middleNode = Header;
            MyNode refHeaderNode = Header;

            while (Header.next != null)
            {
                nodeNum++;
                Header = Header.next;
                if (nodeNum % 2 == 1)
                {
                    middleNode = middleNode.next;
                }
            }

            Header = refHeaderNode;
            Console.WriteLine("Middle Node: " + middleNode.data);
        }

        public void ThirdElementFromLastSinglePass()
        {
            MyNode refheader = Header;
            MyNode thridelement = Header;
            Header = Header.next.next;

            while (Header.next != null)
            {
                Header = Header.next;
                thridelement = thridelement.next;
            }

            Header = refheader;
            Console.WriteLine(thridelement);
        }

        public bool isLLoop()
        {
            MyNode Header1 = new MyNode();
            MyNode Node2 = new MyNode();
            MyNode Node3 = new MyNode();
            MyNode Node4 = new MyNode();
            MyNode Node5 = new MyNode();


            Header1.data = "Node1";
            Header.next = Node2;

            Node2.data = "Node2";
            Node2.next = Node3;

            Node3.data = "Node3";
            Node3.next = Node4;

            Node4.data = "Node4";
            Node4.next = Node5;

            Node5.data = "Node5";
            Node5.next = Header;

            MyNode refHeader = Header;

            while (Header1.next != null)
            {
                Header1 = Header1.next;
                if (Header.next == refHeader)
                    return true;
            }

            return false;

        }



        public void AddLL2(MyNode Header1, MyNode Header2)
        {
            MyNode newHeader = new MyNode();
            MyNode tempNode;
            MyNode refNode = newHeader;
            newHeader.data = Header1.data + Header2.data;
            while (Header1.next != null || Header2.next != null)
            {

                if (Header1 is null)
                    Header1 = new MyNode();
                else if (Header2 is null)
                    Header2 = new MyNode();

                Header1 = Header1.next;
                Header2 = Header2.next;

                tempNode = new MyNode();
                tempNode.data = Header1.data + Header2.data;
                tempNode.next = null;
                newHeader.next = tempNode;
                newHeader = newHeader.next;
            }

            newHeader = refNode;
        }




    }



    class MyNode1
    {
        string data;
        MyNode next;
    }
}
