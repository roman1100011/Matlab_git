/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: Cholenski.c
 *
 * MATLAB Coder version            : 5.5
 * C/C++ source code generated on  : 11-Mar-2023 13:54:33
 */

/* Include Files */
#include "Cholenski.h"
#include <math.h>
#include <string.h>

/* Function Declarations */
static int div_nde_s32_floor(int numerator);

/* Function Definitions */
/*
 * Arguments    : int numerator
 * Return Type  : int
 */
static int div_nde_s32_floor(int numerator)
{
  int i;
  if ((numerator < 0) && (numerator % 5 != 0)) {
    i = -1;
  } else {
    i = 0;
  }
  return numerator / 5 + i;
}

/*
 * Arguments    : const double A[25]
 *                double L[25]
 * Return Type  : void
 */
void Cholenski(const double A[25], double L[25])
{
  int i;
  int ia;
  int iac;
  int info;
  int j;
  int jmax;
  boolean_T exitg1;
  memcpy(&L[0], &A[0], 25U * sizeof(double));
  info = -2;
  j = 0;
  exitg1 = false;
  while ((!exitg1) && (j < 5)) {
    double c;
    double ssq;
    int idxA1j;
    int idxAjj;
    idxA1j = j * 5;
    idxAjj = idxA1j + j;
    ssq = 0.0;
    if (j >= 1) {
      for (jmax = 0; jmax < j; jmax++) {
        c = L[idxA1j + jmax];
        ssq += c * c;
      }
    }
    ssq = L[idxAjj] - ssq;
    if (ssq > 0.0) {
      ssq = sqrt(ssq);
      L[idxAjj] = ssq;
      if (j + 1 < 5) {
        int ia0;
        int idxAjjp1;
        ia0 = idxA1j + 6;
        idxAjjp1 = idxAjj + 6;
        if (j != 0) {
          i = (idxA1j + 5 * (3 - j)) + 6;
          for (iac = ia0; iac <= i; iac += 5) {
            c = 0.0;
            jmax = (iac + j) - 1;
            for (ia = iac; ia <= jmax; ia++) {
              c += L[ia - 1] * L[(idxA1j + ia) - iac];
            }
            jmax = (idxAjj + div_nde_s32_floor((iac - idxA1j) - 6) * 5) + 5;
            L[jmax] -= c;
          }
        }
        ssq = 1.0 / ssq;
        i = (idxAjj + 5 * (3 - j)) + 6;
        for (jmax = idxAjjp1; jmax <= i; jmax += 5) {
          L[jmax - 1] *= ssq;
        }
      }
      j++;
    } else {
      L[idxAjj] = ssq;
      info = j - 1;
      exitg1 = true;
    }
  }
  if (info + 2 == 0) {
    jmax = 3;
  } else {
    jmax = info - 1;
  }
  for (j = 0; j <= jmax; j++) {
    i = j + 2;
    if (i <= jmax + 2) {
      memset(&L[(j * 5 + i) + -1], 0,
             (unsigned int)((jmax - i) + 3) * sizeof(double));
    }
  }
}

/*
 * File trailer for Cholenski.c
 *
 * [EOF]
 */
