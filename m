Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36029165F16
	for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771685333; cv=none; b=MN42X8ARdVC3XdKUMjmliD6L3D/sxJ7xqYqjFJNDRcCj4vGRn2Paq3S1n0FPuLzuIaMQWqiwNNqEJLgl+R+0it6JFwsv4vhRl/i8PiDLQ2W33WlJM3uehEeSE5vRaRTSa3au2zz4ktZrVFEy8Eo4sXPoUARlpAglWTFH1vvi+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771685333; c=relaxed/simple;
	bh=TIW7di7W9B6L4rzU//z3c0xJPlQEQJg5QsLFlDFJjv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H22YdVD5enfBXgGds4JSelV8/k5tqNFHbhGZu9NTEfMwQnoDdO+fUsKAOlebLoa/UZytu4STRI2aw+bGbbad4nZDc5HjYZGivoJ5xT4lZtjBE+WprQpkCvgiZzuWmJ2geuuKSEKHGAfyXKUd/bSUrHO6hQW7LRWUfW0dnM7kjO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ci0WmNfF; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ci0WmNfF"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2aae3810558so35767775ad.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 06:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771685331; x=1772290131; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gz+ZDGsHMTEG/Ms65NnPn5UMtTR5l/RI93OOKvh7syQ=;
        b=Ci0WmNfFG1mnAwc/0RO8a744/gOKqHKaBcrO3kjBwppylof0dDDwOR5lX0xyV6WYUB
         L1CFFGFq7AEmFD/wDxxeM+lTKfK5ResbnMLJyU6MkWsIK53eKiAeTpfwt6GCgjKKoZkr
         +c0xdo974BSo3jyP27lDHI87yKpW9JWCLHotkInnPRzvqtchQtxbAVPvriDUHAW8aqQo
         gJ7+3+ZstJf/87z9xu9zljA13ZH1wnxrmiOdGtTspjfHil9qQK2Exg3nomj+R+KP0Hd8
         DdReMvmn/Qbw7TOQERKxYwkcmrdWrcgXOiSygNImfS75haoXG9nBdsy/dYEcsaZIzAS9
         w82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771685331; x=1772290131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz+ZDGsHMTEG/Ms65NnPn5UMtTR5l/RI93OOKvh7syQ=;
        b=t6aWdeJbZGfvmWxLsX6czVoze4TD4fYcY1Wz3ZccnUCYQIAqIx9BExWsgteMTDlDKu
         JBFLNQlwx19BFns9fSMzQ2mT+gsEWE1ZysSBWKIk3ZE8QrmNP3IOzOO8/OM6sr6ER/N9
         kaxmOt1M6onficWHoQTw4O2zd6umW65i3OmEuo/1WWIDthrrPbipugqfKkh46pELYmWs
         rtIcMoL171Kd4ZMRUKOKIAm+erirJfpRpMQ3QXSGT8/gyazmO06IuMjUissuPCIoSKdI
         PlWRk9lC5Pu5L7Ir4DwSl2kEcKc41LGgvS4hgH29vvfrFsZzIeJoiuDnbs+bWw+P0an5
         PUig==
X-Gm-Message-State: AOJu0YxVuSzxxV8FGJQFMBRpM6GfBo809sQjEoTsgI0Yj0Sd0NfhXhDb
	6RzN4HXrjPGcrd6Mck4GX6y/xpg7tCtIpbhCDhnMzqC+AJyloxjelHDDKiGFR4lKaYn/k1VsYcx
	md8jJ8w==
X-Received: from plv12.prod.google.com ([2002:a17:903:bcc:b0:2ad:5a23:794e])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bcb:b0:2a9:327f:aa2f
 with SMTP id d9443c01a7336-2ad7451256amr27135015ad.26.1771685331374; Sat, 21
 Feb 2026 06:48:51 -0800 (PST)
Date: Sat, 21 Feb 2026 22:48:15 +0800
In-Reply-To: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771685327; l=2555;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=TIW7di7W9B6L4rzU//z3c0xJPlQEQJg5QsLFlDFJjv0=; b=tT2ibPRmS7uKKQm5BH41kwejb6ZUF26AK2nvOFDZs6YaDsP8VT92urhA7PFfBNqiuoM62Q7LS
 A9Usc2eUI0YCx/s9FShl7a4IrvB8+jvW9V+rEpYN9brlUxx9xVd9jnu
X-Mailer: b4 0.14.2
Message-ID: <20260221-legacy-ncm-v2-1-dfb891d76507@google.com>
Subject: [PATCH v2 1/2] usb: legacy: ncm: Fix NPE in gncm_bind
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org, 
	kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="utf-8"

Commit 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle
with bind/unbind") deferred the allocation of the net_device. This
change leads to a NULL pointer dereference in the legacy NCM driver as
it attempts to access the net_device before it's fully instantiated.

Store the provided qmult, host_addr, and dev_addr into the struct
ncm_opts->net_opts during gncm_bind(). These values will be properly
applied to the net_device when it is allocated and configured later in
the binding process by the NCM function driver.

Fixes: 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
Cc: stable@kernel.org
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202602181727.fd76c561-lkp@intel.com
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/legacy/ncm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/legacy/ncm.c b/drivers/usb/gadget/legacy/ncm.c
index 0f1b45e3abd1a1ead7b2776be10a2a5747960136..e8d5655340530aa38fde698f876e785122f0cce8 100644
--- a/drivers/usb/gadget/legacy/ncm.c
+++ b/drivers/usb/gadget/legacy/ncm.c
@@ -15,8 +15,10 @@
 /* #define DEBUG */
 /* #define VERBOSE_DEBUG */
 
+#include <linux/hex.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/string.h>
 #include <linux/usb/composite.h>
 
 #include "u_ether.h"
@@ -129,6 +131,7 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 	struct usb_gadget	*gadget = cdev->gadget;
 	struct f_ncm_opts	*ncm_opts;
 	int			status;
+	u8			mac[ETH_ALEN];
 
 	f_ncm_inst = usb_get_function_instance("ncm");
 	if (IS_ERR(f_ncm_inst))
@@ -136,11 +139,15 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 
 	ncm_opts = container_of(f_ncm_inst, struct f_ncm_opts, func_inst);
 
-	gether_set_qmult(ncm_opts->net, qmult);
-	if (!gether_set_host_addr(ncm_opts->net, host_addr))
+	ncm_opts->net_opts.qmult = qmult;
+	if (host_addr && mac_pton(host_addr, mac)) {
+		memcpy(&ncm_opts->net_opts.host_mac, mac, ETH_ALEN);
 		pr_info("using host ethernet address: %s", host_addr);
-	if (!gether_set_dev_addr(ncm_opts->net, dev_addr))
+	}
+	if (dev_addr && mac_pton(dev_addr, mac)) {
+		memcpy(&ncm_opts->net_opts.dev_mac, mac, ETH_ALEN);
 		pr_info("using self ethernet address: %s", dev_addr);
+	}
 
 	/* Allocate string descriptor numbers ... note that string
 	 * contents can be overridden by the composite_dev glue.

-- 
2.53.0.345.g96ddfc5eaa-goog

