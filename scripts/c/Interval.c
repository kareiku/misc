#include <stdio.h>
#include <stdlib.h>

typedef struct Interval {
    double lowerBound;
    double upperBound;

    int (*contains)(struct Interval*, double);
} Interval;

int contains(Interval* interval, double number) {
    return interval->lowerBound < number && number < interval->upperBound;
}

Interval* newInterval(double lowerBound, double upperBound) {
    Interval* interval = (Interval*)malloc(sizeof(Interval));

    interval->lowerBound = lowerBound;
    interval->upperBound = upperBound;
    interval->contains = contains;

    return interval;
}

int main() {
    Interval* in = newInterval(3.14, 4.04);
    double a = 3.;
    printf("Is %f in the interval (%f, %f)? %s.\n",
        a, in->lowerBound, in->upperBound,
        in->contains(in, a) ? "Yes" : "No");
    free(in);
}
