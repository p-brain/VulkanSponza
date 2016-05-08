#version 450

#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable

layout (location = 0) in vec3 inPos;
layout (location = 1) in vec2 inUV;
layout (location = 3) in vec3 inNormal;

layout (binding = 0) uniform UBO 
{
	mat4 projection;
	mat4 model;
} ubo;

layout (location = 0) out vec3 outUV;

void main() 
{
	outUV = vec3(inUV.st, inNormal.z);
	gl_Position = ubo.projection * ubo.model * vec4(inPos.xyz, 1.0);
}
