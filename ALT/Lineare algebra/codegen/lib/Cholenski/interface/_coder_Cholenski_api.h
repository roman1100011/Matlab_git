/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_Cholenski_api.h
 *
 * MATLAB Coder version            : 5.5
 * C/C++ source code generated on  : 11-Mar-2023 13:54:33
 */

#ifndef _CODER_CHOLENSKI_API_H
#define _CODER_CHOLENSKI_API_H

/* Include Files */
#include "emlrt.h"
#include "tmwtypes.h"
#include <string.h>

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void Cholenski(real_T A[25], real_T L[25]);

void Cholenski_api(const mxArray *prhs, const mxArray **plhs);

void Cholenski_atexit(void);

void Cholenski_initialize(void);

void Cholenski_terminate(void);

void Cholenski_xil_shutdown(void);

void Cholenski_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_Cholenski_api.h
 *
 * [EOF]
 */
