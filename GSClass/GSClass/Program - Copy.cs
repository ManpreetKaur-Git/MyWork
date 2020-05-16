using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace GSClass
{

//    protected baseemp()
//    {
//        this.id = 2;
//        print();
//    }

//    public abstract void print();

//    public virtual void Name()
//    {
//        Console.WriteLine("Manpreet");
//    }
//}
//public class FullEmp : baseemp
//{
//    public FullEmp()
//    { }

//    public override void print()
//    {
//        Console.WriteLine("provided definition");
//    }
//}
//public class contractEmployee : baseemp
//{
//    public override void print()
//    {
//        Console.WriteLine("provided definition");
//    }
//    public override void Name()
//    {
//        Console.WriteLine("Gurjeet");
//    }
//}

    //class Program
    //{

    //    ////1. *********************Constant variable************Starts****************************************************************************

    //    //const int a = 10; // this is correct . Constant varible must be initialized at the time of declartion.
    //    //                  // const int b; // this is not correct. It gives error while writing the code itslef.
    //    //                  // static const int g = 10;// this is incorrect. It is by default   is static in nature..

    //    ////Constant Variable:  Therefore, Constant varible needs to be addigned at the time of decalrtion itself.
    //    ////and it's value cannot be change through out the program. It is static in nature.

    //    ////1. *********************Constant variable************Ends****************************************************************************

    //    ////2. *********************Readonly variable************Starts****************************************************************************

    //    //readonly int c; // this is correct.
    //    //readonly int d = 10;// This is also correct.

    //    //// Readonly variable. It is not neccessary to initialize a read only variable at the time of declaration.
    //    ////However it can be done also it is not incorrect to do so. The value of readonly varaiable can be changed during run time but 
    //    //// only through a constructor and that too non static one.It cannot be changed via any function or a statuc constructor.

    //    ////2. *********************Readonly variable************ Ends******************************************************************************


    //    ////3. *********************Static variable************Starts****************************************************************************

    //    /////        static int num; // It is correct. 
    //    //static int num = 0; // It is correct. 

    //    //int notstatic = 0;

    //    ////Static variable can be initialized anywhere in the program. It created same copy of variable for all the objects of that class.

    //    ////3. *********************Static variable************Ends****************************************************************************


    //    //public Program()
    //    //{
    //    //    c = 10; //this is correct. readonly varaiable can be changed suring run time but only through a constructor
    //    //            //and that too non static one

    //    //    num++;
    //    //    notstatic++;
    //    //    Console.WriteLine("Num value" + num);
    //    //    Console.WriteLine("and ");
    //    //    Console.WriteLine("notstatic value" + notstatic);
    //    //}

    //    //public void newfunction()
    //    //{
    //    //    num = 3;
    //    //    // c = 12; // this is not correct.Readonly variable cannot be changed via any function or a statuc constructor.
    //    //}

    //    static void Main(string[] args)
    //    {

    //        LinkedList objLL = new LinkedList();

    //        LinkedList objLL2 = new LinkedList();
    //        LinkedList objLL1 = new LinkedList();
    //        /// Console.WriteLine(objLL.isLLLoop());


    //        objLL1.InsertinEnd("1");
    //        objLL1.InsertinEnd("2");
            

    //        objLL2.InsertinEnd("3");
    //        objLL2.InsertinEnd("4");
    //        objLL2.InsertinEnd("2");
    //        objLL2.InsertinEnd("7");

    //        objLL1.DisplayNode();
    //        objLL2.DisplayNode();

    //        objLL.MergetwoLL(objLL1.getHeader(), objLL2.getHeader());
    //        objLL.DisplayNode();

    //        ///objLL.deletefrompos2(4);
    //       // objLL.DisplayNode();
    //        // objLL.AlternateElementinmyLL();
    //        //objLL.LargestElementinmyLL();

    //        objLL.DuplicateElementsinLL(objLL.getHeader());


    //        /////objLL.InsertinEnd("LL7");
    //        //objLL.DisplayNode();
    //        //objLL.ThirdElementFromLastSinglePass();

    //        // objLL.DisplayNode();
    //        //objLL.reverseLL();
    //        //objLL.DisplayNode();
    //        Console.ReadKey();

    //        // Employee objEmp1 = new Employee();

    //        // objEmp1.empid = 21;
    //        // objEmp1.name = "MK";
    //        // objEmp1.address = "addr1";

    //        // Console.WriteLine("EMP1: " + objEmp1.empid);

    //        // Employee objemp2;

    //        //  objemp2 = objEmp1; // Both my object are pointing to same location. By doing this we have just assigned the 
    //        // //location/refernce of e1 to e2.Any change in e2 will change e1 also. and vice versa

    //        // ///Console.WriteLine(objEmp1);
    //        ///// Employee objemp2 = new Employee(objEmp1); // here e2 is not pointing to e1 but it has it's on location is memory.This is also called object by value.

    //        // Console.WriteLine("EMP2: " + objemp2.empid);

    //        // objemp2.empid = 26;

    //        // Console.WriteLine("EMP1: " + objEmp1.empid);























    //        //*************************LinkedList**********************

    //        //LinkedList objLL = new LinkedList();
    //        //objLL.InsertinEnd("LL1");
    //        //objLL.InsertinEnd("LL2");
    //        //objLL.InsertinEnd("LL3");
    //        //objLL.InsertinEnd("LL4");
    //        //objLL.InsertinEnd("LL5");
    //        ////objLL.InsertinPos("bet 4 n 5", 5);
    //        ////objLL.InsertinPos("bet 2n3", 3);
    //        ////objLL.InsertinPos("one", 1);
    //        ////objLL.InsertinPos("ant", 9);

    //        //objLL.DeleteinPos(2);
    //        //objLL.DisplayNode();
    //        //Console.ReadKey();

    //        //objLL.DisplayNode();

    //        // objLL.InsertinFront("LL5");

    //        //Console.WriteLine("");

    //        //objLL.DisplayNode();

    //        //objLL.InsertinEnd("endll");
    //        // objLL.DeleteinFront();
    //        // objLL.DeleteinEnd();
    //        //   objLL.DisplayNode();
    //        //*************************LinkedList**********************



    //        //num = 5; // this is correct.

    //        //Program P1 = new Program();
    //        //Program P2 = new Program();
    //        //Program P3 = new Program();
    //        //Program P4 = new Program();

    //        //Console.WriteLine(a);
    //        ////a = 10; // cannnot chnge the value once assigned. it gives error while writng code itslef.


    //        //MyStack preetkaStack = new MyStack(5);

    //        //preetkaStack.put("My first book");
    //        //preetkaStack.put("My sec book");
    //        //preetkaStack.put("My third book");
    //        //preetkaStack.put("My fourth book");
    //        //preetkaStack.Insertatloc("middlebook", 2);
    //        //preetkaStack.diplay();

    //        ////***************** Object by refernce starts**************************

    //        /// Employee e1 = new Employee();
    //        ////e1.empid = 2;
    //        ////e1.address = "add2";
    //        ////e1.name = "two";

    //        ////Employee e2;
    //        ////e2 = e1;

    //        ////Console.WriteLine("e2 ka: " + e2.name);
    //        ////Console.WriteLine("e2 ka: " + e2.empid);
    //        ////Console.WriteLine("e2 ka: " + e2.address);

    //        ////e2.empid = 3;
    //        ////e2.address = "add3";  /// now becasue of this  e2 change e1 will also change. as e2=e1 mean e1's loaction 
    //        ////                      ///is assigned to e2 means e2 and e1 are now poitning to the same loc of copy.It does not means we have assigned only the e1's value to e2.
    //        ////                      /// and does not mean on chnaging e2 ,e1 will reamin same. no. 
    //        ////e2.name = "three";

    //        ////Console.WriteLine("e1 ka: " + e1.name);
    //        ////Console.WriteLine("e1 ka: " + e1.empid);
    //        ////Console.WriteLine("e1 ka: " + e1.address);

    //        //////e2 ka: two
    //        ////e2 ka: 2
    //        ////e2 ka: add2
    //        ////e1 ka: three  // we just change e2 but e1 has also chnaged. this is called object by refernce.
    //        ////e1 ka: 3
    //        ////e1 ka: add3

    //        /////************* Object by value to handle above thing*****************

    //        //Employee e1 = new Employee();
    //        //e1.empid = 2;
    //        //e1.address = "add2";
    //        //e1.name = "two";


    //        //Employee e3 = new Employee(e1);

    //        //Console.WriteLine("e3 ka: " + e3.name);
    //        //Console.WriteLine("e3 ka: " + e3.empid);
    //        //Console.WriteLine("e3 ka: " + e3.address);

    //        //e3.empid = 4;
    //        //e3.address = "add4";
    //        //e3.name = "four";

    //        //Console.WriteLine("e1 ka: " + e1.name);
    //        //Console.WriteLine("e1 ka: " + e1.empid);
    //        //Console.WriteLine("e1 ka: " + e1.address);

    //        //Console.WriteLine("e3 ka: " + e3.name);
    //        //Console.WriteLine("e3 ka: " + e3.empid);
    //        //Console.WriteLine("e3 ka: " + e3.address);




    //        ////***************** Object by refernce Ends**************************





    //    }




    //}


    //class Employee
    //{

    //    public int empid { get; set; }
    //    public string name { get; set; }
    //    public string address { get; set; }

    //    public Employee(Employee e)
    //    {
    //        this.empid = e.empid;
    //        this.name = e.name;
    //        this.address = e.address;
    //    }

    //    public Employee()
    //    {
    //        this.empid = empid;
    //        this.name = name;
    //        this.address = address;
    //    }
    //}

}


