Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D515554CF46
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653236; cv=none; b=TW464ST1SRUnRM9tIeLGltdtZzjA0EbFfoAn75OlIK+aLrptPMImvPOZ4qw9Z9/jWc6xhNrwoxyGMDdeEkU68WcskmmOCkrec81bUPjJkcWyWb4FBXss3Go+bMyoVXT4j5HcVKMXRcCG7ZpBt8HCO9fF3W2unBN6MmMennq2ai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653236; c=relaxed/simple;
	bh=mfzetHJUn51ArerYHqF6aiA8NuXaOVldE7r6LWhO0uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I38YZe2GCy9xcPsUnWelxB1C4MN3QQb/t+mioCRD7R6GQNfWfU0lwM5dpC4kod8IMOLNvFrKAWuuztmuic3Qr7wl/KJOzCaDA/Ehw3G6qGNc66hVYS/zHWqRtgjPa1dkXFn3Fy3/1H8G3ciDn/rR1RbPNvb3TXWpUEEO8D5qkxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=En7S3FAl; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="En7S3FAl"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so436087a12.3
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653229; x=1790258029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNzuklJ6syncehvRtPRFyTK25DIYgkrFQvB75keaveQ=;
        b=En7S3FAlvb7xVAltzwxtYNx6weFJxSA9G721seTvYqMG/5AxdoRiOV4uoXMN8E/5dT
         PY5h60hPKDNjabO8buj8Ilq4c33Uo48tIAQnqnox34Cp+RdePYdm5VezPfZSsa5YWYsZ
         EUyo+MpLRAS9Lbl2t5VRWOzxtOdIArs7tGYgVWyurAKMvLPZ9RuV7NjM0IXMfa8g4+RZ
         bOojSlI5lggddrHVadGBi7sy0rQ0zgD1MysNrvb/+KavfbHSmFBtAa1u2P9JY6CbYefZ
         CoZNUoy7xCslO0s7nwgFqA/B3YegNZqYU5X0K8VEQhg1NANIJbXvx3ISm74IvEK792no
         bKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653229; x=1790258029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNzuklJ6syncehvRtPRFyTK25DIYgkrFQvB75keaveQ=;
        b=G11CdargiW9DV44zbFSoj5LY0a+eb2ZcB1odrkvBCQ25BqaJDVCu3X9qXSLZP9tUvl
         iEY7VMC3yMbbba637wpOxJf8z7agBQNF9E5zbskBvo4lEXX6wC+//vTt8cRfeHU2jTX5
         uVQC1/XbB/zAabDFQ5Xwe2syZ0KJ2zryoFIzpjHpAWA7yqw7L0RWvzlKMnCeVsOcTyWL
         0o0lkWeToOLE1B16ITJkqNccaNabig8ZEcKxpHwgrQQBJ0jnj7wZOffgNlGEAe4l3DYX
         PyQlTiXn3Gd5G2s4NG91kklu09KHV633+xjTRX1+ed6RA6fKEDJaz2MzkIbAQiyIGhxK
         x5dw==
X-Forwarded-Encrypted: i=1; AKwUvBwP7bCb6AR3Q9srXGxX5UM28Jba+VDv4n3zqkrMSL2nmmgAL4CpngNuA+Qo9tELdT9IBv5P/F6vy3s=@vger.kernel.org
X-Gm-Message-State: AFuF++nBDsRbchTxk8Krx6+RxiqN/6T+z29s+kuIdvZuvIyPRO6KDWxf
	f5XuSLavBp03sz6XiwxsZibmcxmkVBQDzcc+JOj9E9+lnZPjaGsqsTcm
X-Gm-Gg: AYBFou12hkTwJnLSR2k+4Y60OqRknWOsxRF8z7rrybSUtaqvOGi6I4X7ydv6zM+3UmY
	s6f/M62LH1W1iOduu5hHW9yK3oIqcbKPszJ6pyqtAiZdOsfEy9zeK8hCuud1ZzunQCon3Zey+WP
	FAMmJNgTmnD5t01DGiTK8LuwKwMmpwxFkEJulHTD776AyK+Rq+fqipFtnEnofWYWzJ8sY7e4Wq6
	KskNRVzaSjyBWCCo/NCswtSEH0GG31Y3Q5IJy6U01yQC04AxiAs5yQVbWDJFOISPG4MgnsHlRpm
	ByoHjx5Pq/ylzZlKrrMvf+N68tL6LAmlbxWJZBLaxZrY6ZqNMlET2VgEcNRnP1+5wJWiSr5j/M7
	Fzzce4ydaLOYIypguQqUeGMRLINDCpDnLmY7JtBNkahSH3vFlANp8p1TIls/AK/2o9c9Hkev6Gi
	6cswiCQZB6Bxmo5oZRXMwU5yAPm+e48t+/DuKDB8JqA3Eh3N832Bamq4qq/pUkqPuNYhGEW9Q/H
	Rmq1vOM231fkYh1rJZjR+zzCzWFUomw4g==
X-Received: by 2002:a17:90b:2ec7:b0:39d:f317:44cd with SMTP id 98e67ed59e1d1-39e1e4907f3mr22997029a91.14.1789653228453;
        Thu, 17 Sep 2026 06:53:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:2428:17da:9062:91b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm5303334a91.16.2026.09.17.06.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 06:53:48 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Nazarewicz <mina86@mina86.com>,
	Robert Baldyga <r.baldyga@samsung.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zjamg <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] usb: gadget: f_fs: Fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
Date: Thu, 17 Sep 2026 21:53:37 +0800
Message-ID: <20260917135337.65444-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260917135337.65444-1-ndaugoing@gmail.com>
References: <20260917135337.65444-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When user space sets up FunctionFS with only full-speed descriptors
(e.g., flags = FUNCTIONFS_HAS_FS_DESC) and the gadget operates at a
higher speed (such as USB_SPEED_HIGH or USB_SPEED_SUPER),
config_ep_by_speed() detects that the function lacks descriptors for
the current speed, logs a warning, and falls back to full-speed
descriptors. The endpoint is then successfully enabled via
usb_ep_enable(), and epfile->ep becomes valid.

However, when user space subsequently issues the FUNCTIONFS_ENDPOINT_DESC
ioctl to query the endpoint descriptor, ffs_epfile_ioctl() selects the
descriptor index solely based on gadget->speed:

	switch (epfile->ffs->gadget->speed) {
	case USB_SPEED_SUPER:
	case USB_SPEED_SUPER_PLUS:
		desc_idx = 2;
		break;
	case USB_SPEED_HIGH:
		desc_idx = 1;
		break;
	default:
		desc_idx = 0;
	}
	desc = epfile->ep->descs[desc_idx];
	memcpy(&desc1, desc, desc->bLength);

Because user space only supplied full-speed descriptors,
epfile->ep->descs[1] is NULL. Dereferencing desc->bLength triggers an
immediate kernel NULL pointer dereference panic.

Fix this by falling back through lower speed descriptors if the current
speed descriptor was not supplied, matching the fallback logic in
config_ep_by_speed() and historical f_fs behavior. If still missing,
fall back to epfile->ep->ep->desc (the active descriptor), and return
-EINVAL safely if no valid descriptor is found. In addition, mark desc
as const to match struct usb_ep::desc and avoid discarding qualifiers.

Fixes: c559a3534109 ("usb: gadget: f_fs: add ioctl returning ep descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: zjamg <ndaugoing@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 43962e05eacf..c64a268e98a4 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1877,8 +1877,9 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 		break;
 	case FUNCTIONFS_ENDPOINT_DESC:
 	{
+		const struct usb_endpoint_descriptor *desc;
+		struct usb_endpoint_descriptor desc1;
 		int desc_idx;
-		struct usb_endpoint_descriptor desc1, *desc;
 
 		switch (epfile->ffs->gadget->speed) {
 		case USB_SPEED_SUPER:
@@ -1892,7 +1893,17 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 			desc_idx = 0;
 		}
 
-		desc = epfile->ep->descs[desc_idx];
+		do {
+			desc = epfile->ep->descs[desc_idx];
+		} while (!desc && --desc_idx >= 0);
+
+		if (!desc)
+			desc = epfile->ep->ep->desc;
+		if (!desc) {
+			ret = -EINVAL;
+			break;
+		}
+
 		memcpy(&desc1, desc, desc->bLength);
 
 		spin_unlock_irq(&epfile->ffs->eps_lock);
-- 
2.53.0

