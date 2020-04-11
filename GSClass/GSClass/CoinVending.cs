using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class CoinVending
    {
        //Denominations:20,10,5,2,1

        //for Ex: Total:50,32 spent.Bal 18, Denominations 10,5,2,1

        int totalamount;
        int Balance;
        int expense;
        int NumOF20Notes;
        int Numof10Notes;
        int Numof5Notes;
        int Numof2Notes;
        int Numof1;

        public void AskTotalCurrency() // Ask for total currency
        {
            Console.WriteLine("Enter Total Currency");
            totalamount = Convert.ToInt32(Console.ReadLine());

        }

        public void AskforMoneySpent()
        {
            Console.WriteLine("Enter Total Money Spent");
            expense = Convert.ToInt32(Console.ReadLine());

        }

        public void DispenseChange()
        {
            Balance = totalamount - expense;
            Console.WriteLine("Total Balance: " + Balance);

            while (Balance >= 20)//73 //13
            {
                Balance = Balance - 20;
                NumOF20Notes++;

            }

            while (Balance >= 10)
            {
                Balance = Balance - 10;
                Numof10Notes++;
            }

            while (Balance >= 5)
            {
                Balance = Balance - 5;
                Numof5Notes++;
            }

            while (Balance >= 2)
            {
                Balance = Balance - 2;
                Numof2Notes++;
            }

            while (Balance >= 1)
            {
                Balance = Balance - 1;
                Numof1++;
            }

            Console.WriteLine("Numof20Notes is :" + NumOF20Notes);
            Console.WriteLine("Numof10Notes is: " + Numof10Notes);
            Console.WriteLine("Numof5Notes is: " + Numof5Notes);
            Console.WriteLine("Numof2Notes is: " + Numof2Notes);
            Console.WriteLine("Numof1 is:" + Numof1);
            Console.ReadKey();

        }

        public void DispenseChange_GS()
        {
            Balance = totalamount - expense;
            Console.WriteLine("Total Balance: " + Balance);

            if (Balance >= 20)
            {
                NumOF20Notes = Balance / 20;
                Balance = Balance % 20;
            }
            if (Balance >= 10)
            {
                Numof10Notes = Balance / 10;
                Balance = Balance % 10;
            }
            if (Balance >= 5)
            {
                Numof5Notes = Balance / 5;
                Balance = Balance % 5;
            }
            if (Balance >= 2)
            {
                Numof2Notes = Balance / 2;
                Balance = Balance % 2;
            }

            Numof1 = Balance;

            Console.WriteLine("Numof20Notes is :" + NumOF20Notes);
            Console.WriteLine("Numof10Notes is: " + Numof10Notes);
            Console.WriteLine("Numof5Notes is: " + Numof5Notes);
            Console.WriteLine("Numof2Notes is: " + Numof2Notes);
            Console.WriteLine("Numof1 is:" + Numof1);
            Console.ReadKey();

        }

    }
}
