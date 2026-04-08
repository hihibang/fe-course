import Child from "./Child.jsx"

function Propscomp() {
    return (
        <h1>Propscomponent!!!!!</h1>
    )
}

export default function Parent() {
    return (
        <> 
        {/* 최상위 태그로 묶어줘야 함(div 혹은 빈 태그)   */}
        <Child>
            <Propscomp />
        </Child>
        </>
    )
}