Class Custom.Algorithms.divideAndconquer.sorting.MergeSort
{

/// Description
ClassMethod MergeSort(ByRef Lista As %List) As %Status
{
    Set sc = $$$OK
    if $ll(Lista)>1{
        set midPoint=##class(%Integer).Normalize($ll(Lista)/2)
        set (leftList,rightList)=""
        set cnt=1
        while cnt<=$ll(Lista){
            if cnt<=midPoint {set leftList=leftList_$lb($lg(Lista,cnt))}
            else {set rightList=rightList_$lb($lg(Lista,cnt))}
            set cnt=$I(cnt)
        }
        do ..MergeSort(.leftList)
        do ..MergeSort(.rightList)

        set (i,j,k)=1
        while ((i<=$ll(leftList)) && (j<=$ll(rightList))){
            if $lg(leftList,i)<$lg(rightList,j){
                set $li(Lista,k)=$lg(leftList,i)
                set i=$I(i)
            }else{
                set $li(Lista,k)=$lg(rightList,j)
                set j=$I(j)
            }
            set k=$I(k)
        }

        while (i<=$ll(leftList)){
            set $li(Lista,k)=$lg(leftList,i)
            set i=$I(i)
            set k=$I(k)
        }
        while (j<=$ll(rightList)){
            set $li(Lista,k)=$lg(rightList,j)
            set j=$I(j)
            set k=$I(k)
        }
    }


    Return sc
}

/// Description
ClassMethod MergeSortPy(arrAsString) As %String [ Language = python ]
{
    myArr=arrAsString.split("^")
    no_of_inversions=[0]
    def mergeSort(arr):
        if len(arr) > 1:
            # Finding the mid of the array
            mid = len(arr)//2
            # Dividing the array elements
            L = arr[:mid]
            # into 2 halves
            R = arr[mid:]
            # Sorting the first half
            mergeSort(L)
            # Sorting the second half
            mergeSort(R)
            i = j = k = 0
            
            # Copy data to temp arrays L[] and R[]
            while i < len(L) and j < len(R):
                if L[i] <= R[j]:
                    
                    arr[k] = L[i]
                    
                    i += 1
                    
                else:
                    arr[k] = R[j]
                    no_of_inversions[0]=no_of_inversions[0]+(len(L)-i)
                    j += 1
                
                
                
                k += 1
                
                
            # Checking if any element was left
            while i < len(L):
                
                arr[k] = L[i]
                
                i += 1
                k += 1
                
            while j < len(R):
                arr[k] = R[j]
                
                j += 1
                k += 1
    mergeSort(myArr)
    print(myArr)
    return str(no_of_inversions)
}

}
