public class practiceHw 
{
    public static void main( String[] args)
    {
        int userInput = 19;
        int i = 0;
        int count = 0;
        int [] testArray = new int[15];
        
        for (i = 2; i <= userInput/2; i++)
        {
            if (userInput % i == 0)
            {
                count = count + 1;
                testArray[i-2] = i;
            }
        }
        if (count > 0)
        {
            System.out.println(userInput + " is not prime.");
            for (i = 0; i < testArray.length; i++)
            {
                if (testArray[i] != 0)
                {
                    System.out.print(testArray[i] + " ");
                }
                //System.out.print(testArray[i]);
            }
            //System.out.println("All prime numbers between 2 and " + userInput + ": " + testArray);
        }
        else
        {
            System.out.println(userInput + " is prime.");
        }
    }
    
}
