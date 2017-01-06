stanza_ao_all: ${GEN}/ao.pkg ${GEN}/ao-gfx.pkg ${GEN}/ao-eval.pkg

LIBS += -lao

ALL_PKG_DEPS += stanza_ao_all

${GEN}/ao.pkg: stanza-geom/ao.stanza ${GEN}/utils.pkg ${GEN}/geom.pkg ${GEN}/font.pkg ${GEN}/glu.pkg
	stanza $< $(STZ_FLAGS)

${GEN}/ao-gfx.pkg: stanza-geom/ao-gfx.stanza ${GEN}/gl.pkg ${GEN}/geom.pkg ${GEN}/geom-gfx.pkg ${GEN}/ao.pkg
	stanza $< $(STZ_FLAGS)

${GEN}/ao-eval.pkg: stanza-geom/ao-eval.stanza ${GEN}/utils.pkg ${GEN}/eval.pkg ${GEN}/geom.pkg ${GEN}/glu.pkg ${GEN}/ao.pkg ${GEN}/font.pkg
	stanza $< $(STZ_FLAGS)


