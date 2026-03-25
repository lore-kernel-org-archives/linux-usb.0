Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51251350D7D
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435729; cv=none; b=JHNvtpMIInkaBbOMxL/QrebJTup401WEVQtqywL1gFvdQ+Olyw4WavHSaqHTV/NNmP+4TXGOiRrBwEgh4yF4UODZV300jK8DSliQgv8VYMzNUjcNZo4tfB+ge/mR1HMzRvj8UKfQeXS2mSDPn2dfxd/LfoXtsyfUVELuCmDYN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435729; c=relaxed/simple;
	bh=r/WpmDwoyICwFTgN885zxaMmFJyfAOUMKCRwPOppz5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WOYX5rcVuX6rJ1nD8h4nQFdZeNMYUvl8qsyLG+ik1XDNMXFlDrytUjU8qXvLmrhB3PS0Mj2snkzJH/ZfS1ig3RTM+f0HIvupu9FLc4YWLuswhVnVniu21hGvFIu+jKh3WVum8ZoWj2MtdI+xRwtE5gWHQlPDEaoseERb2OcOPa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnnOE72G; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnnOE72G"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb4136d865so629280785a.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774435727; x=1775040527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGTGrhTLlSMnsPpePIb7eIx6Z6t49bSCo9l5lmTNwqM=;
        b=ZnnOE72GG7rb2iBPStW8WU+4M60JahOx6ajSwhOmxitcnkcE+6i3vBVa6c7Nxj0RLe
         VsakKzrl2RgDHAezDX5OGukgFSs7DPOilDcCYPLgu5TWDF+9RhdNqVXAGbj+FwjST7QR
         x2Ikg7ZxpBntTu/tSvH89hRbZKY80AHMq2rFurzA2ESTnmtbLXUgQMuLsX60LRzRwKw1
         Qp6YaqYtqVbAkQYicZzCWKrs0cll/uZAQj3XGMzcnmFcb8fjvPN09PC52paZXxniG58K
         k7AAHt3zrGjYBHjS79BPpBkfKK2P9v0+bBZTLoHq9yIzK6lzasqBIrdX8o5SPUDkzg6X
         +OaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435727; x=1775040527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGTGrhTLlSMnsPpePIb7eIx6Z6t49bSCo9l5lmTNwqM=;
        b=MTkZWdJPVZ0z3FmyG52u8ohRvNSa2SsxmsmEQqnGAnYWisHMs5Ywjd1Or0CqaO12dD
         fbCL7Aj0kJhuumo2P/NhEeJqdsbl6Uj9M0t3Wjaz58MVqrdkT2G4uS3nSNSMR6sSH1bb
         XAMqlHT8SAVLuGc14IrjOWk+Y3xjE1ZUypBfHbSMfq5VkaBsavx7Kt3xD1CvqcTRWqsG
         0c/MqeVzq6G1ryv0LJuo5sHZrdj5/TC8owcnK6QH/xY9OaG687k1T/c9qkBIoH5ISxkl
         GwOgmelIfWgkUKcebEFy/jl//cuDyljOUPkdDZ4FLmKa6hqvP4w5ZnIZr1gooblrEdzR
         2FOg==
X-Gm-Message-State: AOJu0Yzp81xQblv5Tae9oDe6rnaQ11GtfMpu1cV05JnxdWHU4iNF9XNw
	a26wFc3Xi3Eu95v7dU6hAla2ALxfmP9ZN1q1E4lRZ7idVIL6H93P7YQxXavQymOvpvVVSeW0
X-Gm-Gg: ATEYQzz7oeleFdlY3GT35yhz7S5WvJaPOJXFmFl1DEFcIhxoF0wv+fTlo1ueWWog9pQ
	4//iahi5ZwO255P7LHMIMsi5Dn/styO6+xklqfzGvukJUiYMSAgvgnA7fR/uA4xbbm70ndrJ8/5
	zZzLrMk6XrvxOjWujaS7DlRECYi0Sv6eRzGCZiVHinKcGAeLQWz9AsB55yUzMiQc05OGDqivOrE
	PkQ9x9rAHZ23oxh1dpOs9RGxhTnC7jwv3w/fYmnSsslee1TDmpVOXunzb90YUJ/kSVVnOPyD5uf
	RB2M74gEcfviIRyhsBffrHIaihvfuDFIswG4gT65wfUb2XEWggdgSKdrwyeGJcfjZcf0B9AZFjO
	UO72ucfKE3noUrib4Rt2XaRR/RHwrkp5jUipLNkeIOFw42/fAo0MhVqT6MTrZplulBMiZY0LXON
	hgGoK3mN529VGZZMlSSmCUTx7yehCioOdWFskJ6vfTL9KU7O1FV9ur2Doj0Ij6SlIVV0lgzyLbL
	tB6FlEr
X-Received: by 2002:a05:620a:1725:b0:8cf:c451:cc1c with SMTP id af79cd13be357-8d0010d0cc1mr410870285a.58.1774435726797;
        Wed, 25 Mar 2026 03:48:46 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cc8c1673asm11745456d6.38.2026.03.25.03.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:48:46 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH v2 1/3] usb: usbip: fix integer overflow in usbip_recv_iso()
Date: Wed, 25 Mar 2026 13:48:39 +0300
Message-Id: <20260325104841.8282-1-addcontent08@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbip_recv_iso() computes the iso descriptor buffer size as:

    int size = np * sizeof(*iso);

where np comes straight from the wire (urb->number_of_packets, set by
usbip_pack_ret_submit() before we get here).  With np = 0x10000001 and
sizeof(*iso) == 16 the product is 0x100000010 which truncates to 16 on
a 32-bit int.  kzalloc(16) succeeds but the following receive loop
writes np * 16 bytes into it - game over.

USBIP_MAX_ISO_PACKETS (1024) already exists in usbip_common.h for the
submit path but was never enforced on the receive side.

Clamp np to [1, USBIP_MAX_ISO_PACKETS] and switch to kcalloc() so
the allocator itself can catch overflows in the future.  Fold the
existing np == 0 early return into the new bounds check.

usbip_pack_ret_submit() already copied the bogus np into
urb->number_of_packets before we run, so just returning -EPROTO is
not enough - processcompl() in the HCD will still iterate that many
iso_frame_desc entries when it completes the failed URB.  Zero out
urb->number_of_packets before bailing to prevent that secondary crash
(confirmed on 6.12.0, processcompl+0x63 with CR2 in unmapped slab).

Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
---
Changes in v2:
  - Fold np == 0 early return into the new bounds check (Greg)
  - Switch from kmalloc_array() to kcalloc() (Greg)
  - Keep size variable to avoid repeating np * sizeof(*iso) (Greg)
  - Use proper block comment style (Greg)
  - Drop Reported-by (author is signer)
  - Drop security@kernel.org CC

 drivers/usb/usbip/usbip_common.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index a2b2da1..8b6eb74 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -662,7 +662,7 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	void *buff;
 	struct usbip_iso_packet_descriptor *iso;
 	int np = urb->number_of_packets;
-	int size = np * sizeof(*iso);
+	int size;
 	int i;
 	int ret;
 	int total_length = 0;
@@ -670,11 +670,21 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	if (!usb_pipeisoc(urb->pipe))
 		return 0;
 
-	/* my Bluetooth dongle gets ISO URBs which are np = 0 */
-	if (np == 0)
-		return 0;
+	if (np <= 0 || np > USBIP_MAX_ISO_PACKETS) {
+		dev_err(&urb->dev->dev,
+			"recv iso: invalid number_of_packets %d\n", np);
+		/*
+		 * usbip_pack_ret_submit() already set urb->number_of_packets
+		 * from the wire.  Zero it so processcompl() does not iterate
+		 * OOB descriptors on the way out.
+		 */
+		urb->number_of_packets = 0;
+		return -EPROTO;
+	}
+
+	size = np * sizeof(*iso);
 
-	buff = kzalloc(size, GFP_KERNEL);
+	buff = kcalloc(np, sizeof(*iso), GFP_KERNEL);
 	if (!buff)
 		return -ENOMEM;
 
-- 
2.34.1

