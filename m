Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E52B2C1594
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783810285; cv=none; b=Sb/eTQY3TocAZHD1B2Yxywi4RL67i9jiPBWjJOSJCTE+fOBvayLfgjKO7jG9sjBQLrtj+XeMX4Ts7Ehg+FzCdA/CxLajj8NAvK2hw47PbPhu/UltgMcOx7UDPQzKwi9/p8yplEOm5lG+utCcU2tJcN3+kkTpUdnzYuhChQXqdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783810285; c=relaxed/simple;
	bh=/aSk/2Lg3g9/qM7hm/5lha+DFmFUObuTa3H0bVXBqLY=;
	h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type; b=XFnY+85OVgTvO81dI0zcJ3mVH/4qgHC6p3y2wpNFi7Pibb3Yr6XLPDpEi8PGdH2/IV91jAdw5G46TXBM9skrGCtLFFYVojg+5iMLo6NVTL0XtT5Vm1+bUY6LzZdhO6H258ES4ZcWqhYXTjjJbyHnjsqtLqeTc+Zs2gwgf7uugQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qpeap05b; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qpeap05b"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-738b39dad22so739879137.2
        for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 15:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783810282; x=1784415082; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:date:message-id:subject:from
         :to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5R6HnGXZXtInrfuHH3ZOOf4L0fGX1MF8Im5Pn0xI8g=;
        b=Qpeap05bxsHJc7qTm0pgtSm72c+WZCIf6FW21WvsM/J7ol/oDKsIEbry48peMh3RXN
         B15UTOjGth5uxytJcCMZG37uTRclazKKd5+SrMCadmrhfnWzC3HSMeTXs5jmEUL5rM45
         wYC1r1qhsmXTQNOWXcjMvivsxThPXh+MUYFjUSmkzv6pVlCFSNsYkIoOH6IzUYIpTC56
         mS7cOwqEYC7ZvsHs08dgcW8Z2oZv6qk5NAFDVvqurVyNB7UyioqN8bnVonaWn/42B1wN
         hL0y/unvcZZ8NUqbQo6B0iT02oXDPgFwmJImyAEDG4s7eeBqb1AlMR4+MGE0Vhju+H54
         WooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783810282; x=1784415082;
        h=content-type:mime-version:user-agent:date:message-id:subject:from
         :to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H5R6HnGXZXtInrfuHH3ZOOf4L0fGX1MF8Im5Pn0xI8g=;
        b=UNCZbPxINOk47Ib0iHAQOy8nI7TC0hrApd4SLwkgywXvnf+jn6UHlDghZgqdXg5MJT
         NDMncLXRj82ZtzPHjqE7tzkGKfCi6K7YgnFSMlTBu+glFoNqxX4CD6QUjvS4hJphkzmh
         8cIX7ZsigHsKRPNeHiJ6FGlV0JEpT71imLK6aSyi/0gx4NPjeXcSbmSSOPGEpbUwLX2s
         oG2J0YmKp5qr/GJ9Xt3TBp0k420FFAXuHwaq2ER+z7amilAbfsXCOs688TmJ5KI9g4sw
         L7v/I6S+2yg9bxRVlKR+DJR51dArA/iLQWuu1dMYFM+v/vucKzxPV7TCkW/uZwTG+Z/F
         Q+nQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZ9N9dQTDfXKFgECPrdLqHc2VweFuLoqE4Xu8iyvL0Fac5udo2mvJWBDW3kxDG5w2PPsovKUZKD9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAU2rDvUiC7d9xk31rs8qQ/QgDtEwZ58IDrRddbr0uFgRRT8ub
	aZ8fLOpDI+/j0QGcS9B5tg/nYQCcfEthDSRSjJPSDWdW3gUBOuQUkKw1H89c
X-Gm-Gg: AfdE7clL2nFsOP2v7XMFFhsr88NrFN3FrMg7/lmDSV7+6Vwlbc6VdSzIe84phbaKx87
	t/jl4y+Cepmt2t4NKsmZndn7W2qxcbJSXNlUD7O/mFD4oPrICGZ32YFzwMCau3sqdWBmb9WFy67
	k5K3AoKAgu4zp4Opt6ajLiVmXREBtDa/aJsNrKb5kIdb2ghj5hQZVEtQgN2/AF68LoSDNF3Jdab
	Yak76H/5gNkzrZvo9woJqDQB4lI6k1AntezgjP0iyRV1jH8VggkokGynW806IrNhR30m5ZZra8y
	BXth4OIWInMq+RT4FyReqlFp+b8YW6zFIbK0W8v8Vu0+BCNdmBagwwaXcDOM5whIQIoL9R7k+a2
	4qIYJ+5GIegbTwN5/BbNmbITCkhOtNtEcbHIzHIJUGgy65HbepSW6TQucQBSAEia+JnCqFppe7V
	wh8Yjy9hVYdG7fQYtFjA4RpFW668YghfwJbHFDtcN9UJvi/lMNUZk=
X-Received: by 2002:a05:6102:370b:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-74533e10340mr2458704137.24.1783810282325;
        Sat, 11 Jul 2026 15:51:22 -0700 (PDT)
Received: from [120.7.1.23] (135-23-94-154.cpe.pppoe.ca. [135.23.94.154])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed258bb75sm6082067241.1.2026.07.11.15.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 15:51:21 -0700 (PDT)
To: LKML <linux-kernel@vger.kernel.org>, Mika Westerberg
 <westeri@kernel.org>, Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, USB list <linux-usb@vger.kernel.org>
From: Woody Suwalski <terraluna977@gmail.com>
Subject: [PATCH] Kernel 7.2: fix for crash during init of thunderbolt driver
Message-ID: <62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com>
Date: Sat, 11 Jul 2026 18:51:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101
 Firefox/140.0 SeaMonkey/2.53.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------CC7D537FBF146DA61E425DCC"

This is a multi-part message in MIME format.
--------------CC7D537FBF146DA61E425DCC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Kernel 7.2 now includes the following patch from Mika:
=====
commit f5cc545f59699549adbaa4084149f8247865a51d
Author: Mika Westerberg <mika.westerberg@linux.intel.com>
Date:   Wed Nov 19 12:53:58 2025 +0200

     thunderbolt: Wait for tb_domain_release() to complete when driver 
is removed
=====
However as testing on older MacBookPro and MacBook Air, this patch is 
causing a crash on driver insmod.
/...
[   10.570223] [   T2604] ACPI: bus type thunderbolt registered
[   10.580666] [   T2604] BUG: unable to handle page fault for address: 
fffffffffffffff8
[   10.580745] [   T2604] #PF: supervisor read access in kernel mode
[   10.580796] [   T2604] #PF: error_code(0x0000) - not-present page
[   10.580844] [   T2604] PGD 2ec19067 P4D 2ec19067 PUD 2ec1b067 PMD 0
[   10.580915] [   T2604] Oops: Oops: 0000 [#1] SMP NOPTI
[   10.580929] [   T2603] acpi ACPI0001:00: SBS HC: offset = 0x20, 
query_bit = 0x10
[   10.580968] [   T2604] CPU: 3 UID: 0 PID: 2604 Comm: (udev-worker) 
Tainted: G S                  7.2-pingu #0~rc1 PREEMPT(full)  
9f8aaa247129d19aebb6b0d19f7b648b1f9f7f36
[   10.581126] [   T2604] Tainted: [S]=CPU_OUT_OF_SPEC
[   10.581165] [   T2604] Hardware name: Apple Inc. 
MacBookPro8,1/Mac-94245B3640C91C81, BIOS MBP81.88Z.0050.B00.1804101331 
04/10/18
[   10.581248] [   T2604] RIP: 0010:complete+0x3a/0x70
[   10.581301] [   T2604] Code: 61 c8 00 48 89 c5 8b 03 83 f8 ff 74 05 
83 c0 01 89 03 48 8b 53 10 48 8d 43 10 48 39 c2 74 29 48 8b 5b 10 31 d2 
be 03 00 00 00 <48> 8b 7b f8 e8 4d e9 fd ff 48 8b 13 48 8b 43 08 48 89 
42 08 48 89
[   10.581441] [   T2604] RSP: 0018:ffff92720020ba98 EFLAGS: 00010046
[   10.581496] [   T2604] RAX: ffff8c82c6a2b3b0 RBX: 0000000000000000 
RCX: 000000000000000c
[   10.581559] [   T2604] RDX: 0000000000000000 RSI: 0000000000000003 
RDI: ffff8c82c6a2b3a8
[   10.581621] [   T2604] RBP: 0000000000000282 R08: 0000000000000000 
R09: 0000000000000000
[   10.581681] [   T2604] R10: 0000000000000001 R11: ffff8c832ba20d80 
R12: ffff8c82c6a2b3a8
[   10.581744] [   T2604] R13: ffff8c82c81f02b0 R14: 0000000000000000 
R15: ffff8c82c6e53148
[   10.581808] [   T2604] FS:  00007ffaf52c99c0(0000) 
GS:ffff8c839ad88000(0000) knlGS:0000000000000000
[   10.581881] [   T2604] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.581935] [   T2604] CR2: fffffffffffffff8 CR3: 0000000105596002 
CR4: 00000000000606f0
[   10.581999] [   T2604] Call Trace:
[   10.582032] [   T2604]  <TASK>
[   10.582061] [   T2604]  device_release+0x3a/0x90
[   10.582112] [   T2604]  kobject_put+0x8a/0x230
[   10.582166] [   T2604]  icm_probe+0xf2/0x550 [thunderbolt 
2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
[   10.582415] [   T2604]  nhi_probe+0x196/0x390 [thunderbolt 
2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
[   10.582620] [   T2604]  local_pci_probe+0x3c/0x90
[   10.582668] [   T2604]  pci_device_probe+0xb0/0x1d0
/...

The fix is to check if tb->cm_ops->complete has been initialized before 
using it.
I have also added couple of NULL pointer checks before calling a function.
I think that another issue could have been caused by a use-after-free of 
the tb structure after kfree() call.

I have tested it OK on my older hardware...

Signed-off-by: Woody Suwalski <terraluna977@gmail.com>
---

--- a/drivers/thunderbolt/domain.c    2026-06-23 07:35:46.060061342 -0400
+++ b/drivers/thunderbolt/domain.c    2026-07-11 15:09:12.748107785 -0400
@@ -321,13 +321,19 @@ static void tb_domain_release(struct dev
      struct tb *tb = container_of(dev, struct tb, dev);
      struct tb_nhi *nhi = tb->nhi;

-    tb_ctl_free(tb->ctl);
-    destroy_workqueue(tb->wq);
+    if (tb->ctl)
+        tb_ctl_free(tb->ctl);
+
+    if (tb->wq)
+        destroy_workqueue(tb->wq);
+
      ida_free(&tb_domain_ida, tb->index);
+
+    if (tb->cm_ops && tb->cm_ops->complete)
+        complete(&nhi->domain_released);
+
      mutex_destroy(&tb->lock);
      kfree(tb);
-
-    complete(&nhi->domain_released);
  }

  const struct device_type tb_domain_type = {
@@ -405,6 +411,8 @@ struct tb *tb_domain_alloc(struct tb_nhi
      if (!tb->ctl)
          goto err_destroy_wq;

+    tb->cm_ops = NULL;
+
      tb->dev.parent = nhi->dev;
      tb->dev.bus = &tb_bus_type;
      tb->dev.type = &tb_domain_type;
@@ -600,7 +608,7 @@ int tb_domain_thaw_noirq(struct tb *tb)

  void tb_domain_complete(struct tb *tb)
  {
-    if (tb->cm_ops->complete)
+    if (tb && tb->cm_ops && tb->cm_ops->complete)
          tb->cm_ops->complete(tb);
  }



--------------CC7D537FBF146DA61E425DCC
Content-Type: text/x-patch;
 name="049_thunderbolt_complete_7.2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="049_thunderbolt_complete_7.2.patch"

--- a/drivers/thunderbolt/domain.c	2026-06-23 07:35:46.060061342 -0400
+++ b/drivers/thunderbolt/domain.c	2026-07-11 15:09:12.748107785 -0400
@@ -321,13 +321,19 @@ static void tb_domain_release(struct dev
 	struct tb *tb = container_of(dev, struct tb, dev);
 	struct tb_nhi *nhi = tb->nhi;
 
-	tb_ctl_free(tb->ctl);
-	destroy_workqueue(tb->wq);
+	if (tb->ctl)
+		tb_ctl_free(tb->ctl);
+
+	if (tb->wq)
+		destroy_workqueue(tb->wq);
+
 	ida_free(&tb_domain_ida, tb->index);
+
+	if (tb->cm_ops && tb->cm_ops->complete)
+		complete(&nhi->domain_released);
+
 	mutex_destroy(&tb->lock);
 	kfree(tb);
-
-	complete(&nhi->domain_released);
 }
 
 const struct device_type tb_domain_type = {
@@ -405,6 +411,8 @@ struct tb *tb_domain_alloc(struct tb_nhi
 	if (!tb->ctl)
 		goto err_destroy_wq;
 
+	tb->cm_ops = NULL;
+
 	tb->dev.parent = nhi->dev;
 	tb->dev.bus = &tb_bus_type;
 	tb->dev.type = &tb_domain_type;
@@ -600,7 +608,7 @@ int tb_domain_thaw_noirq(struct tb *tb)
 
 void tb_domain_complete(struct tb *tb)
 {
-	if (tb->cm_ops->complete)
+	if (tb && tb->cm_ops && tb->cm_ops->complete)
 		tb->cm_ops->complete(tb);
 }
 

--------------CC7D537FBF146DA61E425DCC--
