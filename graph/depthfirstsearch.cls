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
    quit:adjancent="" ""
    set ptr=0
    while $listnext(adjancent,ptr,currentVertex){
        set visited=$g(vertexConnections(vertex))
        continue:($listvalid(visited) && $LISTFIND(visited,currentVertex))
        if ('$listvalid(visited) || '$LISTFIND(visited,currentVertex)) {
            set visited=$SELECT(visited="":$lb(currentVertex),1:visited_$lb(currentVertex)) 
        }
        set vertexConnections(vertex)=visited
        set extraSet=..Explore(currentVertex,.adjanceyListArr, .vertexConnections)
        continue:extraSet=""
        set ltr=0
        while $LISTNEXT(extraSet,ltr,curVal){
            continue:$lf(visited,curVal)
            set vertexConnections(vertex)=visited_$lb(curVal)
        }
    }

    Return $g(vertexConnections(vertex))
}

ClassMethod DepthFirstSearchCountComponents(ByRef adjanceyListArr, ByRef vertexConnections, ByRef components) As %Integer
{
    
    set compId=1
    set vertex=""
    for  {
        set vertex=$O(adjanceyListArr(vertex))
        quit:vertex=""
        do ..ExploreComps(vertex,.adjanceyListArr, .vertexConnections, .components, compId)
        set compId= $I(compId)
    }
    set cnt=0
    set idx=""
    for  {
        set idx=$O(components(idx))
        quit:idx=""
        set cnt=$I(cnt)
    }
    Return cnt
}

/// explore
ClassMethod ExploreComps(vertex, ByRef adjanceyListArr, ByRef vertexConnections, ByRef components, compid) As %List
{
    Set sc = $$$OK
    set adjancent=$g(adjanceyListArr(vertex))
    
    if adjancent="" {
        
        set components(compid)=$SELECT($g(components(compid))="":$lb(vertex),1:$g(components(compid))_$lb(vertex))
        quit ""
    }
    set ptr=0
    while $listnext(adjancent,ptr,currentVertex){
        set visited=$g(vertexConnections(vertex))
        continue:($listvalid(visited) && $LISTFIND(visited,currentVertex))
        if ('$listvalid(visited) || '$LISTFIND(visited,currentVertex)) {
            set visited=$SELECT(visited="":$lb(currentVertex),1:visited_$lb(currentVertex)) 
        }
        set vertexConnections(vertex)=visited
        set extraSet=..ExploreComps(currentVertex,.adjanceyListArr, .vertexConnections,.components,compid)
        continue:extraSet=""
        set ltr=0
        while $LISTNEXT(extraSet,ltr,curVal){
            continue:$lf(visited,curVal)
            set vertexConnections(vertex)=visited_$lb(curVal)
        }
        set components(compid)=$SELECT($g(components(compid))="":$lb(vertex),1:$g(components(compid))_$lb(vertex))
    }

    Return $g(vertexConnections(vertex))
}

}
