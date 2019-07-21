mutable struct Node
    value::Int64
    parent::Union{Node, Nothing}
    left::Node
    right::Node
    
    Node(value::Int64) = new(value, nothing)
    Node(value::Int64, parent::Union{Node, Nothing}) = new(value, parent)
end

function insert(value::Int64, root::Node)::Node
    if value ≤ root.value
        if !isdefined(root, :left)
            root.left = Node(value, root)
        else
            root.left = insert(value, root.left)
        end
    else
        if !isdefined(root, :right)
            root.right = Node(value, root)
        else
            root.right = insert(value, root.right)
        end
    end
    return root
end

function find(value::Int64, root::Node)::Union{Node, Nothing}
    if value == root.value
        return root
    elseif value < root.value && isdefined(root, :left)
        return find(value, root.left)
    elseif value > root.value && isdefined(root, :right)
        return find(value, root.right)
    else
        return nothing
    end
end

function delete(value::Int64, root::Node)::Union{Node, Nothing}
    
end

root = Node(9)
root = insert(10, root)
show(find(10, root))
println("")
show(find(11, root))
