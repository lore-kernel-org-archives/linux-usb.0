Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8980930569A
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787623627; cv=none; b=AnGX4vSrTNa1rkhlv1WUXmPz24KAcNXy1gey4dISgK436faz74vHnUPZboLxlPx3Jw9h+q9bE4FJhhaI94aTCPVtacftsiAJ6U6arU9uvfS1gkYT99UfwBZI1D9sDlzgycRiNsHF+rVFUYDBPJCHi9Yy2cpH2NI42F4H5hWJWKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787623627; c=relaxed/simple;
	bh=IZhmY8lAjfPFB+VNxnCYr/qjCC7hbRpe/+XO+aXiA+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDEyhQTan4hOgvqDSsAcQ2bE6r+/GLwSYlgQk+pzaJcMm1hXvZsjAe4ckUzil4dWwwZb+n9joK4/aQICCahoafnljbT35THRVDsApdzgBxi2UHomzPphjMjpXHhfzKmK2KIHYnjCr/HYnTtSn63Wwdq6kyNyfHhq+EYyiu3VlTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGUH3t3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3FsvbpE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGUH3t3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3FsvbpE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONLaAo1239986
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2iYO/r/HmJr9Cxtr5ffY+0uSqlQMOAULDrmT9AVeec=; b=AGUH3t3JO4IRoCDd
	RhORHKQ8HVzrWkXjMOgrHRC5fiafMpvT1M/G/A+udp3sVxCE6D/bSKEqr1xGDF8F
	4kEiPNjuhJ0LlcWpbBXMODU0hXh0XxLS4T3sy1TRowb0DHxHOwp5VED5R7t8AVI6
	YzYK05ywgCXCfxfoO2vQXINWfBMi/FGcw3pCpRqFC8BTHWjCrelbDNUoA/c77FQP
	YugnYqcddqNMEb1E3gxiwhRWQ/DlLQf1MgLJXJL2BUudA8c3trt3jfVbc8wcl43Q
	FkzyAxvE2vraP9fNGPiU+lL9SYgV01uyli+fdO1P2TUCKihQFSfK0Rgf6hOxEEPi
	a+R+fw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swr9r14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso3978294a12.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 19:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787623622; x=1788228422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2iYO/r/HmJr9Cxtr5ffY+0uSqlQMOAULDrmT9AVeec=;
        b=T3FsvbpE407LxbGwLrZ8yHGe28ZusyfVsQkPTiZnS6m4oY9OW8QBPKY61+XdpOI6DY
         EobcV5AFW3yFFVmy6VsDQaFmZ2AGpQGP+Lubq0LEdbIdeqiwvhxmJL3Hp8JZBKmrrcUG
         T6wSvfyFZiH+j6rT9P4CnTr2NcduBql/Oow8LILPRgBo5EtNVopiyGSOUnRXlk8VcPTc
         SeF9oHu+NIc+vFCrqEMuolxxWUfAYzvPN1BPqPguRlFqpCZ89tfDOCJ2ViaqXmC5TORZ
         a0NUU6L2PXJPynzUyYPFYGOYPv0zLIAWpO/Ilax1e9P89VBqk0OZe9IcgrK9PmrIBC5q
         oobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787623622; x=1788228422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2iYO/r/HmJr9Cxtr5ffY+0uSqlQMOAULDrmT9AVeec=;
        b=YQ6jP2UH34dBA1rpl80oWMp9J17YvDj5ZP6yXWDdrxCOzVFo35g+sI+ZQPAlr0fAGx
         oWBI+T8HCOCdbD8d1cpGUrFTtX5OroAAiJPwrd3v1tJgYJMoWXifg803fVzSssNE0Zm0
         Ih3QXlEg2XcAW2N/IpBlCC9A7QfelvloPJHalJ4OEZgt9uc/cXI+kHMGm5QmbRLRd8Cq
         UFO17ZEefGSnOh5g2ibLnuSLgB3O/XvECU4dWfdCUTy38kmSfBSgNhSFRe6nUZjBk0YU
         YzQiIOdQAkh7qZDtBfMQpjIjeVJXi+AV4R0sj39tutAuCQkHRrjt7GBQWWlmH7AAbPhW
         kDZg==
X-Gm-Message-State: AFuF++lF8ftbIRkmLyNSfeHziS+xl717M99roffBRdZ4uxqPRgxl0kN0
	cr6t3Y6xIj0n57qW2awm5joFukvPjf4LO1Je/N/vMVetOHQZABXmR6H2Q9EIEMqUi7/wVvMEvaP
	F5xZrBEo9D90AwfcXNQpcKqS8YBOjT51lJVhHRG9zNU2OYEaaCYmeh3TBRvjuiQzthR+mePU=
X-Gm-Gg: AR+sD11MbIWwk2nsiHlF3wKPNgLfv+KsNtwh6LPnphXOzYNz3oVRGpVpMCUrTkntue/
	VZkBNHtmRZFZPU3lRfrcdulTLAxawmLk73sj17YWwknsbSLy1M49yQSbS8FlUXPcTV+pq+UXLB/
	E3lnD/rN34LrwznZa2gqsT7lvCN6gWcaI0dCCrd9nFZPuFnDSgehnI5cnlzlYtMNHQeKCWn5TRn
	2dSeTZFLoGKs9Y4i1D5a81MAeF0tdEo4Oet/DOEM/5w5fenjYFIdSkRNIXWtWfvrspWQmqJ65Om
	MO1ItFt4Y0gPVW7zGkO+9CfVgUxFI4MygNJWPuyhsdqd+bxukLFBzisarkFUQxZx23Ek4J0d6QD
	Ef1x7E/CWiTz/l8iNy8NVwkmWprKhBcbK3vdwlVyphX9DykXpTxhC
X-Received: by 2002:a05:6a20:6f8f:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3cd911bf820mr6335031637.11.1787623622233;
        Mon, 24 Aug 2026 19:07:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8f:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3cd911bf820mr6334918637.11.1787623621734;
        Mon, 24 Aug 2026 19:07:01 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d33dcsm39442376eec.18.2026.08.24.19.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 19:06:59 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:06:55 -0700
Subject: [PATCH 1/2] xhci: sideband: support page-aligned ring segment
 allocation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-16k_offload_v1_b4-v1-1-49a6be60ca30@oss.qualcomm.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
In-Reply-To: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: eJcFBgtRgr-2iCzdVZSVqObqYkJI772b
X-Proofpoint-GUID: eJcFBgtRgr-2iCzdVZSVqObqYkJI772b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxNiBTYWx0ZWRfX4K7/yBZD2TCY
 /LpeN5HQFGjpQgQYb8Z21OSmOL2wWFBUaaHvYA6AAekmxd6TI9R7foc3L9184PKs+OyFlFtzEWL
 54gbJy9bUQvQIExIenKAKdDFOyta/rY=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8cf8c8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RFEkg1aCLAsbH47RIloA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxNiBTYWx0ZWRfX5opNI+Mu9s3d
 GgINaFePaUMYbOJVWM/xjdCx7RwIxbEM02gPvJfV9TAR0GBydV2vtU/xGv6Pdr+t0BK/V0x/LPd
 79oLSVUs0DYenRsanO/bwbvN9h+UfTwAJR2dmDaG0DWGYkMWpQskQeOovIYjRu+Fi43jkKdSMdR
 BpOAmauvCXZsP7WCsqNlVaBo5AT7xWbPKU3GL9sXJFZQSN2s7lAOHJn05tgRIcm4LQzelkfDT+2
 iFG6SPv5qmRT7MFvstuyANEGISRe8NDxGAFPgBexS/EffCxttXWBndJXp4Mc90iScT79nfCet5f
 sypgprMjFRbKvS0V3Vethe2hq7rxBF8rkXrtpoMg30flzsp4vcw3repI4ZtmlZdLeiZOMsB5n1A
 ATjQn/bBs4Q/R+tjUYlJhUeEx4oR1egY8075yXhjjqr3MZZz/bWwU0v2M8M22nuZn/0UU3ePjLk
 58W4jCzitFXzDNTBzSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250016

Ring segments are normally allocated from a shared DMA pool sized and
aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
larger PAGE_SIZE (e.g. 16K or 64K page arches), a segment can end up
at a non-page-aligned offset within its enclosing CPU page.

A sideband client that maps a ring buffer directly via the IOMMU
(which operates at page granularity) needs the ring to start at a
page boundary and occupy whole pages, otherwise the IOVA it is given
does not correspond to the actual start of the ring.

Add an alignment_req parameter to the ring/segment allocation path
(xhci_ring_alloc(), xhci_segment_alloc(), xhci_endpoint_init(),
xhci_alloc_interrupter(), xhci_create_secondary_interrupter()) and to
the sideband API (xhci_sideband_add_endpoint(),
xhci_sideband_create_interrupter()) so a sideband client can request
a specific alignment for its endpoint ring and interrupter event
ring. When the requested alignment exceeds TRB_SEGMENT_SIZE, allocate
the segment directly with dma_alloc_coherent() at that size instead of
from the shared pool. Store the alignment requirement on struct
xhci_ring so later segments added via ring expansion keep the same
alignment for the life of the ring.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-mem.c       | 70 ++++++++++++++++++++++++++++-----------
 drivers/usb/host/xhci-sideband.c  |  9 +++--
 drivers/usb/host/xhci.h           | 11 ++++--
 include/linux/usb/xhci-sideband.h |  7 ++--
 4 files changed, 70 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..5f09b36c127b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -15,6 +15,7 @@
 #include <linux/dmapool.h>
 #include <linux/dma-mapping.h>
 #include <linux/bitfield.h>
+#include <linux/usb/xhci-sideband.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -30,6 +31,7 @@
 static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 					       unsigned int max_packet,
 					       unsigned int num,
+					       unsigned int alignment_req,
 					       gfp_t flags)
 {
 	struct xhci_segment *seg;
@@ -40,7 +42,14 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	if (!seg)
 		return NULL;
 
-	seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
+	if (alignment_req > TRB_SEGMENT_SIZE) {
+		seg->trbs = dma_alloc_coherent(dev, alignment_req, &dma, flags);
+		if (seg->trbs)
+			seg->alloc_size = alignment_req;
+	} else {
+		seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
+	}
+
 	if (!seg->trbs) {
 		kfree(seg);
 		return NULL;
@@ -50,7 +59,10 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 		seg->bounce_buf = kzalloc_node(max_packet, flags,
 					dev_to_node(dev));
 		if (!seg->bounce_buf) {
-			dma_pool_free(xhci->segment_pool, seg->trbs, dma);
+			if (seg->alloc_size)
+				dma_free_coherent(dev, seg->alloc_size, seg->trbs, dma);
+			else
+				dma_pool_free(xhci->segment_pool, seg->trbs, dma);
 			kfree(seg);
 			return NULL;
 		}
@@ -65,7 +77,11 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
 {
 	if (seg->trbs) {
-		dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
+		if (seg->alloc_size)
+			dma_free_coherent(xhci_to_hcd(xhci)->self.sysdev,
+					  seg->alloc_size, seg->trbs, seg->dma);
+		else
+			dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
 		seg->trbs = NULL;
 	}
 	kfree(seg->bounce_buf);
@@ -334,7 +350,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	struct xhci_segment *prev;
 	unsigned int num = 0;
 
-	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, ring->alignment_req, flags);
 	if (!prev)
 		return -ENOMEM;
 	num++;
@@ -343,7 +359,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	while (num < ring->num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num,
+					  ring->alignment_req, flags);
 		if (!next)
 			goto free_segments;
 
@@ -370,7 +387,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
  * See section 4.9.1 and figures 15 and 16.
  */
 struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
-				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+				  enum xhci_ring_type type, unsigned int max_packet,
+				  unsigned int alignment_req, gfp_t flags)
 {
 	struct xhci_ring	*ring;
 	int ret;
@@ -382,6 +400,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 
 	ring->num_segs = num_segs;
 	ring->bounce_buf_len = max_packet;
+	ring->alignment_req = alignment_req;
 	INIT_LIST_HEAD(&ring->td_list);
 	ring->type = type;
 	if (num_segs == 0)
@@ -421,6 +440,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 
 	new_ring.num_segs = num_new_segs;
 	new_ring.bounce_buf_len = ring->bounce_buf_len;
+	new_ring.alignment_req = ring->alignment_req;
 	new_ring.type = ring->type;
 	ret = xhci_alloc_segments_for_ring(xhci, &new_ring, flags);
 	if (ret)
@@ -663,7 +683,7 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 
 	for (cur_stream = 1; cur_stream < num_streams; cur_stream++) {
 		stream_info->stream_rings[cur_stream] =
-			xhci_ring_alloc(xhci, 2, TYPE_STREAM, max_packet, mem_flags);
+			xhci_ring_alloc(xhci, 2, TYPE_STREAM, max_packet, 0, mem_flags);
 		cur_ring = stream_info->stream_rings[cur_stream];
 		if (!cur_ring)
 			goto cleanup_rings;
@@ -1007,7 +1027,7 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	}
 
 	/* Allocate endpoint 0 ring */
-	dev->eps[0].ring = xhci_ring_alloc(xhci, 2, TYPE_CTRL, 0, flags);
+	dev->eps[0].ring = xhci_ring_alloc(xhci, 2, TYPE_CTRL, 0, 0, flags);
 	if (!dev->eps[0].ring)
 		goto fail;
 
@@ -1486,11 +1506,20 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	if (usb_endpoint_xfer_control(&ep->desc) && xhci->hci_version >= 0x100)
 		avg_trb_len = 8;
 
-	/* Set up the endpoint ring */
-	virt_dev->eps[ep_index].new_ring =
-		xhci_ring_alloc(xhci, 2, ring_type, max_packet, mem_flags);
-	if (!virt_dev->eps[ep_index].new_ring)
-		return -ENOMEM;
+	if (virt_dev->eps[ep_index].sideband && virt_dev->eps[ep_index].sideband->alignment_req) {
+		virt_dev->eps[ep_index].new_ring =
+			xhci_ring_alloc(xhci, 2, ring_type, max_packet,
+					virt_dev->eps[ep_index].sideband->alignment_req,
+					mem_flags);
+		if (!virt_dev->eps[ep_index].new_ring)
+			return -ENOMEM;
+	} else {
+		/* Set up the endpoint ring */
+		virt_dev->eps[ep_index].new_ring =
+			xhci_ring_alloc(xhci, 2, ring_type, max_packet, 0, mem_flags);
+		if (!virt_dev->eps[ep_index].new_ring)
+			return -ENOMEM;
+	}
 
 	virt_dev->eps[ep_index].skip = false;
 	virt_dev->eps[ep_index].next_uframe = -1;
@@ -2291,7 +2320,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 }
 
 static struct xhci_interrupter *
-xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
+xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs,
+		       unsigned int alignment_req, gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
@@ -2307,8 +2337,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
 	if (!ir)
 		return NULL;
-
-	ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
+	ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, alignment_req, flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2356,7 +2385,8 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num)
+				  u32 imod_interval, unsigned int intr_num,
+				  unsigned int alignment_req)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2367,7 +2397,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	    intr_num >= xhci->max_interrupters)
 		return NULL;
 
-	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
+	ir = xhci_alloc_interrupter(xhci, segs, alignment_req, GFP_KERNEL);
 	if (!ir)
 		return NULL;
 
@@ -2485,7 +2515,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 
 	/* Set up the command ring to have one segments for now. */
-	xhci->cmd_ring = xhci_ring_alloc(xhci, 1, TYPE_COMMAND, 0, flags);
+	xhci->cmd_ring = xhci_ring_alloc(xhci, 1, TYPE_COMMAND, 0, 0, flags);
 	if (!xhci->cmd_ring)
 		goto fail;
 
@@ -2498,7 +2528,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters)
 		goto fail;
 
-	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
+	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, 0, flags);
 	if (!xhci->interrupters[0])
 		goto fail;
 
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..471219d7d86d 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -144,7 +144,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
  */
 int
 xhci_sideband_add_endpoint(struct xhci_sideband *sb,
-			   struct usb_host_endpoint *host_ep)
+			   struct usb_host_endpoint *host_ep,
+			   unsigned int alignment_req)
 {
 	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
@@ -171,6 +172,7 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 	if (sb->eps[ep_index] || ep->sideband)
 		return -EBUSY;
 
+	sb->alignment_req = alignment_req;
 	ep->sideband = sb;
 	sb->eps[ep_index] = ep;
 
@@ -322,7 +324,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
  */
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear, u32 imod_interval, int intr_num)
+				 bool ip_autoclear, u32 imod_interval, int intr_num,
+				 unsigned int alignment_req)
 {
 	if (!sb || !sb->xhci)
 		return -ENODEV;
@@ -337,7 +340,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
 						   num_seg, imod_interval,
-						   intr_num);
+						   intr_num, alignment_req);
 	if (!sb->ir)
 		return -ENOMEM;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..e356405c6351 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1290,6 +1290,10 @@ struct xhci_segment {
 	void			*bounce_buf;
 	unsigned int		bounce_offs;
 	unsigned int		bounce_len;
+	/* nonzero if trbs was allocated via dma_alloc_coherent() at this size,
+	 * instead of from xhci->segment_pool
+	 */
+	unsigned int		alloc_size;
 };
 
 enum xhci_cancelled_td_status {
@@ -1377,6 +1381,7 @@ struct xhci_ring {
 	unsigned int		stream_id;
 	unsigned int		num_segs;
 	unsigned int		bounce_buf_len;
+	unsigned int		alignment_req;
 	enum xhci_ring_type	type;
 	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
@@ -1823,7 +1828,8 @@ int xhci_endpoint_init(struct xhci_hcd *xhci, struct xhci_virt_device *virt_dev,
 		struct usb_device *udev, struct usb_host_endpoint *ep,
 		gfp_t mem_flags);
 struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
-		enum xhci_ring_type type, unsigned int max_packet, gfp_t flags);
+		enum xhci_ring_type type, unsigned int max_packet,
+		unsigned int alignment_req, gfp_t flags);
 void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring);
 int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		unsigned int num_trbs, gfp_t flags);
@@ -1865,7 +1871,8 @@ void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num);
+				  u32 imod_interval, unsigned int intr_num,
+				  unsigned int alignment_req);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 005257085dcb..8ab4e1cb0fc6 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -62,6 +62,7 @@ struct xhci_sideband {
 	struct usb_interface		*intf;
 	int (*notify_client)(struct usb_interface *intf,
 			     struct xhci_sideband_event *evt);
+	unsigned int			alignment_req;
 };
 
 struct xhci_sideband *
@@ -72,7 +73,8 @@ void
 xhci_sideband_unregister(struct xhci_sideband *sb);
 int
 xhci_sideband_add_endpoint(struct xhci_sideband *sb,
-			   struct usb_host_endpoint *host_ep);
+			   struct usb_host_endpoint *host_ep,
+			   unsigned int alignment_req);
 int
 xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
 			      struct usb_host_endpoint *host_ep);
@@ -94,7 +96,8 @@ static inline bool xhci_sideband_check(struct usb_hcd *hcd)
 
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear, u32 imod_interval, int intr_num);
+				 bool ip_autoclear, u32 imod_interval, int intr_num,
+				 unsigned int alignment_req);
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
 int

-- 
2.34.1

