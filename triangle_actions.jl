using TriMeshGame
using MeshPlotter
TM = TriMeshGame
MP = MeshPlotter

##
function make_test_mesh()
    vertices = [0.0  1.0  0.5  0.5
                0.0  0.0  0.5 -0.5]
    connectivity = [1 1
                    2 4
                    3 2]
    mesh = TM.Mesh(vertices, connectivity)
    return mesh
end
##

##
mesh = make_test_mesh()
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/triangle-flip0.png")

TM.edgeflip!(mesh, 1, 3)
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/triangle-flip1.png")
##


##
mesh = make_test_mesh()
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/triangle-split0.png")

TM.split_interior_edge!(mesh, 1, 3)
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/triangle-split1.png")
##

##
vertices = [0.  0.  0.5 1.  1.  1.5 2.  2.
            -0.5    0.5 0.  -0.5    0.5 0.  -0.5    0.5]
connectivity = [1 1 2 3 3 6 6 6
                3 4 3 4 6 4 8 7
                2 3 5 6 5 7 5 8]
mesh = TM.Mesh(vertices, connectivity)
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/triangle-collapse0.png")

TM.collapse!(mesh, 4, 2)
TM.reindex!(mesh)
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/triangle-collapse1.png")
##

##
mesh = make_test_mesh()
vs = [1,1,-1,-1]
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh),
vertex_score = vs, vertex_size = 50, fontsize = 30)
fig.tight_layout()
fig.savefig("figures/triangle/vertex-irregularity")
##