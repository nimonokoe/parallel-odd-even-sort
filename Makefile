
SRCS := $(wildcard *.c)
OBJS := $(subst .c,.o,$(SRCS))
PROGRAM := Sort1

############################################################
################Settings for Compile########################
############################################################

CXX := gcc-4.9
CXXFLAGS := -g -Wall
LDFLAGS := -lm -fopenmp -std=c11

################# For OpenGL Compile #######################
# OPENGL_CFLAGS  = -I.
# OPENGL_LDFLAGS = -lglut -lGLU -lGL -lm

################# For OpenCV Compile #######################
# OPENCV_CFLAGS = `pkg-config opencv --cflags`
# OPENCV_LIBS   = `pkg-config opencv --libs`
# GLUT_CFLAGS = `pkg-config gl --cflags` `pkg-config glu --cflags`
# GLUT_LIBS   = `pkg-config gl --libs` `pkg-config glu --libs` -lglut
# INCLUDE = -I./

############################################################
############################################################



all:$(PROGRAM)


#make executable files
$(PROGRAM): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(OPENGL_CFLAGS) $(OPENGL_LDFLAGS) $(OPENCV_CFLAGS) $(OPENCV_LIBS) $(LDFLAGS)


#make object files
.c.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(OPENGL_CFLAGS) $(OPENGL_LDFLAGS) $(OPENCV_CFLAGS) $(OPENCV_LIBS) $(LDFLAGS)


.PHONY: clean depend
clean:
	rm $(OBJS) $(PROGRAM)

depend:
	makedepend -- $(CXXFLAGS) $(OPENGL_CFLAGS) $(OPENGL_LDFLAGS) $(OPENCV_CFLAGS) $(OPENCV_LIBS) $(LDFLAGS) -- $(SRCS)

