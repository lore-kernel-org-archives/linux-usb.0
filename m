Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598434;
	b=zm11pU2QvfHJ89+/Ew8P82hYw7ILCII2f7fGH1iciyNZFQqqo6ua8iaKG3xMtVVuY5oE
	 LWBBiWKjcCd7jQ5qrHydaNC6ByeoAK7AFzZmg6BHC81Bj2VFGB2MNFvk32fD1vEkt3C9o
	 I/Lm/c5/ZMVnG2zudqf3eEjVfW8P2xeDIuQ08S3Lb86NEZ/5cTA5Aymr+DbEqp9VzTpZ4
	 c8gA3o4lll/v3EhH0I3Or8JUO5nPTmENcfwMbZOpZBMN5HNuE343yq7ZkJPb249f2mXDW
	 Sq2jRwQ0TrMUbXfky+nTm0RYtDV8EBpyfM0zlKaHoYpjeNRhYg9/9OVKcBxJnWDr2jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A0RgOElBwJJDomLUhRT0GMZ4m0uB6a3WEPZ47yWgujo=;
	b=fOlhk8NZ33uT4fSfPafLKtEi1l9uXlTlzyqgLOzFe+V7GU9+MLMCTdKDWsWBjViSmVGF
	 QB2kW1lz2CYHRnDYIhGwDAmqF6govNqhcFm7p6qFzCDrduGBsSkplaN4ld7XiqlfHI4ia
	 uQiw4qqFQ0Np906K4sn6322DMdwoHY1OUZrdwhCGa8ABBPD5Y01rw7nKqmG3fOrXqSlwl
	 JxW31J2uh20yvMTihQHXRoV7tqCnLUORqqw1ftwO2Et/Pw5PfVv6sVUQtNA02lMu0CRFQ
	 5HfrjnQaxy0oW395RpbBbyUIYp0n3VnpQcLsp01bmb+F5zI7bFEozQGypboSRo6NrZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TfT+Z0xJ;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888D606A69E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B888D606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TfT+Z0xJ
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E205D3FBAE
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795598430;
	bh=A0RgOElBwJJDomLUhRT0GMZ4m0uB6a3WEPZ47yWgujo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=TfT+Z0xJhaUU17MQcs7AW7nwl1KcarFPvugCIyR+g1LUeB/+u90K8LAAsFOyJGNQI
	 qnTkOExerRIEDJVuH1sd9Avq80j+u/sFMmxcywtsGujiFR4B56n5URBYZ2qFnxZphe
	 XDNoRs4E69yhUuZaE04cPRUG3CIwLzZzk3i+Xc5zIuPGMiTOvVrX7M3d3VTMNWaBwH
	 uLH/LGlYYuUiX2oudE9cfrnnQQbk/s3Z/Jo6KMUfsqADUp6K+DaBlpJLUco4WlfGHA
	 FQAcjgz7jkSfQUVScd/z0JsmZAN1HHvWi5/xbniq62dH3mzKt0m2m8a5fgNQxE+cA8
	 NO2/WOXxwGSyLvdDMlVvIEDYjmqs0GvSMRWakFM8Lbl6u7uOeoLcIBtowOeUMovDuX
	 2t2OgZ5PPg+ZrglfCER86itEoa0YwAh2TEKvKfX7okaox9eEVXRWm1Bq6Paecd9T+q
	 iCReMZcd5FPjcDRTMq3cux7IDV9z75y55ulysD6Gg54cC7Cwm9E79MDUSk4ixYZa5G
	 HchqZl0l0hUj8qJ+EyxU05PGuW7GST5FZ/X5PLk5NWhTUQMAOAwE5RTmuI1k0QevmT
	 u68XwkEJVESBId+swKSNogh58pAuQCevrAOlqj8scjrQ/omvh8gqfcu0TeT/177TZb
	 sQ6+5WV8FpY/BO+bFHIkbhAs=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f040056fd0so31076735ad.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 01:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598429; x=1796203229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0RgOElBwJJDomLUhRT0GMZ4m0uB6a3WEPZ47yWgujo=;
        b=bUsvzxiEl244FFm2wW8QskHaplSCU0TJaUhRN75nK3ISfYODSZyzzi0bcUISXAaD7K
         Tp3MlbaD485uaXThX4IFNiwdGIDw2aRobUCjxvHM7cH+SS+ok7Rm/ETv3+xDIjkef45h
         4JTbmZ0bt/ZoDsp1hIPc6scgnhfXCipMNLE1v4EYN/oRkQrm18g6zPH0NGFKgDkdgryR
         5AEqpdAQ/6Hps5BQHEHtBHgaooWXTKbw2jX94HMf3Tm4MNOMBAkYKDEJiSqB0G5MJkAc
         FZP3qWvpBCexdZAmDnR/S53D47trQ/YmjZZwwB2lHQ7HDxNzUj9wGa4oEUms3sDqJqS8
         HcAg==
X-Forwarded-Encrypted: i=1; AL+hErHsPFN/lW1vmDMlcfEdnPDpv3Abwn+e6FgVGvSYMvdwOuay0wHYE1hWDfS6t4gZkJYHFO5eNGxlvKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TFL48LPGVgU40LMVbCugQ6c3jJYFVNKXeRM8YH1AMyylnT++s
	aDkWaqul8xvT2W70/Qcd3LCnezTvzbXYXu3ZSxIs6XoZBQi05qaqJ+OKLu5eIJMzrS0o/VeXix1
	+o6X9fKOmwg2qh3qG3QgjFYoJxkCNbAjHIVT6uTD3vjps2IKdvdqUrtEACp3noKQZHZf0q5pNUv
	n3FQ==
X-Gm-Gg: AZFdTZdXaviOzbSriM3VN8Twc9UhZ/QhShgrTu0mljjZ2fVEhrofHefrZV8K959S561
	fVR4OIyqQ0D/eQ7EF0v8bhPM2r8SM3x2d1eM8ZjVgkg/NcwMXo203w9nfLMb5OHFbHNz5/xTCnI
	auDQnhYAK1HfFKq4UPeZe/QBBAoV2GpE3zKWrvQ4qWf2osZQsu9E82SWW2V5gkNMnbaR3LNhanh
	25NqzYwjbevpa0tyYu5UpPNxQV2bXe0OARngt03VeeUgQtCxESBu8KVx8yNvSTGDQgMPgCo8ZLE
	t68eqnbaCE7VY0zLjFqSgZ5G+sIjBr90+zkrv4zVDux3CjRJ81zsY20I/liBnVQZstxO7ahmYZr
	c5gqrobIum06Qufd3tElbc+gDxkRIaPyF/4T/ZIOMJviXWuKd5Jr4mTRkwtLjZs/UypIy6OH38l
	oLECpxwM2hp2LIRWeYGb9mXwkB/7xdbA==
X-Received: by 2002:a17:902:fda5:b0:2ed:fb0:bfd6 with SMTP id d9443c01a7336-2f031e08699mr142488195ad.11.1795598429371;
        Wed, 25 Nov 2026 01:20:29 -0800 (PST)
X-Received: by 2002:a17:902:fda5:b0:2ed:fb0:bfd6 with SMTP id d9443c01a7336-2f031e08699mr142488065ad.11.1795598428998;
        Wed, 25 Nov 2026 01:20:28 -0800 (PST)
Received: from resolute-linux.lxd (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm42673685ad.37.2026.11.25.01.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:20:28 -0800 (PST)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-usb@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] usb: gadget: max3420_udc: fix out of bounds endpoint index from wIndex
Date: Wed, 25 Nov 2026 09:05:29 +0000
Message-ID: <20261125092004.15562-2-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125092004.15562-1-aristo.chen@canonical.com>
References: <20261125092004.15562-1-aristo.chen@canonical.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX3420 has four endpoints, and udc->ep[] has MAX3420_MAX_EPS (4)
entries. GET_STATUS for an endpoint, and SET_FEATURE and CLEAR_FEATURE
of ENDPOINT_HALT, take the endpoint number from wIndex, which the host
controls. The driver only masks it with USB_ENDPOINT_NUMBER_MASK, so
the number can be 0 to 15. Endpoint numbers 4 to 15 index past the end
of the array.

GET_STATUS uses the indexed entry to check the endpoint direction. If
that check passes, it reports the halt state from that entry.
SET_FEATURE and CLEAR_FEATURE use the same unchecked index to update
the halt state: they change ep->todo and call spi_max3420_stall(),
which reads and writes more fields.

Stall such requests. Both functions already have a stall path for
requests that they cannot answer.

The driver has been in mainline since v5.7. Commit 0ea39e030a80 ("usb:
gadget: udc: Handle gadget_connect failure during bind operation"),
first in v6.7, makes the gadget driver bind fail on this UDC, because
the driver has no pullup callback. The next patch fixes the bind, so
this patch has to go first. Mainline v5.7 to v6.6 have the driver but
not that commit.

I do not have the hardware. I tested with a KUnit test under User Mode
Linux that emulates a MAX3420 on a fake SPI controller, with KASAN and
UBSAN. Without the bind fix, a SETUP packet sent to the emulated chip
after the failed bind got no answer. With only the bind fix applied,
UBSAN reports an array-index-out-of-bounds in both functions and KASAN
reports a slab-out-of-bounds read in the driver thread. With this patch
as well, the test gets a stall for endpoint numbers 4, 5 and 15 in all
three requests, and there is no KASAN or UBSAN report. Halting and
unhalting endpoint 1 still works.

The bug was found by an AI code review. This patch and the test were
written with an AI coding assistant.

Fixes: 48ba02b2e2b1 ("usb: gadget: add udc driver for max3420")
Cc: stable@vger.kernel.org
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/usb/gadget/udc/max3420_udc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 6dbea43022a7..d3a4c824a732 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -536,6 +536,7 @@ static void max3420_getstatus(struct max3420_udc *udc)
 {
 	struct max3420_ep *ep;
 	u16 status = 0;
+	int id;
 
 	switch (udc->setup.bRequestType & USB_RECIP_MASK) {
 	case USB_RECIP_DEVICE:
@@ -548,7 +549,10 @@ static void max3420_getstatus(struct max3420_udc *udc)
 			goto stall;
 		break;
 	case USB_RECIP_ENDPOINT:
-		ep = &udc->ep[udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK];
+		id = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;
+		if (id >= MAX3420_MAX_EPS)
+			goto stall;
+		ep = &udc->ep[id];
 		if (udc->setup.wIndex & USB_DIR_IN) {
 			if (!ep->ep_usb.caps.dir_in)
 				goto stall;
@@ -596,6 +600,8 @@ static void max3420_set_clear_feature(struct max3420_udc *udc)
 			break;
 
 		id = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;
+		if (id >= MAX3420_MAX_EPS)
+			break;
 		ep = &udc->ep[id];
 
 		spin_lock_irqsave(&ep->lock, flags);
-- 
2.53.0

