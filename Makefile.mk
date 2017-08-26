stanza_ao_all: ${GEN}/ao.pkg ${GEN}/ao-gfx.pkg ${GEN}/ao-eval.pkg

LIBS += -lao-kernel # ${GEN}/ao.o

ALL_PKG_DEPS += stanza_ao_all

# ${GEN}/ao.o: stanza-ao/ao.cpp
# 	c++ -std=c++11 -I/usr/local/include/eigen3 -c stanza-ao/ao.cpp ${CFLAGS} -o ${GEN}/ao.o

${GEN}/ao-repl.pkg: stanza-ao/ao-repl.stanza ${GEN}/geom.pkg ${GEN}/ao.pkg ${GEN}/glu.pkg ${GEN}/font.pkg
	stanza $< $(STZ_FLAGS)

${GEN}/eval-ao-repl.stanza: ${GEN}/gen-repl ${GEN}/eval.pkg ${GEN}/ao-repl.pkg 
	${GEN}/gen-repl ao-repl

${GEN}/eval-ao-repl.pkg: ${GEN}/eval-ao-repl.stanza 
	stanza ${GEN}/eval-ao-repl.stanza $(STZ_FLAGS)

${GEN}/ao.pkg: stanza-ao/ao.stanza ${GEN}/utils.pkg ${GEN}/geom.pkg ${GEN}/font.pkg ${GEN}/glu.pkg # ${GEN}/ao.o
	stanza $< $(STZ_FLAGS)

# ${GEN}/eval-ao.stanza: ${GEN}/gen-repl ${GEN}/ao.pkg
# 	${GEN}/gen-repl ao
# 
# ${GEN}/eval-ao.pkg: ${GEN}/eval-ao.stanza ${BASE_EVAL_PKGS} ${GEN}/eval-utils.pkg ${GEN}/eval-geom.pkg ${GEN}/eval-font.pkg ${GEN}/eval-glu.pkg ${GEN}/ao.pkg
# 	stanza $< $(STZ_FLAGS)

${GEN}/ao-gfx.pkg: stanza-ao/ao-gfx.stanza ${GEN}/gl.pkg ${GEN}/geom.pkg ${GEN}/geom-gfx.pkg ${GEN}/ao.pkg
	stanza $< $(STZ_FLAGS)

${GEN}/ao-eval.pkg: stanza-ao/ao-eval.stanza ${GEN}/utils.pkg ${GEN}/eval.pkg ${GEN}/geom.pkg ${GEN}/glu.pkg ${GEN}/ao.pkg ${GEN}/font.pkg ${GEN}/eval-ao-repl.pkg
	stanza $< $(STZ_FLAGS)

# ${GEN}/plates.pkg: stanza-ao/plates.stanza ${GEN}/utils.pkg ${GEN}/geom.pkg ${GEN}/ao.pkg
# 	stanza $< $(STZ_FLAGS)

# ${GEN}/eval-plates.stanza: ${GEN}/gen-repl ${GEN}/plates.pkg
# 	${GEN}/gen-repl plates

# ${GEN}/eval-plates.pkg: ${GEN}/eval-plates.stanza ${BASE_EVAL_PKGS} ${GEN}/eval-utils.pkg ${GEN}/eval-geom.pkg ${GEN}/eval-font.pkg ${GEN}/eval-glu.pkg ${GEN}/eval-ao.pkg ${GEN}/plates.pkg
# 	stanza $< $(STZ_FLAGS)

# ${GEN}/plates-eval.pkg: stanza-ao/plates.stanza ${GEN}/utils.pkg ${GEN}/eval.pkg ${GEN}/geom.pkg ${GEN}/glu.pkg ${GEN}/ao.pkg ${GEN}/eval-ao.pkg ${GEN}/plates.pkg ${GEN}/eval-plates.pkg 
# 	stanza $< $(STZ_FLAGS)

