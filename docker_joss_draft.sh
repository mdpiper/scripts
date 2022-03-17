# Compile a draft of a JOSS paper through Docker.
paper_dir=/Users/mpiper/projects/babelizer/paper
docker run --rm \
    --volume ${paper_dir}:/data \
    --user $(id -u):$(id -g) \
    --env JOURNAL=joss \
    openjournals/inara
