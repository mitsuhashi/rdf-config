export WORKDIR=/mnt/nas05/togovar/original/grch38/tgv2mogplus/
export RDFCONFIG=$WORKDIR/mitsuhashi/rdf-config/
export TSVDIR=$WORKDIR/downloads/gene_tsv/
export OUTDIR=$WORKDIR/jsonld/

#bundle exec rdf-config --config $RDFCONFIG/togovar --senbero
#bundle exec rdf-config --config $RDFCONFIG/togovar --schema > schema.svg

#
# Generate TogoVar JSON-LD with link to MoG+
#
echo Generate TogoVar JSON-LD with link to MoG+
mkdir -p $OUTDIR/togovar
cd $RDFCONFIG
bundle exec rdf-config --config config/togovar --format jsonld --convert $TSVDIR/404.tsv > $OUTDIR/togovar/togovar.jsonld

#
# Generate MoG+ JSON-LD with link to TogoVar 
#
echo Generate MoG+ JSON-LD with link to TogoVar 
mkdir -p $OUTDIR/mogplus
cd $RDFCONFIG
bundle exec rdf-config --config config/mogplus --format jsonld --convert $TSVDIR/404.tsv > $OUTDIR/mogplus/mogplus.jsonld
