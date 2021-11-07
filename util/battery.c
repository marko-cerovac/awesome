#include <stdio.h>

// The program prints the current battery capacity
// If the battery is plugged to AC, the first letter of the output is C
// If the battery is running on it's own power, the first letter of the output is B

char acFile[] = "/sys/class/power_supply/AC/online";
char batFile[] = "/sys/class/power_supply/BAT0/capacity";

int main (void)
{
    char capacity [5];
    FILE *fp;
    if ((fp = fopen(acFile, "r")) != NULL)
    {
        char c = fgetc(fp);
        if (c == '1')
            capacity[0] = 'C'; // Running on AC power
        else
            capacity[0] = 'B'; // Running on battery power
        fclose(fp);
    }
    else return 1;
    if ((fp = fopen(batFile, "r")) != NULL)
    {
        fgets(capacity + 1, 3, fp);
        printf("%s\n", capacity);
        fclose(fp);
    }
    
    return 0;
}
