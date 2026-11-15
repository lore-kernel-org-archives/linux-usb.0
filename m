Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768824;
	b=wZP5SThlRxafpbNGW3XAr7nWpMXoLLwXme1o67e5590c/15f/YqSJNNpmOtv6T7wMYQO
	 htYFahbG2eKxGtsEvRb/Kn4WlvTneaaI2xuW/plGkkDoHgG9wRU11lv8tsveNFysBkQ/M
	 6gCBcVG3Q76e7DwuTQLhVSJsCrRCszgZQBsQtAEdFfH2aEb7Q6xca9Z+KnPA52WIEB/cY
	 Qy2dvDA0xTm1Vo34TgQPLAZU0+VIuW6c5fGTF6SxlIHCUENNobA86JBLzPxFu8xmzKsoe
	 KPKVI9ZhxsDEvYCzdbQCyIJ7qYbRsCvzqzBx7+tCiGOe6/8gt+L7b+me0ONLeuCMfIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
	b=v4MYCIcIKjn1DpMgoJyk2hDvTkSxyQ2xXHgMm/prVpsWZMRcv3hv/oL3Gae0WtrFRbYL
	 wnPO0HYBfOZ03oqdB6Hvf60N7eyGJOB19P5bMTh7na31Diz2/pfQx8/NGdR9/95D6XldI
	 AaeScOx2xJQGyVn1mfVI+CxaVhngvLkF0XxuUapjT3d74D+G8GSEKUbA7J4Y7BXM3TNdE
	 Kx5K/nrDGl58z+8f3J9MeCyc112r0CMyEg+tfgFgKWX/yAZ/IfQPEZmrnymwDtg84SKM3
	 AcspgGvcFVMQWr2iZ+oZT2ZuG1p5W1rZgE9mGA79hmBX5MDPLrxLZ7m/JX+hrrShQRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=MdAvEU1u;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A554606A327
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 18:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A554606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=MdAvEU1u
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so31035675e9.2
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768823; x=1795373623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
        b=MdAvEU1u7SCn0d4StuDm3qQkvkE5B8JbAYKeGeTi4kItIZzIIlYVWqjC4ofjAP7gwL
         oSqky2wgYBGRQ7m8pGMpFTqf7S/YsfxlEKMugMOor8109xerzZIYP0i84zounUG6K8iw
         fkIbsRrmLHXshDjLxLqZkhwd66d/1MEitqoX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768823; x=1795373623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
        b=uTuWWL0Ejhzwi3RdmY27a/O67c0B2UU0yPNWRLDsRSO5L5GarjoiH5v/3W5X1VDZ9f
         HprbDJQXhzb+mUB0XL8aWqWYnnK1nJV9SqEjLC5COEzKk3bK61SwUx3lupj6uVwYThK/
         Crme8h1Ex1T53f8ntZkEHw7mkvgqEQCXoSTOqZuQrXNpohU+GvsfEXC1jsFnLmw/7r/y
         1BLxIxUv3EejOZE5kxjsiRQhrC0Cy6jKj5CUGk2AfzovHWap7UJkKy9B6j1y03qUKdEs
         CbtWaRpKDZ6rye30gxNdMW6twmZfL7elSfKxalAMvs1syQZXr10EILGQUdoUKk03FElH
         kASw==
X-Forwarded-Encrypted: i=1; AL+hErF3Z4xBS0JZMD3KzeOIM1Hzr0aC6c9z0dBZnYCQTCjuEpkirxVpg0HGlo9GCav+KGyvmdRDUsag2Jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+iM/6pRRzY9JyMnZvlFeDysLXx755zcxv0Cj1BCu3HR8kEpNL
	6hjVIiXGHOcAqpJpdn4Q2b5mqmlj1DTcEDB2qTb42n1WsG11PhAYTd+js+8gAyEcchM=
X-Gm-Gg: AYBFou1TE6lwewDLVjfPvnZEOyGyWguU2O5SE7wnPXyS29MDJJz+lAL+IOzJl2m//7+
	37ck1moOTs5FydkkgBW+vOFHyPb4T+8MUP6l19N+YmI/v6O80fl+dsyZLkJkGo+aiLxLu/fk1+t
	GwJqTEmJjbouFhO7mpuArDDAhWt8oOLlEWghIVAOxkGgXhpj5jldZ3uFWl0YsxDXaif2NxdH8aN
	tAcKLcg+ChkBFLe5FQ+5vRQkTP2Nr52EN2Ta/lht9vxnJ8Go8V+PPtvtTTm0Erx4VdW1PCjXVKu
	UUNnfL5KSvmwbj8YPAJ0pd8t6Ccmbc6qIzct1+jFoCDwkXOw2lc/3x7TEh0GzSVxz7QZ0SmQvd2
	lLsq3IRTIBAXyP/G7PBuGIznluD0hFldYMXaQhbHT5KpRFT34MrNw/WD65SrSALge77XVgQUwrK
	+G2BSE2Yxji2fSCJISbB/nFfZnjNN4ductR84ZCGSZQxWi6pbV3Dvru43nNOuPvwSYdjZx2o6TT
	WNNI9NS8rbDMoXcPdcZlKAMQNT5oIjFWi1qZgUfz+L43FrAgAbUVH+ow03+3veHtwOqk7Qox4KO
	SW6HhPkIxmda4YO/Tusvx3YDlrFE+gkcN31Zp8CdwuA0IJ0Ml9Sp32WwGwvC0sFRt7pMHweQw37
	QNxfD5ZBxLHIkFUqsoM4AZ6xVPTdvQ01DMiRUqWked6mqRLHeURRTtFNEU0hyqGQOC/HEZk14G+
	RtLmLHML3cqvRXuA==
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr80230305e9.8.1794768822690;
        Sun, 15 Nov 2026 10:53:42 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:41 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after BNA
Date: Sun, 15 Nov 2026 20:53:33 +0200
Message-ID: <20261115185335.782678-2-vadim@yuzi.co>
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

In descriptor DMA mode the core disables an isochronous endpoint when it
reaches a descriptor that is not ready (BNA), for example after an
interrupt latency longer than the queued requests cover.
dwc2_gadget_handle_isoc_bna() resets the endpoint and leaves the restart
to the next OUTTKNEPDIS. Two things keep that from happening.

First, the endpoint-disabled interrupt that comes with the BNA runs
dwc2_gadget_handle_ep_disabled(), whose isochronous part is written for
buffer DMA: it completes requests frame by frame and advances
target_frame up to the current frame. Run after the BNA reset, it moves
target_frame off TARGET_FRAME_INITIAL, and the OUT token handler then
takes the chain for running and never restarts it.

Second, after the BNA the core raises BNA again for the disabled
endpoint as fast as the handler clears it, and no OUTTKNEPDIS comes.

On a Sophgo SG2002 (DWC_otg 4.20a) with a UAC1 capture endpoint and
eight requests queued, one 8 ms interrupt latency (a line printed on the
115200 baud serial console) caused one BNA. The endpoint stayed
disabled and the BNA interrupt kept the CPU busy until the host gave up
and reset the port, which took the other functions of the composite
gadget down as well.

In descriptor DMA mode, do not run the buffer DMA completion for a
disabled isochronous endpoint; put it back in its initial state. For an
OUT endpoint, build the chain again from the queue and enable it at
once, both after the BNA and after an endpoint-disabled interrupt that
finds it disabled with requests queued. IN endpoints keep restarting on
the next NAK.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05f..b0e129061 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2259,6 +2259,28 @@ static void dwc2_gadget_complete_isoc_request_ddma(struct dwc2_hsotg_ep *hs_ep)
 	}
 }
 
+/*
+ * dwc2_gadget_restart_isoc_out_ddma - build the chain of a disabled ISOC OUT
+ * endpoint again from its queue and enable it.
+ * @hs_ep: The isochronous OUT endpoint, in its initial state.
+ *
+ * After a BNA the core keeps raising BNA for the endpoint, as fast as the
+ * handler clears it, and no OUTTKNEPDIS comes to restart the chain. So the
+ * chain is restarted here at once.
+ */
+static void dwc2_gadget_restart_isoc_out_ddma(struct dwc2_hsotg_ep *hs_ep)
+{
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+
+	if (hs_ep->dir_in || list_empty(&hs_ep->queue) ||
+	    hs_ep->target_frame != TARGET_FRAME_INITIAL ||
+	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
+		return;
+
+	hs_ep->target_frame = dwc2_hsotg_read_frameno(hsotg);
+	dwc2_gadget_start_isoc_ddma(hs_ep);
+}
+
 /*
  * dwc2_gadget_handle_isoc_bna - handle BNA interrupt for ISOC.
  * @hs_ep: The isochronous endpoint.
@@ -2279,6 +2301,8 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
 	hs_ep->target_frame = TARGET_FRAME_INITIAL;
 	hs_ep->next_desc = 0;
 	hs_ep->compl_desc = 0;
+
+	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
 }
 
 /**
@@ -2902,6 +2926,27 @@ static void dwc2_gadget_handle_ep_disabled(struct dwc2_hsotg_ep *hs_ep)
 	if (!hs_ep->isochronous)
 		return;
 
+	/*
+	 * In descriptor DMA the requests sit in the descriptor chain rather
+	 * than one per frame, so the frame by frame completion below does not
+	 * apply. The core disables an isochronous endpoint by itself when it
+	 * meets a descriptor that was not filled in time (BNA). Put such an
+	 * endpoint back in its initial state and build the chain again from
+	 * the queue: at once for OUT, on the next NAK for IN. The loop below
+	 * would move target_frame off TARGET_FRAME_INITIAL, which tells the
+	 * token handlers that a chain runs: the endpoint then stays disabled
+	 * for good, and every request queued again goes into a dead chain.
+	 */
+	if (using_desc_dma(hsotg)) {
+		if (!(dwc2_readl(hsotg, epctl_reg) & DXEPCTL_EPENA)) {
+			hs_ep->target_frame = TARGET_FRAME_INITIAL;
+			hs_ep->next_desc = 0;
+			hs_ep->compl_desc = 0;
+			dwc2_gadget_restart_isoc_out_ddma(hs_ep);
+		}
+		return;
+	}
+
 	if (list_empty(&hs_ep->queue)) {
 		dev_dbg(hsotg->dev, "%s: complete_ep 0x%p, ep->queue empty!\n",
 			__func__, hs_ep);
-- 
2.56.0

