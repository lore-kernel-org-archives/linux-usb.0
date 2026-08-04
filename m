Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDDD45FFCA
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837945; cv=none; b=NgR9JmTnAV2uGZ2IV/K7FUtKrxhahz4jHS9sIoLRtYTbApZ/Nm5fpEHZjEBLsulyPwS7smhRAKgvtpildsW/KVPrFhte18eO05LGsW9crIjUBJDA22KqcNb6K1DSrRGKp1XlWykdclrcc7c7CDLKfKgnTZ+69ALOHfE2t4t6XXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837945; c=relaxed/simple;
	bh=1QO/qBBBYoTpexzPlejE/2yvvi++gi6Mcoo1imP9/Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=Nbcg57bQyDabyg/872ayeGU4KmGoOzfjR8jxev7gkNERoq8jS7vlyu34RcXxfZM9/8b1WvpwZCCDqj7i3TiWHzPY0NlqeBWflUolWOI1SqT0s/Dl4VhsnsELPh2FrKezOPxPMDn6WycRdv7PE1Qgx8ySWSb5uZHD1CBdwDV03lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=W9pMlmYI; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="W9pMlmYI"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260804100540euoutp028a62b6e8ac4be14fe3c37214be537ade~IkiUh-6IK2509725097euoutp02l
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:05:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260804100540euoutp028a62b6e8ac4be14fe3c37214be537ade~IkiUh-6IK2509725097euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785837940;
	bh=KZ7812YrouTaGKtnZrRRlTGtZhtVMD2AeJWLFgwrtg0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=W9pMlmYIb9bMkRu4jfc8clgyQCFq19x84t+o1f4NNVFPNzppRlZfYm/Am//yXRobf
	 x9kobMvqpbC40iYmNByaNhNsQ9BRZb/wIs6elgt/V8N+y/3vHg7FqvqQGKBEYYvQfV
	 TVkrr7vDCeqxCNyFlCNeF2wekj6FmFNO16Y2jVcg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3~IkiUU8B6_3251632516eucas1p2x;
	Tue,  4 Aug 2026 10:05:40 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260804100539eusmtip249c88d331150984ce7acdc66a99b9818~IkiT6smw23264332643eusmtip2G;
	Tue,  4 Aug 2026 10:05:39 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] USB: mtu3: tracing: fix pointers dereferencing
Date: Tue,  4 Aug 2026 12:05:30 +0200
Message-ID: <20260804100531.88576-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3
X-EPHeader: CA
X-CMS-RootMailID: 20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3
References: <CGME20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3@eucas1p2.samsung.com>

Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
in TP_printk()") added a warning then printing an event dereferences
a pointer, because it might be already freed that time.

MTU3 driver is one of the drivers triggering this warning. Fix it by
storing also the DMA address in the event structure to avoid
dereferencing gpd_ring pointer during event printing.

Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
index 89870175d635..b24c6411a8cf 100644
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
2.43.0

