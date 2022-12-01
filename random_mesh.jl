using RandomQuadMesh
using TriMeshGame
using MeshPlotter

RQ = RandomQuadMesh
TM = TriMeshGame
MP = MeshPlotter


boundary_points = RQ.random_polygon(20)
boundary_desired_degree = TM.get_desired_degree.(TM.get_polygon_interior_angles(boundary_points))

bp = [boundary_points[:,[1:end;1]]]
p, t = RQ.polytrimesh(bp, [], 0.2)
mesh = TM.Mesh(p, t)

initial_boundary_point = falses(size(p,2))
initial_boundary_point[1:size(boundary_points,2)] .= true

new_boundary_point = .!initial_boundary_point .& mesh.vertex_on_boundary[mesh.active_vertex]
interior_vertices = .!mesh.vertex_on_boundary[mesh.active_vertex]

d0 = zeros(Int, size(p,2))
d0[1:length(boundary_desired_degree)] .= boundary_desired_degree
d0[new_boundary_point] .= 4
d0[interior_vertices] .= 6

env = TM.GameEnv(mesh, d0, 100)
fig = MP.plot_mesh(TM.active_vertex_coordinates(env.mesh), TM.active_triangle_connectivity(env.mesh),
vertex_score = env.vertex_score[env.mesh.active_vertex], fontsize = 10)

fig.tight_layout()
fig
fig.savefig("figures/triangle/random_polygon_with_score.png")