Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256948;
	b=AiyZq2BlUfr8PGOggM1W8wLQi9LHBvtZiGs/n8nR8p1UNqlJLuqLhiAQ2l5OXMe0zp0h
	 c2V1XZ6RpSedKd6uSu8ruSeQ8/rLLNxApMwK0IbcDr/c/URUpTR+Kxo71u0TDC8RbA8BZ
	 7/yY/tsmjA91gzxczcoojCm2NAIJ2DAFm2Za0w0Bod1G5OJJlfh1OB7XTWD2Aic3qUg3+
	 +zWpp4a/PenKlmQ3Wge/dmy2SW2zjX4F4VPb5FZbrySFWl/C9imWfEpIBpqIqAzXArAyF
	 ZMFQv30anq7pA3KuCGFgSaBEfngJCAmBFxbCOEKRzK9tSRi5gQ91RhpdHOx5cKDeDdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X+sBR37PKezFo9EZH7jBAqNTkY656fto71PhPteM0uU=;
	b=IVnL7J756abIaOKHdC+BBqYdxiI6SzIEGlQ/pk5hnZbL6ID2YluLJr5qYd8T9YkkOino
	 QQLNz2bbriXBvHLNt4F59jagisFwYmUifL7FCefBsiLEw+Cm8D2mkzYHreyKB4QRvZKNM
	 1cdTEjY6mGSrUFxZBaFmFy7nWMWi3kgoqeobKb/x7aSk2zTGIpZ3bbbmQZPwzMBB77GuH
	 e/xMKVrLpmwV70VNF01rLXXGRhXDoHa9mRKQUih6sq/2ubJ+GFva3NMZHwrrR7Q18DZax
	 NntjSRjFBLUYfSCal8PBapBTWVydXvlyePtNWHycLEbvsHNRdunrk4TPpYlOLMbdFnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PriGu3O9;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8E606A31C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 06:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PriGu3O9
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so15507985e9.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256946; x=1793861746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+sBR37PKezFo9EZH7jBAqNTkY656fto71PhPteM0uU=;
        b=PriGu3O9fMvhB7kCvSKpzAt36p5JdAbnIwX3i8ewG/JTLelhJqNGFNkohTFceylfQY
         KgISnI+FKv1jkNel4ZfvhYkARGOownVP9cdb47WkZDmt98Mq0xNxuJNJyok/Qs2YZRiV
         DKP7xfMG/hbcogEhGskxhFyOJHmHaEylVVTyQYsVWdi2LigZ44N8zlIYmY13Em1RQMet
         0mHVd1PhSwbpIK2mfOEdnHMqIv00civZ5u3QB6exvR4pRNPahVjTnuDkJL0OyAN8docB
         c88XjmWuDRX960aicUGdoJPXworTWtTO4TIHPg7aVg2STFJu5wjV6XoVbbdeew8Ma/BO
         8ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256946; x=1793861746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+sBR37PKezFo9EZH7jBAqNTkY656fto71PhPteM0uU=;
        b=2y97PiGSpA2oWxo8wjJfC9/5ob36C2/VSssHXTvGgzRtKbKJY0lf+KD0d+BXw+sMmj
         HnTTTOOO0YQKbTWhERKr16DtMWxMGlfmACtL69KUEW6EB8JY5V3FrhqXe+D3ERcTz8aG
         yX+Hg6K3MsTQ00UfihAnQNwkwV7Jb+2Z9twPIIcKBxM+C7q8dgQvDmxDgdfM9EWkFVCc
         oAdnN2n8wUjPN2SMLcIWPcuPx2j0VoWExn1HjHVOPZ/aZ4DgwKGdk+oV05fjMlnM9s3q
         oI/pzq7OQBrZiBGzcMIR/oUu0WXCC5vNf1EXnc9DvyIMLMEleoDk2QpqIvJsKVSl5XeR
         aoLw==
X-Forwarded-Encrypted: i=1; AKwUvBx6p+KgUO3gCRN1kfgRjiud/gbyNWI/to2szFxVuKPq6GMWn2e8l/aUam3OrnC/hMUvKDoTcclcSaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpPU3KLOzY3/jsTYLmDu8A5sLB6S0ZX6KTiqZpzZgmNKE77djX
	TD9gqYI36gPUoZ84WM9c1aYxAVtPh2CXSbjzpvO0Rx798ZeC9ad/m7djM2VpCnMS
X-Gm-Gg: AYBFou3gmgUmDnI1dIwP4Hq/pZveZ82Iz6pWM2YCmox+6hdI/3eWjHi9OtfyrcYf0LJ
	unz4sTy2zYeOMdGbBFwxgQaQYSvVDW8Rxbk2vp0lzRPh5RKtxbHVqOoATKJ1r0Puw6VSfCq4RCX
	BqdGTTGXFs7iQN0UfyEvsk8sT9bnprrwi9zmqKRiTULPfdX0AWsNemy9KPogYyF0JHlByn8uTYK
	siYWk+lJP7fEBEOot7GSGEJLjcJtmrGK8/xhDSvQAgSp0n2adJ/Z9wBfXMKDvNV6eWPhJRc2E41
	NGF/3WU3aEV+QiTBl6m2+vIYbWIobR2wj8Cv95pgru3d77Y7GqXjN/ocw5iElZWI5D+9f4BoCFO
	atgtwGfQDLldaiFf4onUUscqzT6wFebU/9HY9NFyC6xC9GfqaaDDdhsnoo4VNWfFFAuuPSZR4zG
	OLfQgya7Szre/9xH73bR21CvK5y0qBqzHZattgnN6u3PzPHgPQkH/jqBqKFd0PmUZxdawyGDbks
	Ke9NH2IqyQkep1M6xPARQoqoNJUBlSALk+Vln5qf2EC2eZGvbt7pQYdbL0n//ltAFx1b7Giy3dm
	VFYAAF9Ej8/eQCCDxhJ5yC+NZ9m0emMpFekW/Q==
X-Received: by 2002:a05:600c:8715:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a967ab1ce3mr101984595e9.33.1793256946210;
        Wed, 28 Oct 2026 23:55:46 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm42963885e9.3.2026.10.28.23.55.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:55:45 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:55:43 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 2/4] usb: xhci: Give back stranded URBs on disconnected
 endpoints
Message-ID: <20261029075543.3fe902b3.michal.pecio@gmail.com>
In-Reply-To: <20261029075409.4b203658.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
	<20261027192128.386082-1-mathias.nyman@linux.intel.com>
	<20261028080734.173da0e4.michal.pecio@gmail.com>
	<20261029075409.4b203658.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

When a URB is unlinked and Stop Endpoint handler sets EP_DROP_PENDING,
the endpoint won't be restarted and URBs will be hanging until drivers
unlink them, possibly only after a long timeout.

For control endpoints, cancel all remaining URBs before invalidation
and then process them normally to ensure proper ring cleanup. On other
endpoints just nuke remaining URBs after cancelled TD processing; URBs
which are already cancelled are still returned normally.

Based on ideas from patches by Yiyu Zhou and Mathias Nyman, reworked
to integrate deeper with existing infrastructure and cover more cases.

Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7049787725fb..14cfb025c365 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -62,6 +62,7 @@
 #include "xhci.h"
 #include "xhci-trace.h"
 
+static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
 static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field1, u32 field2,
 			 u32 field3, u32 field4, bool command_must_succeed);
@@ -951,6 +952,11 @@ static void xhci_giveback_invalidated_tds(struct xhci_hcd *xhci, struct xhci_vir
 		if (xhci->xhc_state & XHCI_STATE_DYING)
 			return;
 	}
+
+	/* Nuke stranded URBs if there is no one to give them back */
+	if ((ep->ep_state & EP_DROP_PENDING) &&
+	    !(ep->ep_state & (EP_HALTED | SET_DEQ_PENDING | EP_STOP_CMD_PENDING)))
+		xhci_kill_endpoint_urbs(xhci, ep->vdev->slot_id, ep->ep_index);
 }
 
 static int xhci_reset_halted_ep(struct xhci_hcd *xhci, unsigned int slot_id,
@@ -1047,6 +1053,20 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 	if (ep->ep_state & SET_DEQ_PENDING)
 		return 0;
 
+	/*
+	 * Disconnected EP0 may be reused when core "resuscitates" the device,
+	 * so we must clean up its ring properly. Cancel all remaining URBs.
+	 */
+	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index == 0) {
+		list_for_each_entry(td, &ep->ring->td_list, td_list) {
+			if (list_empty(&td->cancelled_td_list)) {
+				list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
+				td->cancel_status = TD_DIRTY;
+				td->status = -ESHUTDOWN;
+			}
+		}
+	}
+
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
-- 
2.48.1
