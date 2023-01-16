import sys

class Vertex:
    def __init__(self,label,initialAdj):
        self.label=label
        self.initialAdj=initialAdj
        self.connectionList=set()

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
def depth_first_search(adj):
    listOfVertexObjects=[Vertex(ix, adj[ix]) for ix in range(len(adj))]
    visited=[]
    for vrtx in listOfVertexObjects:
        explore(listOfVertexObjects,vrtx,visited)
    return listOfVertexObjects


def explore(listOfVertices,vrtx,visited):
    
    for vtxId in vrtx.initialAdj:
        vtx=listOfVertices[vtxId]
        if (vtxId,vrtx.label) in visited: continue
        visited.append((vtxId,vrtx.label))
        vrtx.connectionList.add(vtxId)
        newSet=explore(listOfVertices,vtx,visited)
        if newSet: vrtx.connectionList=vrtx.connectionList|newSet
    return vrtx.connectionList