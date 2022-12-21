"""
knapsack problem is either
-fractional: you can take fraction of each item..in this case greedy will work
-discrete:in this case greedy won't work
    it has two natures-->both solved by dynamic progremming
    - repeating: u can repeat items into knapsack (items unlimited)
        u make an array of the capacity of the kanpsack and fill it gradually with the best option at each capacity point index.
        like the primitive calculator solution
    - non repeating: u can't repeat items into knapsack (items exhaustive)
        u make a multi dimensional array (like the edit distance solution) of item vs kanpsack capacity
        and gradually fill each point with the bext option at the end of the array--> u will get the final value.
    
"""
# this is a discrete non repititive knapsack problem 
def optimal_weight(W, wt):
    if len(wt)==0:return 0
    if len(wt)==1:return wt[0]*W
    #w.insert(0,0)
    wt.sort()
    K=[[0]*(W+1) for z in range(len(wt)+1)]
    #+1 in length so the current value would be index-1
    for i in range(len(wt)+1):
        for w in range(W+1):
            if i == 0 or w == 0:
                K[i][w] = 0
            elif wt[i-1] <= w:
                #if the current value wt[i-1] less than current weigth w, check which is maximum
                #the current weight wt[i-1] + maximum weight of the subproblem w-wt[i-1] before the current weight i k[i-1] 
                #or last known maximum value [i-1] of this weight limit W[w]
                
                K[i][w] = max(wt[i-1]
                          + K[i-1][w-wt[i-1]], 
                              K[i-1][w])
            else:
                #set to last known maximum value [i-1] of this weight limit W[w]
                K[i][w] = K[i-1][w]
                
        
           
    #for f in K:print(f)
    return K[-1][-1]