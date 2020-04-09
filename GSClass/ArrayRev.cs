using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class ArrayRev
    {

        public void duplicateElementinArray()
        {
            int[] testArray = { 21, 22, 41, 8, 3, 21, 8 };


            for (int i = 0; i < testArray.Length - 1; i++)
            {
                for (int j = i + 1; j < testArray.Length; j++)
                {
                    if (testArray[i] == testArray[j])
                    {
                        Console.WriteLine("Duplicate Element: " + testArray[i]);
                        break;
                    }

                }

                //0-1,2,3,4,5,6
                //1-2,3,4,5,6
                //2-3,4,5,6    

            }
        }


        public void reverseArray()
        {
            int[] testArray = { 1, 2, 3, 4, 5, 6 };
            int temp;
            for (int i = 0; i <= testArray.Length / 2; i++)
            {
                temp = testArray[i];
                testArray[i] = testArray[testArray.Length - (i + 1)];
                testArray[testArray.Length - (i + 1)] = temp;

            }

            foreach (int i in testArray)
            {
                Console.WriteLine(i + "->");
            }
            //0-5
            //1-4
            //2-3

        }

        
    }
}
