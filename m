Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E1630F924
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203630; cv=none; b=Xd1W46XtXdHXkDL91+x7LHyCZbh0oz3Qy73GFa/slqltVsifCUVGPraYBCGWXs8eyYntsznNTotbeTggK5U6mdhjN8F+CvPEU6D6Mz9s8k2YimbVOR+Vze7Zgna7ocCREEe0P0ES+Z7vMiwdvMmMm/VuTzFHn/UGnzqDoZC36e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203630; c=relaxed/simple;
	bh=j0EoqL8IuiLtmXdt0H398BbvsC8H1qJ95HdoZ4a/ugs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uqpe2Es3wd9gFUFC3E6XXjuIkG6LzQ71L3Hx0xnISA8EO5MUfRy12F8Ce3RkCxIUW8B43+KXyxZ2bPsa/K0yfrGf9HqWPLFe1VywJgMgZbCYAU+oasLA9ChD6jo8/zpAQ1V/o/whqk7PMV683485k+RDEX0TxdGuWx3D+BwPaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrfaAwxJ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrfaAwxJ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90e8e70fa02so966166d6.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203628; x=1788808428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMGIA5ANiEfyPx0Aer3EeRWdzc/nK5frp0+gRGq+39k=;
        b=lrfaAwxJhDyKoIWyoya94gjOpY+JfJagT7RpA1xm6qqsHYFVfLwAA3aT7MsZuwd0WJ
         tw7sOYcVbCEF93wcK194N3zDNE7XmRBYe8vAzReO9o0S6RJMXYo6zptJkFg2xs59EsHO
         3t30GL/rWKD5eDjm3bN1GgVfhkkmd41Kf9/7f97WNF3jBVrd1hXK78YVe27EMxOuJr+n
         o0UEOjt9cFbbMt4DJ5A1LScGEyg5uUkp5pKcmuNem5fWlbsw0IoMwJ0nwV/hwGJ9PSv4
         3n/exLKW5MGlhRCWPczog4o9ECw+DxdrFKfpDIAxxGpLAjH8X+xrALlNh1DHt6IBZ7nc
         Y4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203628; x=1788808428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMGIA5ANiEfyPx0Aer3EeRWdzc/nK5frp0+gRGq+39k=;
        b=iGB1rSczgcHSs6zNf2HXlk7LDls2UaBU4bPQdbdi39zC+uAIMbG/OtipKgRVQwx4HW
         uzQpdbehN/zsQIAXRy1DnGoHZVnp6q7NlXusCXvJkRinBb7ya2o6BWofzUT1DYW76Ult
         DG85vQ/PfRtEcjLEdaxG7Y8RcEP3eyON495K59rbW0eUar7VlwJP87wI/mw/PublN6fq
         YDPwHHKMFhYGFGSIcsVQoyQI0+GkEZ+2MKUIRE7cQGnA/UNswA9Ejyn92LIkQR9DTbms
         LBgwCd7kUWvVge6DjjHGfT0WXp1hdrSWNJtBnRqkOnC3EO1o3T6g2CI8dQvfzvTRcNJS
         9l0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqmRgEq7VlYlgbmyUbdzv1nFRsYEEhQ4eav1WOgS4pOoUT2J1jtP4ee+qz2DAjqrOYGBB5oIj54hf8=@vger.kernel.org
X-Gm-Message-State: AFuF++ldPuIyujm423xamvCbn1FEjuCM7dbqrCGnl88+1UYJs0ezZ+4q
	uOOBH2GlKw0O5ayhK4XyG3O0dsoLjER1goI2cU9X1GYPt+MU46gn6J+mcjweMJ0N97M=
X-Gm-Gg: AR+sD139fyUG2R5RC8fBZSJxnKdbSBsdB1n7WG9HXQA8PFKL7cvY8ye/AFOIflvWT9k
	TkNCZpjxyKvyD3S+j0IGDFJIj+657REhb74L0zSZC4KFDf9VBNkJ2uutwl0Zp73xeoKx1aOCAmB
	eoSPZhgf2jjqzpiYWxs3UEYLFcj2VuDEptorKRVVMBEGyRqt0n13nX9FFTJICPi/j/FUwNkEaQ9
	T5Vgxumyg9QHx439nmXp7WymAgFOqTCwbYU76T3xNfhKMpC629g+yF4P2t5GsfWPxKrxenN51x0
	cY8uUWTuP5rAw+jqvf89yXs6hFzy4p96Cmjg4f4Cje44IsWDwYsjADnBomxIAoDNmKsM5G0+R/T
	+lPm/P5t9Q44iBCsEZWWAXRLTz5R0bj8Rbm1Vxo0WfAGh5jwm2S4kM2/cvuK3UpofnfBuz8JaT7
	fFPcqhBQ6aCSmFT2w3Qsehizuk5dObYHJnOsmxVSz5O4nLIgB1QsCblXZwMwg7zkn71KHPhBuO7
	qKvwgWP0ZGfqg==
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2487499485a.2.1788203627956;
        Mon, 31 Aug 2026 12:13:47 -0700 (PDT)
Received: from zmitepc.ad.psu.edu ([66.71.17.237])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391701305dsm853925885a.4.2026.08.31.12.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:13:47 -0700 (PDT)
From: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
Subject: [PATCH] usb: quirks: add WINDOWS_CONFIG_REQ_SIZE for Razer BlackShark V3
Date: Mon, 31 Aug 2026 15:13:45 -0400
Message-ID: <20260831191345.43869-1-memobayoglu2007@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Razer BlackShark V3 and V3 Pro wireless dongles fingerprint the
USB host by its configuration-descriptor read pattern during
enumeration. Unless they see a single full-length (wLength=255)
request like Windows sends, they refuse to bring up the wireless
telemetry relay and battery, charging and EQ state all read back as
zero.

USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE already implements exactly this
behaviour, so just register it for the four BlackShark V3 PIDs:

  0x0576  V3 Pro (wired USB-C)
  0x0577  V3 Pro (2.4GHz dongle)
  0x0579  V3     (wired USB-C)
  0x057a  V3     (2.4GHz dongle)

Both the dongle and the wired transport enumerate the same firmware
and need the quirk. Verified on 0x057a and 0x0577: with the quirk the
vendor channel answers and battery/charging/EQ read correctly;
without it every vendor GET returns zero.

Tested-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
Signed-off-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
---
 drivers/usb/core/quirks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f0b..9b5420be2 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -502,6 +502,11 @@ static const struct usb_device_id usb_quirk_list[] = {
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
 	/* Razer - Razer Kiyo Pro Webcam */
 	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
+	/* Razer BlackShark V3 / V3 Pro - unlock wireless telemetry relay */
+	{ USB_DEVICE(0x1532, 0x0576), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x0577), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x0579), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x057a), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 
 	/* Lenovo ThinkPad OneLink+ Dock twin hub controllers (VIA Labs VL812) */
 	{ USB_DEVICE(0x17ef, 0x1018), .driver_info = USB_QUIRK_RESET_RESUME },
-- 
2.55.0

