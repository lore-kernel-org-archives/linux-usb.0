Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EA7493643
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787394249; cv=none; b=dHgjU4nYRvBYWTQRF2rF9s27OlCBM/mft/sPdGpAL/Br2s0sIBbmRO1pYTz8LdpmEqwYon0odWsbb7KT0YVlmziTTt0cLZMvWDOYp9+jJZ48AC5q6MC/7EWAgCiCSZh8bezDODlE6R5mUBemZQQ6RA5b7vMGm7PtsaE8A1rec+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787394249; c=relaxed/simple;
	bh=MY+mnpwfABl43+R4lLwnYc5uAZ2mnNN0/kYDMO9ThH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6HXESaAjNamEqD7tuOAm9W8aBEshToe1uSpU2LPOMdWLs6VHtm50Rly4CuPe04xGN7NM13Fj9MyisbgEJsQUwFN7Gb9RW5ZzJXzUj/znNJYYjUv1J0YqqYhyg2uDuLlXPrgyLTJaufpEiZLGIj5M/01xsuKsj5+Ja2cnz+ygE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd4Mo14o; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd4Mo14o"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c9fcd903839so1090877a12.1
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 03:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787394247; x=1787999047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uGCc+Ym03Fgjj1SDrqU2gGDlotBz612tbq+Cy7bXAYc=;
        b=kd4Mo14oL3bWjdANnRkrC4Sr9MmDv8Kpd//dfJ+66ryEXkcHBzT1cwg+G+rcwc31oc
         i0VLLtlGLeoZxrASqdosqXJbvMoHdzSc/L5Q/Bby6dwIEQaN82ZtyRE30BCE5CWHyibi
         fDtn1eR+yLQ3o4NCEFWl2beERNhWloi+DXwF+H8puapnHgJG8QN8KkrbdzGhXMQQ6zw8
         rzndGh9USJ0p1nOub6hi6GvNhuN+idlsBHz4mrn+bBABOYu9q+frcjkaFoG1oJ9bojmh
         XHGHHow89kl8R0/Vs8FHtLwxWf1RHaNtQo5TGJ5lIwOxOhf+t+1ZsWU8fzwgxGk9SRel
         eY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787394247; x=1787999047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGCc+Ym03Fgjj1SDrqU2gGDlotBz612tbq+Cy7bXAYc=;
        b=SrTj9L1xdqKBSJutQ+4IZBgR/IYJe7049OGpVX+VJ9WdC+9JLALAR5HL5MjiAMcARw
         bE49OiSH94DfYB+zkvLCevoMpfjfmlrEFuXWEfqtlgpcu/yDTjwl2wZlqc+rcSYNHbuJ
         BXyGenVLHG+wFYfmNX5TdPWOGs6J91HIzq2ZsPQQZrO1kUaywS/UZ+woMWIXPZMcUSJv
         mCcP4mX95jQIYGpCkYq1cpAw2LwfsCsqdAKoTnB3XqjnASqlUGCF7viFHCkc+LDOgnT8
         mBNr0FpYoOqoHdym3fDSMFsvC5Ii+GzTDend/txY/s+GveLjfkVIGT0at3f3zn7B1B8v
         Xdsw==
X-Gm-Message-State: AFuF++nCOUNaHsTvCZML3yC9eiNpxhE/hcKGPcC+46epJRmjxWw/R390
	ca5o93g+FeWnGaNTriwh2YW8uGWJ0mFlXIFOFYXASaCVVbz+6Nr97ZsW
X-Gm-Gg: AR+sD12tznjM780s+fmwp3G0ZkxVPkjts4+hBAzr359KWJ3pyB0G9Ir0k9JF+qoOzd7
	WWDXxnxRO6T1RjwaZCo5byylSdxeHdCpdvw24FW4/qlv/OfzSHBUUG2Oig6Chskn6ThJgBirR3v
	UKWqfZyk/svpPLKU65Z5+26RjSp878ZvP/LB8zZjDz0dfJIqppbTomw/X9ydfZYzspsC3OfUz3h
	INYRg3PpfRE5AYL9C5/SSDb1T7nv/PfrHzNyOACMtet5gz1diu7F16ceL/hXufYD81r5OvND2/v
	fm4kg3kxZl8J7LEvBHczM9+0SyK2H4l6eskaSJ1VQwPUhLuGh0cp3PtixeywGHaDlieMYmgtx+i
	oD8SPSzIZO6pBcH3oihvYEN232MxEH1xbh7fIpndZq8hl/gKr+q039pB1SUXArjnUxz0IqK1qLc
	aobMovo0O8W971abWvO94jDLRvbKZ8oXj6OLhHsSIZ3YPoieXaJq7lo82moeEFcCrsCBYkDhzoR
	wXVfkYx+HJKY96ht06iOmNz+T1Z/5B+BOG+zjiwUbNV0n2IJsmugyqpmvtJ3/1I0PDLkV50
X-Received: by 2002:a05:6a00:b42:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-8520be923e7mr7327295b3a.16.1787394247324;
        Sat, 22 Aug 2026 03:24:07 -0700 (PDT)
Received: from erdaitian.tail85cd49.ts.net (2001-b030-a81d-0a00-0000-0000-0082-2410.hinet-ip6.hinet.net. [2001:b030:a81d:a00::82:2410])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef07a12sm503958b3a.16.2026.08.22.03.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 03:24:06 -0700 (PDT)
From: erdaitianjiao <erdaitianjiao@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: validate CAPLENGTH in xhci_gen_setup()
Date: Sat, 22 Aug 2026 18:23:57 +0800
Message-ID: <20260822102357.4634-1-erdaitianjiao@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xhci_hcd can be bound to arbitrary PCI devices via the
driver_override sysfs knob. When this happens to a device whose
MMIO registers are not xHCI capability registers,
xhci_gen_setup() reads CAPLENGTH from the foreign register
layout and uses it as a byte offset to compute op_regs.

A non-xHCI device can return a CAPLENGTH value that is
  - not large enough to fit the capability register block, or
  - not 4-byte aligned (e.g. the NVMe CAP register's low byte is
    0xff, which becomes CAPLENGTH = 0xff).

The unaligned case is especially harmful on arm64: MMIO is
Device memory and Device-nGnRE accesses require natural
alignment, so readl(&op_regs->command) faults with an
alignment exception even when the address is within the
ioremapped region.

Validate CAPLENGTH in xhci_gen_setup() and fail probe with
-ENODEV if the value is smaller than 0x20 (capability registers
are 32 bytes per the xHCI spec), not 4-byte aligned, or leaves
no room for the operational register space within the mapped
region.

The run_regs_off read on the next line has the same shape, but
is not reachable on the xhci_halt code path and is left
untouched here.

Reproduced on a QEMU virt machine with a syzkaller repro that
unbinds the NVMe driver on 0000:00:02.0 and binds xhci_hcd via
driver_override. Before this patch the kernel Oopses and
panics; after, the probe is rejected cleanly. Ran the repro for
over two hours (66,709 consecutive probe attempts) with zero
Oopses.

Reported-by: syzbot+c90273bf9017ef1462af@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=44c85514940262c7e2fad6f8fd0c07d8f2884154
Fixes: 552e0c4f12fe ("usb/xhci: move xhci_gen_setup() away from -pci.")
Signed-off-by: erdaitianjiao <erdaitianjiao@gmail.com>
---
 drivers/usb/host/xhci.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 091c82ca8ee2..fb0075d0530f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5432,7 +5432,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 */
 	struct device		*dev = hcd->self.sysdev;
 	int			retval;
-	u32			hcs_params1;
+	u32			hcs_params1, capbase;
 
 	/* Accept arbitrarily long scatter-gather lists */
 	hcd->self.sg_tablesize = ~0;
@@ -5453,8 +5453,16 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	mutex_init(&xhci->mutex);
 	xhci->main_hcd = hcd;
 	xhci->cap_regs = hcd->regs;
-	xhci->op_regs = hcd->regs +
-		HC_LENGTH(readl(&xhci->cap_regs->hc_capbase));
+	capbase = readl(&xhci->cap_regs->hc_capbase);
+	if (HC_LENGTH(capbase) < 0x20 ||
+	    (HC_LENGTH(capbase) & 0x3) ||
+	    (hcd->rsrc_len &&
+	     HC_LENGTH(capbase) + sizeof(struct xhci_op_regs) > hcd->rsrc_len)) {
+		xhci_err(xhci, "Invalid CAPLENGTH %#x (rsrc_len %#lx)\n",
+			 HC_LENGTH(capbase), (unsigned long)hcd->rsrc_len);
+		return -ENODEV;
+	}
+	xhci->op_regs = hcd->regs + HC_LENGTH(capbase);
 	xhci->run_regs = hcd->regs +
 		(readl(&xhci->cap_regs->run_regs_off) & RTSOFF_MASK);
 	/* Cache read-only capability registers */
-- 
2.55.0

