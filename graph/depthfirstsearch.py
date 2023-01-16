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


"""
this use of depth first search is focused on counting how many islands 
in the graph so every componentIdx updated represents a part of graph 
that is isolated from other parts

for instance this graph adjancency matrix
4 vertices 1,2,3,4
the following edges exist
1 2
3 2

so 1,2,3 are connected representing one component while the vertex 4 is isolated as another compoenet
"""
def countComponents(adj):
    listOfVertexObjects=[Vertex(ix, adj[ix]) for ix in range(len(adj))]
    visited=[]
    components={}
    componentIdx=1
    
    for vrtx in listOfVertexObjects:
        exploreAndCountComponents(listOfVertexObjects,vrtx,visited, componentIdx, components)
        componentIdx+=1
    
    return len(components.keys())


def exploreAndCountComponents(listOfVertices,vrtx,visited, compId, components):
    if len(vrtx.initialAdj)==0 :
        if compId not in components.keys():components.update({compId:[vrtx.label]})
        else:
            components[compId].append(vrtx.label)
    for vtxId in vrtx.initialAdj:
        vtx=listOfVertices[vtxId]
        if (vtxId,vrtx.label) in visited: continue
        visited.append((vtxId,vrtx.label))
        if compId not in components.keys():components.update({compId:[vtxId]})
        else:
            components[compId].append(vtxId)
        vrtx.connectionList.add(vtxId)
        newSet=exploreAndCountComponents(listOfVertices,vtx,visited, compId, components)
        if newSet: vrtx.connectionList=vrtx.connectionList|newSet
    
    return vrtx.connectionList