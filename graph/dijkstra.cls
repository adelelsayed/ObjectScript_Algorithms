Class Custom.Algorithms.graph.dijkstra
{

/*
    /// supposing that adjacency list is passed as a multidimensional array
    /// i.e:
    /// 1 -> 2,4
    /// 2 ->
    /// 3 -> 2
    /// 4 -> 3
    /// passed as an comma separated string of carret separated strings (multi dimenetional array)
    example :
    0^4^0^0^0^0^0^8^0,4^0^8^0^0^0^0^11^0,0^8^0^7^0^4^0^0^2,0^0^7^0^9^14^0^0^0,0^0^0^9^0^10^0^0^0,0^0^4^14^10^0^2^0^0,0^0^0^0^0^2^0^1^6,8^11^0^0^0^0^1^0^7,0^0^2^0^0^0^6^7^0
    is representing multi dimentional python list
    [[0, 4, 0, 0, 0, 0, 0, 8, 0],
			[4, 0, 8, 0, 0, 0, 0, 11, 0],
			[0, 8, 0, 7, 0, 4, 0, 0, 2],
			[0, 0, 7, 0, 9, 14, 0, 0, 0],
			[0, 0, 0, 9, 0, 10, 0, 0, 0],
			[0, 0, 4, 14, 10, 0, 2, 0, 0],
			[0, 0, 0, 0, 0, 2, 0, 1, 6],
			[8, 11, 0, 0, 0, 0, 1, 0, 7],
			[0, 0, 2, 0, 0, 0, 6, 7, 0]
			]
        */
ClassMethod Dijkstra(adjanceyListArr As %String, startNode As %Integer = 0) As %String [ Language = python ]
{
    import math
    
    adjx=adjanceyListArr.split(",")
    adj=[entry.split("^") for entry in adjx ]
    
    # initialize all distances to infinity and previous to None as all nodes never explored
    distance=[math.inf] * len(adj)
    previous=[None]*len(adj)
    distance[startNode]=0
    priorityQueue=[(0,startNode)] #distance values, node idx, priority queue serves as base for the loop to explore nodes based on node with shortest distance found so far
    
    while priorityQueue:
        priorityQueue.sort(key=lambda x:x[0]) #sort queue so 0th element will be the min distance node
        currentNode=priorityQueue[0]
        currentNodeIdx=currentNode[1]
        
        for node in range(len(adj[currentNodeIdx])):
            node=int(node)
            nodeValue=int(adj[currentNodeIdx][node])
            if not nodeValue: continue #skipping 0 distance
            if distance[node]>distance[currentNodeIdx]+nodeValue :
                # if new distance found through currentNode is shorter, update node to it
                
                newVal=distance[currentNodeIdx]+nodeValue
                distance[node]=newVal
                previous[node]=currentNodeIdx
                priorityQueue.append((newVal,node))
                
        del priorityQueue[0] #knock off explored node from queue
    print(distance)
    print(previous)
    return "END"
}

}
