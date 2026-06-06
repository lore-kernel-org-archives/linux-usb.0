Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A13270575
	for <linux-usb@vger.kernel.org>; Sat,  6 Jun 2026 02:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780713645; cv=none; b=nSR+Qzf2CVm6v2UXGNZXeqI7Amc60zCFDuRkNaz605C0drlHjS7UYmMXmGngIPGNFAe4BwEuUNpFU4zUGku5Lr8n1UcDwqeDxIe0cl2QLTegTXiDGPqyOug/zhxs+vYYb8leZZwoKy7XKBVaH9bTvMgFg/KT8f4ZNw0jltjYkwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780713645; c=relaxed/simple;
	bh=M5Bi8ieqGgSX9vQ1NT8hurUhkbNY6pPyQdskgwNd82k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pmhb9em43yF0orGQbE4IfiFtxZrklMuQmrub7Xx9tnSM3w0xzVpVtMZlDHPgIAzB5VNEXivW9dWTnYgHdoQ5YIGMyRWX3fF6R7dy6aY8Kbsg/Vd64R4a/I0LXqnaffgC05SvgRTHV0E4UQ68ycyyedeX/g+Z+teNQ5n4KZ9jRnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myPm84xg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myPm84xg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso1633102a91.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Jun 2026 19:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780713640; x=1781318440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OnUZWQkJ/UT6kL1pJlMljxV5hMYiFMtGqMjvgMPjKdo=;
        b=myPm84xgChtImCu0mL4QpMqL4H/zr+UqtMPY06UXC5SacM25e1MsZK1kJOlaY6iLA6
         ciwmIJoJpipH9NZKE5b80NJn98G6x5PqusIRcXYYhpnzhdFsA3sqbYgc+wtMuU4zF4zG
         UZW4l75W352I0A++MP54RbNuu0Iz+qhl4u/15aXLfl9m4DWwIur+R/drwQILbWZTjF4N
         M1QDc08eJMMvgv3hf2CNaISdhdD7U/nKfXfaLB91aOEQ91D8H1QfukeIHAhLyJypfdvT
         kZWkikpq70cFIByfBAeBTGI1hTVIfZWwQwzZQQuoYD7svFzLFjj0Js5bvkm1NT8TdfEE
         LC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780713640; x=1781318440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnUZWQkJ/UT6kL1pJlMljxV5hMYiFMtGqMjvgMPjKdo=;
        b=nju82Ie2rOabltxuXWrrN9r4CiSvcCrXAMWM3rFlWRHV3BkxYHKECqTlIEMNfdNhV6
         JwY0GK5RMSiF4TaVoUo5P64v78HJEi27kr6/b3kjWsJYdhaDuMmoS2qULmPCY9y2QSBy
         2fSkXcXSU5Rm5P//UXMwde+6qaMgw6WLHsxWaqc7d2bPvnhSPNy46ac/oZvXd/CdysHe
         hu5f0ITAvNhndkkfSsLU9sA/LLkGpMKI7Xt7TfMo7BNUsCV11kj0+gxeCP1e0ksy3Lxc
         tWI6ZCZ+dsloFiI5o1gABTwDp58mAt8og5d1k7X1p/QPPkadY0clMo7wkf8fJyGQ3sNY
         reQg==
X-Gm-Message-State: AOJu0YxI5WCq304CB8LEEwsqSDYZv3qQIVkngmuUFiMiKbJbg6XBHmd/
	Wlx7WhlVNYyz2QfOqWcu50D+LmHKZ5WI9iCR6KWglJrRqGzLifQBdK/8IREVgMHmsCI=
X-Gm-Gg: Acq92OHmcGe7OUb7Mp7WnA3NpsUCdZ3ntJWBCbz4j2rHwiuSKnsoC2OqqJ/CdzOHOMT
	uQGGlgvH57fjO2+RgHFQnmE85cCvQH19ADW8FJ9WfLiQE6yXNkLk9Wg27PFP4ysuglqV2y00HSr
	3PJ7X08AHG28k4ErsargRxPgM2y2XSxrPH7jPR7E5RLBgey+vUfaFb/Xhrw7G+J2F0fRszH7T6t
	kzNR5h0FQIGm0mykpdc58v32bTiPGMFPZ/6XQ4n6WaGboUWPO0BIQ+dC4G33xUR2k6E1UNmZSl6
	xjGSlRAIbLFWkok3af1uvJldpaF8G3NqiYXNJLCtgvMGXc8mr79bqnzsilfvNCa8Vg7ZFRjAoLs
	Sf4L7CD9+NHZlH8NjhQ/JuvFPa5UwLbeyla/+194aobNcRIUYcrAAYVFqUgNHsf+nIjPe40VdCr
	zSbg/GMvvLWk6eUKUAjrhq5kew70yELMd6nPvr2E5dc/0d8LR2Af09p1j6fl+yFusuy53cWGfnl
	vVDc+PuGzG63g==
X-Received: by 2002:a17:90b:4b0b:b0:36b:a2cc:4857 with SMTP id 98e67ed59e1d1-370efdaca8fmr8433786a91.18.1780713640163;
        Fri, 05 Jun 2026 19:40:40 -0700 (PDT)
Received: from viku.office.rr.lan (fs79022602.tkyc410.ap.nuro.jp. [121.2.38.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm7924955a91.11.2026.06.05.19.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 19:40:39 -0700 (PDT)
From: Vishal Kumar <vishalmimani008@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishal Kumar <vishalmimani008@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: tegra-xudc: drain EP pipeline before dma_unmap
Date: Sat,  6 Jun 2026 11:40:11 +0900
Message-Id: <20260606024011.1160110-1-vishalmimani008@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tegra186/194/234 the XUDC posts a transfer-completion event when the
DMA write is dispatched to the AXI interconnect, before the store is
committed to memory.  Under SMMU strict mode dma_unmap() synchronously
invalidates the IOVA TLB entry.  An in-flight AXI write to the
just-unmapped IOVA triggers a translation fault (fsr=0x402) that
permanently wedges the bulk-OUT endpoint.

Observed on Tegra234 (Jetson Orin Nano) at ~170 MB/s USB-NCM transfers:

  arm-smmu 8000000.iommu: Unhandled context fault: fsr=0x402,
    iova=0xfffb5000, cbfrsynra=0x100f, cb=3
  tegra-mc 2c00000.memory-controller: EMEM address decode error

cbfrsynra=0x100f identifies XUDC (StreamID 0x0f per DT), cb=3 is iommu
group 4 (3550000.usb).  fsr=0x402 is a translation fault on a DMA write.

Fix: poll EP_THREAD_ACTIVE before calling usb_gadget_unmap_request() for
non-control endpoints.  EP_THREAD_ACTIVE clearing is the hardware's
guarantee that the endpoint sequencer is idle and all AXI transactions
have completed, so the subsequent TLB invalidation cannot race an
in-flight write.

Also change ep_wait_for_inactive() to return the readl_poll_timeout()
status so callers can detect a timeout.  On timeout in the completion
path, skip dma_unmap() to avoid the translation fault and force
req->usb_req.status = -EIO so the gadget driver does not treat the
transfer as successful or requeue the still-mapped buffer.  On timeout
in the dequeue path, emit a warning.

Fixes: 49d6f3dd4abe ("usb: gadget: add tegra xusb device mode driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Vishal Kumar <vishalmimani008@gmail.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 47 ++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 0b63b8c0a..3f18beddf 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -1023,9 +1023,9 @@ static void ep_wait_for_stopped(struct tegra_xudc *xudc, unsigned int ep)
 	xudc_writel(xudc, BIT(ep), EP_STOPPED);
 }
 
-static void ep_wait_for_inactive(struct tegra_xudc *xudc, unsigned int ep)
+static int ep_wait_for_inactive(struct tegra_xudc *xudc, unsigned int ep)
 {
-	xudc_readl_poll(xudc, EP_THREAD_ACTIVE, BIT(ep), 0);
+	return xudc_readl_poll(xudc, EP_THREAD_ACTIVE, BIT(ep), 0);
 }
 
 static void tegra_xudc_req_done(struct tegra_xudc_ep *ep,
@@ -1046,8 +1046,39 @@ static void tegra_xudc_req_done(struct tegra_xudc_ep *ep,
 					 (xudc->setup_state ==
 					  DATA_STAGE_XFER));
 	} else {
-		usb_gadget_unmap_request(&xudc->gadget, &req->usb_req,
-					 usb_endpoint_dir_in(ep->desc));
+		/*
+		 * Drain the endpoint DMA pipeline before unmapping.
+		 *
+		 * Under SMMU strict mode dma_unmap() synchronously
+		 * invalidates the IOVA TLB entry.  On Tegra186/194/234 the
+		 * XUDC appears to post the completion event when the DMA
+		 * write is dispatched to the AXI interconnect, before the
+		 * store is committed to memory.  A subsequent dma_unmap()
+		 * can remove the IOVA translation while the write is still
+		 * in-flight, triggering a translation fault (fsr=0x402) that
+		 * permanently wedges the bulk endpoint.
+		 *
+		 * Wait for EP_THREAD_ACTIVE to clear (endpoint sequencer
+		 * idle).  On timeout skip the unmap to avoid the SMMU fault;
+		 * the DMA mapping leaks but the hardware is already in an
+		 * unrecoverable state.
+		 */
+		if (!WARN_ONCE(ep_wait_for_inactive(xudc, ep->index),
+			       "ep%u: DMA drain timed out; skipping dma_unmap\n",
+			       ep->index)) {
+			/* Read-back completes the poll barrier; EP_THREAD_ACTIVE=0 guarantees DMA is idle. */
+			xudc_readl(xudc, EP_THREAD_ACTIVE);
+			usb_gadget_unmap_request(&xudc->gadget, &req->usb_req,
+						 usb_endpoint_dir_in(ep->desc));
+		} else {
+			/*
+			 * Timeout: mapping is intentionally leaked to avoid the
+			 * SMMU fault.  Force -EIO so the gadget driver does not
+			 * treat this as a successful transfer and reuse the
+			 * still-mapped buffer.
+			 */
+			req->usb_req.status = -EIO;
+		}
 	}
 
 	spin_unlock(&xudc->lock);
@@ -1443,10 +1474,12 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
 		return 0;
 	}
 
-	/* Halt DMA for this endpiont. */
+	/* Halt DMA for this endpoint. */
 	if (ep_ctx_read_state(ep->context) == EP_STATE_RUNNING) {
 		ep_pause(xudc, ep->index);
-		ep_wait_for_inactive(xudc, ep->index);
+		if (ep_wait_for_inactive(xudc, ep->index))
+			dev_warn(xudc->dev, "ep%u: DMA drain timed out during dequeue\n",
+				 ep->index);
 	}
 
 	deq_trb = trb_phys_to_virt(ep, ep_ctx_read_deq_ptr(ep->context));

2.39.0
