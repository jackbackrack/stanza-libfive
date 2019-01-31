// See license.txt for details about licensing.

#include <iostream>
#include <fstream>

#include "libfive.h"
#include "libfive/tree/opcode.hpp"
#include "libfive/tree/tree.hpp"
// #include "libfive/tree/template.hpp"
#include "libfive/render/brep/region.hpp"
#include "libfive/render/brep/contours.hpp"
#include "libfive/render/brep/mesh.hpp"
#include "libfive/render/discrete/voxels.hpp"
#include "libfive/render/discrete/heightmap.hpp"

using namespace Kernel;

extern "C" {

float libfive_tree_eval_f_spread(libfive_tree tree, float x, float y, float z) {
  libfive_vec3 p = {x, y, z};
  return libfive_tree_eval_f(tree, p);
}

bool libfive_tree_save_mesh_spread(libfive_tree tree, float lx, float ux, float ly, float uy, float lz, float uz,
                                   float res, const char* f);
 
libfive_contours* libfive_tree_render_slice_spread(libfive_tree tree, float lx, float ux, float ly, float uy, 
                                                   float z, float res);

libfive_pixels* libfive_tree_render_pixels_spread(libfive_tree tree, float lx, float ux, float ly, float uy, 
                                                  float z, float res);

bool libfive_tree_save_slice_spread(libfive_tree tree, float lx, float ux, float ly, float uy, float z,
                                    float res, const char* f);

libfive_mesh* libfive_tree_render_mesh_spread(libfive_tree tree, float lx, float ux, float ly, float uy, float lz, float uz,
                                    float res);
  
bool libfive_tree_save_mesh_spread(libfive_tree tree, float lx, float ux, float ly, float uy, float lz, float uz,
                                   float res, const char* f) {
  libfive_region3 region = {{lx, ux}, {ly, uy}, {lz, uz}};
  return libfive_tree_save_mesh(tree, region, res, f);
}
 
libfive_contours* libfive_tree_render_slice_spread(libfive_tree tree, float lx, float ux, float ly, float uy, 
                                                  float z, float res) {
  libfive_region2 region = {{lx, ux}, {ly, uy}};
  return libfive_tree_render_slice(tree, region, z, res);
}

libfive_pixels* libfive_tree_render_pixels_spread(libfive_tree tree, float lx, float ux, float ly, float uy, 
                                                  float z, float res) {
  libfive_region2 region = {{lx, ux}, {ly, uy}};
  return libfive_tree_render_pixels(tree, region, z, res);
}

bool libfive_tree_save_slice_spread(libfive_tree tree, float lx, float ux, float ly, float uy, float z,
                                 float res, const char* f) {
  Region<2> region({lx, ly}, {ux, uy}, Region<2>::Perp(z));
  auto cs = Contours::render(*tree, region, 1/res);
  cs->saveSVG(f);
  return 0;
}

libfive_mesh* libfive_tree_render_mesh_spread(libfive_tree tree, float lx, float ux, float ly, float uy, float lz, float uz,
                                    float res) {
  libfive_region3 region = {{lx, ux}, {ly, uy}, {lz, uz}};
  return libfive_tree_render_mesh(tree, region, res);
}
  
}
