Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E70423EA8B
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785390342; cv=none; b=q9FLL1PK3Yb224ZTuHQimZMAoFAmm6dCM8bKukPalSRvGHvsqJCMHahEFG/qDM62Z5uq8LwhVo7MIi3JhbDfycv+V7PXrSvtqZmubWD7HfzRootzXiZjcbkFMt9D9Unsk6GLWDwr3S0NpW1XsI2cpunwrYbmGdztYjTbxxy1TM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785390342; c=relaxed/simple;
	bh=Y1vbb4+WSikD4XCWd2jc7BVnW2zpn2qNVu5ZLbalqUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCqBFxeAKrANFjHGWZLwHSeFsYaaqIk+h4vlAFRLJYhKmWOfAK7/qhUc+/kdD4tv7S+EbNMD7BqmW1V/An3xinzHf/0ao+lgByM+SnXwoS2t8HGMWVOIWuvk/dB8ZUBotb9rK4uY8Bzv3VMC3G8aHeQMG7N6GvRVZPL2+Y4icvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com; spf=pass smtp.mailfrom=morsemicro.com; dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b=YgUoVBzY; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b="YgUoVBzY"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1523667b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 22:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20251104.gappssmtp.com; s=20251104; t=1785390340; x=1785995140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoHJfTfNGCZcdoSdMSuAR9Bs2dt360oLu0EuCp6rBCw=;
        b=YgUoVBzYklwrhTXs+KvsF1KnGGdQhzqN9akgtNunkBQ4Hs+ZJKLijPo+1V6aF9N1U0
         nR8+wWMG7QiEYWiOleXdwxyCbjGbMyHisFSad5qlkwWv9V8PIJx5Qjwj9DfAXD75+zLL
         MqUQvT6WkrjjtmScdN+BiwPmrGEubnOvjOsfGWNV2oF7Mn4dRF8qLZ8nPZ4MQHR4JSGE
         IKspd11o9BqkyB4QDVIzoRzDyVJOxLWgSMte9v75k3JkOCTloMvu74mX14dl7mtbcKxe
         a01CxrV4Wj646j5h2zkytpE/BuxlWkk+Fya5IMUO7eHthkxnzLRXmciGXZ8I+YrJY9wn
         92Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785390340; x=1785995140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoHJfTfNGCZcdoSdMSuAR9Bs2dt360oLu0EuCp6rBCw=;
        b=DFTB/ehiGdMJDfyBxXJXVjdxKgElzioV1qkZtL311V4cjL3TR9Pjo1cbVTwHQvdT+D
         KAISRf+3aJa7AmEo+7n0YDJ9M84+WDEyE8JYfrkPFhoBsf6a2UOGvhHPEg8qvojy17f/
         XiGZdZJLnRslT0ezqBG680ElhQL+BwxmzX00RK4hF5yp6RgFXCxNZ9+DUN0HONQVEqit
         gUthiW53VxIt78SR0Rpcyo20W56aWb+DNUufZ+BKbeRo6MiTCPPpyrUUZ2vrH0mjxXle
         8wV+dmjq+2cE5r38mrcXBliRWHMDVRfVba9htVMjOT5LTM9HXKtiCBLbcDULwfD7n2kp
         Rm1A==
X-Gm-Message-State: AOJu0Yw98+qDrz4+ThDqpOGvxICCGsMMcgwsCd79ukQdtWVunwwUpddf
	IbyMGgR8gtRFRvll4I3D+RIZMg7bNMKaYep68YBokWF0lo89u+0kkol1xH13eowlpckVrDohQUp
	dGEiLTXc=
X-Gm-Gg: AR+sD132Rfswzooz5VhP/dEAY6U9cuczxKpMXaknOHcWdDVin3Oirs4WDHYMQwfTtDm
	m3+7mRWdvtjhEY2XVL4hgTYifaAd4ma6Q1T26owDsvZ4SGc30tiufRBxnfPn1XlWjVbFd+kkUuZ
	sCP3TOs1JXndMwokm5qI4w7krGif/yT76U3hq6BaCtHCNg2K0C3sBV43jyv1rv4GKEi28GBi0y2
	2gRUFLo/CJ4tPLNEgSxV+pHNpMrb4VpDKWE7tYF9lhzEbvF7QyuJBf5M8u7wEfV5xtiofEZDifD
	A7X5VKtp1VlEveTKKGuJx1FHTxzTjf7FMSQ+nUSif00rOiO0YpDD3FtKpxBI/ModiLYHf1/m31b
	6HnkM5Tbx/nQ07kd+jyAC3iGm9vnxdLoJ1t7Xk9Sj2Cj78W6ZNv6peiYTtmuvPhRSl8QBwDssct
	AvLCtLcKBBBUVjMT14/C2M8S/jI2Vp55UIRFJZM0CQKAnb9EaGdrnzGcoP2OGkv2R1reuKI82ql
	D94AKiaqdCQ+XMH4pfQ2K3y4xFHYU6WsTwaYoV+0fTTq7aiBz4jSKPMdIOdJzMpm+597zrhBpLY
	F4A18JuQkzYYZ5Cg
X-Received: by 2002:a05:6a00:f8c:b0:848:42c4:d8c7 with SMTP id d2e1a72fcca58-84ebc446dccmr1251043b3a.66.1785390339726;
        Wed, 29 Jul 2026 22:45:39 -0700 (PDT)
Received: from mma-H9MHD44.sydney.mm.lcl (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe238efsm2398337b3a.4.2026.07.29.22.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 22:45:39 -0700 (PDT)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	oneukum@suse.com
Cc: linux-usb@vger.kernel.org,
	arien.judge@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: [RFC PATCH] usb: xhci: use BIT_ULL for CRCR bits
Date: Thu, 30 Jul 2026 15:45:21 +1000
Message-ID: <20260730054521.296139-1-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CRCR register is 64 bits wide - commit abe93f27cdd7
("xhci: use BIT macro") changed the flag definitions from (1 << n),
a signed int, to BIT(n), an unsigned long. Within
xhci_set_cmd_ring_deq(), the following operation is performed on the
CRCR register:

...
	crcr &= ~CMD_RING_PTR_MASK;
	crcr |= deq_dma;
	crcr &= ~CMD_RING_CYCLE;
	crcr |= xhci->cmd_ring->cycle_state;
...

Previously, ~CMD_RING_CYCLE was ~(int)1, a negative signed value
(0xFFFFFFFE with the sign bit set). Widening a negative signed int to
u64 sign-extends it to 0xFFFFFFFFFFFFFFFE, correctly clearing only bit
0 and preserving the 64-bit pointer written two lines above.

After the change when running on 32 bit kernels, ~CMD_RING_CYCLE is
~(unsigned long)1UL. On a 32-bit host this is an unsigned 32-bit
value (0xFFFFFFFE, no sign bit). Widening an unsigned value to u64
zero-extends it instead (0x00000000FFFFFFFE), so the subsequent AND
silently clears bits 63:32 of crcr, truncating the command ring
pointer that was just written before the value reaches hardware.

To fix, similar to how CMD_RING_PTR_MASK is defined, make sure we
use the BIT_ULL variant when defining the CRCR bits.

Fixes: abe93f27cdd7 ("xhci: use BIT macro")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---

Hi, I experienced this when running the tip of wireless-next on
a raspberry pi 4B compiled for arm32. The main symptoms were the
following log message:

[    0.549897] raspberrypi-firmware soc:firmware: Attached to firmware from 2021-02-25T12:11:39
[    0.626859] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    0.626889] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
[    0.812619] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci version 0x100 quirks 0x0000200000000890
[    0.813188] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    0.813203] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
[    0.813219] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
[    0.813602] hub 1-0:1.0: USB hub found
[    0.814052] hub 2-0:1.0: USB hub found
[    0.952714] xhci_hcd 0000:01:00.0: ERROR mismatched command completion event

Additionally running lsusb just hangs. Running the same kernel compiled
for aarch64 worked fine. Bisected to the commit in the Fixes line
above. Additionally a USB device plugged in to the USB3.0 (or 2.0)
did not enumerate. Once this patch is applied the USB device
enumerates properly on the tip of wireless-next 4a0bd262df75 ("wifi:
mac80211: fix per-STA profile length in cross-link CSA parsing").

Happy to test alternate fix proposals! Thanks.

lachlan
---
 drivers/usb/host/xhci.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d02046a573e4..df014855c659 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -190,13 +190,13 @@ struct xhci_op_regs {
 
 /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
 /* bit 0 - Cycle bit indicates the ownership of the command ring */
-#define CMD_RING_CYCLE		BIT(0)
+#define CMD_RING_CYCLE		BIT_ULL(0)
 /* stop ring operation after completion of the currently executing command */
-#define CMD_RING_PAUSE		BIT(1)
+#define CMD_RING_PAUSE		BIT_ULL(1)
 /* stop ring immediately - abort the currently executing command */
-#define CMD_RING_ABORT		BIT(2)
+#define CMD_RING_ABORT		BIT_ULL(2)
 /* true: command ring is running */
-#define CMD_RING_RUNNING	BIT(3)
+#define CMD_RING_RUNNING	BIT_ULL(3)
 /* bits 63:6 - Command Ring pointer */
 #define CMD_RING_PTR_MASK	GENMASK_ULL(63, 6)
 
-- 
2.43.0

