#include <stdio.h>
#include <stdlib.h>

// get max brightness
float getMax(FILE *fp)
{
    if ((fp = fopen("/sys/class/backlight/amdgpu_bl0/max_brightness", "r")) != NULL)
    {
        char max_str[5];
        int max;
        if (fgets(max_str, 4, fp) == NULL)
            return -1;
        max = atoi(max_str);
        fclose(fp);
        return max;
    }
    else
        return -1;
}

// get current brightness
float getCurrent(FILE *fp)
{
    if ((fp = fopen("/sys/class/backlight/amdgpu_bl0/brightness", "r")) != NULL)
    {
        char current_str[5];
        int current;
        if (fgets(current_str, 4, fp) == NULL)
            return -1;
        current = atoi(current_str);
        fclose(fp);
        return current;
    }
    else
        return -1;
}

int main(void)
{
    FILE *fp = NULL;
    float max, current, result;
    if ((max = getMax(fp)) < 0)
    {
        printf("Error reading max brightness\n");
        return 1;
    }
    if ((current = getCurrent(fp)) < 0)
    {
        printf("Error reading current brightness\n");
        return 1;
    }
    result = current / (max / 100);
    printf("%2.0f%%\n", result);
    return 0;
}
