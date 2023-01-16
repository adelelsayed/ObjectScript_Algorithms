Class Custom.Algorithms.graph.depthfirstsearch
{

/// supposing that adjacency list is passed as a python list
/// i.e:
/// 1 -> 2,4
/// 2 ->
/// 3 -> 2
/// 4 -> 3
/// passed as an array
/// the output is vertexConnections array in which the entire possible path of each vertex is explored
/// for instance the above adjancey list will output arrx as:
/// arrx(1)=$lb(2,4,3,2)
/// arrx(3)=$lb(2)
/// arrx(4)=$lb(3,2)
ClassMethod DepthFirstSearch(ByRef adjanceyListArr, ByRef vertexConnections) As %Status
{
    Set sc = $$$OK
    set vertex=""
    for  {
        set vertex=$O(adjanceyListArr(vertex))
        quit:vertex=""
        do ..Explore(vertex,.adjanceyListArr, .vertexConnections)
    }
    Return sc
}

/// explore
ClassMethod Explore(vertex, ByRef adjanceyListArr, ByRef vertexConnections) As %List
{
    Set sc = $$$OK
    set adjancent=$g(adjanceyListArr(vertex))
    quit:'$listvalid(adjancent) sc
    set ptr=0
    while $listnext(adjancent,ptr,currentVertex){
        set visited=$g(vertexConnections(vertex))
        continue:($listvalid(visited) && $LISTFIND(visited,currentVertex))
        if ('$listvalid(visited) || '$LISTFIND(visited,currentVertex)) {
            set visited=$SELECT(visited="":$lb(currentVertex),1:visited_$lb(currentVertex)) 
        }
        
        set extraSet=..Explore(currentVertex,.adjanceyListArr, .vertexConnections)
        set vertexConnections(vertex)=visited_extraSet
    }

    Return $g(vertexConnections(vertex))
}

}
