using Revise
using RandomQuadMesh
using TriMeshGame
using MeshPlotter

TM = TriMeshGame
RQ = RandomQuadMesh
MP = MeshPlotter

boundary_points = RQ.random_polygon(50, scale = 0.)
mesh = RQ.tri_mesh(boundary_points; hmax = 0.25, allow_vertex_insert = true)
mesh = TM.Mesh(mesh.p, mesh.t)

d0 = fill(6, TM.num_vertices(mesh))
d0[1:size(boundary_points,2)] .= 4
env = TM.GameEnv(mesh, d0, 100)


TM.averagesmoothing!(mesh)
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/triangle/circle-delaunay.png")

mesh = TM.circlemesh(3)
fig = MP.plot_mesh(TM.active_vertex_coordinates(mesh), TM.active_triangle_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/triangle/circle-custom.png")
