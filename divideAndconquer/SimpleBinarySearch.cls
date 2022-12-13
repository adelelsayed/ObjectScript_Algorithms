Class Custom.Algorithms.divideAndconquer.SimpleBinarySearch
{

/// Description
ClassMethod BinarySearch(plist As %List, psearch As %String, pstart As %Integer, pend As %Integer) As %Integer
{
    
    if pstart>=pend return -1
    set midpoint=##class(%Integer).Normalize(pstart+((pend-pstart)/2))
    if $lg(plist,midpoint)=psearch {
        return midpoint
    }elseif $lg(plist,midpoint)<psearch{
        return ..BinarySearch(plist,psearch,midpoint+1,pend)
    }elseif $lg(plist,midpoint)>psearch{
        return ..BinarySearch(plist,psearch,pstart,midpoint)
    }
}

/// Description
ClassMethod BinarySearchPy(plist, psearch, pstart, pend) As %String [ Language = python ]
{
    
    import math
    def binary_search(a, x,start, end):
        if start>=end:
            return -1
        midpoint=math.floor(start+((end-start)/2))
        if a[midpoint]==x:
            return midpoint
        elif a[midpoint]<x:
            return binary_search(a,x,midpoint+1,end)
        elif a[midpoint]>x:
            return binary_search(a,x,start, midpoint)
    plist=plist.split("^")
    return binary_search(plist,psearch,pstart,pend)
}

}
