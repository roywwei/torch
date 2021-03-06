% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R, R/gen-namespace.R
\name{torch_irfft}
\alias{torch_irfft}
\title{Irfft}
\usage{
torch_irfft(
  self,
  signal_ndim,
  normalized = FALSE,
  onesided = TRUE,
  signal_sizes = list()
)
}
\arguments{
\item{self}{(Tensor) the input tensor of at least \code{signal_ndim} \code{+ 1}        dimensions}

\item{signal_ndim}{(int) the number of dimensions in each signal.        \code{signal_ndim} can only be 1, 2 or 3}

\item{normalized}{(bool, optional) controls whether to return normalized results.        Default: \code{FALSE}}

\item{onesided}{(bool, optional) controls whether \code{input} was halfed to avoid        redundancy, e.g., by \code{\link[=torch_rfft]{torch_rfft()}}. Default: \code{TRUE}}

\item{signal_sizes}{(list or \code{torch.Size}, optional) the size of the original        signal (without batch dimension). Default: \code{NULL}}
}
\description{
Irfft
}
\note{
\preformatted{Due to the conjugate symmetry, `input` do not need to contain the full
complex frequency values. Roughly half of the values will be sufficient, as
is the case when `input` is given by [`~torch.rfft`] with
`rfft(signal, onesided=TRUE)`. In such case, set the `onesided`
argument of this method to `TRUE`. Moreover, the original signal shape
information can sometimes be lost, optionally set `signal_sizes` to be
the size of the original signal (without the batch dimensions if in batched
mode) to recover it with correct shape.

Therefore, to invert an [torch_rfft()], the `normalized` and
`onesided` arguments should be set identically for [torch_irfft()],
and preferably a `signal_sizes` is given to avoid size mismatch. See the
example below for a case of size mismatch.

See [torch_rfft()] for details on conjugate symmetry.
}

The inverse of this function is \code{\link[=torch_rfft]{torch_rfft()}}.

\preformatted{For CUDA tensors, an LRU cache is used for cuFFT plans to speed up
repeatedly running FFT methods on tensors of same geometry with same
configuration. See cufft-plan-cache for more details on how to
monitor and control the cache.
}
}
\section{irfft(input, signal_ndim, normalized=False, onesided=TRUE, signal_sizes=NULL) -> Tensor }{


Complex-to-real Inverse Discrete Fourier Transform

This method computes the complex-to-real inverse discrete Fourier transform.
It is mathematically equivalent with \code{\link{torch_ifft}} with differences only in
formats of the input and output.

The argument specifications are almost identical with \code{\link{torch_ifft}}.
Similar to \code{\link{torch_ifft}}, if \code{normalized} is set to \code{TRUE},
this normalizes the result by multiplying it with
\eqn{\sqrt{\prod_{i=1}^K N_i}} so that the operator is unitary, where
\eqn{N_i} is the size of signal dimension \eqn{i}.
}

\section{Warning}{

Generally speaking, input to this function should contain values
following conjugate symmetry. Note that even if \code{onesided} is
\code{TRUE}, often symmetry on some part is still needed. When this
requirement is not satisfied, the behavior of \code{\link{torch_irfft}} is
undefined. Since \code{torch_autograd.gradcheck} estimates numerical
Jacobian with point perturbations, \code{\link{torch_irfft}} will almost
certainly fail the check.


For CPU tensors, this method is currently only available with MKL. Use
\code{torch_backends.mkl.is_available} to check if MKL is installed.
}

\examples{
if (torch_is_installed()) {

x = torch_randn(c(4, 4))
torch_rfft(x, 2, onesided=TRUE)
x = torch_randn(c(4, 5))
torch_rfft(x, 2, onesided=TRUE)
y = torch_rfft(x, 2, onesided=TRUE)
torch_irfft(y, 2, onesided=TRUE, signal_sizes=c(4,5))  # recover x
}
}
