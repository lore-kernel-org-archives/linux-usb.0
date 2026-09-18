Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813D63624B8
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 00:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692891; cv=none; b=TJzcjE22L3vRWnvqW/CKNSOApbWzZ6y6CNzFuFeveAyyX+Z7xso2km3wDPy3QxXVJThaP/mile+2fxlpgQJC5v/mZquYWwHdTjcv7QUO3OPjZ4T5InEUCKzYEMDiI/UPqDhTzjaI6KpPpSlN6fiK6OYPJr4s5WsrSF+MbZUSgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692891; c=relaxed/simple;
	bh=qCrvnwnw2ZmTpdL+R/0NITnHZPsB2ITSD1FJ8dZiKL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHpHKiT/GHF9utLUPHxUXyZ4XzCoomGwPGyMcPkO53m66Ezibj0wmosJvvBDAyzhOBdDPLOd6LSsw1e2jWhWNoHrSlxhf9VKxq/33eGwDaVm6QzNxLnXfR+ksnJ66lFtfBqrcWPxh6jd1sxsbcvvzWWR7KacFnAL5uul+9arCBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZENtkiI; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZENtkiI"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso145892b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 17:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789692888; x=1790297688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vorPSln8DTStAoGWTmO2QfiwSgMRhe3eQ+sYKlZMfk4=;
        b=UZENtkiISEgDw+Y/0Yg2iBk8HMlhWmF6+JjFAjbySgUqb+faetKAghjCCjMPnvgZP2
         m2oiLmuAvaPUQpPMxuI21Sgh9rfrLhXxsrDlD9w3Rs9vE5JbeTl/swGA/2ooAveq3dXW
         0wbv85HOSKmLFq/vns3flsTYc9kr9OYrNwEUKuEppTJ4XgAKpEUyqcW8D/QiMtGrnK+g
         yilLi3dwWtjtySgM895QAauezGs2z4KDQI4IKagke/HtPcdldpIuL3dsh+LnrMRW5FZM
         fi4zapgUQzhrO7F/7hBN2Hqk90eY6WBDFfJZD8yBBiWGoeHpI9wZ8rm9JBjuCPWU+KuW
         y/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789692888; x=1790297688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vorPSln8DTStAoGWTmO2QfiwSgMRhe3eQ+sYKlZMfk4=;
        b=yWFdG4yQmN/jMZJju3h2y7hhz+sYq8XLoK/JGqa3ozVj7Z+QeuhtsuZKwmfrOuZHVx
         c5YdC4M18dnsZlkcbacxEOX81vXG+HC0qVG/TPqO04joIZslx746DZ0wT8Kv2ry32gQt
         bY1H3DLbzgKKHfuA/j2ORBZmSRv5rAFIpbyLiPwPJG9ZfOhCVn/r5a2YnaoF8ddECgli
         5CbTEVbmlM17CWYRXaadaB3HpAibiffGAuJsCDNZnDIZKSU3btuwjwqTFjA15rcUJESm
         PQW6Bk1r4Zhk3fOukbwBFZMcBngami5C5nXqB+cteUH+2QXfpsrlwDwIu1xKfUoPBIsc
         9zpw==
X-Forwarded-Encrypted: i=1; AKwUvBwJafErSgcHh3Z3FXdqcsvIuP/I4Ioi+bBDcv2Wsjpx5JswlVJsDwn4bHfLbCmFpqF0UXIrJVacSqA=@vger.kernel.org
X-Gm-Message-State: AFuF++nA8PaFsnnGXxe3PIZ37Vs09duky5epbTogG7DMveznEibYx6LI
	1NaWaQXitMNqRLFYemOgqQ5Lh0lkZ/fhxKm3tdV/PXjomMT8dLD8QTIN
X-Gm-Gg: AYBFou2Wf/i4W5ZnuGWpzC2E8mREP3JvbAxQW339v9IgXvbHdm3pf6PNPbGKA4chRKL
	pfYZ+m6MpJ/d6ETPLCtnZm3wjty41Ax6v8+aq/6IvJh8oAOwDP+oE0y7qlj4V9ALtE9JuPM7bZx
	cOtIV/c2NbF1Ukfx/IwzD3Kl82/XyRWYxODc9IvUortWLJFZazV2UEEwDaHA7enfIEsnm9inrDB
	cL+DnFhzTnAy+6fdIHnGOBSk5JOd64nFFTDY++7XRk/BCV2tfF/nBvAdBgyF6Aen3EhoEA64L0t
	PBfyPUMDTpRn+mrzTFF7tuC2zOvRdkfZAU2jsPJFYJZf1InkKejWWItxCfCuKeysR+0BGMYI+S5
	WBFCESzgnUmiFbVcjv8XjKWgXNgTFD0qq/QZGVfjmojg4PggI4fHOr7RTG+ckxD/gmXygl1GxqT
	GNk6xzuNU1gfYqwzqGuVZ9i8qNPJ8eEYbMSOmeGbtd6H1FOgaFy/2pYfT1lcQRf4hW+0Q74mk7S
	2YQi14u1GwrG9M168MZRLkRBMRQY6VDHA==
X-Received: by 2002:a05:6a20:c989:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3dd8c43822fmr1616231637.14.1789692888530;
        Thu, 17 Sep 2026 17:54:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:84a7:aa72:4f01:6c70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm25238885eec.2.2026.09.17.17.54.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 17:54:48 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Nazarewicz <mina86@mina86.com>,
	Robert Baldyga <r.baldyga@samsung.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [RESEND PATCH 1/1] usb: gadget: f_fs: Fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
Date: Fri, 18 Sep 2026 08:54:38 +0800
Message-ID: <20260918005438.81263-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918005438.81263-1-ndaugoing@gmail.com>
References: <20260918005438.81263-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

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
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
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

