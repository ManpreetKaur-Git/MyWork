using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class BinarySearch
    {
        public bool ifelementExists(int key)
        {
            int[] arr = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
            int High = arr.Length - 1;
            int Low = 0;
            int mid = (High + Low) / 2;
            //  int key = 0;

            //if our element (key) is to the right. Low=mid+1,High, mid=(high+Low)/2
            //if our element (key) is to left. Low stays,High= mid -1 , mid=(high+low)/2
            //if our elemet(key) = mid. We have found it. return key.(aage jane ki need nae.)

            while (Low <= High) //once low is grater than high. Low and high crossed each other therefore element not found.
            {
                if (key > arr[mid])
                {
                    Low = mid + 1;
                    mid = (Low + High) / 2;
                }

                if (key < arr[mid])
                {
                    High = mid - 1;
                    mid = (Low + High) / 2;
                }
                if (key == arr[mid])
                {
                    return true;

                }
            }


            return false;
        }

    }
}
