# torch (development version)

- Expanded the `utils_data_default_collate` to support converting R objects to
  torch tensors when needed. (#269) 
- Fixed bug that made `RandomSampler(replacement = TRUE)` to never take the last
  element in the dataset. (84861fa)
- Fixed `torch_topk` and `x$topk` so the returned indexes are 1-based (#280)
- Fixed a bug (#275) that would cause `1 - torch_tensor(1, device = "cuda")` to 
  fail because `1` was created in the CPU. (#279)

# torch 0.1.0

- Added many missing losses (#252)
- Implemented the `$<-` and `[[<-` operators for the `nn_module` class. (#253)
- Export `nn_parameter`, `nn_buffer`, and `is_*` auxiliary functions.
- Added a new serialization vignette.
- Added a few learning rate schedulers (#258)

# torch 0.0.2

* Added a `NEWS.md` file to track changes to the package.
* Auto install when loading the package for the first time.
