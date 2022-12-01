using QuadMeshGame
using PlotQuadMesh
QM = QuadMeshGame
PQ = PlotQuadMesh

##
vertices = [0. 0. 1. 1. 2. 2.
            0. 1. 0. 1. 0. 1.]
connectivity = [1 3 4 2
                3 5 6 4]'
mesh = QM.QuadMesh(vertices, connectivity)

fig = PQ.plot_mesh(QM.active_vertex_coordinates(mesh), QM.active_quad_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/quad/flip-0.png")

QM.left_flip!(mesh, 1, 2)
fig = PQ.plot_mesh(QM.active_vertex_coordinates(mesh), QM.active_quad_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/quad/flip-1.png")

mesh = QM.QuadMesh(vertices, connectivity)
fig = PQ.plot_mesh(QM.active_vertex_coordinates(mesh), QM.active_quad_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/quad/flip-2.png")

QM.right_flip!(mesh, 1, 2)
fig = PQ.plot_mesh(QM.active_vertex_coordinates(mesh), QM.active_quad_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/quad/flip-3.png")
##

##
vertices = [0. 0. 0. 1. 1. 1. 2. 2. 2.
            0. .5 1. 0. .5 1. 0. .5 1.]
connectivity = [1 4 5 2
                2 5 6 3
                4 7 8 5
                5 8 9 6]'
mesh = QM.QuadMesh(vertices, connectivity)
fig = PQ.plot_mesh(QM.active_vertex_coordinates(mesh), QM.active_quad_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/quad/split-0.png")

QM.split!(mesh, 1, 3)
QM.averagesmoothing!(mesh)
fig = PQ.plot_mesh(QM.active_vertex_coordinates(mesh), QM.active_quad_connectivity(mesh))
fig.tight_layout()
fig.savefig("figures/quad/split-1.png")
##

