#include <iostream>
#include <fstream>

#include "ao/ao.h"
#include "ao/tree/opcode.hpp"
#include "ao/tree/tree.hpp"
#include "ao/tree/template.hpp"
#include "ao/render/brep/region.hpp"
#include "ao/render/brep/contours.hpp"
#include "ao/render/brep/mesh.hpp"

using namespace Kernel;

extern "C" {

bool ao_tree_save_mesh_spread(ao_tree tree, float lx, float ux, float ly, float uy, float lz, float uz,
                              float res, const char* f);
 
ao_contours* ao_tree_render_slice_spread(ao_tree tree, float lx, float ux, float ly, float uy, 
                                         float z, float res);

ao_pixels* ao_tree_render_pixels_spread(ao_tree tree, float lx, float ux, float ly, float uy, 
                                        float z, float res);

bool ao_tree_save_slice_spread(ao_tree tree, float lx, float ux, float ly, float uy, float z,
                               float res, const char* f);

ao_mesh* ao_tree_render_mesh_spread(ao_tree tree, float lx, float ux, float ly, float uy, float lz, float uz,
                                    float res);
  
}

bool ao_tree_save_mesh_spread(ao_tree tree, float lx, float ux, float ly, float uy, float lz, float uz,
                              float res, const char* f) {
  ao_region3 region = {{lx, ux}, {ly, uy}, {lz, uz}};
  return ao_tree_save_mesh(tree, region, res, f);
}
 
ao_contours* ao_tree_render_slice_spread(ao_tree tree, float lx, float ux, float ly, float uy, 
                                         float z, float res) {
  ao_region2 region = {{lx, ux}, {ly, uy}};
  return ao_tree_render_slice(tree, region, z, res);
}

ao_pixels* ao_tree_render_pixels_spread(ao_tree tree, float lx, float ux, float ly, float uy, 
                                          float z, float res) {
  ao_region2 region = {{lx, ux}, {ly, uy}};
  return ao_tree_render_pixels(tree, region, z, res);
}

bool ao_tree_save_slice_spread(ao_tree tree, float lx, float ux, float ly, float uy, float z,
                                 float res, const char* f) {
  Region<2> region({lx, ly}, {ux, uy}, Region<2>::Perp(z));
  auto cs = Contours::render(*tree, region, 1/res);
  cs->saveSVG(f);
  return 0;
}

ao_mesh* ao_tree_render_mesh_spread(ao_tree tree, float lx, float ux, float ly, float uy, float lz, float uz,
                                    float res) {
  ao_region3 region = {{lx, ux}, {ly, uy}, {lz, uz}};
  return ao_tree_render_mesh(tree, region, res);
}
  
