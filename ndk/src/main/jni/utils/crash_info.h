/**
 * Async-safe utilities for manipulating crash reports
 */
#ifndef BUGSNAG_CRASH_INFO_H
#define BUGSNAG_CRASH_INFO_H

#include "../bugsnag_ndk.h"
#include "build.h"
#ifdef __cplusplus
extern "C" {
#endif
/**
 * Add crash-time information to a report, respecting signal safety
 */
void bsg_populate_report_as(bsg_environment *env) __asyncsafe;
#ifdef __cplusplus
}
#endif
#endif
