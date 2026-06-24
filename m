Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0522F83B5
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 02:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782268637; cv=none; b=A41utU18zfVVkH2zBaCaRMUl5IPcbnb7Oo2B3+akQR542e257b6A04YWxnZOlBvSSoiNAntDmnZKuwBotOnFSaXwvtSp6HXvVC5fsjXh/yjyUBeWJgrg9w2VVArnSgUActFPJfAYE2iQnLkHVUerOIS38pzzIMZjtNTBtP3VhJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782268637; c=relaxed/simple;
	bh=A27AXjtIfy9VbwZYtrJitga1mHDPW06YdjcKsTB1CgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W3WIOqDpE1sekUjopgqjNYuzhDFZuCa0dz0k0H+O//jpEPbO/ESPaykSMwmU2bcuBAc+f/686gbm0k9XRZfQytLj2TZcW8TACvDGHIhiRGg0JqYNQjET30h2hD+D8Mk34YumLGfzzb8QE2dw+RnOd+8FkYZ9wwxdxlgJS9sfiPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXfB2oKM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXfB2oKM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84347ad88edso608030b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 19:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782268635; x=1782873435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rb5lzbSLHutv37hiBNWlpIZ7YOF3+BtXsa0gQbRPlC0=;
        b=RXfB2oKMgybgsSV1DXiZJ3uSt4p0MR6umyX00xuneEGzVIfi75EYxC65tqh1nZId9r
         K6LVl8IajJnXNOMGqVUEKXfHAYhB7JzaSoofsFcG2H6pQxb1+ykeJmF8/mNeWFj9FyxX
         KLXl7Si6oRPHV6ka9mupG6yK9FTUvBNsoDP5yZV18iU8uZtuIkQYVomPgxuyfG74sVuA
         eA6rxwA41QF8/pekqrLoZV2dzbVHXnTL7XVUvSo6bwmN4wvcRDueCAK8ENJrLKewqs0f
         VkT8BQRlvimoGKxoUA3qIlW7jeU1ZURyBiUAwaql593Al14Ss30MO3YKUfxf6YZ17QuR
         Hb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782268635; x=1782873435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rb5lzbSLHutv37hiBNWlpIZ7YOF3+BtXsa0gQbRPlC0=;
        b=ePwnJSL6HTpxpqy3Q/Xwl3ePlZvFES7Zzuyo663NGSw8TSjvPLNma8LLClo2H5HhnA
         rN/lA1OhoLpq6Kmt0fknqaG4SgNaEKeeWmqTk71VlGXVUctzroRLvbUyMlWRTXINBIDP
         vTCmfBvvfnfuW51rfRjZP7mRC1TawJZ4G9PrA8dd0z6xaoW0X+Ii1dm9nT87sFh63EPK
         PgvRJPdUT1d7Zxkq1uOd6Y1tf1r2+m/Eqo50fS6yMX/ySXPJN7kX1Kk4WumtDNy8TxWf
         /QriJ5lKn7vCsYaj+gju7fZcwa/QWB77qXmVqIIL0+clIokWKdeluQN1svJkwrWDR/FZ
         TguQ==
X-Gm-Message-State: AOJu0Yw6v4PTYhnH58IFDfaIwwVe06MyZqYfEM4mSmLxkj/Ixf27uBZF
	F2vDD4fB9o7ZExvSl+9O1Ygte5pJy4pOkqlqM5ii2vPVky8tPOEHNv0p
X-Gm-Gg: AfdE7clzPx3wGPWKYVLpO/oV6E5ta/B3rxmTctBtyT2AG/2HfVFXQjbvkd4FaZImGys
	oO9IsRwfyKqrIZTSbHW/si6jBWYZyZ2U5UR3Q8Llb35v4yIs/DEFc6YSXg88kwge/W031HKNNj+
	rqV8VrUj3HWCTDZYJl7XhbMq3ku+dzquOzYW+JqdhJJEFdPH5gWSWemoCep5izmwqIsd6797bgn
	ej1oPAYc9bdyTuPhx2nh+pkafJ1mSnlDQUyQzP9QRhjQ/RfLBn/oGabuIwoSfUVRmGYZ07dOPEV
	FthC4VojWJ3cbJqlH46qCqiq7yZY7dgRrQANxgs3UbQ4iAV1yNlDVGDNzYOpZDyj41gvvT7/drI
	5y1M/NqejizrPrJn/MBeVZD9uLAj7PDh62uBa+9Q+K3frH+1ckBL4KywmGpTbCPPwYccCsOxQd0
	mW7FRDJL6p
X-Received: by 2002:a05:6a00:2d17:b0:845:328c:1ec1 with SMTP id d2e1a72fcca58-845a2ae222cmr1996729b3a.12.1782268635089;
        Tue, 23 Jun 2026 19:37:15 -0700 (PDT)
Received: from adr.. ([103.216.221.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d22e8sm546720b3a.33.2026.06.23.19.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 19:37:14 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH] usb: core: devio: validate device and interface before buffer allocation
Date: Tue, 23 Jun 2026 23:35:31 -0300
Message-ID: <20260624023532.63009-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The proc_ioctl() function currently allocates a buffer using kmalloc()
before checking the USB device state and resolving the interface number.
If either validation fails, the function must free the buffer and return
an error.

Move these checks to the top of the function to fail early. This avoids
unnecessary memory allocation and deallocation on error paths, removes
the nested 'else' structure, and eliminates redundant kfree() calls,
making the code cleaner and easier to maintain.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/usb/core/devio.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index e191934623c73..8329d1c7d1b27 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -2329,6 +2329,13 @@ static int proc_ioctl(struct usb_dev_state *ps, struct usbdevfs_ioctl *ctl)
 	if (!connected(ps))
 		return -ENODEV;
 
+	if (ps->dev->state != USB_STATE_CONFIGURED)
+		return -EHOSTUNREACH;
+
+	intf = usb_ifnum_to_if(ps->dev, ctl->ifno);
+	if (!intf)
+		return -EINVAL;
+
 	/* alloc buffer */
 	size = _IOC_SIZE(ctl->ioctl_code);
 	if (size > 0) {
@@ -2345,11 +2352,7 @@ static int proc_ioctl(struct usb_dev_state *ps, struct usbdevfs_ioctl *ctl)
 		}
 	}
 
-	if (ps->dev->state != USB_STATE_CONFIGURED)
-		retval = -EHOSTUNREACH;
-	else if (!(intf = usb_ifnum_to_if(ps->dev, ctl->ifno)))
-		retval = -EINVAL;
-	else switch (ctl->ioctl_code) {
+	switch (ctl->ioctl_code) {
 
 	/* disconnect kernel driver from interface */
 	case USBDEVFS_DISCONNECT:
-- 
2.43.0

