Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3A476CFB
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953084; cv=none; b=FNMp039LjxUJ2PfjujMZDkh8rgNMEKzVmKSbPV2TrhIpnr1TKGC8VxL//tfzpWz3BCLCJXJapP73XFcGM+1g0WDWCYyheSke22RP78KbyQQSc5tq5075U/yUmED+Srgxw9u16CfE93FbTaqN5B1uWl6hnrrPImpceSjFKdgv2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953084; c=relaxed/simple;
	bh=3oWb2ED0DUimXzrvzTFETa03tehzQ1fBvx/hdYY/Hnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEdidCUKGG5rtXBM1Feg3o/1ut/ZssKT6N8n7Ox4Nr+84OuWovo/WtKdFTzgt34d/oUAzwrCT97GpSONmwCQWbEjesnmUwe/1CQKnG4WtrztIF5UhJAqH3viCg5srVpjBTd2gjrbR760XA6gRxgY1AEx/29GBBWpi8m7cM1rv2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYwm80qi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvcXuUvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYwm80qi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvcXuUvb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SJddUX126158
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	edwmVF0kuFN7eYt2lxNi6cf3g1PHD1yZadeiuBsRrqE=; b=cYwm80qi8KCLUfNf
	5m2MZqR7gdlY82qnBwno5eBNPIzPc/E24eJATmxQH6OU0zlQBoDGW4L9vdet20Za
	wgaKDDrwI0L/NTx6NWGafja2AnwL1knszWdQZ8AUb8RDf4B4jMRZpvkuiN2WwxnH
	iJXzDaL+IZNlg0qbGiHyvoBm590051XsCZsW8cfLgafjLm0MGnChZgr4GgjQD1xh
	BvL41VOIieZOOKWZS59Wyhv49yzpc8B19VkgnU+IQlB96y18ZIoa6zGh7apBP3QL
	uDyAet9q1bWgUiCAUNpwGKWtkhZKd0zrWA4QAsVj8qTyXAshDqKm6J0DGhmxPng3
	Cs+/Ug==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbgpc09t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:38:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so2319745a91.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787953079; x=1788557879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edwmVF0kuFN7eYt2lxNi6cf3g1PHD1yZadeiuBsRrqE=;
        b=TvcXuUvb1wFD48HLxhpdaKKpGWgFuerxAmJ2PtGotP3VAcUpu9ChfEgnZVwWusWMEn
         coeD0Q8CAZOBrR2kl8fRUwkEhGd2FM49icxpH+XUhMPEUsiiSN6P5ldQQAuliaQ6StEE
         YKL1nVZoZBG8/K1/OaC+NuYohn8wlqU+FJR7YX2TfqLilfwVKsQLO10APneWFJ1txOTc
         9xDdEq/4Naxo5sTJS2LoApyqMaGN86ygaOpGIA6Lee3F5gJx95XUQ3fLwtCz4OaBDCle
         c3DUOs56AVb5GLIUjj/OaOBJVN5+6754Ef0BRoIjYoukhme0RftEq8XexUUFfQZls5sW
         jbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953079; x=1788557879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edwmVF0kuFN7eYt2lxNi6cf3g1PHD1yZadeiuBsRrqE=;
        b=BKANKf6weQUtZRlFR+2owdzjB9rVUrkagW7sqbECliYy4QmWCrzm1F+oLfUbHJSpdv
         QnkRSNaEASRhhsXtfRIdEUfmf/tO0+BGgcLlB3vTdkYIDSR0RUqFibOTjX5dim2CkrrB
         jRUfEWIkJwe5lUjmw/EQZPpQlJAxnrCEd2G+PsoPbBZq1D8vQvgSuf4TDEMTRSV0ecNY
         TswV+ebIXNDwimJVTly5T+uM3rMYwpUrpW/pTfmoat1mpuBSX762MxM3jkotfYQtiO6o
         OrtiKMuWNFkOTwzW3K8zGkUwgkEbxD0Qk/aWuKM4FstYXAbGQlovSarJD47RtXWfePEs
         kn8A==
X-Gm-Message-State: AFuF++nLYp8CRWk5eTy5IVRJEqSZ/2Erx//b3lgDYREUyzMJqLSuThop
	nQ38byvMwCtM/667B2p5GVrPLbKlL8BHJ8/LGT/abkBayEmgpwBIPqsWhUtCzQEQHo582rBB9p6
	4vJ5ujeR2hBn3mmZAa2dpiTxsx4UvTCMTkPaogb+3x7NaHFax+dHapaKqS8FEXcg=
X-Gm-Gg: AYBFou3fPVjh+R12+oDrFAyfKLzEiuecWiX7/N3w6I1XTyvH3Aqb5F20Nv6nd9NLi4Z
	A4pGTNHhOiRnICf1WMDX8HE/55jdXflwF5AOdx8Vg7N1JaZ01BUqGEnqPnC0UipM4+OUXIvDC8/
	3z/+w8vF0ja7SsTOL2N9MR2Hlxly92p2o/foOGDPCpZfTTrM5Jeq6MVLwQYaBMwO4RtQSaolhdA
	yTCynJnlqq76DYCG6YGy5DOtGMX3y9bgZUq2LLK7bh/489cZiw8wT5QTxdVmPSkaP7UalVWHCBp
	heWW2TX81zOiQxTpCNbVzISBWmFvwMsO0JhZj/An03gKsgXhl41BTEUVIth+gCb2ogvVuNW4huU
	iBW1nlhZp8sfLUZ9qTufcfYD55BzAj3qNXeku3y9kMQeBlOANSiGD
X-Received: by 2002:a17:90b:4cd1:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-3989bd40da3mr4340689a91.17.1787953078898;
        Fri, 28 Aug 2026 14:37:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd1:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-3989bd40da3mr4340617a91.17.1787953078337;
        Fri, 28 Aug 2026 14:37:58 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm5892112c88.11.2026.08.28.14.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:37:57 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:37:54 -0700
Subject: [PATCH v2 2/4] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-16k_offload_v1_b4-v2-2-8a46369ebbb6@oss.qualcomm.com>
References: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
In-Reply-To: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: -qIHYPCTN1KOvXkLBGUrk0wbuzEkzbNK
X-Proofpoint-GUID: -qIHYPCTN1KOvXkLBGUrk0wbuzEkzbNK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfXzsHWTy6XI9Ik
 gEaT+5I8WjnB91+Im/y0fzKOAri9/aq907lh02dsWCY8ihj2Ypvoum/XuSWJny1cMQSmjrWYl7Y
 HKhwJU4yzdxr/EWoUbrckrGAvzsbxs8=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a91ffb8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=n6KXtLIYvygRVsXyBwEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX/AJ2UEqfqT3U
 ZljmN6LJajLnnHbM8rSK4f9zgs6cR14En9I8PbdzSIdsennVbjgdvDhBL0ABhXzMqheCC+2vsVU
 vhZ+My9yHmX5pTswce2cwdeuywg3Uc+2HX+m0lDPDuF/MCGW46DCgkb1uVunr7j2VVH6vTVwS1E
 bAH3QJP+Oml30BpI6HkNEYPlsCQA0scbeCYafMPhac1hxZqMR0qrj4xe8Xbie27dZmXO/whARTC
 LJfdDDmUpunFBBRfELyDXSqQN8LTbEEUFqEBQNZTfOCebR38UdmVDJqoPrIa1hULpLnwTeL4yq7
 xd3UAh9AKkRJ7pBuJRcWwWeC8XVx5gcK7ppI9K5RiI+CVbM4bV7TOws4mIy3lZEIw722gjbjn85
 /shTjwujU8A0riWf+I3rvIHf7ypRG133wfRBc3QSyzuc5rqw5ytSHiWgLmQu3zEMJ8kvbhPCEQL
 EdFpc+xZEMt1QSgocPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280188

Ring segments are normally allocated from a shared DMA pool sized and
aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
larger PAGE_SIZE (e.g. 16K or 64K page arches), a segment can end up
at a non-page-aligned offset within its enclosing CPU page, and
multiple segments can share the same physical page.

A sideband client that maps a ring buffer directly via the IOMMU
(which operates at page granularity) needs to know exactly which
page(s) back the ring, and only pages that are actually intended to
be exposed to that client should ever be mapped this way.

Give each xhci_sideband instance its own segment_pool, allocated
separately from the core xhci->segment_pool, so every segment backing
a sideband-tagged endpoint always comes from a page that is meant to
be ADSP-visible. Normal (non-offloaded) endpoints are unaffected, as
they keep allocating from xhci->segment_pool.

Thread the pool to use through xhci_ring_alloc_from_pool(),
xhci_alloc_interrupter() and xhci_create_secondary_interrupter(), and
have xhci_endpoint_init() pick virt_dev->eps[ep_index].sideband's pool
over xhci->segment_pool when the endpoint has already been tagged by
xhci_sideband_add_endpoint(). Endpoint tagging always precedes ring
allocation, since UAC streaming endpoints aren't allocated a ring
until usb_set_interface() activates the streaming altsetting, well
after the sideband client has already tagged them.

Move EP_CTX_PER_DEV, TRBS_PER_SEGMENT and TRB_SEGMENT_SIZE into
xhci-sideband.h as the shared canonical definitions, replacing the
"FIXME defined twice" duplicate in xhci.h.

Have xhci_sideband_register() take the segment pool as an argument
instead of creating it internally, so the sideband client that
actually consumes the pool (qc_audio_offload.c) owns its full
lifetime: create it before xhci_sideband_register(), destroy it after
xhci_sideband_unregister() or a failed register call. The client picks
the DMA device the same way it already does elsewhere in that file
(interface_to_usbdev(intf)->bus->sysdev) without needing an
xhci-internal accessor for xhci->page_size.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-mem.c       | 64 +++++++++++++++++++++++++--------------
 drivers/usb/host/xhci-sideband.c  | 14 +++++++--
 drivers/usb/host/xhci.h           | 14 ++++-----
 include/linux/usb/xhci-sideband.h | 22 +++++++++++++-
 sound/usb/qcom/qc_audio_offload.c | 21 +++++++++++--
 5 files changed, 100 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..bf7eb53abab9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -15,6 +15,7 @@
 #include <linux/dmapool.h>
 #include <linux/dma-mapping.h>
 #include <linux/bitfield.h>
+#include <linux/usb/xhci-sideband.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -28,6 +29,7 @@
  * "All components of all Command and Transfer TRBs shall be initialized to '0'"
  */
 static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
+					       struct dma_pool *pool,
 					       unsigned int max_packet,
 					       unsigned int num,
 					       gfp_t flags)
@@ -40,7 +42,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	if (!seg)
 		return NULL;
 
-	seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
+	seg->trbs = dma_pool_zalloc(pool, flags, &dma);
 	if (!seg->trbs) {
 		kfree(seg);
 		return NULL;
@@ -50,7 +52,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 		seg->bounce_buf = kzalloc_node(max_packet, flags,
 					dev_to_node(dev));
 		if (!seg->bounce_buf) {
-			dma_pool_free(xhci->segment_pool, seg->trbs, dma);
+			dma_pool_free(pool, seg->trbs, dma);
 			kfree(seg);
 			return NULL;
 		}
@@ -62,10 +64,11 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	return seg;
 }
 
-static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
+static void xhci_segment_free(struct xhci_hcd *xhci, struct dma_pool *pool,
+			      struct xhci_segment *seg)
 {
 	if (seg->trbs) {
-		dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
+		dma_pool_free(pool, seg->trbs, seg->dma);
 		seg->trbs = NULL;
 	}
 	kfree(seg->bounce_buf);
@@ -81,7 +84,7 @@ static void xhci_ring_segments_free(struct xhci_hcd *xhci, struct xhci_ring *rin
 
 	while (seg) {
 		next = seg->next;
-		xhci_segment_free(xhci, seg);
+		xhci_segment_free(xhci, ring->segment_pool, seg);
 		seg = next;
 	}
 }
@@ -334,7 +337,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	struct xhci_segment *prev;
 	unsigned int num = 0;
 
-	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+	prev = xhci_segment_alloc(xhci, ring->segment_pool, ring->bounce_buf_len, num, flags);
 	if (!prev)
 		return -ENOMEM;
 	num++;
@@ -343,7 +346,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	while (num < ring->num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+		next = xhci_segment_alloc(xhci, ring->segment_pool, ring->bounce_buf_len,
+					  num, flags);
 		if (!next)
 			goto free_segments;
 
@@ -362,15 +366,10 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	return -ENOMEM;
 }
 
-/*
- * Create a new ring with zero or more segments.
- *
- * Link each segment together into a ring.
- * Set the end flag and the cycle toggle bit on the last segment.
- * See section 4.9.1 and figures 15 and 16.
- */
-struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
-				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+static struct xhci_ring *
+xhci_ring_alloc_from_pool(struct xhci_hcd *xhci, unsigned int num_segs,
+			  enum xhci_ring_type type, unsigned int max_packet,
+			  struct dma_pool *pool, gfp_t flags)
 {
 	struct xhci_ring	*ring;
 	int ret;
@@ -382,6 +381,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 
 	ring->num_segs = num_segs;
 	ring->bounce_buf_len = max_packet;
+	ring->segment_pool = pool;
 	INIT_LIST_HEAD(&ring->td_list);
 	ring->type = type;
 	if (num_segs == 0)
@@ -398,6 +398,20 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 	return NULL;
 }
 
+/*
+ * Create a new ring with zero or more segments.
+ *
+ * Link each segment together into a ring.
+ * Set the end flag and the cycle toggle bit on the last segment.
+ * See section 4.9.1 and figures 15 and 16.
+ */
+struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
+				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+{
+	return xhci_ring_alloc_from_pool(xhci, num_segs, type, max_packet,
+					 xhci->segment_pool, flags);
+}
+
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		unsigned int ep_index)
@@ -422,6 +436,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	new_ring.num_segs = num_new_segs;
 	new_ring.bounce_buf_len = ring->bounce_buf_len;
 	new_ring.type = ring->type;
+	new_ring.segment_pool = ring->segment_pool;
 	ret = xhci_alloc_segments_for_ring(xhci, &new_ring, flags);
 	if (ret)
 		return -ENOMEM;
@@ -1424,6 +1439,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	unsigned int mult;
 	unsigned int avg_trb_len;
 	unsigned int err_count = 0;
+	struct dma_pool *pool;
 
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
@@ -1487,8 +1503,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 		avg_trb_len = 8;
 
 	/* Set up the endpoint ring */
+	pool = virt_dev->eps[ep_index].sideband ?
+	       virt_dev->eps[ep_index].sideband->segment_pool : xhci->segment_pool;
 	virt_dev->eps[ep_index].new_ring =
-		xhci_ring_alloc(xhci, 2, ring_type, max_packet, mem_flags);
+		xhci_ring_alloc_from_pool(xhci, 2, ring_type, max_packet, pool, mem_flags);
 	if (!virt_dev->eps[ep_index].new_ring)
 		return -ENOMEM;
 
@@ -2291,7 +2309,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 }
 
 static struct xhci_interrupter *
-xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
+xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs,
+		       struct dma_pool *pool, gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
@@ -2308,7 +2327,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!ir)
 		return NULL;
 
-	ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
+	ir->event_ring = xhci_ring_alloc_from_pool(xhci, segs, TYPE_EVENT, 0, pool, flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2356,7 +2375,8 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num)
+				  struct dma_pool *pool, u32 imod_interval,
+				  unsigned int intr_num)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2367,7 +2387,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	    intr_num >= xhci->max_interrupters)
 		return NULL;
 
-	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
+	ir = xhci_alloc_interrupter(xhci, segs, pool, GFP_KERNEL);
 	if (!ir)
 		return NULL;
 
@@ -2498,7 +2518,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters)
 		goto fail;
 
-	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
+	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, xhci->segment_pool, flags);
 	if (!xhci->interrupters[0])
 		goto fail;
 
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 1585c47720e0..ec7d3859771c 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -10,6 +10,7 @@
 
 #include <linux/usb/xhci-sideband.h>
 #include <linux/dma-direct.h>
+#include <linux/dmapool.h>
 
 #include "xhci.h"
 
@@ -342,8 +343,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		return -EBUSY;
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg, imod_interval,
-						   intr_num);
+						   num_seg, sb->segment_pool,
+						   imod_interval, intr_num);
 	if (!sb->ir)
 		return -ENOMEM;
 
@@ -397,6 +398,11 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
 /**
  * xhci_sideband_register - register a sideband for a usb device
  * @intf: usb interface associated with the sideband device
+ * @type: xHCI sideband type
+ * @segment_pool: dma pool for sideband ring segments, created and owned by
+ *                the caller. The caller must destroy it after calling
+ *                xhci_sideband_unregister().
+ * @notify_client: callback for xHCI sideband sequences
  *
  * Allows for clients to utilize XHCI interrupters and fetch transfer and event
  * ring parameters for executing data transfers.
@@ -405,6 +411,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
  */
 struct xhci_sideband *
 xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
+		       struct dma_pool *segment_pool,
 		       int (*notify_client)(struct usb_interface *intf,
 				    struct xhci_sideband_event *evt))
 {
@@ -426,6 +433,8 @@ xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
 	if (!sb)
 		return NULL;
 
+	sb->segment_pool = segment_pool;
+
 	mutex_init(&sb->mutex);
 
 	/* check this device isn't already controlled via sideband */
@@ -450,6 +459,7 @@ xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
 
 	spin_unlock_irq(&xhci->lock);
 
+
 	return sb;
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_register);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..c91cba16abea 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -19,6 +19,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
+#include <linux/usb/xhci-sideband.h>
 
 /* Code sharing between pci-quirks and xhci hcd */
 #include	"xhci-ext-caps.h"
@@ -738,8 +739,6 @@ struct xhci_interval_bw_table {
 	unsigned int		ss_bw_out;
 };
 
-#define EP_CTX_PER_DEV		31
-
 struct xhci_virt_device {
 	int				slot_id;
 	struct usb_device		*udev;
@@ -1253,14 +1252,11 @@ static inline const char *xhci_trb_type_string(u8 type)
 #define NEC_FW_MAJOR(p)		(((p) >> 8) & 0xff)
 
 /*
- * TRBS_PER_SEGMENT must be a multiple of 4,
- * since the command ring is 64-byte aligned.
- * It must also be greater than 16.
+ * TRBS_PER_SEGMENT and TRB_SEGMENT_SIZE are defined in
+ * <linux/usb/xhci-sideband.h>, shared with sideband client drivers.
  */
-#define TRBS_PER_SEGMENT	256
 /* Allow two commands + a link TRB, along with any reserved command TRBs */
 #define MAX_RSVD_CMD_TRBS	(TRBS_PER_SEGMENT - 3)
-#define TRB_SEGMENT_SIZE	(TRBS_PER_SEGMENT*16)
 #define TRB_SEGMENT_SHIFT	(ilog2(TRB_SEGMENT_SIZE))
 /* TRB buffer pointers can't cross 64KB boundaries */
 #define TRB_MAX_BUFF_SHIFT		16
@@ -1380,6 +1376,7 @@ struct xhci_ring {
 	enum xhci_ring_type	type;
 	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
+	struct dma_pool	*segment_pool;
 };
 
 struct xhci_erst_entry {
@@ -1865,7 +1862,8 @@ void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num);
+				  struct dma_pool *pool, u32 imod_interval,
+				  unsigned int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 005257085dcb..338146674a88 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -13,7 +13,19 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
-#define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
+/*
+ * Constants shared with the xHCI host driver (drivers/usb/host/xhci.h),
+ * which includes this header for its canonical definitions.
+ */
+#define EP_CTX_PER_DEV      31
+
+/*
+ * TRBS_PER_SEGMENT must be a multiple of 4,
+ * since the command ring is 64-byte aligned.
+ * It must also be greater than 16.
+ */
+#define TRBS_PER_SEGMENT    256
+#define TRB_SEGMENT_SIZE    (TRBS_PER_SEGMENT * 16)
 
 struct xhci_sideband;
 
@@ -59,6 +71,13 @@ struct xhci_sideband {
 	/* Synchronizing xHCI sideband operations with client drivers operations */
 	struct mutex			mutex;
 
+	/*
+	 * Separate sideband segment pool for sideband rings, supplied by and
+	 * owned by the sideband client: created before xhci_sideband_register()
+	 * and destroyed after xhci_sideband_unregister().
+	 */
+	struct dma_pool	*segment_pool;
+
 	struct usb_interface		*intf;
 	int (*notify_client)(struct usb_interface *intf,
 			     struct xhci_sideband_event *evt);
@@ -66,6 +85,7 @@ struct xhci_sideband {
 
 struct xhci_sideband *
 xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
+		       struct dma_pool *segment_pool,
 		       int (*notify_client)(struct usb_interface *intf,
 				    struct xhci_sideband_event *evt));
 void
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..1b8877b8ee62 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -7,6 +7,7 @@
 #include <linux/ctype.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-map-ops.h>
+#include <linux/dmapool.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
@@ -1786,6 +1787,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	struct usb_interface_descriptor *altsd;
 	struct usb_host_interface *alts;
 	struct snd_soc_usb_device *sdev;
+	struct dma_pool *segment_pool;
 	struct xhci_sideband *sb;
 
 	/*
@@ -1804,10 +1806,19 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		if (!sdev)
 			return;
 
-		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
+		segment_pool = dma_pool_create("xHCI sideband ring segments",
+						interface_to_usbdev(intf)->bus->sysdev,
+						TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
+						TRB_SEGMENT_SIZE);
+		if (!segment_pool)
+			goto free_sdev;
+
+		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool,
 					    uaudio_sideband_notifier);
-		if (!sb)
+		if (!sb) {
+			dma_pool_destroy(segment_pool);
 			goto free_sdev;
+		}
 	} else {
 		sb = uadev[chip->card->number].sb;
 		sdev = uadev[chip->card->number].sdev;
@@ -1844,7 +1855,9 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	return;
 
 unreg_xhci:
+	segment_pool = sb->segment_pool;
 	xhci_sideband_unregister(sb);
+	dma_pool_destroy(segment_pool);
 	uadev[chip->card->number].sb = NULL;
 free_sdev:
 	kfree(sdev);
@@ -1905,8 +1918,12 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
 	 * This is to accommodate for devices w/ multiple UAC functions.
 	 */
 	if (chip->num_interfaces == 1) {
+		struct dma_pool *segment_pool = dev->sb->segment_pool;
+
 		snd_soc_usb_disconnect(uaudio_qdev->auxdev->dev.parent, dev->sdev);
 		xhci_sideband_unregister(dev->sb);
+		dma_pool_destroy(segment_pool);
+		dev->sb = NULL;
 		dev->chip = NULL;
 		kfree(dev->sdev->ppcm_idx);
 		kfree(dev->sdev);

-- 
2.34.1

