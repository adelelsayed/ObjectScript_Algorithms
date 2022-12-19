Class Custom.Algorithms.divideAndconquer.sorting.QuickSort
{

ClassMethod getArrayLength(ByRef myArr) As %Integer
{
    Set retVal = 0
    set idx=""
    for  {
        set idx=$O(myArr(idx))
        quit:'idx
        set retVal=$I(retVal)
    }
    Return retVal
}

/// Description
ClassMethod PartitionTwoWay(ByRef lista, left As %Integer, right As %Integer) As %Integer
{
    
    set pivot=$lg(lista,right)
    set i=left-1
    for j=left:1:right-1{
        if (($lg(lista,j))<=pivot) {
            set i=i+1
            set temp= $lg(lista,j)
            set $li(lista,j)=$lg(lista,i)
            set $li(lista,i)=temp
            
            }
    }
    set i=i+1
    set temp= $lg(lista,right)
    set $li(lista,right)=$lg(lista,i)
    set $li(lista,i)=temp

    Return i
}

/// Description
ClassMethod PartitionArrTwoWay(ByRef Arr, left As %Integer, right As %Integer) As %Integer
{
    set pivot=$g(Arr(right))
    set idxLow=left-1
    for ix=left:1:right-1{
        if (($g(Arr(ix)))<=pivot) {
            set idxLow=$I(idxLow)
            set temp= ($g(Arr(idxLow)))
            set Arr(idxLow)=($g(Arr(ix)))
            set Arr(ix)=temp
        }
        
    }
    set idxLow=$I(idxLow)
    set temp= $g(Arr(right))
    set Arr(right)=$g(Arr(idxLow))
    set Arr(idxLow)=temp
    Return idxLow
}

ClassMethod PartitionThreeWay(ByRef lista, ByRef midStart, ByRef midEnd, left As %Integer, right As %Integer) As %Integer
{
    set pivot=$lg(lista,right)
    set idxLow=left-1
    while midEnd<=right{
        if ($lg(lista,midEnd)<pivot){
            set temp= $lg(lista,midEnd)
            set $li(lista,midEnd)=$lg(lista,midStart)
            set $li(lista,midStart)=temp

            set midEnd=$I(midEnd)
            set midStart=$I(midStart)

        }elseif ($lg(lista,midEnd)>pivot){

            set temp= $lg(lista,right)
            set $li(lista,right)=$lg(lista,midEnd)
            set pivot=$lg(lista,midEnd)
            set $li(lista,midEnd)=temp            

        }else{
            set midEnd=$I(midEnd)
        }
    }
    
    Return idxLow
}

/// for collection with majorly unique items
ClassMethod QuickSortTwoWay(ByRef lista, left As %Integer, right As %Integer) As %Status
{
    Set sc = $$$OK
    if right<=left return sc
    
    set pivot=..PartitionTwoWay(.lista,left,right)
    
    do ..QuickSortTwoWay(.lista,left,pivot-1)
    
    do ..QuickSortTwoWay(.lista,pivot+1,right)
       
    Return sc
}

/// for collection with majorly non unique items
ClassMethod QuickSortThreeWay(ByRef lista, left As %Integer, right As %Integer) As %Status
{
    Set sc = $$$OK
    if right<=left return sc
    set midleft=left
    set midright=left
    set pivot=..PartitionThreeWay(.lista,.midleft,.midright,left,right)
    
    do ..QuickSortTwoWay(.lista,left,midleft-1)
    
    do ..QuickSortTwoWay(.lista,midright,right)
    Return sc
}

/// for collection with majorly unique items
ClassMethod QuickSortArrTwoWay(ByRef Arr, left As %Integer = 1, right As %Integer = 0) As %Status
{
    Set sc = $$$OK
    set arraylen=..getArrayLength(.Arr)
    if ('right) set right=arraylen
    if right<=left return sc

    set pivot=..PartitionArrTwoWay(.Arr,left,right)

    do ..QuickSortArrTwoWay(.Arr,left,pivot-1)
    
    do ..QuickSortArrTwoWay(.Arr,pivot+1,right)
    Return sc
}

/// for collection with majorly non unique items
ClassMethod QuickSortArrThreeWay(ByRef Arr, left As %Integer, right As %Integer) As %Status
{
    Set sc = $$$OK
    // do something
    Return sc
}

/// Description
ClassMethod QuickSortPyThreeWay(lista) [ Language = python ]
{
    
    def partition(arr, first, last, start, mid):
    
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
    
    def quicksort(arr,first,last):
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
        partition(arr, first, last, start, mid)
        
        # Recursively sort sublist containing elements that are less than the pivot.
        quicksort(arr, first, start[0] - 1)
        # Recursively sort sublist containing elements that are more than the pivot
        quicksort(arr, mid[0], last)
        
        
    
    lista=list(map(lambda x:int(x),lista.split("^")))
    
    quicksort(lista,0,len(lista)-1)
    
    print(lista)
}

}
