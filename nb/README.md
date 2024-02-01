## Downstream Impact

We've included some tests to show how dataset issues can lead to bias in downstream research. We've recreated their methodology, reused their code or taken the original results as given, depending on the analysis. The notebooks are largely, but not completely, plug-and-play: datasets should be downloaded from their original sources (or extracted, such as the data provided in the `./data/per_packet_data.tar.gz` file) and the directory specified in the notebook files where necessary. Some flags also may need to be modified.

We also include the original CADE repository alongside the modified data used in our experiments and instructions detailing our experimental process. Due to the size of the data, we've split it up into .zip partfiles, which must be recombined before converting back into .npz files.
