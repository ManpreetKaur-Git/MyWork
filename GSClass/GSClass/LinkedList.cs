using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    public class LinkedList
    {

        MyNode Header;

        public void InsertinFront(string data)
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

        public void InsertinPos(string data, int pos)
        {
            if (Header is null)
            {
                //Header.data = data;
                //Header.next = null;
                InsertinFront(data); // use any function doesn't matter
            }
            else
            {
                if (Header.next == null)  // Case single node
                {
                    if (pos > 1)
                        InsertinEnd(data);
                    else
                        InsertinFront(data); //pos == 1, it will fall here
                }
                else // case multiple nodes
                {
                    countNodes(out int count);
                    if (pos == 1)//
                    {
                        InsertinFront(data);
                    }
                    else if (pos > count) //
                    {
                        InsertinEnd(data);
                    }
                    else
                    {
                        int iter = 1;
                        MyNode refprevNode = Header;
                        MyNode refheader = Header;
                        while (Header.next != null)   //element to be inserter at pos = 3
                        {
                            if (iter < pos) //item = 1 : pos = 3, item = 2 : pos = 3
                            {
                                refprevNode = Header; // node 1, node 2
                                Header = Header.next; // node 2 , node 3
                                iter++; //2,3
                            }
                            else
                                break;
                        }
                        MyNode newNode = new MyNode(); //
                        newNode.data = data;
                        newNode.next = null;
                        refprevNode.next = newNode;
                        newNode.next = Header;
                        Header = refheader;
                    }
                }
            }
        }


        public void InsertinEnd(string data)
        {
            if (Header is null)
            {
                Header = new MyNode();
                Header.data = data;
                Header.next = null;
            }
            else
            {
                MyNode newNode = new MyNode();
                MyNode refHeaderNode = Header;
                //if (Header.next == null)
                //{
                //    Header.next = newNode;
                //}
                //else
                //{
                while (Header.next != null)
                {
                    Header = Header.next;
                }
                newNode.data = data;
                newNode.next = null;
                Header.next = newNode;// This handles the commented code also.Because header.next = null wali cheez tou ismei bhi aygi.ds
                Header = refHeaderNode;
                //}
            }
        }

        public void DeleteinEnd()
        {
            if (Header is null)
            {
                Console.WriteLine("LL is empty");
            }
            else
            {
                MyNode refheaderNode = Header; //just holding the reference
                MyNode refheaderprev = Header;
                while (Header.next != null)
                {

                    refheaderprev = Header; //if 2 bar executred.. to tera header will be on 3rd pos and refheaderprev will be on 2nd pos
                    Header = Header.next;
                }
                //insertion
                refheaderprev.next = null;
                Header = refheaderNode;

            }


        }

        public void DeleteinFront()
        {

            if (Header is null)
            {
                Console.WriteLine("LL is empty");
            }
            else
            {
                MyNode refHeaderNode = Header.next;
                Header.next = null;
                Header = refHeaderNode;
            }

        }
        public void DeleteinPos(int pos)
        {
            if (Header is null)
                Console.WriteLine("LLis empty");
            else if (Header.next == null)
            {
                Header = null;
            }
            else
            {
                int i = 1;
                countNodes(out int count);
                if (pos == 1)
                {

                    Header = Header.next;
                }
                else if (pos == count)
                {
                    MyNode refprevheader = Header;
                    MyNode refheader = Header;
                    while (Header.next != null)
                    {
                        refprevheader = Header;
                        Header = Header.next;

                    }

                    refprevheader.next = null;
                    Header = refheader;
                }
                else if (pos == 2)
                {
                    Header.next = Header.next.next;
                }
                else
                {
                    MyNode refHeader = Header;
                    while (Header.next != null)
                    {
                        if (i < pos - 1) /// to delete 3rd node i need 1 iteration isliye. soch ke dekho :P
                        {
                            Header = Header.next;
                            i++;
                        }
                        else
                            break;
                    }

                    Header.next = Header.next.next;
                    Header = refHeader;

                }
            }
        }


        public void DisplayNode()
        {
            int count = 0;
            if (Header is null)
            {
                Console.Write("Humari LL is empty");
            }
            //else if (Header.next == null)
            //{
            //    Console.Write(Header.data);
            //}
            else
            {
                MyNode RefheaderNode = Header;  /// stored the refernce of header  because we are moving header and we need to bring it back to starting point.
                while (Header.next != null)
                {
                    Console.Write(Header.data + "->");
                    Header = Header.next;
                }
                Console.Write(Header.data); // else if handeled with this. 
                Header = RefheaderNode;
            }

            countNodes(out count);
            Console.WriteLine("Count is:" + count);
        }

        public void countNodes(out int count)
        {
            count = 0;
            if (Header is null)
                count = 0;
            else
            {
                MyNode refHeaderNode = Header;
                while (Header.next != null)
                {
                    count++;
                    Header = Header.next;
                }
                count++;
                Header = refHeaderNode;

            }
        }


        public void reverseLL()
        {

            if (Header is null)
                Console.WriteLine("Kya kru reverse");
            else if (Header.next == null)
            {
                Console.WriteLine("ek ko bhi kya kru :P");
            }
            else
            {
                //MyNode newHeader = new MyNode();

                //newHeader.data = Header.data;
                //newHeader.next = null;

                //Header = Header.next;

                //MyNode tempNode = new MyNode();

                //tempNode.data = Header.data;
                //tempNode.next = newHeader;
                //newHeader = tempNode;

                //Header = Header.next;

                //tempNode = new MyNode();

                //tempNode.data = Header.data;
                //tempNode.next = newHeader;
                //newHeader = tempNode;


                MyNode newHeader = new MyNode();
                newHeader.data = Header.data;
                newHeader.next = null;

                MyNode tempNode;
                //MyNode refheader = newHeader;
                while (Header.next != null)
                {
                    Header = Header.next;
                    tempNode = new MyNode();


                    tempNode.data = Header.data;
                    tempNode.next = newHeader;
                    newHeader = tempNode;


                }

                Header = newHeader;
            }
        }

        public void MidlleNodeSinglePass()
        {
            {
                /*

                MyNode MiddleNode;
                MyNode refHeaderNode = Header;
                // 1st node
                MiddleNode = Header;
                // 2nd node
                Header = Header.next; //this says we are on second node now // middle stays; ( middle 1)

                // 3rd Node
                Header = Header.next;
                MiddleNode = MiddleNode.next; // middle 2
                // 4th Node
                Header = Header.next; // middle stays on 2
                // 5th node
                Header = Header.next;
                MiddleNode = MiddleNode.next; //middle node on 3
                // 6th Node
                Header = Header.next;
                ///MiddleNode stays on 3
                Header = refHeaderNode;
                */
            }

            MyNode MiddleNode; // sabse first time
            MyNode refHeaderNode = Header;

            int NodeNumber = 1;
            MiddleNode = Header;
            while (Header.next != null)// 
            {
                NodeNumber++;
                Header = Header.next;
                if (NodeNumber % 2 == 1)
                {
                    MiddleNode = MiddleNode.next;
                }
            }

            Header = refHeaderNode;
            Console.WriteLine("My middle element is: " + MiddleNode.data);
        }

        public void ThirdElementFromLastSinglePass()
        {

            MyNode ThirdNode;
            MyNode refHeader = Header;
            int NodeNum = 1;
            ThirdNode = Header;
            while (Header.next != null)
            {

                NodeNum++;
                Header = Header.next;
                if (NodeNum > 3)
                    ThirdNode = ThirdNode.next;
            }

            Console.WriteLine("My third element is: " + ThirdNode.data);
            Header = refHeader;
        }

        public void ThirdElementFromLastSinglePassGS()
        {
            MyNode ThirdNode = Header;
            MyNode refHeader = Header;
            Header = Header.next.next;
            while (Header.next != null)
            {
                ThirdNode = ThirdNode.next; //it will always be 2 nodes before header
                Header = Header.next;//it will reach end
            }
            Console.WriteLine("My third element is: " + ThirdNode.data);
            Header = refHeader;
        }

        public bool isLLLoop()
        {
            MyNode Header1 = new MyNode();
            MyNode Node2 = new MyNode();
            MyNode Node3 = new MyNode();
            MyNode Node4 = new MyNode();
            MyNode Node5 = new MyNode();

            MyNode refHeader = Header1;

            Header1.data = "node1";
            Header1.next = Node2;

            Node2.data = "node2";
            Node2.next = Node3;

            Node3.data = "node3";
            Node3.next = Node4;

            Node4.data = "node4";
            Node4.next = Node5;

            Node5.data = "node5";
            Node5.next = Header1;


            while (Header1.next != null)
            {
                Header1 = Header1.next;
                if (Header1 == refHeader)
                {
                    Console.WriteLine(" Loop is there on " + Header1.data);
                    return true;
                }

            }

            return false;
        }

        public void LargestElementinmyLL()
        {
            MyNode refHeader = Header;
            //  int largestElement = Int32.MinValue;
            int largestElement;
            largestElement = Convert.ToInt32(Header.data); //assumption

            while (Header.next != null)
            {

                if (largestElement < Convert.ToInt32(Header.data))
                {
                    largestElement = Convert.ToInt32(Header.data);
                }
                Header = Header.next;
            }

            if (largestElement < Convert.ToInt32(Header.data))
                largestElement = Convert.ToInt32(Header.data);

            Header = refHeader;
            Console.WriteLine("Largest element:" + largestElement);

        }


        public void AlternateElementinmyLL()
        {
            int nodenum = 1;
            MyNode refHeader = Header;
            Console.WriteLine("Alternate elements:");
            while (Header.next != null)
            {
                if (nodenum % 2 == 1)
                    Console.WriteLine(Header.data);
                nodenum++;
                Header = Header.next;
            }

            if (nodenum % 2 == 1)
                Console.WriteLine(Header.data);
            Header = refHeader;


        }



        public void DuplicateElementsinLL(MyNode dupHeader) //if LL is sorted
        {

            MyNode newHeader = new MyNode();
            MyNode tempnode = new MyNode();
            MyNode refheader = newHeader;
            MyNode refheaderdup = dupHeader;

            //1,2,2,3,4,5,6,7,7,8,9,9
            //Duplicate elements :2,7,9
            //LL without dup : 1,2,3,4,5,6,7,8,9

            while (dupHeader.next != null)
            {
                if (Convert.ToInt32(dupHeader.data) == Convert.ToInt32(dupHeader.next.data))
                {
                    Console.WriteLine("dup ELEMENT:" + dupHeader.data);
                }

                dupHeader = dupHeader.next;
            }

            dupHeader = refheaderdup;
            ///********************

            newHeader.data = dupHeader.data;
            newHeader.next = null;
            Console.WriteLine(newHeader.data);

            while (dupHeader.next != null)
            {
                if (newHeader.data != dupHeader.next.data)
                {
                    tempnode = new MyNode();
                    tempnode.data = dupHeader.next.data;
                    tempnode.next = null;
                    newHeader.next = tempnode;
                    newHeader = newHeader.next;
                    Console.WriteLine(newHeader.data);
                }

                dupHeader = dupHeader.next;
            }
        }


        public void duplicateElementinUnsoretedLL(MyNode dupHeader) //if LL is not sorted we use Dictionary
        {
            //LL 7,4,2,6,4,2,7,8,9,4
            MyNode pivot = dupHeader; //7
            MyNode sPoint;//7
            while (pivot.next != null) //7
            {
                sPoint = pivot;
                while (sPoint.next != null)
                {
                    sPoint = sPoint.next; //
                    if (sPoint.data == pivot.data)
                        Console.WriteLine("Duplicate Element: " + pivot.data);
                }
                pivot = pivot.next;
            }
        }




        public void duplicateElementinUnsoretedLL2(MyNode dupHeader)
        {
            MyNode refHeader = dupHeader;
            Dictionary<string, int> objDict = new Dictionary<string, int>();

            while (dupHeader.next != null)
            {
                if (objDict.ContainsKey(dupHeader.data))
                {
                    objDict.TryGetValue(dupHeader.data, out int value);
                    
                    value += 1;
                    objDict[dupHeader.data] = value;
                }
                else
                    objDict.Add(dupHeader.data, 1);
                dupHeader = dupHeader.next;

            }

            if (objDict.ContainsKey(dupHeader.data))
            {
                objDict.TryGetValue(dupHeader.data, out int value);
                value += 1;
                objDict[dupHeader.data] = value;
            }
            else
                objDict.Add(dupHeader.data, 1);

            dupHeader = refHeader;

            foreach (string key in objDict.Keys)
            {
                objDict.TryGetValue(key, out int value);
                if (value > 1)
                    Console.WriteLine("Duplicate Element: " + key);
            }

        }


        public MyNode getHeader()
        {
            return Header;
        }


        public void MergetwoLL(MyNode Header1, MyNode Header2)
        {
            Header = new MyNode();
            MyNode refprevnode1 = Header1;
            MyNode refprevnode2 = Header2;
            MyNode refprevnode = Header;
            MyNode tempNode;


            Header.data = (Convert.ToInt32(Header1.data) + Convert.ToInt32(Header2.data)).ToString();
            Header.next = null;

            while (Header1.next != null || Header2.next != null)
            {
                Header1 = Header1.next;
                Header2 = Header2.next;
                if (Header2 is null)
                    Header2 = new MyNode();
                else if (Header1 is null)
                    Header1 = new MyNode();

                tempNode = new MyNode();
                tempNode.data = (Convert.ToInt32(Header1.data) + Convert.ToInt32(Header2.data)).ToString();
                tempNode.next = null;
                Header.next = tempNode;
                Header = Header.next;
            }

            Header1 = refprevnode1;
            Header2 = refprevnode2;
            Header = refprevnode;
        }


        public void deletefrompos2(int pos)
        {
            countNodes(out int count);
            MyNode refheader = Header;
            MyNode prevHeader = Header;
            int i = 1;

            if (pos > 1 && pos <= count)
            {
                while (Header.next != null)
                {
                    if (i < pos)
                    {
                        prevHeader = Header;
                        Header = Header.next;

                    }
                    else
                        break;
                    i++;
                }

            }

            prevHeader.next = Header.next;
            Header = refheader;
        }


    }

    public class MyNode   // Composite structure for our LL. As the node has two parts data and Node itself. This is the reason we created the object of MYNode class
    {
        public string data;
        public MyNode next;  // object of My node class


    }


    /*
    A linked list is another important data structure after array and String. It actually compliments array and whatever you cannot do with an array, you can do with a linked list.

For example, the array needs contiguous memory to store objects but the linked list doesn't need that. It's difficult to add and remove elements in an array because you need to shift existing elements but that is very easy with a linked list, as you just need to change the pointer to accommodate them.

But, nothing is free in this world. While linked list provides all these functionalities but the cost of that you lose the ability to search elements in constant time with index. Searching and element require traversing linked list, which means examining all nodes, thus cost around O(n) time.

    */
    // MyNode Header1 = new MyNode(); // new header so that our existing header is not affected.
    //MyNode tempnode = new MyNode();
    //MyNode refHeader = Header1;
    //Console.WriteLine(ob.data);


    //Header1.data = 1.ToString();
    //Header1.next = null;

    //tempnode.data = 2.ToString();
    //tempnode.next = null;
    //Header1.next = tempnode;

    //tempnode = new MyNode();
    //tempnode.data = 2.ToString();
    //tempnode.next = null;
    //Header1.next = tempnode;
    //Header1 = Header1.next;


    //tempnode = new MyNode();
    //tempnode.data = 3.ToString();
    //tempnode.next = null;
    //Header1.next = tempnode;
    //Header1 = Header1.next;

    //tempnode = new MyNode();
    //tempnode.data = 4.ToString();
    //tempnode.next = null;
    //Header1.next = tempnode;
    //Header1 = Header1.next;

    //tempnode = new MyNode();
    //tempnode.data = 5.ToString();
    //tempnode.next = null;
    //Header1.next = tempnode;
    //Header1 = Header1.next;

    //tempnode = new MyNode();
    //tempnode.data = 5.ToString();
    //tempnode.next = null;
    //Header1.next = tempnode;
    //Header1 = Header1.next;

    //tempnode = new MyNode();
    //tempnode.data = 7.ToString();
    //tempnode.next = null;
    //Header1.next = tempnode;
    //Header1 = Header1.next;

    //tempnode = new MyNode();
    //tempnode.data = 7.ToString();
    //tempnode.next = null;
    //Header1.next = tempnode;
    //Header1 = Header1.next;

    //Header1 = refHeader;

    ////1,2,2,3,4,5,5,7,7
    ////dup elements :2,5,7
    ////1,2,3,4,5,7,8
    ///
}
