Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768826;
	b=X4ZlI9mQDIuwOiErbQ3DaWasXPqrRAL9xzD14Ap/JkyCqjai4Tu3YiDvkXfVuPU8e1v8
	 gAeLpRSE9SjuYKTMS4+Pu5YLEw6+ELZ8U4NLPDZygi4QDUuOBmYS8falvt6Mq2Vwt8lCM
	 5CErNfpiF12O7AX7jALXEVWZzS8hQJ9j7E0Al7FaD0mERYbAWKR1XNQiXEBSDZq8fIW5D
	 MqR3k0OW5TnHVm9tIJs1N4Tj0LP6ajtSEfC/yEfzQYdBYhWy04sBwoSja//p2ic/4KR1q
	 pV3h5lce1uAbKfVZfxmWFQ6HtQ5e6qweF7vV7KuWxsM1lRNkt1aP8b1Ig4Hscv3re3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
	b=wA7m+orIfzJaRU9mUASQhjOw2gW9LjnR0/vsZOrd8lJKcj9lMJe4QnoWoB3opSRW7pOi
	 iesbvk4z8XGGmLZdRQp33yQVCcy3k94HnGxLALB6wMOchz+tEttuIYO7zdPi9LVLlROJm
	 mN6oKQO5D44hEf2nFMCK6LEFqlE3/o7Ftfr1dvPmOlvtuZRSDnWn2ly/CillxFG+pLVWQ
	 9845Ec89gDGAB4z+T14yjXKU20eYiS0AWb9hEtrF5PNruLpokX6P+Moz0j1vLeFwBuGnG
	 Wgdm+2zNPsAEJo8X+KrcFWIZzYN+UHuvDU3evVTPugnaabftty4td8a7gn0S+KBrYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=fmYESyMc;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A41606A339
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 18:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A41606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=fmYESyMc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so17019505e9.2
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768824; x=1795373624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
        b=fmYESyMcOcPNBrVIG9pTz/GX40rE7ARFytSuS5HISaCYxWT8ylusIM5to96koZ3uIg
         1kFPQYg741ZgL2bugckZzNhBUIdlxeKMx4iaB68PqxsXF0LcKS6Wky/WFO8RzvCML+Zj
         CbTpFPPl25R6QbBBK6ORL0Si1PzhV4x5QfTJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768824; x=1795373624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
        b=dGtBkCE7KcuhYGF/Fe6oEuXs7eJHLb/ojge1dKemdHQdrJyUktN3+tG5Xn80XBY5ZI
         ay4HkJQDkLpbl1uTyAqWlCToD5BcJPP18/qho3PYjmQNCLWGdV30jz6W/prS16CfdJgE
         5ffmPFf5uqePXoey4oz9X243VDiSdQqjrELvI/VXKzfObffIkYvJ/mK6VhhyrWv/PjNe
         MhLHCzowLIn3W1kX7BIz7z+W1dDlFM+mG9CBgkET2zOY89Cv7NrAjaFt7Im2/XkHzqg7
         Ie+JRw1aIw2HWc0RLwD/lTzZjZ+mchdR4w5u52sW+e4xT2js5NEjhHYdaGV1DOEU/1z7
         0Gqg==
X-Forwarded-Encrypted: i=1; AL+hErGo+NdDgBi9vC6ncmrI0pOUvfd4sy457iS9S21Vuw9bty88Mq/iJpBEgip19slUMPHy91kxH9Pte3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JejlnuKKAMU2Ks6qoVKWApwn5ES+JRPEjI21ZLAWYxJn3iDuA
	Aig3ZNxtShpNcThCwpss7zI+W7HXmosgTT1csRo9Pd7/JGYE8DRJOtW4h6bAZ4+/WnI=
X-Gm-Gg: AYBFou3O9r/MNBn24wpuj4MidFqvIf1j6RKVfllsSx8UWn+vxglJnAsD2wMgj3akwiK
	zdCwY7jgOBQBroycbmERGJ5LMyFFHxhRYgybQyb/gDBtwIc+wKCvITf3zD9QZqsuR6PXbTXxpyN
	rVjtFBOTdeB9RsJmgGektwFjGBG0dZAkEPQkdYubJVpzq9TuuO4UMMq+8UhUQIHuWxDnWh6v+7E
	1kW4N+gcA8JrFVhyel6L4mozVJcHOTMVHgMB6uEPF13hxKYHiTIyGuglPsy2P+hzwVeeCWmhFKl
	2zb0YQbfzuE1JAMsv6klIr6LfYa+XpGamtIArfjzQsfr8Q0gFk+czHVBdEy52+D9Lbk0AoXe/wl
	8DLqiGwRomZWWoZLvDdc2815rnxqibvuyZmq4gyVGGxqHuVJutOw53Xlh6KxxhiMe/wwSUNZ+9m
	/fDyvLFryM7c6l1rs4m4rpaE7wb12am4I8XvvvdunTCNrj82S0e+6cqZuCWfVpet2YCz5gxrpRv
	YnUYzyS+TOxwGAuR64Cgi8ks1ELWTZvbGFU4ed4Q9dKbX/glq0x/gnRa733lSIkbw86MDS+BXcW
	XYDmf0g8TrGn241+jQN4Vb9IGrxrOBxzlidz5ffeoyYwzGMJzkatLiArb/ys5Cw8qIpsA2J9lKZ
	sPsfXYWR51/m43rd61JpQ/LMe4pRZTLCM3UMLOAvNKy6zyiTwTMcu39u9C+PMOOXdV2rpDIkcef
	bt56G71k6bEN8OKA==
X-Received: by 2002:a05:600c:1c0e:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb68e5bb4amr88504125e9.16.1794768824018;
        Sun, 15 Nov 2026 10:53:44 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:43 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints after BNA
Date: Sun, 15 Nov 2026 20:53:34 +0200
Message-ID: <20261115185335.782678-3-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115185335.782678-1-vadim@yuzi.co>
References: <20261115185335.782678-1-vadim@yuzi.co>
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

In descriptor DMA mode the core raises BNA and disables an endpoint when
the descriptor it fetches is not marked host ready. For isochronous
endpoints dwc2 handles that; for bulk and interrupt endpoints it only
logs the interrupt at debug level. Nothing was transferred and no
XferCompl follows, so the request stays current, the requests queued
behind it never start, and the function driver waits for a completion
that never comes.

On a Sophgo SG2002 (DWC_otg 4.20a) with a video pipeline loading the
DRAM this happened every minute or two to the bulk IN endpoint of
f_mass_storage: debugfs showed the endpoint disabled with an 18-byte
REQUEST SENSE reply current and nothing done, the 13-byte CSW queued
behind it, and f_mass_storage asleep waiting for its buffer. The host's
command timed out after 30 s and it reset the port. Read in the BNA
handler, the descriptor is 0x0e000012: host ready, last, short,
interrupt on completion, 18 bytes. The chain is written completely
before the endpoint is enabled, so the core fetched the descriptor
before the CPU's stores to it reached memory. The next patch closes
that window on this SoC, but a BNA on such an endpoint should not leave
it dead on any platform.

When a bulk or interrupt endpoint other than EP0 raises BNA, is disabled
and not halted, start its current request again, which fills the
descriptor anew. Report the BNA with a rate limited warning instead of
at debug level: unlike on an isochronous endpoint it is not expected.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b0e129061..046b5b045 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2305,6 +2305,45 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
 	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
 }
 
+/*
+ * dwc2_gadget_handle_nonisoc_bna - handle BNA interrupt for bulk and
+ * interrupt endpoints in descriptor DMA mode.
+ * @hs_ep: The endpoint, not EP0 and not isochronous.
+ * @ints: The endpoint interrupts that came with the BNA, for the log.
+ *
+ * The core raises BNA and disables the endpoint when the descriptor it
+ * fetches is not marked host ready. The chain of a bulk or interrupt
+ * endpoint is complete before the endpoint is enabled, and afterwards the
+ * descriptor reads host ready, so the core read it before the CPU's writes
+ * to it reached memory. Nothing was transferred and no XferCompl
+ * follows: the request stays current, the ones queued behind it never
+ * start, and the function waits until the host gives up and resets the
+ * port. Start the request again; that fills the descriptor anew.
+ */
+static void dwc2_gadget_handle_nonisoc_bna(struct dwc2_hsotg_ep *hs_ep,
+					   u32 ints)
+{
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+	struct dwc2_hsotg_req *hs_req = hs_ep->req;
+	u32 epctl_reg = hs_ep->dir_in ? DIEPCTL(hs_ep->index) :
+					DOEPCTL(hs_ep->index);
+	u32 epctl = dwc2_readl(hsotg, epctl_reg);
+	u32 status = hs_ep->desc_list ? READ_ONCE(hs_ep->desc_list[0].status) : 0;
+	bool restart = hs_req && !hs_ep->halted &&
+		       !(epctl & (DXEPCTL_EPENA | DXEPCTL_STALL));
+
+	dev_warn_ratelimited(hsotg->dev,
+			     "%s: BNA, DxEPINT %08x DxEPCTL %08x descriptor %08x, %s\n",
+			     hs_ep->name, ints, epctl, status,
+			     restart ? "request restarted" : "not restarted");
+
+	if (!restart)
+		return;
+
+	hs_ep->req = NULL;
+	dwc2_hsotg_start_req(hsotg, hs_ep, hs_req, false);
+}
+
 /**
  * dwc2_hsotg_rx_data - receive data from the FIFO for an endpoint
  * @hsotg: The device state.
@@ -3257,6 +3296,8 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 		dev_dbg(hsotg->dev, "%s: BNA interrupt\n", __func__);
 		if (hs_ep->isochronous)
 			dwc2_gadget_handle_isoc_bna(hs_ep);
+		else if (using_desc_dma(hsotg) && idx)
+			dwc2_gadget_handle_nonisoc_bna(hs_ep, ints);
 	}
 
 	if (dir_in && !hs_ep->isochronous) {
-- 
2.56.0

