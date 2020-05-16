using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace GSClass
{


    class Program
    {
        static void Main(string[] args)
        {


            SortLLusingMergeSort obj1 = new SortLLusingMergeSort();
            LinkedList objLL = new LinkedList();

            objLL.InsertinEnd("1");
            objLL.InsertinEnd("6");
            objLL.InsertinEnd("8");
            objLL.InsertinEnd("2");
            objLL.InsertinEnd("9");
            objLL.InsertinEnd("3");
            objLL.InsertinEnd("4");


            obj1.MergeSort(objLL.getHeader());//indexes





            Console.ReadKey();


        }

    }




}


