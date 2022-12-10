"""
greedy algorithm thinking
find safe choice --> reduce problem recursively using safe choice

You have a knapsack of weight W and you want to use it to carry maximum value of items (a,b,c,d) with weights (w1,w2,w3,w4)

Safe choice is: pick item of highest value…use it to reduce problem from filling W to filling W-wi till reaching W=0 or approaches 0
"""

def get_optimal_value(capacity, weights, values):
    value = 0.0
    valuesWithWeights=zip(values,weights)
    valuesWithWeightsorted=sorted(list(valuesWithWeights),key=lambda x:x[0]/x[1],reverse=True)
    while (capacity>0) and (len(valuesWithWeightsorted)>0):
        consumedWeight=min(valuesWithWeightsorted[0][1],capacity)
        capacity-=consumedWeight
        print("current value: {} will add weight {} of item {}".format(value,consumedWeight,valuesWithWeightsorted[0][0]))
        value+=consumedWeight*(valuesWithWeightsorted[0][0]/valuesWithWeightsorted[0][1])
        print("new value: {}".format(value))
        valuesWithWeightsorted.remove(valuesWithWeightsorted[0])