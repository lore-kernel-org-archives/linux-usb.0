Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73763A4F2C
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057923; cv=none; b=NMQmnwPKCA07toKRx4hmIy2G65sc9ShtK/pvKePAC2m30GSvCkRmIFeDyf6rn4dJojcQQrBGfBzdirmT9vxYLO/FRtfX+xbGjryemyJd/YAVbgFGpUKAxZJ2hTIx++/8OABf+ZgM7KOSA2Ds+R9vUrbsbgOu3NUdvjk20Vd+tec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057923; c=relaxed/simple;
	bh=hrijtfqfOvg8LYhTu0Jxjjl8F1NDkkXHNxjFaW5iGQQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SmszPLYURZw8/QFuexXAGhv1yak306noMuz26RX717gYeUuhyX141RjWxQCM/XfjbX/Lx34i7Qo+tXEQBq0EsSggZ8bPtvYND6hjMUKFdbBzKPZJgG7O4Kibyh7rrGt3Y9lZtKTQEl/v0aJa+/62NdV9BG5A4oK7UlfLK+pi7QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PazsTmsy; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PazsTmsy"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3598f4fbb13so7575402a91.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773057920; x=1773662720; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TwK794DdqJYSdG6zV72tobi0ALWgKSn0ri9Q6Cr47G8=;
        b=PazsTmsy92oHJ8ebxQLOMhEVa4Gzfuc9UvmW+DkCBK0MgJeibvHOfCnSN4cp/w+jb/
         e7pcn1sjiy9bnLd9vVsFGYj1O5p68C4bsjHYsq9NobU9CkkeSFvIyfcrW+AHvMNYAdrU
         uHSpKSnVn44XR+T/B1yeqWpQ7VMmBsb/crZm0PsGHf4/qBd+isavn3we2Oh4SR4I0uZF
         xKDX6yf+Ebvd00uZPuPNfLAoYd3L6Sq5b4Ozgvd/r5glSoSN/IUoPqGjst53is8vs5Kv
         i3ipmSvr0XhLQifiZISOVEW6rM+sUf9WTxU+6mcPQnsjflJ4xrDe2QNe6zQd/DCwnspY
         WOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057920; x=1773662720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwK794DdqJYSdG6zV72tobi0ALWgKSn0ri9Q6Cr47G8=;
        b=XcXCMSjSzyxnWt8Lf8fGN2UBL48dGZHOQrFfjyWXu/FRHLGTdv1w3V/G1HlustOhJT
         FgjGjSKbbtPnRjP6iaasNgKqNuTPLCBiDMfHMdacEQc/ryYcToTTCaMqv2WfrxmmQemk
         fs9swC+YmDTtLmJeiAlU3jqR3sy8YOm77KkiCtDt05EpRoKppLP0ZipulE/fSV2Fj2C8
         kODYwg5L1G63/KdkW988R+6jeAooyN2uTIUm/rd2AAN67aiOaj+zQzhmmDurZ7h+HusK
         GHbKYDCJ8EOiXdy5Y1XwNvaTQaUdge3BzMTRm9kLN+3Zf56wPt0MyPQ331bKUmd00P9U
         /9LA==
X-Forwarded-Encrypted: i=1; AJvYcCUE603cTOodHo+uaIshNDtEIEEyedOuu1GqCZ9YYLE9ywL0WUnQJGLAcM2repo8lR1apCMKqJIaJro=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe7Iuo0X42+PxVYL577qSJ8UI9YZpYgnW4ILsWlU3KgrLLXqy/
	nljDicex40AOM3q43Q0RIy/aIv+U0Y/zDXYhYE0iBW80gGX+EOHFFsMluZ82/fBKZYdpd9yuOfE
	i1OH3bQ==
X-Received: from pjbds20.prod.google.com ([2002:a17:90b:8d4:b0:354:c1db:b113])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a10:b0:356:22ef:57b9
 with SMTP id 98e67ed59e1d1-359be2205a9mr9389334a91.3.1773057919973; Mon, 09
 Mar 2026 05:05:19 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:04:47 +0800
In-Reply-To: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773057914; l=3085;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=hrijtfqfOvg8LYhTu0Jxjjl8F1NDkkXHNxjFaW5iGQQ=; b=2Tv0AeQAtVUjZNyvZvH2DCe7nDFIVineVwXIFrOtbbpzhFvUgumR7ZB/4tpB3elWm9KbeSd9L
 mr7pc73YFmwC5swFG77KG2jDG2GB1DoJHzSv4f6LzuPrVvB0rzhLsBm
X-Mailer: b4 0.14.3
Message-ID: <20260309-f-ncm-revert-v2-2-ea2afbc7d9b2@google.com>
Subject: [PATCH v2 2/7] Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Jon Hunter <jonathanh@nvidia.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"

This reverts commit fde0634ad9856b3943a2d1a8cc8de174a63ac840.

This commit is being reverted as part of a series-wide revert.

By deferring the net_device allocation to the bind() phase, a single
function instance will spawn multiple network devices if it is symlinked
to multiple USB configurations.

This causes regressions for userspace tools (like the postmarketOS DHCP
daemon) that rely on reading the interface name (e.g., "usb0") from
configfs. Currently, configfs returns the template "usb%d", causing the
userspace network setup to fail.

Crucially, because this patch breaks the 1:1 mapping between the
function instance and the network device, this naming issue cannot
simply be patched. Configfs only exposes a single 'ifname' attribute per
instance, making it impossible to accurately report the actual interface
name when multiple underlying network devices can exist for that single
instance.

All configurations tied to the same function instance are meant to share
a single network device. Revert this change to restore the 1:1 mapping
by allocating the network device at the instance level (alloc_inst).

Reported-by: David Heidelberg <david@ixit.cz>
Closes: https://lore.kernel.org/linux-usb/70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz/
Fixes: 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/legacy/ncm.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/legacy/ncm.c b/drivers/usb/gadget/legacy/ncm.c
index e8d565534053..0f1b45e3abd1 100644
--- a/drivers/usb/gadget/legacy/ncm.c
+++ b/drivers/usb/gadget/legacy/ncm.c
@@ -15,10 +15,8 @@
 /* #define DEBUG */
 /* #define VERBOSE_DEBUG */
 
-#include <linux/hex.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/string.h>
 #include <linux/usb/composite.h>
 
 #include "u_ether.h"
@@ -131,7 +129,6 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 	struct usb_gadget	*gadget = cdev->gadget;
 	struct f_ncm_opts	*ncm_opts;
 	int			status;
-	u8			mac[ETH_ALEN];
 
 	f_ncm_inst = usb_get_function_instance("ncm");
 	if (IS_ERR(f_ncm_inst))
@@ -139,15 +136,11 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 
 	ncm_opts = container_of(f_ncm_inst, struct f_ncm_opts, func_inst);
 
-	ncm_opts->net_opts.qmult = qmult;
-	if (host_addr && mac_pton(host_addr, mac)) {
-		memcpy(&ncm_opts->net_opts.host_mac, mac, ETH_ALEN);
+	gether_set_qmult(ncm_opts->net, qmult);
+	if (!gether_set_host_addr(ncm_opts->net, host_addr))
 		pr_info("using host ethernet address: %s", host_addr);
-	}
-	if (dev_addr && mac_pton(dev_addr, mac)) {
-		memcpy(&ncm_opts->net_opts.dev_mac, mac, ETH_ALEN);
+	if (!gether_set_dev_addr(ncm_opts->net, dev_addr))
 		pr_info("using self ethernet address: %s", dev_addr);
-	}
 
 	/* Allocate string descriptor numbers ... note that string
 	 * contents can be overridden by the composite_dev glue.

-- 
2.53.0.473.g4a7958ca14-goog

