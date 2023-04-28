"""
supposing that adjacency list is passed as a python list
i.e:
1 -> 2,4
2 ->
3 -> 2
4 -> 3

as [[1,3],[],[1],[2]] << index -1 for python
where each node is a list of its direct connections
"""
import math


def dijkstra(adj, startNode):
    # initialize all distances to infinity and previous to None as all nodes never explored
    distance=[math.inf] * len(adj)
    previous=[None]*len(adj)
    distance[startNode]=0
    priorityQueue=[(0,startNode)] #distance values, node idx, priority queue serves as base for the loop to explore nodes based on node with shortest distance found so far
    while priorityQueue:
        priorityQueue.sort(key=lambda x:x[0]) #sort queue so 0th element will be the min distance node
        currentNode=priorityQueue[0]
        currentNodeIdx=currentNode[1]
        currentNodeDistance=currentNode[0]
        for node in range(len(adj[currentNodeIdx])):
            nodeValue=adj[currentNodeIdx][node]
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

