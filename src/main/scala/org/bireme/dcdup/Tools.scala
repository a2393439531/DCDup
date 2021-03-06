/*=========================================================================

    DCDup © Pan American Health Organization, 2017.
    See License at: https://github.com/bireme/DCDup/blob/master/LICENSE.txt

  ==========================================================================*/

package org.bireme.dcdup

import java.nio.charset.Charset
import java.text.Normalizer
import java.text.Normalizer.Form
import java.util

object Tools {
  def isUtf8Encoding(text: String): Boolean = {
    require(text != null)

    val utf8 = Charset.availableCharsets().get("UTF-8")
    val b1 = text.getBytes(utf8)
    val b2 = new String(b1, utf8).getBytes(utf8)

    util.Arrays.equals(b1, b2)
  }

  def normalize(in: String): String = Normalizer.normalize(in.trim().toLowerCase, Form.NFD)
    .replaceAll("[^a-z0-9]", "")
}
