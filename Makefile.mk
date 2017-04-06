stanza_ao_all: ${GEN}/ao.pkg ${GEN}/ao-gfx.pkg ${GEN}/ao-eval.pkg

LIBS += -lao

ALL_PKG_DEPS += stanza_ao_all

${GEN}/ao.pkg: stanza-ao/ao.stanza ${GEN}/utils.pkg ${GEN}/geom.pkg ${GEN}/font.pkg ${GEN}/glu.pkg
	stanza $< $(STZ_FLAGS)

${GEN}/eval-ao.stanza: ${GEN}/gen-repl ${GEN}/ao.pkg
	${GEN}/gen-repl ao

${GEN}/eval-ao.pkg: ${GEN}/eval-ao.stanza ${BASE_EVAL_PKGS} ${GEN}/eval-utils.pkg ${GEN}/eval-geom.pkg ${GEN}/eval-font.pkg ${GEN}/eval-glu.pkg ${GEN}/ao.pkg
	stanza $< $(STZ_FLAGS)

${GEN}/ao-gfx.pkg: stanza-ao/ao-gfx.stanza ${GEN}/gl.pkg ${GEN}/geom.pkg ${GEN}/geom-gfx.pkg ${GEN}/ao.pkg
	stanza $< $(STZ_FLAGS)

${GEN}/ao-eval.pkg: stanza-ao/ao-eval.stanza ${GEN}/utils.pkg ${GEN}/eval.pkg ${GEN}/geom.pkg ${GEN}/glu.pkg ${GEN}/ao.pkg ${GEN}/font.pkg ${GEN}/eval-ao.pkg
	stanza $< $(STZ_FLAGS)

# ${GEN}/plates.pkg: stanza-ao/plates.stanza ${GEN}/utils.pkg ${GEN}/geom.pkg ${GEN}/ao.pkg
# 	stanza $< $(STZ_FLAGS)

# ${GEN}/eval-plates.stanza: ${GEN}/gen-repl ${GEN}/plates.pkg
# 	${GEN}/gen-repl plates

# ${GEN}/eval-plates.pkg: ${GEN}/eval-plates.stanza ${BASE_EVAL_PKGS} ${GEN}/eval-utils.pkg ${GEN}/eval-geom.pkg ${GEN}/eval-font.pkg ${GEN}/eval-glu.pkg ${GEN}/eval-ao.pkg ${GEN}/plates.pkg
# 	stanza $< $(STZ_FLAGS)

# ${GEN}/plates-eval.pkg: stanza-ao/plates.stanza ${GEN}/utils.pkg ${GEN}/eval.pkg ${GEN}/geom.pkg ${GEN}/glu.pkg ${GEN}/ao.pkg ${GEN}/eval-ao.pkg ${GEN}/plates.pkg ${GEN}/eval-plates.pkg 
# 	stanza $< $(STZ_FLAGS)

