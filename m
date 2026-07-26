Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C483E379EF5
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785053043; cv=none; b=E/X3jvxTykEdiIiOKlYct+MAWbh2YEdCif7PqFjC0FbMbpGQG02tg8f+6G6sGxyJKqjMFRH2gl35uPXWdfiMsINitPc1MpsG2l6eOMgOHEtlwU88lS/Cerz+ZfGnuFxDKi40Wt+nVj4UfgeYwahUppVLD0hX+zlOYoqe73Vx2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785053043; c=relaxed/simple;
	bh=eBiYeqRNOonyekOJrJqCQgTXAFtBAqkEfIJs/qQdiKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t0rpcXOKT7+G25uIGLzr3akuyG4boIUcGqPfSLcBxJW9ibU3jt5cTm78IaMHa2lu8UeDJOgw8PttqWEVUY0PuwoUfQWjZ67b/adJyBXNtqdLOsu40PyhUbwPnhlhhQ+EqUgwnNbG8sDp2DCCpJMOCuBoql5LPH9u7i+QD8OV5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9FE78d1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9FE78d1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cea3004256so18825215ad.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 01:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785053041; x=1785657841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vwye3bYt271MSx9qRm7lxJP4TvzZMND6qAgc6WLmrE=;
        b=P9FE78d1HGGeARsExt2f7fztq/9m4wBIg3d7T+CB8S5GjBucwMdDiJTIRlsMRNTojz
         5rATMUSjZyQdNd7wBCkCGu6VCbsXzP+4dX/7fmRTXjx59tYNOAV+dbGKl5d+vjYAOVWf
         Rx73FRVt3ubUuD8vXr/BHdKX5X6XHzV/2gR1j8r2f/XweBX7WExuwwDh877Wy6ByBFBA
         VYbg1OsZSZXmzYtr5TuJzXACv94W2VGHF9KaMG3djs/xoCYYR6IF1U0c64Zlnijm2L15
         PblKVxpYOz2z9Vx7UdjazIlULIsXM0r/97CqMimy/7IgGHv8UE5NTmeoa7ZrcT7gRTTC
         0pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785053041; x=1785657841;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0vwye3bYt271MSx9qRm7lxJP4TvzZMND6qAgc6WLmrE=;
        b=ThuL6kgAEBCVWFhvfXBTWNhdp0dNr8oCfpUAd2mybCuvQX79EIAnoZ5cH0ltd3LvFb
         vFzdUjwJzG29cQpZF8UJGnaSq2h8TwnX6c94IYrkaPFq3RW1SOMMFIn/zq61Opc3vfcv
         icc3grqppLljIw1XK89Sgwqf8U9bxJM4YjkReZPmoHt8sgguJNWAUYRghmCOI0nOb84U
         tLuMU16pmt6MUIWKBCtIhBBKrAHxwb3tVSfL7AxQC8pTVmtDN5qzE9fB9HkfFeMC9I2r
         rq15O3P5culbdksr765F6tE3srOtrmPRtJHlAQq31YxcNY1xUlazAxi/c7JS8TEI4CJm
         F0VQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLBPwdZR+P3P61w3jQhTnOg5LmsPnlPakoNWntkBsTv5k0NrBKDmgIW6AVODq4R4KFbskuZOOo13g=@vger.kernel.org
X-Gm-Message-State: AOJu0YynZfCDLWFYTY+wsWDcntris1z8eJoyObdZAJGuIMLO/hNXsXHy
	G6QjBG50bMmUmYvia72AHp06/xAItoVU+U7846ro00lI+NrTbheB2FIH
X-Gm-Gg: AR+sD10Esb/Znikn39oUFqEaZJzfixUlanneOuDl/YbrW3idk5jzQXVEbMx1T86EBQl
	n1jkOY+w7rC7jd2O73FmHaJKC/ItNMIQz2g3K/+yLczalX+mAmbP0WiDda9JtuGY2tL8W80WONU
	E+JI9zwTeDCTx5KbXMgEm6SbKw2dlfE39x5+j/TRv956YYTbgq5cGHqz+eHoTpI9fPDcfr0i9lT
	4SIPe5B8jIG6ov7Dxmhza3qbYNsvZ+lOcu3EisulolBXE5/8lZmUN2PDLFqxYnn4KEzZhobP7GM
	7wKvrRQTxruwvDBUsncPMr7kaV+9Ya1EAzNCGP0h8VVVLlFFMwQNkl1Vtn9G50g0rR60uD+Roaa
	6AFDm6SnRvq4z1ULVlQ53OewY0Ia4GoJltuMK3eodstP9d2otQOky9TOURe9bjI6oRQhFy9cUtI
	8dxGkBEK0sOw+M9Vt4HqJJVF+82l3aawrKqlfoLQ1zMr+89DxDQwpUjxWxfltV7e8=
X-Received: by 2002:a17:902:d2c9:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cfde6877c3mr43661925ad.1.1785053040874;
        Sun, 26 Jul 2026 01:04:00 -0700 (PDT)
Received: from localhost.localdomain (211-20-143-81.hinet-ip.hinet.net. [211.20.143.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b8esm17503365ad.31.2026.07.26.01.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Jul 2026 01:04:00 -0700 (PDT)
From: =?UTF-8?q?HE=20WEI=20=28=E3=82=AE=E3=82=AB=E3=82=AF=29?= <skyexpoc@gmail.com>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HE WEI <skyexpoc@gmail.com>
Subject: [PATCH 0/3] usbio: fix two out-of-bounds accesses and a hang
Date: Sun, 26 Jul 2026 16:59:10 +0900
Message-ID: <20260726080129.44969-1-skyexpoc@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is variant analysis around 8c6314489550 ("usb: misc: usbio: bound
bulk IN response length to the received transfer"), which fixed a slab
out-of-bounds read in usbio_bulk_msg().  Re-reading that function,
usbio_ctrl_msg() and the I2C client built on top of them turned up three
further issues.

Patch 1 fixes the length checks in usbio_ctrl_msg() and
usbio_bulk_msg().  They are computed as "<buf>_len - sizeof(*pkt)", u16
minus size_t, which wraps for any endpoint smaller than the protocol
header.  usb_parse_endpoint() only clamps wMaxPacketSize downwards, so
a device can advertise 1 and turn the check off entirely; the first I2C
transfer then overflows a one byte slab object.  The overflow completes
before usb_bulk_msg() is reached, so it does not depend on the host
controller accepting the transfer.  Fixed by validating the three
lengths once in usbio_probe(), which is the only place that assigns
them.

Patch 2 is the equivalent arithmetic in i2c-usbio.c, where the overhead
is 10 rather than 5.  The interesting value there is exactly 10: the
chunk size is then 0 and the split loop in usbio_i2c_read() never
advances, so a device that keeps answering keeps the loop alive
uninterruptibly while holding usbio->bulk_mutex.  That is a hang rather
than memory corruption, and patch 1 does not address it.  This is also
the one patch in the series with a behaviour change -- a bridge whose
bulk wMaxPacketSize is below 11 no longer gets an I2C adapter -- and the
commit message spells out why such an adapter could never have
completed a transfer in the first place.

Patch 3 is a different bug from the two above, and the one that affects
existing hardware.  usbio_ctrl_msg() and usbio_bulk_msg() hex dump the
reply with "%*phN" using a length the device supplied and that has not
been validated yet.  hex_string() caps the field width at 64, not at
the buffer size, so the dump reads up to byte 67 of ctrlbuf and byte 68
of rxbuf: out of bounds for every low, full and high speed ep0 packet
size and for the bulk sizes these bridges actually use.  It needs no
malformed descriptor at all, only the dev_dbg() calls enabled.

The new probe checks do not reject any supported bridge: the low, full
and high speed devices this driver binds to have an ep0 packet size of
at least 8, and they use bulk endpoints of 64, or 63 via
USBIO_QUIRK_BULK_MAXP_63.

What was verified, and what was not:

 - All three build cleanly with x86_64 gcc 14.2.0 at W=1, with
   CONFIG_DYNAMIC_DEBUG both disabled and enabled.

 - The out-of-bounds accesses in patches 1 and 3, and the
   non-terminating loop in patch 2, reproduce against a userspace model
   that copies the struct definitions from usbio.h and the checks and
   stores from usbio.c and i2c-usbio.c verbatim, with only
   devm_kzalloc(), usb_bulk_msg() and usb_control_msg() replaced; the
   memory errors are reported by AddressSanitizer.  The same source
   built with the patches applied is clean, and both a normal device
   (ep0 64, bulk 64/64) and the USBIO_QUIRK_BULK_MAXP_63 path still
   work.

 - The decision space was swept exhaustively, endpoint sizes 0..2048
   against caller lengths 0..4101: the mainline bulk check can be
   bypassed for exactly 0..4 and the control check for exactly 0..3.
   After patch 1 no accepted endpoint size admits an overflow, and no
   size that could carry a payload byte is rejected.

 - I have not run any of this on hardware or on dummy_hcd.  The
   reachability arguments are read from usbcore and from
   lib/vsprintf.c, not observed at runtime.  I am happy to build a
   raw-gadget reproducer if that would help review.

Patches 1 and 3 touch drivers/usb/misc/usbio.c and patch 2 touches
drivers/i2c/busses/i2c-usbio.c; MAINTAINERS lists all three files under
the same INTEL USBIO entry, so they are sent as one series.  They apply
to mainline 3dab139d4795, to usb-next and to usb-testing.

HE WEI (ギカク) (3):
  usb: misc: usbio: reject endpoints smaller than the packet header
  i2c: usbio: reject bridges with undersized transfer buffers
  usb: misc: usbio: bound the debug hex dumps by the received length

 drivers/i2c/busses/i2c-usbio.c | 14 ++++++++++++
 drivers/usb/misc/usbio.c       | 50 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 60 insertions(+), 4 deletions(-)

-- 
2.51.0

