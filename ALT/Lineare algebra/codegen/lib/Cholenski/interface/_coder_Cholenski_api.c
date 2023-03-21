/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_Cholenski_api.c
 *
 * MATLAB Coder version            : 5.5
 * C/C++ source code generated on  : 11-Mar-2023 13:54:33
 */

/* Include Files */
#include "_coder_Cholenski_api.h"
#include "_coder_Cholenski_mex.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;

emlrtContext emlrtContextGlobal = {
    true,                                                 /* bFirstTime */
    false,                                                /* bInitialized */
    131627U,                                              /* fVersionInfo */
    NULL,                                                 /* fErrorFunction */
    "Cholenski",                                          /* fFunctionName */
    NULL,                                                 /* fRTCallStack */
    false,                                                /* bDebugMode */
    {2045744189U, 2170104910U, 2743257031U, 4284093946U}, /* fSigWrd */
    NULL                                                  /* fSigMem */
};

/* Function Declarations */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[25];

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[25];

static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *A,
                                 const char_T *identifier))[25];

static const mxArray *emlrt_marshallOut(const real_T u[25]);

/* Function Definitions */
/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *u
 *                const emlrtMsgIdentifier *parentId
 * Return Type  : real_T (*)[25]
 */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[25]
{
  real_T(*y)[25];
  y = c_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *src
 *                const emlrtMsgIdentifier *msgId
 * Return Type  : real_T (*)[25]
 */
static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[25]
{
  static const int32_T dims[2] = {5, 5};
  real_T(*ret)[25];
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 2U,
                          (const void *)&dims[0]);
  ret = (real_T(*)[25])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *A
 *                const char_T *identifier
 * Return Type  : real_T (*)[25]
 */
static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *A,
                                 const char_T *identifier))[25]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[25];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(sp, emlrtAlias(A), &thisId);
  emlrtDestroyArray(&A);
  return y;
}

/*
 * Arguments    : const real_T u[25]
 * Return Type  : const mxArray *
 */
static const mxArray *emlrt_marshallOut(const real_T u[25])
{
  static const int32_T iv[2] = {0, 0};
  static const int32_T iv1[2] = {5, 5};
  const mxArray *m;
  const mxArray *y;
  y = NULL;
  m = emlrtCreateNumericArray(2, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m, &iv1[0], 2);
  emlrtAssign(&y, m);
  return y;
}

/*
 * Arguments    : const mxArray *prhs
 *                const mxArray **plhs
 * Return Type  : void
 */
void Cholenski_api(const mxArray *prhs, const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  real_T(*A)[25];
  real_T(*L)[25];
  st.tls = emlrtRootTLSGlobal;
  L = (real_T(*)[25])mxMalloc(sizeof(real_T[25]));
  /* Marshall function inputs */
  A = emlrt_marshallIn(&st, emlrtAlias(prhs), "A");
  /* Invoke the target function */
  Cholenski(*A, *L);
  /* Marshall function outputs */
  *plhs = emlrt_marshallOut(*L);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void Cholenski_atexit(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  Cholenski_xil_terminate();
  Cholenski_xil_shutdown();
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void Cholenski_initialize(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, NULL);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void Cholenski_terminate(void)
{
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/*
 * File trailer for _coder_Cholenski_api.c
 *
 * [EOF]
 */
