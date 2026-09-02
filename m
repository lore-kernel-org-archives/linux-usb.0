Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7642E738F
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 01:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312259; cv=none; b=dmU/psg8Ltlr1WmRNhKsePTExB0R/3yYG1f5eoq4L9+8mXG8pcH6IvOtnmEQa6yk9fjictLRgf9rxx0sMP1WBUADV9XeKghtvgTBWG3LUL2TYqBvoIkuORvDgXUjZOsP//YfTO+NtZ7faovf33bk1s+oxNOacEAFbiCV3yn5rxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312259; c=relaxed/simple;
	bh=OE6zUP8LM9A08GqXAFXgldNPvFoJM+cZir5oxvqX3BY=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:Message-ID; b=fb8DMAoIQ0geheXr93q5/OOGDKmKfIPPXhJvHQ8sv4U6p8nAfskZtwJRvM0HJLydiM11MtohOr0+cnP4G3muJasUrWiuUURP+hGMzror5JASCuTnwuvu8t3aM3MaZGKSCKvBEGtxsw9h5hMrSYAI1UAS9SuB9b49tmMLvHl5KVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsgzYn/w; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsgzYn/w"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedf082ba2so56993a12.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 18:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788312257; x=1788917057; darn=vger.kernel.org;
        h=message-id:cc:to:subject:date:from:references:in-reply-to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bM1Ama1SqfILo+ToLsEHyErile10Oj26qImjJshC1qs=;
        b=DsgzYn/wuefapijPc71p3n7AHTBmxfKBzVRr22kfXP1DoWuk69WPTMyZ4a8BUDo7S2
         X1Diuo5K1+Hrljreyn1iJJy1x0qARfG1eULyPxsflt0Li24+mkR9/0gLwHQElqJmHF+I
         ArW9X6o2nvM3RT0TT1dpCgg6JgTxACdmkC+O++72ryxzw7yVa2GJ8b/fvKXznjUFNJln
         IoyaozYUsBbeUV6jRyw6mWfZnqsfIhjHvxNaVFx3AS8oRiSTtpQ4iUIGQFKfrgBw6vkz
         5TJ2arB0y0kVrq9ZVEU7jXkcXlXR244XbrueApe+2BMqaUYkMr18tn0NynTD/CLR3zxi
         wEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788312257; x=1788917057;
        h=message-id:cc:to:subject:date:from:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bM1Ama1SqfILo+ToLsEHyErile10Oj26qImjJshC1qs=;
        b=DmlvojQCKLvojc3BXA9CL/eSycEGMZtKaathEdUi8c0iGrqNScP9Y4ZIvkhs8yKdos
         UhtdxW5kM8pOcEQvvWUfiPQfFOZPb3A6mYIw8GEG/h2RiZdfHhW8j/N3D7SYAN6pqUkx
         e8BqkXb+iqbfYMOnDXeigpCwUHrTf0U7YTnzhcR6LIsexV4xQNI1dyouEeu87vSBBP+R
         /5kP6Asjvo1DEDR8gXPNEJUttp5vlHsQ27bKIc95YyXB91nNDTP8/78aByB0vcO2Oukj
         LFMcWsoipekp/w6uv9RlKULmZb6IM/VcgT/zc84BwHX+Px9e+ld7US9VWRkFjiriDey6
         Hk4w==
X-Forwarded-Encrypted: i=1; AKwUvBzUQc5pqs9i9EAHlkg4TDngt5LjGh7Oz0DYnPKW0X+qO22lYDpNNNN/6j8Xo8YGYBc3EgmfsPaYtvo=@vger.kernel.org
X-Gm-Message-State: AFuF++mqg0QQK1XzxLc5oewGCi2Hj4viorvTKU0CkdsEzfQQFxD+u3rp
	G1o8Xy0h++EIwuj5H+Y8iOeZOQm98bFN1qlHEdegrEDI3P0WjRxTCtTA
X-Gm-Gg: AYBFou1SUa6HZhK3bvLJZw/ytrGElkRC8zdP6YewLnczbooxnz3/gO6a3fEGhG5geRj
	tIug5brYlA7OKEInHN3Yr9aHpw0i086GkIRHcGUuEsSCFWIqqDX1U58iYVh8GYraYRTDElFbpgh
	pdUXJQ3cTmPTJvclsKY622efMuumRPS3Fd3guMwWEYAeX+VF5tRyE9VmS9+JYZWNidQ/N+7aDWa
	y8i8G0joDJZd+X7GgUZPKUjF5U0ZqwQ4u560pfg0q8kfJYnDvIX6/yIjJkZJNzUdWm7vxmtyOuy
	N1pbr5iFJ82euOxZZ+kdaKQx86kfNs9OBFw61Ha5lEakcQLmtZavpCtr2iCoDIBmOE7L4BZ0zsh
	MrsVfpahzMLB5ZlTAvMfqyj0oA5akdTD4pvbOpwsyBoTCClzB7qK9J8nkiCX7RofeHZEr31SLZt
	xjwnr7pBcy1FfCXVwkN7un20v+kGkklC3Nv9gpGfh/rdZi2HXeQCWWL3IWMLVJuuf7lezvRgOXX
	6nHrc3xiwHMvMkTJEDnaAnCwIUqVK/0RfCGqWAqL+lGSXdZUwLxUUV1Xo7lTwhXSv8rUTf8+9E4
	6G4jGQLyAoSs7ffLwWwJSHPhvCP5U+/Vg5P42dAm2rRrpxqtT1dlVvvQcc9lZcRrVw3Bkqj6qfs
	0i7oAGSml
X-Received: by 2002:a17:90b:5828:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-39aedf2714amr1010525a91.2.1788312256977;
        Tue, 01 Sep 2026 18:24:16 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (c-98-47-46-163.hsd1.ca.comcast.net. [98.47.46.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79898sm2053080eec.15.2026.09.01.18.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:24:16 -0700 (PDT)
In-Reply-To: <20260831211126.23745-1-rishabh.jain1198@gmail.com>
References: <20260831211126.23745-1-rishabh.jain1198@gmail.com>
From: Rishabh Jain <rishabh.jain1198@gmail.com>
Date: Tue, 01 Sep 2026 18:24:07 -0700
Subject: [PATCH v4] usb: pci-quirks: always assert xHCI OS ownership
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Mario Limonciello <superm1@kernel.org>,
    Michal Pecio <michal.pecio@gmail.com>,
    linux-usb@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    stable@vger.kernel.org,
    Rishabh Jain <rishabh.jain1198@gmail.com>
Message-ID: <178831224746.44206.8934470315568179153@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

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

Across four S3 cycles, asserting only HC OS Owned changed USBLEGSUP from
0x00000801 to 0x01000801 and eliminated the restore failure. Testing
included the unmodified 7.1.8-ogc1.1.fc44.x86_64 distribution kernel
using a test module that set the HC OS Owned semaphore. Clearing
USBLEGCTLSTS was independently verified to be unnecessary.

Always assert OS Owned for controllers using the standard xHCI handoff,
and leave the existing TI/Renesas forced handoff unchanged. Keep OS
Owned asserted after the standard handoff to prevent firmware from
reclaiming the controller during subsequent suspends.

Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
---
Thanks for the review.

By "stock-kernel test", I meant that the register change was tested on
the unmodified 7.1.8-ogc1.1.fc44.x86_64 distribution kernel using a test
module that set the HC OS Owned semaphore.

Sorry, I missed the AI assistant guidelines. Fixed now.

The TI/Renesas forced-handoff path is restored unchanged. This revision
only changes the standard handoff path. I left the byte-access change
out of this patch.

Changes in v4:
- Preserve the existing TI/Renesas forced-handoff path.
- Limit the ownership change to the standard handoff path.

 drivers/usb/host/pci-quirks.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 0404489c2f6a..fa9b5db4d115 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1193,22 +1193,25 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 			 && pdev->device == 0x0014)) {
 		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
 		writel(val, base + ext_cap_offset);
-	}
-
-	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
-	if (val & XHCI_HC_BIOS_OWNED) {
-		writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
+	} else {
+		/*
+		 * Perform the standard handoff and leave OS ownership set to
+		 * keep the BIOS at bay during subsequent suspends.
+		 */
+		val |= XHCI_HC_OS_OWNED;
+		writel(val, base + ext_cap_offset);
 
 		/* Wait for 1 second with 10 microsecond polling interval */
 		timeout = handshake(base + ext_cap_offset, XHCI_HC_BIOS_OWNED,
-				0, 1000000, 10);
+				    0, 1000000, 10);
 
 		/* Assume a buggy BIOS and take HC ownership anyway */
 		if (timeout) {
 			dev_warn(&pdev->dev,
 				 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
 				 val);
-			writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
+			writel(val & ~XHCI_HC_BIOS_OWNED,
+			       base + ext_cap_offset);
 		}
 	}
 
-- 
2.50.1 (Apple Git-155)

