/*
 * This file is a module for: dout = log2(din).
 *
 * Copyright (C) 2017
 * Authors: Wen Wang <wen.wang.ww349@yale.edu>
 *          Ruben Niederhagen <ruben@polycephaly.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
*/


`define CLOG2(x) ( \
  (x <= 2) ? 1 : \
  (x <= 4) ? 2 : \
  (x <= 8) ? 3 : \
  (x <= 16) ? 4 : \
  (x <= 32) ? 5 : \
  (x <= 64) ? 6 : \
  (x <= 128) ? 7 : \
  (x <= 256) ? 8 : \
  (x <= 512) ? 9 : \
  (x <= 1024) ? 10 : \
  (x <= 2048) ? 11 : \
  (x <= 4096) ? 12 : \
  (x <= 8192) ? 13 : \
  (x <= 16384) ? 14 : \
  (x <= 32768) ? 15 : \
  (x <= 65536) ? 16 : \
  (x <= 131072) ? 17 : \
  (x <= 262144) ? 18 : \
  (x <= 524288) ? 19 : \
  (x <= 1048576) ? 20 : \
  (x <= 2097152) ? 21 : \
  (x <= 4194304) ? 22 : \
  (x <= 8388608) ? 23 : \
  (x <= 16777216) ? 24 : \
  (x <= 33554432) ? 25 : \
  (x <= 67108864) ? 26 : \
  (x <= 134217728) ? 27 : \
  (x <= 268435456) ? 28 : \
  (x <= 536870912) ? 29 : \
  (x <= 1073741824) ? 30 : \
  -1)


`define FLOG2(x) ( \
  (x < 2) ? 0 : \
  (x < 4) ? 1 : \
  (x < 8) ? 2 : \
  (x < 16) ? 3 : \
  (x < 32) ? 4 : \
  (x < 64) ? 5 : \
  (x < 128) ? 6 : \
  (x < 256) ? 7 : \
  (x < 512) ? 8 : \
  (x < 1024) ? 9 : \
  (x < 2048) ? 10 : \
  (x < 4096) ? 11 : \
  (x < 8192) ? 12 : \
  (x < 16384) ? 13 : \
  (x < 32768) ? 14 : \
  (x < 65536) ? 15 : \
  (x < 131072) ? 16 : \
  (x < 262144) ? 17 : \
  (x < 524288) ? 18 : \
  (x < 1048576) ? 19 : \
  (x < 2097152) ? 20 : \
  (x < 4194304) ? 21 : \
  (x < 8388608) ? 22 : \
  (x < 16777216) ? 23 : \
  (x < 33554432) ? 24 : \
  (x < 67108864) ? 25 : \
  (x < 134217728) ? 26 : \
  (x < 268435456) ? 27 : \
  (x < 536870912) ? 28 : \
  (x < 1073741824) ? 29 : \
  -1)

