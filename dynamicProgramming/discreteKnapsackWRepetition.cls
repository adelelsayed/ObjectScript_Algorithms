Class Custom.Algorithms.DynamicProgramming.DiscreteKnapsackWRepetition
{

/// Description
ClassMethod OptimalWeight(capacity As %Integer, values As %List) As %Integer
{
    Set retVal = 0
    if $ll(values)=0 return 0
    if $ll(values)=1 return capacity*$lg(values,1)
    do ##class(Custom.Algorithms.divideAndconquer.sorting.QuickSort).QuickSortTwoWay(.values,1,$ll(values))
    set w=0
    set Arr=""

    for w=1:1:capacity {
        for ix=1:1:$ll(values){
            set currentValue=$lg(values,ix)
            if ix>capacity continue
            if currentValue<=w{
                set Arr(w)=##class(Ens.Util.FunctionSet).Max((currentValue+$g(Arr(w-currentValue))),$g(Arr(w)))
            }


        }
    }
    set retIdx=$O(Arr(""),-1)
    set retVal=$g(Arr(retIdx))
    Return retVal
}

/// Description
ClassMethod optimalWeightPy(capacity, values) As %Integer [ Language = python ]
{
    def optimal_weight(W, wt):
    
        if len(wt)==0:return 0
        if len(wt)==1:return wt[0]*W
        wt.sort()
        K=[0]*(W+1)
        for w in range(W+1): 
            for i in range(len(wt)):
                
                if i>W:continue
                if wt[i] <= w:
                    K[w]=max(K[w],wt[i]+K[w-wt[i]])
                    
        return K[-1]
    valuesList=list(map(lambda x:int(x),values.split("^")))
    return optimal_weight(capacity,valuesList)
}

}
