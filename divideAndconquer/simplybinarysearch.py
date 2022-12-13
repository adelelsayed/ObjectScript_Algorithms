import sys
import math
# a is A SORTED list and x is a number to search for, start, end are positions in list
def binary_search(a, x,start, end):
    if start>=end:
        return -1
    midpoint=math.floor(start+((end-start)/2))
    if a[midpoint]==x:return midpoint
    elif a[midpoint]<x:return binary_search(a,x,midpoint+1,end)
    elif a[midpoint]>x:return binary_search(a,x,start, midpoint)