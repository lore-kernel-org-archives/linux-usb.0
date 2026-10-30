Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389026;
	b=iRXN2mlG4NF6Erau9gEYV8EOi6HSpHCbNkFvoRzrBUfHgQVztfHTYgUBMSIK+s3SdsG7
	 90YZyx2srd/ML+ruNYQB73bzNAdhOmPwhuWGFjPtTwPb4sjOTaZa1lZAwPN6Tn9J1n6st
	 oQY4wA9qwVrZgL4tgS0JRdUiG6UwtLWU4BkbG1p33iGKDDpzkrfqECEmNwlndwPYHfquB
	 gLRpctJPSq6PRHiudWtW7hEL4Ks1xlzZRYfyr1OR4SXwl+sS1PUfFPNm1f/QYjZYTMelp
	 3yXdaR7Pd4Po3gqS1FwFyIdWrSzaBwn54CydKoKwFhpB2SE85Myc+PvCnTj1pMQRofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID;
	bh=SAVZhtl45acG7pXv3O1589ijaVBP1M9mCVM0eytdgy4=;
	b=XM3lqE14GqDgHq9up2yKLkHLKVy1daqukUAw4Fl1yiRgi46p8I+0S0Bo6V0+4fIPD5I8
	 Mgzx3H2NcEKZ2OQUONXFnEZ8F+n+mGCubagRCAD+n+OVVLAlVR9RRBJZKgaffAPU5y9KM
	 xrlOLiTEE0lTyBCwy1++QEZuS4wLo6q/O5Ybsm0O2h7B/7YrLOh/G9XkEYxLR0sWtdRJO
	 R9e2e0IvEiKzDi9peqb2/Fivfhgtuh4T56KEiFAd9Pvw+uL63V6HFeFeIfhPwuLYHt2Tb
	 FOQGNJ3L4SQ4hMD+yBEnfgRW20aIhMkhzxyHYeZQEPxHrW2ixl+Aa0PAITSsK7CckXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfURx7M7;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C36606A31C
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 19:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfURx7M7
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33c10faf6easo166514eec.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 12:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793389025; x=1793993825; darn=vger.kernel.org;
        h=message-id:cc:to:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAVZhtl45acG7pXv3O1589ijaVBP1M9mCVM0eytdgy4=;
        b=FfURx7M7snCJy3FJoVpaCRBNec3AB74pIgrzMYoUtGQFRvxSbEaKOLQcSwW1j4xI63
         JtLthT2zf3sJcdoNi/q38OC4ZcPlpJcwDTFG2xN/u5UDkRSs6mEAfD6XlLj2LvcGGff2
         a9/FGWfvVYvjs3qP6rT+Fk1ZqU8A0c+itVXh6gCCfMBnNWDqfKDP1SP3PI9iCHq9IEWj
         e4m+UVqZgFlipLMkAxwEmvSuSOfrHaiNBHP/I1PZoQxHukke5xpu2CP1rYimA0EuScF7
         hSMgZLjU7Y+4VzjGhI5gUuLXb6EtUIqCpAZP1qtR6SuVewLXsoNOFkdQ9bnMtqsDcdGp
         0Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389025; x=1793993825;
        h=message-id:cc:to:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAVZhtl45acG7pXv3O1589ijaVBP1M9mCVM0eytdgy4=;
        b=KniH6bZYllHg2nG9hmqT9QuGDGN0I7oKVSg7DgGvNKGIXDPHdf0GRy/eMMi/KUOIn2
         AIp9W8B5y2rSkCKV+JYNo/sWX2RGbErN98loNZAn8NPvxLe/q3VjHW5K+mKWkjaXaq6c
         VAQ0aZ4c7Zi0od2x6uttuwWsjhGzq9gZ2WgNEjKUxcGTYguaRRqKjkOLKu0thSeVvcW8
         VcNl14Lo5g9ntcOQ3wmWirEwl1QvyFKvQo4+0EnPnQfGLpYGa4syI+aNyV/pivxUeaH+
         hOfDFOJzIZnUDnktAbLwzR48NjqnbsORdGVZxVzhfpnHpgZRCc086yFKQE/o6K7eFxwe
         c9tA==
X-Forwarded-Encrypted: i=1; AKwUvBxfYeiXU6m8LXmfpDq8n8uTLjkSSoRSDaw3Cthn0AxT431q9G2nDufBxtNQ+3N0n5e/crxtyItSp6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjYVfFQK/5UwduCNypRrmBkJS6b4i88N7BEGFI+WwWn7mkD9EJ
	BkVQxUVal57D5B3CXuK7auhWufTin9n90JCIY97br0nQtyltGIjr/QRJ
X-Gm-Gg: AYBFou2RlWR/2d3gybbNLDYD3MqEHwmj0oBSA/4S0e+yuTWnUL2Bp4Oc5nm1YFVPx6Q
	/licoq/FDSI/8TkxCW0vHWRZ/CDLYVldJZYFuS8WBBKEl0v8oJKmr9ikDxRz4MuYgH25DGpfFib
	givWzk0KL2HXVTcq+YJ7jHyxGTlDAzHO+EdYnMf5ruaaiu3iruPfqRvosa54vQqAAFLUUdjNf/x
	H/lLHISUw/jRDUQ4mDh4TWDHCelGGUqDfBLIfxxfZqBNtLIRWnlYQuwb3n91rc8BqNz/6xXevP5
	476AZ1xcqHRL2jn/HLwxvXupHLUXPRN5eR3xuJ1xsotJ2mUA2p3GCLj6NNL14GjCy7PJ1tVDS7O
	viqVIdFrwyV3l/O9A/TQbSK+Swy8tIEQC//AlYeuFID1SMGWn5I1HysWGNHX6ug2qm8kJcFudQF
	NijM5rLWWUP7qYMVkWWMAd+HtXWRQcOaet3S5/1/haooxW7JwVltrNm23JIKaqoA3g5gckzPRsq
	w1b5M4TT5H4PcYe3dNrNta79hhigPETQYMJOLGtU03PNhQJsKXZ5+MfpiQ5+yKOQCOvcyNNu49u
	W/dyYC1HMq85UuUkV0LMg3OM2rd71Z1iB1YwMQhWTnSuTGPkHO7mS7DLJilHiYb1iQSY4/iWk+F
	Fe059M5nW0406YEuxaWOjMv+HXzx5d7+LvFKp2T3XmAiC8R/ZDMd6akQ2j0U=
X-Received: by 2002:a05:7022:c90:b0:127:def:dd72 with SMTP id a92af1059eb24-1ac5914348dmr5687886c88.2.1793389024873;
        Fri, 30 Oct 2026 12:37:04 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (c-98-47-46-163.hsd1.ca.comcast.net. [98.47.46.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm8425848c88.18.2026.10.30.12.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:37:04 -0700 (PDT)
From: Rishabh Jain <rishabh.jain1198@gmail.com>
Date: Fri, 30 Oct 2026 12:36:47 -0700
Subject: [PATCH v6] usb: pci-quirks: always assert xHCI OS ownership
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Mario Limonciello <superm1@kernel.org>,
    Michal Pecio <michal.pecio@gmail.com>,
    McKenna Fan <blue_sun@tuta.io>,
    Quinn Schive <quinnschive@hotmail.com>,
    Bruno Filipe <bmilreu@gmail.com>,
    Maciej Zonski <me@zonni.pl>,
    linux-usb@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    stable@vger.kernel.org,
    Rishabh Jain <rishabh.jain1198@gmail.com>
Message-ID: <179338900780.73175.16604680938007633313@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

The xHCI ownership protocol requires the OS driver to assert the HC OS
Owned semaphore before using the host controller, then wait for HC BIOS
Owned to clear if firmware owns it.

quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS Owned
is already set. If firmware leaves BIOS Owned clear, Linux uses the xHC
while both ownership semaphores remain clear.

The timeout fallback also clears BIOS Owned using the original register
value, which can clear OS Owned at the same time.

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
using a test module that set the HC OS Owned semaphore. The same test
was repeated after review with the same result. Clearing USBLEGCTLSTS
was independently verified to be unnecessary.

Always assert OS Owned for controllers using the standard xHCI handoff,
and leave the existing TI/Renesas forced handoff unchanged. Keep OS
Owned asserted after the standard handoff, including when forcing BIOS
Owned clear after a timeout, to prevent firmware from reclaiming the
controller during subsequent suspends.

Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
Cc: stable@vger.kernel.org
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: McKenna Fan <blue_sun@tuta.io>
Tested-by: Quinn Schive <quinnschive@hotmail.com>
Tested-by: Bruno Filipe <bmilreu@gmail.com>
Tested-by: Maciej Zonski <me@zonni.pl>
Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
---
Sorry for threading the earlier revisions together.

Changes in v6:
- Rebase onto current Linus mainline; no code changes from v5.
- Collect the Reviewed-by and Tested-by tags.
- Send as a new thread.
- Move AI disclosure here following removal of the Assisted-by tag.

An LLM assisted with the investigation, patch, and submission text.

v5:
https://lore.kernel.org/r/178832755831.50581.1058201741431375556@gmail.com/

 drivers/usb/host/pci-quirks.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index f670e7aab984..1dbfd697a582 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1195,10 +1195,11 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 			 && pdev->device == 0x0014)) {
 		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
 		writel(val, base + ext_cap_offset);
-	}
-
-	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
-	if (val & XHCI_HC_BIOS_OWNED) {
+	} else {
+		/*
+		 * Perform the standard handoff and leave OS ownership set to
+		 * keep the BIOS at bay during subsequent suspends.
+		 */
 		writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
 
 		/* Wait for 1 second with 10 microsecond polling interval */
@@ -1210,7 +1211,9 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 			dev_warn(&pdev->dev,
 				 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
 				 val);
-			writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
+			writel((val | XHCI_HC_OS_OWNED) &
+			       ~XHCI_HC_BIOS_OWNED,
+			       base + ext_cap_offset);
 		}
 	}
 

base-commit: abf8c33470f78e2226ee3dcdc69004660020ab47
-- 
2.50.1 (Apple Git-155)

