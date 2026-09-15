Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C453B9DB3
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482911; cv=none; b=MgtMjgdIPp6uxeD/Ck0MgIMPynAYO102pyKBwO0vh8P2Kl0A1f/z0S1MpcmkLF/zH8VYaJdLH8FTraXAaouvYlTcALfr1pRbyYyfmYC/g9fewcqojk+ATtSLobnp8u4TshcXfxW7eqeLdctkXAsdS6jY8Hjh6kuBo+vBo4x81G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482911; c=relaxed/simple;
	bh=BaTy1mJgbJAcsliMSea+KT9ybagMiGHMdv+/HCc3oJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FDGysKeat/kq+/9wJ2pCdN5oyM372V/9KgaMiNSCquQAI8Bm7P1foA4CSrhbgl81NKBgXMxtXB5ypaN0LG3Hbhw3rFdU9f+ovVpvwIeEyn0PwbYrHTfeAbSzfZnpTvQuf0Wyb4DlqDIROADtgeb+c64zQMdTe37xV+QvlQXiV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Pd2chXqN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Oy1d0P9Z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Pd2chXqN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Oy1d0P9Z"
Date: Tue, 15 Sep 2026 16:35:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789482907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nx6kcC6T/CBVAANjLTqKgoQ+eAsQB2eLKb2QMIhX71s=;
	b=Pd2chXqNhfsyyVA3mOANEDBu9rqAg4YRHmcXYXsF0c4N+xgXGjBMRtOxvexqWTsTWV6fNu
	AMrYAUjBtwWQr2PTi1rWjlzwFRrwzdPDvzUqT6RrFw8W2GZHtcxXO7PHeTkir/pV0oEhfB
	Wbpow+EKBTdMZ/OkKRt7gpRMjA52jptVf+1nCowPtD+GtZaw53Da5QCAhUCET8S+vITRe9
	WM4rAxdi+NDgu0CpGpMDHQRyR+VjECQKnQpk8P4OHDxzW+1RM8IZGqKNyN6UhtHri79Z7e
	cfKvfGuE7JCxw8XNS6GWANfmQ2HnmHjZfaLhxy6idvt5k3cB5MLkBKNN6xPlzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789482907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nx6kcC6T/CBVAANjLTqKgoQ+eAsQB2eLKb2QMIhX71s=;
	b=Oy1d0P9ZSJtaxieXglY3zjfYX+QGJbzbbquBiZtTVGpnwXJN8xVBK3sMp1awtGq0sUNvq1
	YOVi3G6CqdIfHWBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v3 REPOST] USB: mtu3: tracing: fix pointers dereferencing
Message-ID: <20260915143505.k5Mxo7_J@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

From: Marek Szyprowski <m.szyprowski@samsung.com>

Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
in TP_printk()") added a warning when printing an event dereferences
a pointer, because it might be already freed at that time.

MTU3 driver is one of the drivers triggering this warning. Fix it by
storing the DMA address in the event structure to avoid dereferencing
gpd_ring pointer during event printing.

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

Could this please be routed via the USB tree?

v3:
  - Repost

v2: https://lore.kernel.org/20260904083644.2010063-1-m.szyprowski@samsung.com
- fixed typos in commit description

v1: https://lore.kernel.org/all/20260804100531.88576-1-m.szyprowski@samsung.com/

 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d6356..b24c6411a8cf1 100644
--- a/drivers/usb/mtu3/mtu3_trace.h
+++ b/drivers/usb/mtu3/mtu3_trace.h
@@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__field(unsigned int, flags)
 		__field(unsigned int, direction)
 		__field(struct mtu3_gpd_ring *, gpd_ring)
+		__field(dma_addr_t, gpd_ring_dma)
 	),
 	TP_fast_assign(
 		__assign_str(name);
@@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
 		__entry->flags = mep->flags;
 		__entry->direction = mep->is_in;
 		__entry->gpd_ring = &mep->gpd_ring;
+		__entry->gpd_ring_dma = __entry->gpd_ring->dma;
 	),
 	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
 		__get_str(name), usb_ep_type_string(__entry->type),
 		__entry->maxp, __entry->slot,
 		__entry->mult, __entry->maxburst,
-		__entry->gpd_ring, &__entry->gpd_ring->dma,
+		__entry->gpd_ring, &__entry->gpd_ring_dma,
 		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
 		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
 		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
-- 
2.55.0

