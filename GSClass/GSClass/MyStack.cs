using System;


namespace GSClass
{
    public class MyStack
    {
        int size; //Shelf ki limit hai
        string[] shelf; //humari shelf hai jispr books rakhenge
        int loc;


        //only implement LIFO at the moment


        public MyStack(int size) //ye preet ki number of books hain
        {
            this.size = size; //left wala size Mom ne new shelf jo holke dia hai wo hai
            this.shelf = new string[size];
            loc = -1; //shelf khali hai PReet.. ja jo marji kar
        }

        public void put(string preetKiBook) //books rakhne ka code
        {
            if (loc == size - 1) //fullhai ki nahi
            {
                Console.WriteLine("jaa bahi shelf full hai");
            }
            else
            {
                loc++; //1, 2, 3,4
                shelf[loc] = preetKiBook;
                Console.WriteLine("Teri " + preetKiBook + " rakh di hai");
            }

        }

        public void Insertatloc(string preetKinewBook, int insertloc) //books rakhne ka code
        {
            insertloc = insertloc - 1; //// preet ka actual no.
            if (insertloc >= size - 1) //fullhai ki nahi
            {
                Console.WriteLine("jaa bahi shelf full hai");
            }
            else
            {
                //if (insertloc >= 0 && insertloc <= size - 2)
                //{
                for (int i = loc;i>= insertloc;i--)
                {
                    shelf[i+1] = shelf[i];
                    //4 <- 3
                    //3 <- 2
                    //2 <- 1
                }

                shelf[insertloc] = preetKinewBook;
                Console.WriteLine("Teri " + preetKinewBook + " insert ho gae hai");
                loc++;

                //}   

            }

        }

        public void retrieve()
        {
            if (loc == -1)
            {
                Console.WriteLine("Preet shelf khali hai.Jao. ");
            }
            else
            {
                Console.WriteLine("Ye le apni book " + shelf[loc]); //upar upar yehi padi hai
                shelf[loc] = string.Empty; //jagah khali kardi;
                loc--; //current book ki location hai
            }
        }

        public void diplay()
        {
            //for (int i = 0; i <= loc; i++)
            //{
            //    Console.WriteLine("Preet ki Book " + (i + 1) + ":" + shelf[i]);
            //}

            for (int i = loc; i > -1; i--)
            {
                Console.WriteLine("Preet ki Book " + (i + 1) + ":" + shelf[i]);
            }
        }


    }
}