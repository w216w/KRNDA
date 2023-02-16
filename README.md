# Kernel Reverse Neighborhood Discriminant Analysis

This repository contains the implementation files for the above paper. If you use this implementation, please cite our article and the following:

 @article{Zhu2022,
  title={Neighborhood linear discriminant analysis},
  author={Zhu, Fa and Gao, Junbin and Yang, Jian and Ye, Ning},
  journal={Pattern Recognition},
  volume={123},
  pages={108422},
  year={2022},
  publisher={Elsevier}
}

# Abstract
 Currently, Neighborhood linear discriminant analysis (nLDA) exploited the reverse nearest neighbors to avoid the assumption of linear discriminant analysis (LDA) that all samples from the same class are independently and identically distributed (i.i.d.). nLDA performs well when a dataset contains multimodal classes. However, in complex pattern recognition tasks, such as visual classification, the complex appearance variations caused by deformation, illumination and visual angle often generate non-linearity. Furthermore, the multimodal classes are not easy to be separated in lower dimensional feature space. One solution to these problems is to map the feature to a higher dimensional feature space for discriminant learning. Hence, in this paper, we employ kernel functions to map the original data to a higher dimensional feature space, where the non-linear multimodal classes can be better classified. We give the details of the deduction of the proposed Kernel Reverse Neighborhood Discriminant Analysis (KRNDA). The proposed KRNDA outperforms the original nLDA on most datasets of the UCI benchmark database. In high dimensional visual recognition tasks of handwritten digits recognition, object categorization and face recognition, our KRNDA achieves the best recognition results compared to several previous LDA-based discriminators.
