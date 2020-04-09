using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class Queue
    {
        int front;
        int rear;
        string[] queue;
        int size;

        public Queue(int size)
        {
            this.size = size;
            this.queue = new string[size];
            front = 0;
            rear = -1;
        }

        public void enqueue(string person)
        {
            if (rear == size - 1)
            {
                Console.WriteLine("Queue is full." + person + " can't be inserted.");
            }
            else
            {

                rear = rear + 1;
                queue[rear] = person;
                Console.WriteLine(person + "is inserted.");
            }
        }

        public void dequeue()
        {
            if (rear == -1)
            {
                Console.WriteLine("Our Queue is empty. What to dequeue now:P");
            }
            else
            {
                Console.WriteLine(queue[0] + "is served.");
                for (int i = 0; i < rear; i++)// if reaer is 3 it requires 2 iterations.
                {
                    queue[i] = queue[i + 1];

                    {
                        /* queue[0] = queue[1];
                         * queue[1] = queue[2];
                         *-- queue[2] = queue[3];
                         * --queue[3] = queue[4];
                         * */
                    }
                }
                queue[rear] = string.Empty;
                rear--;

            }
        }

        public void display()
        {
            Console.Write("COUNTER : ");
            //foreach (string person in queue)
            //{
            //    Console.Write(person + " <-- ");
            //}

            for (int i = 0; i <= rear; i++)
            {
                Console.Write(queue[i] + " <-- ");
            }
        }

        public void insertatPos(string person, int pos)
        {
            int insertloc;
            if (rear == size-1)
            {
                Console.WriteLine("Queue is full.Tum nahi asakte.");
            }
            else
            {
                insertloc = pos - 1;

                for (int i = rear; i >= insertloc; i--)
                {
                    queue[i + 1] = queue[i];
                }
                rear++;
                //queue[4] = queue[3];
                //queue[3] = queue[2];
                //queue[2] = "new";

                queue[insertloc] = person;

                Console.WriteLine(person + "is inserted at location: " + pos);
            }

        }
    }
}
