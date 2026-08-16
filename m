Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8543124E4C6
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786904168; cv=none; b=hIZJG8Uv4R2ZhPeAF5HKxCuckenPi9XnlUzafjigMccEKc2vy+iVSwe8V2BwK2am6peoC7wB+JJWy4iD1FPFD3GSG4b79BtfkwzsbJG5RJQ3PF3Zs+XVjZCMw2eoS/F+bFMS6jWQFmPMs98xZVecRfwA3Kkpkn4Pecvd5uChNLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786904168; c=relaxed/simple;
	bh=oW8WDtEKirvx0mPOlGeZsjJBr0GaF+eKT6gExnakevs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ta6VO0qEzvDRufHBiZIIy/LgV1oSVOtdwoSpS8Iw4zlXAGcprEXpfj7kI9qY/Oz6oXKqk2E2MngB3+u39RdfGR7ODkZdc3ZLjFMED2tM42hDeAZ4PdQK82OQxHz2K4pho6MAiyClDaJR9/qwhVHZ7Tfsx0P4bvil4nfRC8P6O+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GS0334FR; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GS0334FR"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-394f4397662so151728a91.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786904166; x=1787508966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFfDkrfxwy7hG8CK5T75q58k3ed4tHaImnic4A+OQwE=;
        b=GS0334FR/HauLMhp9YiFZWzxCQI0kCMtwlLhTxMSGuWFHttL8bsyfo9iZMqZYsWyp6
         Roh4rkFqHJEDzNwdhueH2/xHvnmj8CP2vWMxa9lUMI00SLS4HxjIlatE5RaSuoDkr6SN
         ITdML8ltI9PaG1S76RExdS/8zlY8yDjMzkQ626p8JfH1AcZ8/drxL3zacb0v57XdmvqL
         j5+uNjM08UvlLHgfpDXu6CCw7YT9QLlX6ToPGU63fqMc/1EK25JBJ/8cttNhJrU9+g05
         YvYanLyq7DlmgxWaOtQ3Z1f1sqXzXuenuAcfNHUdKTpeu1vw+kVSfCgKmyAivKV/Er1b
         YyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786904166; x=1787508966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFfDkrfxwy7hG8CK5T75q58k3ed4tHaImnic4A+OQwE=;
        b=qFRkvCLG6uvYJcdCqMvgqndf6wvd6FI2i7RV1tA7oSoc0gmW1SjyQ8xpAcZARLe25S
         yDepVC58zawlUctP12xpWxXBPyKArMG4hsZz5/6dmjnvc9oeQixVIDkmveY66dj45Nri
         6Q6bwTz6UVK/smUVBnwLnGquuK+XG8MQA/KdGYkOg9aHoxPa0ytUA8NNgCO+M34ewJB5
         pItXZF1NJdvPZmTuxSAEeUgT+WPlgLCp6yF9ewZ8rDI/d+lE8gEd4J8KBiugrob+47o3
         fHAZl0B1AJRUSJeGY+0uFUdsOr+xHmJHK+CpzLCE6p9Sk9iXR7FOZ2AOHke0+ZK/nqhI
         /4LA==
X-Forwarded-Encrypted: i=1; AHgh+Rpt8qCBKSC/C9tetA7Th2eQw059zsrWkUuLBbOKtAUWtXDeA6Z5ud8jV+eJPKD6M+FuiW7rQ0Sj19M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLyXF7bf3LzjGyzDpSoV/KauKa3uHNxLnXSn/W2609A9/Uo66
	+FxCT9pz5wDg0/fla4ZtjyydpTxQ8+BOiON0y3HQ5+SVlDx6elc+78hH
X-Gm-Gg: AR+sD136wMgpHmLrfMUEp5c9QWx473dHwb6E/xR64s+CMXidHVzuRis9srObo9yLqLC
	XrSko+reEMZwWRLIakGxIyb/qBuVGRfSukzJfCsCnuiRIQsBk8+SWb8lsTQZmQ6YTdcfDpYzb9u
	N5bg2svdk0lzXUP431pm/d/BF/Y/z5KkNk65z32W08PD9vU17J3t6pxjB0i6Mq6iE17r3DDS4Nt
	zAMjO1AFoiCCxJjhb+bWPUA28szDygaK4ly1zGfptOqff3n1mHPjiSMSKUevSX+mGVn7xN2JBhk
	jl09PD45qS58vE5Ng+/YRCInhA8DUAHm4rzT2+md7CBlssPqtCwYLhcKq9vZvrRdi5ZMx2T3n5+
	ubDo2WGHYHae5rD0oM/S0wv8Z/QOq421ljVAqMXmakOK3P+MFRMn4veFq0T7mZXetbBXzs11Urs
	hSxtQXR7xZwhnzHq66oSPLJFndTT3J2L2hRzrUTVsJN6MdXj1PTNNsaYb8nxIZg5WnmZZ9Rll+v
	YyoqA7WhTTh5iruHcTRcI8u2pZ+I8ld7JtDLIxIbTaXY2f1MPuP2zGrvsO7yz+NDFpIyULTXB0F
	OYMrf+YvhBw2qkAv
X-Received: by 2002:a17:90b:5444:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-3933b8e2befmr14552562a91.3.1786904165699;
        Sun, 16 Aug 2026 11:16:05 -0700 (PDT)
Received: from localhost.localdomain (c-98-47-46-163.hsd1.ca.comcast.net. [98.47.46.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm55015503c88.8.2026.08.16.11.16.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 16 Aug 2026 11:16:05 -0700 (PDT)
From: Rishabh Jain <rishabh.jain1198@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mario Limonciello <superm1@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Rishabh Jain <rishabh.jain1198@gmail.com>
Subject: [PATCH v2] usb: pci-quirks: always assert xHCI OS ownership
Date: Sun, 16 Aug 2026 11:15:19 -0700
Message-ID: <20260816181519.88865-1-rishabh.jain1198@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <69fdc442-a4f2-42e0-80f6-6b35cbc207bf@kernel.org>
References: <69fdc442-a4f2-42e0-80f6-6b35cbc207bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xHCI ownership protocol requires the OS driver to assert the HC OS
Owned semaphore before using the host controller, then wait for HC BIOS
Owned to clear if firmware owns it.

quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS Owned
is already set. If firmware leaves BIOS Owned clear, Linux uses the xHC
while both ownership semaphores remain clear.

On an AMD PROM21 xHCI controller (1022:43fc), this caused every S3
resume to terminate Controller Restore State with USBSTS 0x401. Linux
then reset the host controller, both root hubs and the USB Bluetooth
adapter.

The controller entered resume ready and halted with USBSTS 0x1.
Endpoint state, 100 ms save/restore delays, scratchpads, the DCBAA,
device contexts and command, event and transfer rings were verified not
to cause the restore error.

Asserting only HC OS Owned changed USBLEGSUP from 0x00000801 to
0x01000801 and eliminated the restore failure across four S3 cycles,
including a stock-kernel test. Clearing USBLEGCTLSTS was independently
verified to be unnecessary.

Always assert OS Owned when the xHCI Legacy Support capability is
present. Use the existing ownership masks with a single initial register
read/write, and leave a debug breadcrumb when firmware owns the
controller. Keep the existing BIOS handoff recovery and legacy SMI
cleanup unchanged.

Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
Tested-by: Rishabh Jain <rishabh.jain1198@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
---
Ah, agreed, I didn't see XHCI_HC_OS_OWNED is defined! The +3 in v1 was
for selecting byte 3 of USBLEGSUP.

I've simplified v2 to use the existing ownership masks, one initial
read/write (makes sense to batch the writes), and the debug breadcrumb
you suggested.

Changes in v2:
- Use XHCI_HC_OS_OWNED instead of byte-offset access.
- Fold the TI/Renesas forced handoff into the ownership-register write.
- Add a debug breadcrumb when BIOS ownership is initially set.
- Make the BIOS handoff wait unconditional and gate recovery on the initial
  BIOS ownership state.

Additional context:

* Kernel Bugzilla #216470 documents the same USBSTS 0x401/reinitialize
  behavior and its impact on attached USB devices:
  https://bugzilla.kernel.org/show_bug.cgi?id=216470

* Commit a7d57abcc8a5 ("xhci: workaround CSS timeout on AMD SNPS 3.0
  xHC") is related workaround history: it tolerates a distinct AMD CSS
  timeout and resets the controller on resume:
  https://github.com/torvalds/linux/commit/a7d57abcc8a5bdeb53bbf8e87558e8e0a2c2a29d

The external reports do not record their ownership semaphore values but
are included as corroborating failure signatures that this might fix.

 drivers/usb/host/pci-quirks.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 0404489c2f6a..29e635a036a6 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1185,31 +1185,31 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 		dev_warn(&pdev->dev, "xHCI controller failing to respond");
 		goto iounmap;
 	}
+
 	val = readl(base + ext_cap_offset);
+	if (val & XHCI_HC_BIOS_OWNED)
+		pci_dbg(pdev, "BIOS owns xHCI HC\n");
 
 	/* Auto handoff never worked for these devices. Force it and continue */
 	if ((pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241) ||
 			(pdev->vendor == PCI_VENDOR_ID_RENESAS
 			 && pdev->device == 0x0014)) {
-		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
-		writel(val, base + ext_cap_offset);
+		val &= ~XHCI_HC_BIOS_OWNED;
 	}
 
-	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
-	if (val & XHCI_HC_BIOS_OWNED) {
-		writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
+	val |= XHCI_HC_OS_OWNED;
+	writel(val, base + ext_cap_offset);
 
-		/* Wait for 1 second with 10 microsecond polling interval */
-		timeout = handshake(base + ext_cap_offset, XHCI_HC_BIOS_OWNED,
-				0, 1000000, 10);
+	/* Wait for 1 second with 10 microsecond polling interval */
+	timeout = handshake(base + ext_cap_offset, XHCI_HC_BIOS_OWNED,
+			    0, 1000000, 10);
 
-		/* Assume a buggy BIOS and take HC ownership anyway */
-		if (timeout) {
-			dev_warn(&pdev->dev,
-				 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
-				 val);
-			writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
-		}
+	/* Assume a buggy BIOS and take HC ownership anyway */
+	if (timeout && (val & XHCI_HC_BIOS_OWNED)) {
+		dev_warn(&pdev->dev,
+			 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
+			 val);
+		writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
 	}
 
 	val = readl(base + ext_cap_offset + XHCI_LEGACY_CONTROL_OFFSET);
-- 
2.50.1 (Apple Git-155)
