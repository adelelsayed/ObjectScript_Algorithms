Class Custom.Algorithms.DynamicProgramming.EditDistance
{

/// Description
ClassMethod FindEditDistance(strA As %String, strB As %String) As %Integer
{
    Set retVal = ""
    return:'$l(strA) $l(strB)
    return:'$l(strB) $l(strA)
    set Arr=""
    for ix=0:1:$l(strA) {
        for iy=0:1:$l(strB){
            set Arr(ix,iy)=0
            if ('ix && 'iy) continue
            if 'ix {
                set Arr(ix,iy)=iy
                continue
            }
            if 'iy {
                set Arr(ix,iy)=ix
                continue
            }
            if ($e(strA,ix)=$e(strB,iy)){
                set Arr(ix,iy)=$g(Arr(ix-1,iy-1))
            }else{
                set Arr(ix,iy)=1+##class(Ens.Util.FunctionSet).Min($g(Arr(ix-1,iy-1)),$g(Arr(ix,iy-1)),$g(Arr(ix-1,iy)))
            }

        }
    }
    set retVal=$g(Arr($l(strA),$l(strB)))
    Return retVal
}

/// Description
ClassMethod findEditDistancePy(strA, strB) As %Integer [ Language = python ]
{
    """Finding the equality of strings OR how many changes to be done in strA to be equal to strB"""
    def edit_distance(s, t):
        if len(s)==0: return len(t)
        if len(t)==0: return len(s)
        # empty change table ..all values instantiated as 0..with adding one pure 0 row and #column
        arr=[(len(t)+1)*[0] for ix in range((len(s)+1))]
        for i in range((len(s)+1)):
            for j in range((len(t)+1)):
                if i==0 and j==0:continue
                if i==0:
                    arr[i][j]=j
                    continue
                if j==0:
                    arr[i][j]=i
                    continue
                
                if s[i-1]==t[j-1]:
                    arr[i][j]=arr[i-1][j-1]
                else: 
                    arr[i][j]=min(arr[i-1][j],arr[i][j-1],arr[i-1][j-1])+1

        return arr[-1][-1]
    return edit_distance(strA,strB)
}

}
