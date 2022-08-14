#include <iostream>
#include <cmath>
#include <numeric>

using namespace std;
bool check(int x)
{
    const int w[7] = {1, 10, 100, 1000, 10000, 100000, 1000000};
    for (int n : w)
    {
        if (x == n)
        {
            return true;
        }
    }
    return false;
}
int prod(int x[7])
{
    int n = 1;
    for (int i = 0; i <= 6; i++)
    {
        n = n * x[i];
    }
    return n;
}
int main()
{
    int counter = 1;
    int num = 1;
    int ar[7]; // array of numbers to multiply
    int n = 0;
    do
    {
        string t = to_string(num);
        for (int i; i <= t.length(); i++)
        {
            if (check(counter))
            {
                ar[n] = stoi(t[i]);
                n++;
                cout << n << endl
                     << ar[n - 1] << endl;
            }
            counter++;
        }
        num++;
    } while (counter <= 1000000);
    return prod(ar);
}