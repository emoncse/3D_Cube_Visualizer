#version 330 core
out vec4 FragColor;

in vec3 FragPos;
in vec3 Normal;
in vec2 TexCoords;

uniform sampler2D texture_diffuse1;

void main()
{
    vec3 color = texture(texture_diffuse1, TexCoords).rgb;
    vec3 ambient = 0.1 * color;

    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(vec3(1.0, 1.0, 1.0));
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * color;

    FragColor = vec4(ambient + diffuse, 1.0);
}
