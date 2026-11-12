Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493907;
	b=2Ue+O2E/BelCkfYpc9sFnoh6tnpvBaLZFnP+FJ8N+qNz57yt6dLh059/L1g/RPAmrx4g
	 t4p2V4n96EFusg3R1thZ5LQtsINYY2jmC+o+Hs95p51z/66e7i0BwE2Su5+3GsvWNsXoB
	 YjBSNN9geaiTwSkSkkn0ZPuLh0jTHEQhDKjLIIpGskhe6dbisnU3GPmkbEskotP9VqFZx
	 zCOD7lYNmZYm/pxscwy+3zUlu5rasRHQpVnY7KyjTUeGgHb/PCnvk5Ux6Id6XVjzL65w9
	 IxlR88N4SrT5nnj3iy7Yl9EOb6FmJOErRxTSfBGwGkcCYX2F+qCMpgJOg70uTBZxUKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NwZKnHeueZm5SUbYhirFm5Y+XTxCLeRvAgzZxImWLKk=;
	b=cqopFXi25pcHJlX40Cgq1erp0QJ1SpGC5ULQUXLhQa9o+tyMKQsLzp7z0uALDLBXxz+C
	 cwt9mrKdNi7HfxdOlEX/UdppVbvJGy2LtvZWqoSi8mHk8zUWHESuIAxdgWBLow8ZJWhdk
	 aqP4LO1NTq0lD++Cplg2pNRPFt0zz9NuR3+O+d8NZg+6n8JtcElZ6Zm1bXRgpiyhvjKEi
	 ABxveQwxKz1V2CuR361rV1gPuNBt2ZW1DaA2QSg1CZPYXSz7zskhtvEzPzwcQJuZZhk4g
	 +uFCLzvyMsWBH6o9eb8UPlI/vUGEVeVhOSmledGxmOYkUFzyMQXf2MZ9UOpcBTBWssA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=uD4ajhan;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38B606D56D
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB38B606D56D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=uD4ajhan
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so32946335e9.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 06:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794493905; x=1795098705; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NwZKnHeueZm5SUbYhirFm5Y+XTxCLeRvAgzZxImWLKk=;
        b=uD4ajhanlvjpm43NY53eT+GPkSD7TSc6oQHCqCNmFkQgAocpSKCFZtrdyaCilWnzqq
         fxyp1P8+IdBw7pJ8HdVpkZBI14lrD4GuvgdQlc96XPERyWkJ6/0KNynelqB3+gLVuKd1
         FdX7/PtNC1fbLGnrGXFlKr+/F1nYQcRldw3E5t1WYFkxJbuAcc+LPZH+tywQQWnXSbaD
         5vocNjKiq/9zQdQ7bQemqH0t5f+jltrBfgczcUQeU8Z0ZR/IVpKSYRnBjInAGk82lODp
         dhzBtHW7WEFp6WsN6TK7SaKeR4Hdk76uay2KqJ05WtIgv5yrhuXN0bv2t6ZNYy/aPRZg
         2ykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493905; x=1795098705;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NwZKnHeueZm5SUbYhirFm5Y+XTxCLeRvAgzZxImWLKk=;
        b=XfTkvf05S8/Hy00O/FaLLQtJ6K0JD58dBwT+vWkXhC98RNctXCLLfm+7SpGmn3BgMA
         Aw13s8aXUYkcfsD8G2eh94XFcCxCX5Fzxq5vbDxrAc7LPhqRc7h2e1m7kTOBedtvojMS
         U1o/+ZEYdDAW3U95p6yq4i8OgBRtOulutEIaTcYgM7mNTC7bIRdDos6+ACPi/YmwXkF6
         AMcvtgfIc8ym+QiCKDLjV5i6p0CDzY1Kl6YjNILLCnTBQT6a+7eVmxdebC/2RnYlD5e9
         MJECeRHVr4qdaNj+mia9i4ohkp0rMQE4vKthH0vOqijNrbPdc/bxcppQfgE8Ynibmf0o
         rosA==
X-Gm-Message-State: APuU4Z9GE4UDVEL4VBO5pB6jgwkB2ybqbuWurD9DSJIQVrk3sKyNforW
	6xmxnemoR1SRFcZxYcNGWO4f6w3Nq+j/rhKfd4pJhIbxnoQ4opNCo41/z+mUKuod8X8=
X-Gm-Gg: AYBFou2Mp02Ir3F+Rrd2HEdwAM9eM2VazNY/Y4zvj7NIgEElXODNKKElt/6dTXute3h
	ecxHJJl/RCH3WP3todVcCYID+ILQjh3uY5l50B0a53PyNxsERWsKttGxxpsuRaygGI1rncI0IE7
	E87bO6pOC2LrXSqVlx4A8Xq+kSse2Ku4f+5LlQbef8aBb7bREkkXzwHXNN7OS1668/5tAY2Brlw
	EsdwzAs7l9zSNqfWb45oeypTAdGLUfjEziYZ3zVG6uoMhpM2mDZ39Bawf7IqC8EIP25vkJ/0hiA
	n71xbFXdwHtu1m98P3nKd/JHOegVDRqARjI9Gip0hDAiVBcs5DUyP7esD4alXT/9Om157teWH3S
	Lw11oKNY5pIwC6/K+b0o8kObOKqHeVD3dR+DVHEADQeMbjR/GpT1XTy7wKBP2MXpI5LsV3QZF8+
	VHjq/4w9G2B1L24znQ6owYT9H1yjiGt4i0Oj0UKmf4SBI+gOQzun1bZOTzd4ml6ZDXzxD1osQru
	ItSToCFSXvOfi6wZAoelfAtqwSNHjpWgwQvBgHy3i65ed1bFK403WAjSVAEYArbBo0xS/Lgwsor
	RB4LmJnhpzG2GPAmZqZA7rWmBOtolQZRann3M/69F3XhQSXzGUhFwV/fgwbPhTufojCZa+KHVG1
	74y8pcdzY1A==
X-Received: by 2002:a05:600c:4444:b0:4b3:6900:280c with SMTP id 5b1f17b1804b1-4ba09377988mr107048235e9.19.1794493905182;
        Thu, 12 Nov 2026 06:31:45 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb51f3cbf9sm40456285e9.0.2026.11.12.06.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:31:44 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 18:31:35 +0400
Subject: [PATCH] usb: gadget: udc: Clear a pending connection when starting
 the UDC
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-udc-connect-v1-1-03c73259642b@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBMcg6CuEi1qHGtaWGhFIN09q
 +UH7/0JIgfhCG2RIPApUVafgWUBNA9+YiU2G4w2NSIadVhStHrPtKsaWTtEck01Qn5sgZ1cX63
 rf8djXPL0TcB9P18ShtBvAAAA
X-Change-ID: 20261112-udc-connect-61e0f11cf93b
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148; i=alchark@flipper.net;
 h=from:subject:message-id; bh=MHd6orKLm11EEOPLXLXTgh0g8Oy55XzQF+QD+f5lqwg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9PXu2+nn9MUOBV39f/nL6cocr7MPfj7M/cTutqn+qk
 t5nvsjlecdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTzS/NyLBEc09T1AtLf8cSPSvW/F3SD+VuVPCXnz84e/vGCGZe7U5Ghqf1zfH
 5/P+kV4l96J9f+6g932F1ZmsB64YbyxlFlzxVYAEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
connected"), usb_gadget_connect_locked() returns early when
gadget->connected is set. A connection requested while the UDC is
stopped sets that flag too, without enabling the pullup. A later
gadget_bind_driver() or soft_connect "connect" then finds it set and
never enables the pullup, so the host doesn't see the gadget until it is
unbound and bound again.

This happens whenever a UDC driver reports VBUS through
usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
Type-C port controller switches the controller to the device role at
boot, seconds before userspace binds a configfs gadget.

The pullup is never enabled while the UDC is stopped, so clear
gadget->connected once it starts. The bind connects according to the
VBUS state that the core tracks anyway, and a function that deactivates
the gadget during bind still has the connection recorded for
usb_gadget_activate().

Fixes: 62911bc82b03 ("usb: gadget: udc: skip pullup() if already connected")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/udc/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index d5844384c368..577bc15f61a1 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1236,8 +1236,16 @@ static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
 	}
 
 	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
-	if (!ret)
+	if (!ret) {
 		udc->started = true;
+		/*
+		 * The pullup is never enabled while the UDC is stopped, so any
+		 * connection recorded meanwhile was only a request. Forget it,
+		 * so that the next usb_gadget_connect_locked() enables the
+		 * pullup rather than returning early.
+		 */
+		udc->gadget->connected = false;
+	}
 
 	return ret;
 }

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-udc-connect-61e0f11cf93b

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

