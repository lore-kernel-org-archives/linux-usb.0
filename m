Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D33DA7E4
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054027; cv=none; b=FUk2ZEwxocksHDAitdGQThGMc+9YQBf0tqQZE02VtQ19wOaIJkzdwGIL00iuaoLk5YqfjOvtNFvKsFps0zhN625Z7Zr0tfEE+oH6foDR1JPGiQDCow4qc2yLr+HfV4W6H+18T9mzxbQzNfrKbGdL0WNg+3l7LxEGWjIwW25zxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054027; c=relaxed/simple;
	bh=HOcRnjQ/78+UziIir9oKy8ANLOoA8o6bAT5N5PtLkpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPDRJ02k85EVoZLaj+HOmLoEZcRiLtocmP0T6Q5e09eFXzbH5aqNLWE00ts6RvLvDc4qsA8V8GfVv8NRtBV9Kbju9uRcQRjuuJIMfojMA6t+InKYD3mHEkmN79tpiesSKC3dS4ItuFNZqUnr2LalJSAdR7F5cjre/sRGYMsfSyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXfj5Hb2; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXfj5Hb2"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd60d155070so885219a12.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054026; x=1792658826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYttvjru9fKHemUV/qFF+L5++eupMPrrcmnwQVMAKQQ=;
        b=XXfj5Hb2/vHfMhAXzMo+GL7tEdt8m0i0jRrMwVGm/uZW3CXMZ1tkR7fu6O702RKbqi
         gMdkjMgOshedqjlYDUd2Gr3HCJ48G9pPFbui0mvE9CxVqraMqFRPRtRh6R3zxyu6iGTK
         IoNA9eCW+d7AXren7o61t30JJraJRIBBpLaGspOePTzWKYkCW8HCb7RWmG83yGjEHNGX
         Wb21weEyBin4oRkd/3Vxd8yjDHvv3HGRtEKv3alfBjGIiqXXYh4Uq8wZ7uSg3K4B52vn
         IarERUf5N+8vNo+oZBwkgC1KmiGwNq1oz98toBbg8FbS8ourPLbqlY1eZB7a7E2VnKyD
         9nZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054026; x=1792658826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYttvjru9fKHemUV/qFF+L5++eupMPrrcmnwQVMAKQQ=;
        b=Yi/Cy59hT19H9KheBTfjEkrvLe/vIFlKiqD7EZ/eNRmYMuBw1b1qeUrX7uUN0GLurD
         /Nyej7MGbtifo+tPQZxcqvx+RUh7J5/w3Ca40tZ/w6G7O5TjsDTrK/RIDq+ORgZHM7o0
         SNDmB3dlO2g8Hz4Vc/X5qJ/4LUsUgH7Sn5H6cOXIteWdnGDxTYc0x0OyZBnWsiiysCJH
         xSxbUcrcLst7iDyXtPEr5AEaZlWxR1ZmxIwebOGAIwAMp2LgacNoWyzEMUBRzLqTZOGO
         aTqRndFbrJBCl9//j0rY77nxerZ8I4zfaXtiUF8tUigQuC99rpQ/2YnPeEMmF6nirvM6
         nKQg==
X-Gm-Message-State: AFq9FYK2T0CojFUvZ7B57hKqYZwvu3tgrBMg/CIeWfBmTKTdvpQI5/zj
	jr09zE4X50CKuUjJcJ4FveTOPSHjD0r6AFhInm3pzqcx9wio/Eqeqcp2bhbnMFpZ
X-Gm-Gg: AYBFou3w6aWjZ6q3F+WrL+IbSnVmvB75mlaHo3s1H6fMsWKP2g4ZwY/a5X/i9SDhgF+
	f+jXGElXdfmrgLxa67Z/6B/pzVoykAFSWD4FNtQhYJjrAI37kuLCA/c1jypDBmy4eAsTHfNdHTt
	jdMMVUpSlNr3oPSW5qsseJPUi65vawWyxp+wPGp+0hEXgult5loeG/8+x/7xOdEpvck4ioi9SXU
	4+EVaYsmFZ/vwsDwx3GXU4Iv6s5sXWhsbTil3etaY0oUQPLxlOytj6rH92jJmtTt+0CE5ZTj2kb
	4r/M/VMrdoCzB81eLbFFBiGqJZiqAb5qdofhATVJ+t+zttqIcqU8e6f2E/4PXe5m88v26dmkdDg
	5h9sJOVrzVJJ/30bx3/XrSM1hcyFtTcSJuF4C7trb4b35Hu+elzwoAmcjiCIWnjsFE0cSDZ5VPV
	txrA3VK3oDHAKCjf7Q/S9/7eNvG99hJBZ0fRIkqJuLHgR1iiVkAUA+MDTArrhmf2G6o5tU8HYmd
	nWTJLy2KcYM/NYAufFlrj3xP/Oa3QqnsrVqn5wxf8Apt7jXmDLQcD61o5of/YcvnimtKSVbaDjI
	VNlk41wPbkxubtIYuPp5NvuBTKtag60CRI1W0XNRkkk16gGh
X-Received: by 2002:a05:6a21:490d:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3e16bb71b3amr16357663637.10.1792054025821;
        Thu, 15 Oct 2026 01:47:05 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c57517sm900574a12.13.2026.10.15.01.47.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 01:47:05 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] usb: gadget: f_printer: fix pnp_string use-after-free on reconfigure
Date: Thu, 15 Oct 2026 18:46:58 +1000
Message-ID: <20261015084658.70918-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_printer_opts_pnp_string_store() replaces opts->pnp_string with
kfree(old) + kstrndup(new) under opts->lock only, with no opts->refcnt
guard, so the IEEE-1284 ID string can be changed while the function is
bound and the gadget is enumerated.

printer_func_setup() answers the host GET_DEVICE_ID class request from
(soft)irq context and reads the string with no lock:

	value = strlen(*dev->pnp_string);
	...
	memcpy(buf + 2, *dev->pnp_string, value);

dev->pnp_string points at &opts->pnp_string, so a concurrent configfs
write that frees the old string races the setup read -> use-after-free.

KASAN, a configfs writer racing a host GET_DEVICE_ID (reproduced over
dummy_hcd):

  BUG: KASAN: slab-use-after-free in strlen+0xe/0x40
  Read of size 1 at addr ffff888005036000 by task swapper/1/0
  Call Trace:
   <IRQ>
   strlen+0xe/0x40
   printer_func_setup+0x410/0x890
   composite_setup+0x67e/0x4690
   configfs_composite_setup+0xbb/0xd0
   dummy_timer+0x1934/0x1e40
   __hrtimer_run_queues+0x1b6/0x410
   hrtimer_run_softirq+0x13a/0x260
  Allocated by task 3486:
   kstrndup+0xb2/0x130
   f_printer_opts_pnp_string_store+0x3f/0xf0
   configfs_write_iter+0x1a7/0x250
   vfs_write+0x5df/0x940
   ksys_write+0xfd/0x1e0

The setup path runs in atomic context and cannot take opts->lock, so
serialize by refusing to change pnp_string while the function is
instantiated, exactly as the sibling f_printer_opts_q_len_store() already
does for q_len.  While the function is bound the string is then stable
for the lifetime of the live reader; it can still be changed when the
function is not linked into a gadget.

Fixes: 24b7ba2f88e0 ("usb: gadget: function: fix dangling pnp_string in f_printer.c")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
Tested-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/usb/gadget/function/f_printer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1111111..2222222 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1269,6 +1269,11 @@ static ssize_t f_printer_opts_pnp_string_store(struct config_item *item,

 	mutex_lock(&opts->lock);

+	if (opts->refcnt) {
+		result = -EBUSY;
+		goto unlock;
+	}
+
 	new_pnp = kstrndup(page, len, GFP_KERNEL);
 	if (!new_pnp) {
 		result = -ENOMEM;
--
2.43.0
