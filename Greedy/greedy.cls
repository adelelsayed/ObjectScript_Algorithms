Class Custom.Algorithms.greedy
{

/// Description
ClassMethod GetOptimalValue(capacity As %Integer, weights As %List, values As %List) As %Status
{
    Set sc = $$$OK
    set value=0
    do ..GetValuesWithWeightsorted(weights,values,.VWArray)
    set curVal=""
    for  {
        set curVal=$Order(VWArray(curVal),-1)
        quit:curVal=""
        quit:capacity=0
        set curValueWeightPair=$get(VWArray(curVal))
        set consumedWeight=##class(Ens.Util.FunctionSet).Min(capacity,$lg(curValueWeightPair,2))
        set capacity=capacity-consumedWeight
        w "current value: "_value_" will add weight "_consumedWeight_" of item "_$lg(curValueWeightPair,1),!
        set value=value+(consumedWeight*curVal)
        w "new value: "_value,!
    }
    Return sc
}

/// Description
ClassMethod GetValuesWithWeightsorted(weights As %List, values As %List, ByRef VWSorted) As %Status
{
    Set sc = $$$OK
    if $ll(values)'=$ll(weights) return sc
    for ix=1:1:$ll(values) {
        set curVal=$lg(values,ix)/$lg(weights,ix)
        set VWSorted(curVal)=$lb($lg(values,ix),$lg(weights,ix))
    }
    
    Return sc
}

/// Description
ClassMethod GetOptimalValuePy(capacity, weights, values) As %Status [ Language = python ]
{
    value = 0.0
    values=list(map(lambda x:int(x),values.split("^")))
    weights=list(map(lambda x:int(x),weights.split("^")))
    valuesWithWeights=zip(values,weights)
    valuesWithWeightsorted=sorted(list(valuesWithWeights),key=lambda x:x[0]/x[1],reverse=True)
    while (capacity>0) and (len(valuesWithWeightsorted)>0):
        consumedWeight=min(valuesWithWeightsorted[0][1],capacity)
        capacity-=consumedWeight
        print("current value: {} will add weight {} of item {}".format(value,consumedWeight,valuesWithWeightsorted[0][0]))
        value+=consumedWeight*(valuesWithWeightsorted[0][0]/valuesWithWeightsorted[0][1])
        print("new value: {}".format(value))
        valuesWithWeightsorted.remove(valuesWithWeightsorted[0])
}

}
