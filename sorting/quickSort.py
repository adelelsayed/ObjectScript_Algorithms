'''
This function partitions a[] in three parts
a) a[first..start] contains all elements smaller than pivot
b) a[start+1..mid-1] contains all occurrences of pivot
c) a[mid..last] contains all elements greater than pivot
ref: geeksforgeeks.org  
'''
def partition2Way(array, low, high):
    
    # choose the rightmost element as pivot
    pivot = array[high]
 
    # pointer for greater element
    i = low - 1
 
    # traverse through all elements
    # compare each element with pivot
    for j in range(low, high):
        if array[j] <= pivot:
 
            # If element smaller than pivot is found
            # swap it with the greater element pointed by i
            i = i + 1
 
            # Swapping element at i with element at j
            (array[i], array[j]) = (array[j], array[i])
 
    # Swap the pivot element with the greater element specified by i
    (array[i + 1], array[high]) = (array[high], array[i + 1])
 
    # Return the position from where partition is done
    return i + 1
def quickSort2way(array, low, high):
    if low < high:
 
        # Find pivot element such that
        # element smaller than pivot are on the left
        # element greater than pivot are on the right
        pi = partition2Way(array, low, high)
 
        # Recursive call on the left of pivot
        quickSort2way(array, low, pi - 1)
 
        # Recursive call on the right of pivot
        quickSort2way(array, pi + 1, high)

def partition3Way(arr, first, last, start, mid):
    
    pivot = arr[last]
    end = last
    
    # Iterate while mid is not greater than end.
    while (mid[0] <= end):
        
        # Inter Change position of element at the starting if it's value is less than pivot.
        if (arr[mid[0]] < pivot):
            
            arr[mid[0]], arr[start[0]] = arr[start[0]], arr[mid[0]]
            
            mid[0] = mid[0] + 1
            start[0] = start[0] + 1
            
        # Inter Change position of element at the end if it's value is greater than pivot.
        elif (arr[mid[0]] > pivot):
            
            arr[mid[0]], arr[end] = arr[end], arr[mid[0]]
            
            end = end - 1
            
        else:
            mid[0] = mid[0] + 1
# Function to sort the array elements in 3 cases
def quicksort3Way(arr,first,last):
    # First case when an array contain only 1 element
    if (first >= last):
        return
    
    # Second case when an array contain only 2 elements
    if (last == first + 1):
        
        if (arr[first] > arr[last]):
            
            arr[first], arr[last] = arr[last], arr[first]
            
            return
    # Third case when an array contain more than 2 elements
    start = [first]
    mid = [first]
    # Function to partition the array.
    partition3Way(arr, first, last, start, mid)
    
    # Recursively sort sublist containing elements that are less than the pivot.
    quicksort3Way(arr, first, start[0] - 1)
    # Recursively sort sublist containing elements that are more than the pivot
    quicksort3Way(arr, mid[0], last)