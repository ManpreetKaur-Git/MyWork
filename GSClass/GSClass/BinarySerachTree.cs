using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class BinarySerachTree
    {
        /* Let us create following BST 
              50 
           /     \ 
          30      70 
         /  \    /  \ 
       20   40  60   80 */

        /*  100                               100
           /   \        Insert 40            /    \
         20     500    --------->          20     500 
        /  \                              /  \  
       10   30                           10   30
                                                 \   
                                                 40 
                                                 */
        Node root;
        // 1,2,3,4,5546,6767657567,456456546456546



        public void findMin() /// because extreme left node will always be smallest.As per the BST property.
        {                     // all elements greater than current node will be on right and smaller than the 
                              //current node will be on left.
            Node refrootnode = root;
            while (root.left != null)
            {
                root = root.left;
            }
            Console.WriteLine(root.data);
            root = refrootnode;
        }

        public Node getroot()

        {
            return root;
        }

        public void findMax()
        {
            Node refNode = root;
            while (root.right != null)
            {
                root = root.right;
            }
            Console.WriteLine(root.data);
            root = refNode;
        }

        //Three types of traversal. (DFS -- BFS)
        //Inorder traversal. (parent in centre. LPR)-20,30,40,50,60,70,80
        //Post-order traversal.(Parent baad mei.LRP)-20,40,30,60,80,70,50
        //Pre-order traversal. (parent pehle. PLR)-50,30,20,40,70,60,80
        public void InOrder()
        {
            InorderRec(root);
        }

        public void InorderRec(Node root)
        {
            if (root != null)
            {
                InorderRec(root.left);
                Console.WriteLine(root.data);
                InorderRec(root.right);
            }
        }

        public void PreorderRec(Node root)
        {
            if (root != null)
            {
                Console.WriteLine(root.data);
                PreorderRec(root.left);
                PreorderRec(root.right);
            }
        }


        public void postOrderRec(Node root)
        {
            if (root != null)
            {
                postOrderRec(root.left);
                postOrderRec(root.right);
                Console.WriteLine(root.data);
            }
        }

        public void createTreeManually()
        {
            //root = new Node();
            //Node left = new Node();
            //Node right = new Node();

            //root.data = 1;
            //root.left = null;
            //root.right = null;

            //root.left = left;
            //root.right = right;

            //left.data = 2;
            //left.left = null;
            //left.right = null;

            //right.data = 3;
            //right.left = null;
            //right.right = null;


            root = new Node(50);
            Node l = new Node(30);
            Node r = new Node(70);
            Node ll = new Node(20);
            Node lr = new Node(40);
            Node rl = new Node(60);
            Node rr = new Node(80);

            root.left = l;
            root.right = r;

            l.left = ll;
            l.right = lr;

            r.left = rl;
            r.right = rr;






        }

        public void insertNode(int data)
        {
            if (root is null)
            {
                root = new Node(data);
                //root.data = data; // this work is done in constructor in above statement.
                //root.left = null;
                //root.right = null;
            }
            else
            {
                Node refnode = root;
                while (true)
                {
                    if (data < root.data && (root.left != null))
                    {
                        root = root.left;
                        continue;
                    }
                    if (data > root.data && (root.right != null))
                    {
                        root = root.right;
                        continue;
                    }
                    break;
                }

                if (data < root.data)
                    root.left = new Node(data);
                else
                    root.right = new Node(data);

                root = refnode;
            }
        }

        public bool elementifexists(int num) //element if exists
        {
            while (true)
            {
                if (num == root.data)
                {
                    return true;

                }
                if (num > root.data && root.right != null)
                {
                    root = root.right;
                    continue;
                }
                if (num < root.data && root.left != null)
                {
                    root = root.left;
                    continue;
                }
                break;
            }

            return false;
        }
    }


    class Node
    {
        public int data;
        public Node left;
        public Node right;

        public Node(int data)
        {
            this.data = data;
            this.left = null;
            this.right = null;
        }

    }
}
