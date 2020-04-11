using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GSClass
{
    class ProgramQuestions
    {


        public void factorial(int n)
        {
            // int n = 6;
            int fact = 1;
            for (int i = 1; i <= n; i++)
            {
                fact = fact * i;
            }

            Console.WriteLine("Factorial: " + fact);
        }


        public bool powerof2orNot(int number)
        {
            while (number != 1)
            {
                if (number % 2 != 0)
                {
                    return false;
                }
                number = number / 2;
            }
            return true;
        }


        public bool isPalindrome(int number)
        {

            {
                //323 3,2,3

                //    756 "(7*100 + 5*10  + 6*1)
                //756 % 10 = 6 * 100
                //756 / 10 = 75.6
                //75%10=5 = 5*10
                //75/10 = 7
            }
            int orgnumber = number;
            int reverseNumber = 0;
            int remainder = 0;

            while (number != 0)
            {
                remainder = number % 10;
                number = number / 10;
                reverseNumber = reverseNumber * 10 + remainder;
            }
            if (reverseNumber == orgnumber)
                return true;
            return false;
            //4

        }


        public bool checkArmstrongNumber(int number)
        {
            //153

            int remainder;
            int orignalnumber = number;
            int myNumber = 0;
            while (number != 0)
            {
                remainder = number % 10;
                number = number / 10;
                myNumber = (remainder * remainder * remainder) + myNumber;
            }

            if (myNumber == orignalnumber)
                return true;
            return false;
        }


        public void checkArmstrongNumber1(int number)
        {
            //153

            int remainder;
            int orignalnumber = number;
            int myNumber = 0;
            while (number != 0)
            {
                remainder = number % 10;
                number = number / 10;
                myNumber = (remainder * remainder * remainder) + myNumber;
            }

            if (myNumber == orignalnumber)
                Console.WriteLine(myNumber);
            //return true;
            ///return false;
        }

        public void primeNumbers()
        {
            int flag = 0;
            for (int i = 2; i <= 100; i++)
            {
                if (i == 2)
                    Console.WriteLine(i + " is a prime number.");
                else
                {
                    flag = 0;
                    for (int j = 2; j <= (i - 1); j++)
                    {
                        if (i % j == 0)
                        {
                            flag = 1; // it is not prime. As it is divisble by a number.
                            break;
                        }

                    }

                    if (flag == 0)
                        Console.WriteLine(i);
                }
            }



        }

        public void fibonacciSeries()
        {
            //0 1 1 2 3 5 8 13 21 .. ........   //assume 10 numbers
            int first = 0;
            int second = 1;
            Console.WriteLine(first);
            Console.WriteLine(second);
            int third;
            for (int i = 1; i <= 8; i++)
            {
                third = first + second;
                first = second;
                second = third;
                Console.WriteLine(third);
            }
        }


        public void fibonacciSeries2(int index)
        {
            //0 1 1 2 3 5 8 13 21 .. ........   //assume 10 numbers
            int first = 0;
            int second = 1;
            ////Console.WriteLine(first);
            ////Console.WriteLine(second);
            int third = 0;
            for (int i = 0; i < index - 2; i++)
            {
                third = first + second;
                first = second;
                second = third;

            }
            Console.WriteLine(third);

        }


        public void countNumberofDigits(int number)
        {
            //756
            int remainder;
            int count = 0;
            while (number != 0)
            {
                remainder = number % 10;
                number = number / 10;

                count++;
            }

            Console.WriteLine("Number of digits." + count);
        }

        public void isBinaryNumber(int number)
        {
            //101    10000011 10040001

            int remainder;
            int flag = 0;
            int originalNumber = number;
            while (number != 0)
            {
                remainder = number % 10;
                number = number / 10;
                flag = 0;
                if (remainder != 0 && remainder != 1)
                {
                    flag = 1;
                    break;
                }
            }

            if (flag == 1)
                Console.WriteLine(originalNumber + "-Number is not binary.");
            else
                Console.WriteLine(originalNumber + "-Number is binary.");

        }

        public void reverseAnInteger(int number)
        {
            //192- -291
            int remainder;
            int revesernumber = 0;
            while (number != 0)
            {
                remainder = number % 10;
                number = number / 10;

                revesernumber = revesernumber * 10 + remainder;
            }

            Console.WriteLine("Reverse Numver" + revesernumber);
        }

        public void sumofDigits(int number)
        {
            //153 - 1+5+3

            int remainder;
            int sumofdigits = 0;
            while (number != 0)
            {
                remainder = number % 10;
                number = number / 10;
                sumofdigits = sumofdigits + remainder;

            }
            Console.WriteLine("sum of digits" + sumofdigits);
        }

        public void swapTwoNumberwithoutusingTempvariable(int a, int b)
        {
            //a=10, b= 20

            Console.WriteLine("Before Swap. A=" + a + " .B=" + b);

            a = a + b; //(30)
            b = a - b; //30-20 =10
            a = a - b;

            Console.WriteLine("After Swap.A=" + a + " .B=" + b);
        }

        public void largestofThreeIntegers(int a, int b, int c)
        {
            //a=10,b=8,c=12
            /// int largestelemnt = a;

            if (a >= b && a >= c) //21,21,20
                Console.WriteLine(a + "is largest");
            else if (b >= a && b >= c)
                Console.WriteLine(b + "is largest");
            else if (c >= a && c >= b)
                Console.WriteLine(c + "is largest");
        }

        public void primeFactorofInteger(int number)
        {
            int remainder;
            int originalNumber = number;
            Console.WriteLine("Prime Factor of " + originalNumber + ". ");
            for (int i = 2; i <= originalNumber; i++) //2 ke liye bhi check krna hai isliye <= laga hai
            {
                while (number != 1)
                {
                    remainder = number % i;
                    if (remainder == 0)
                    {
                        number = number / i;
                        Console.WriteLine(i);
                    }

                    else
                        break;
                }
            }
        }

        public void addtwoIntegersWithoutusingArithmaticOpertaions()
        {

        } //pending

        ///// ************************************String Questions************************************************

        public bool stringisPalindromeornot(string s)
        {
            //teamq
            Console.WriteLine("String before Reverse " + s);
            char[] myArray = s.ToArray(); //'k', 'a'
            char temp;
            for (int i = 0; i < myArray.Length / 2; i++)
            {
                temp = myArray[i];
                myArray[i] = myArray[myArray.Length - (i + 1)];
                myArray[myArray.Length - (i + 1)] = temp;
            }

            string reverStrimg = new string(myArray);
            Console.WriteLine("Reverse String: " + reverStrimg);
            if (reverStrimg == s)  //objs.Equals(s)
                return true;
            else
                return false;

        }

        public void removeAnyOneCharFromaString(string s, char character)
        {
            char[] myArray = s.ToArray();

            char[] newArray = new char[myArray.Length];
            Console.WriteLine("Old string: " + s);

            int count = 0;
            for (int i = 0; i < myArray.Length; i++)
            {
                if (myArray[i] != character)
                {
                    newArray[count] = myArray[i];
                    count++;
                }
            }

            string newstring = new string(newArray);
            Console.WriteLine("New string: " + newstring);

        }

        //public void allPermutationofStringIterative() //pending
        //{ }

        //public void longestPalindromeinaString()//pending
        //{ }

        //public void allPermutationofStringRecursive()// pending
        //{ }



        public void firstNonRepeatedCharacterinaString(string s) // first non repeated character of a given String
        {
            char[] myArray = s.ToArray();
            int flag = 0;
            for (int i = 0; i < myArray.Length; i++)
            {
                flag = 0;
                for (int j = i + 1; j < myArray.Length; j++)
                {
                    if (myArray[i] == myArray[j])
                    {
                        flag = 1;
                        break;
                    }
                }

                if (flag == 0)
                {
                    Console.WriteLine("First Non Repeated" + myArray[i]);
                    break;
                }

            }


        }

        public void countGivenCharinString(string s, char ch)
        {
            char[] myArray = s.ToArray();
            Dictionary<char, int> myDict = new Dictionary<char, int>();

            for (int i = 0; i < myArray.Length; i++)
            {

                if (myDict.ContainsKey(myArray[i]))
                {
                    myDict.TryGetValue(myArray[i], out int value);
                    value += 1;
                    myDict[myArray[i]] = value;
                }
                else
                    myDict.Add(myArray[i], 1);
            }

            foreach (char key in myDict.Keys)
            {
                if (key == ch)
                {
                    myDict.TryGetValue(key, out int value);
                    Console.WriteLine("Occurence of char " + ch + " is " + value);
                }

            }

        }

        public void countGivenCharinString2(string s, char ch)
        {
            char[] myArray = s.ToArray();
            int count = 0;
            foreach (char c in myArray)
            {
                if (ch == c)
                {
                    count++;
                }

            }

            Console.WriteLine("Count of given char is " + count);
        }

        public void twoStringsAreAnagram(string s1, string s2)
        {
            // Anagram - Number of  characters and occurence should be same.andar ke shuffled.ayi smajh.Jumbeled characted
            //Manpreet - Nampreet, Pot-top,pto

            char[] myarray1 = s1.ToArray();
            char[] myarray2 = s2.ToArray();

            if (myarray1.Length != myarray2.Length)
                Console.WriteLine("Not an AG")
;


            System.Array.Sort(myarray1);
            System.Array.Sort(myarray2);
            //  12234 12234
            //start of MK code
            {
                //int flag = 0;
                //for (int i = 0; i < myarray1.Length; i++)
                //{
                //    for (int j = i; j <= i; j++)
                //    {
                //        if (myarray1[i] != myarray2[j])
                //        {
                //            flag = 1;
                //            Console.WriteLine("It is not an Anagram.");
                //        }
                //    }
                //    if (flag == 1)
                //        break;
                //}

                //if (flag == 0)
                //    Console.WriteLine("It is an Anagram.");
            }
            //End
            int i = 0;
            for (; i < myarray1.Length; i++)
            {
                if (myarray1[i] != myarray2[i])
                {
                    Console.WriteLine("not an AG");
                    break;
                }
            }
            if (i == myarray1.Length)
                Console.WriteLine("IT is an AG");

        }

        public void printDuplicateCharactersfromstring(string s)   //can be done by dictionary also           /// Print duplicate characters from String
        {

            char[] myArray = s.ToArray();

            for (int i = 0; i < myArray.Length - 1; i++)
            {
                for (int j = i + 1; j < myArray.Length; j++)
                {
                    if (myArray[i] == myArray[j])
                    {

                        Console.WriteLine("Duplicate Element:" + myArray[i]);
                        break;
                    }
                }
            }
        }


        public void stringContainsOnlyDigits(string s) //How to check if a String contains only digits
        {
            char[] myarray = s.ToArray();

            int i = 0;

            if (int.TryParse(s, out int result))// ek bhi char ayega tou it will give false.If string has only digits it gives true
                Console.WriteLine("String contains only digits.");
            else
                Console.WriteLine("String does not contains only digits.It has some characters too.");
            Console.WriteLine(int.TryParse(s, out result));
        }


        public void stringContainsOnlyDigits2(string s)
        {
            char[] myarray = s.ToArray();
            int flag;
            int i = 0;
            for (; i < myarray.Length; i++)
            {
                flag = 0;
                for (int j = 48; j <= 57; j++) //where in 48=0 and 57 =9
                {
                    if (Convert.ToInt32(myarray[i]) == j)
                    {
                        flag = 1;
                    }
                }

                if (flag == 0)
                {
                    Console.WriteLine("String does not contains only digits.");
                    break;
                }

            }

            if (i == myarray.Length)
                Console.WriteLine("stringContainsOnlyDigits2");
        }


        public void countNumberofVowelsandConsonants(string s)
        {
            Char[] myarray = s.ToArray();
            char[] vowels = { 'a', 'e', 'i', 'o', 'u' };
            int vowelcount = 0;
            int consonantcount = 0;
            for (int i = 0; i < myarray.Length; i++)
            {
                if (vowels.Contains(myarray[i]))
                    vowelcount++;
                else
                    consonantcount++;
            }

            Console.WriteLine("Vowel" + vowelcount + "Consonants: " + consonantcount);

        }


        public void reverseWordsinaSenetence(string s)  //How to reverse words in a sentence without using a library method?
        {
            // s = "Java is best programming language.";
            s = "This is .net programming";
            char[] delimeter = { ' ' };
            string[] myarray = s.Split(delimeter).ToArray();
            string temp = string.Empty;
            for (int i = 0; i < myarray.Length / 2; i++)
            {
                temp = myarray[i];
                myarray[i] = myarray[myarray.Length - (1 + i)];
                myarray[myarray.Length - (1 + i)] = temp;
            }

            string newstring = string.Empty;
            foreach (string st in myarray)
            {
                newstring = newstring + st + " ";
            }

            Console.WriteLine(newstring);
            Console.WriteLine("Length of old string:" + s.Length);
            Console.WriteLine("Length of new string:" + newstring.Length);

        }


        public void duplicateCharactersfromString(string s)    //How to remove duplicate characters from String?  //‘bananas’ the output will be ‘bans’
        {
            char[] myarray = s.ToArray();
            string st = string.Empty;
            Dictionary<char, int> myDict = new Dictionary<char, int>();

            for (int i = 0; i < myarray.Length; i++)
            {
                if (myDict.ContainsKey(myarray[i]))
                {
                    myDict.TryGetValue(myarray[i], out int values);
                    values += 1;
                    myDict[myarray[i]] = values;
                }
                else
                    myDict.Add(myarray[i], 1);
            }

            foreach (char ch in myDict.Keys)
            {
                st = st + ch;
            }

            Console.WriteLine(st);
        }


        public void removeGivenCharinString(string s, char ch)  // //Write a program to remove a given character from String?
        {
            char[] myarray = s.ToArray();
            char[] newarray = new char[myarray.Length];
            int count = 0;
            for (int i = 0; i < myarray.Length; i++)
            {
                if (myarray[i] != ch)
                {
                    newarray[count] = myarray[i];
                    count++;
                }
            }

            string newstring = new string(newarray);
            Console.WriteLine(newstring);
        }


        //How to find all permutations of String.

        //Write a program to check if a String contains another String like indexOf ()

        //public void stringContainsAnotherStringandIndex(string s1, string smallstring) //important
        //{
        //    Char[] myarray1 = s1.ToArray();
        //    char[] myarray2 = smallstring.ToArray();

        //    for (int i=0;i<myarray1.Length;i++)
        //    {


        //    }

        //}




        //      How to check if a String is a valid shuffle of two String?
        
        //How to sort String on their length in Java?





        //first = "abc" and 
        //second = "def", 
        //third = "dabecf"

        //How to return highest occurred character in a String?



        // What is the difference between String, StringBuilder, and StringBuffer in Java?

        //How to convert numeric String to int in C#? -- Convert.ToInt332();

        //Why Char array is preferred over String for storing password? (ans
        //Answer:Since Strings are immutable in Java if you store password as plain text it will be available in memory
        //until Garbage collector clears it and since String are used in String pool for reusability there is pretty high 
        //chance that it will be remain in memory for long duration, which pose a security threat. Since any one who has
        //access to memory dump can find the password in clear text and that's another reason you should always used an 
        //encrypted password than plain text. Since Strings are immutable there is no way contents of Strings can be changed
        //because any change will produce new String, while if you char[] you can still set all his element as blank or zero.
        //So Storing password in character array clearly mitigates security risk of stealing password.


    }
}