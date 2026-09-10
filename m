Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED9136B07E
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005070; cv=none; b=JPOoEYbD1tFEmBEalVuuwU/lTlmW64GH6PjJ5s2TL3gITfxPC/Gugzyz1HoNWFVDf0iOOwwTwg/WPC3KvY19SZiuzkRl1/LJEgjyjDYUvFJkulHaOCi7zOnh8OprmU/D+kNTHdVlEbYs9OJ4Ji1bYhfaMylRi2hMlorSlYLSaX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005070; c=relaxed/simple;
	bh=YezSN2ajFgZ5BhO6JiinsBMA1oRGhgbu29Z0ApFTkJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qo62nJ3AkxW7bW4/ImpXN50fr8AGrfrHVRuo3uEgGGHz1NEiO9BUtRpUz7UdixTHZird5hZ32z2hMpTJ8DD0Nfw1ylx4hXUEe2CjrNYPYUFzYnLZcwQ7tNZPjx7NYp6ES/XkiE12GIezHgERiVrJbMG+lZPgv0zGjjU/tk3LRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHdBkrRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrjTizf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHdBkrRL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrjTizf8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1l9Ji651694
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJT8o863eEHoJK98pu1Vs+VG+YrADer7sNUuCodL15M=; b=lHdBkrRLDdqSrI2R
	M4Xf36muJ0oNcSAz/2TRFVS/LJZWdPqa4maZ/10CiyrF6/gXSLrKLETvwai0uwMt
	kUjF5roCax8kJTj5vzdu3pp6+2OirSLhXwi6IgqhvmfatBrKjs/0A3Dvd561U0ZR
	YovF/Z9+N8qt55tZOze7XdagEWJ5pGr3eJ3BPn0ZnGArnLnUSfvpzx3sGsn9LSIV
	ktElPn5xQauSzITCqrQuHav3AMkPj9XJdFmp695ArHwIuauGMu6l0PcoZ2xU7vTl
	/P2wlGUFKUKyoDVOB9A9/tE2rAFL01tnYU+Y8GWju2A64GEeUxVcmJ3kYK5ZHcg6
	67PwEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyh9ger-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso91224065ad.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 18:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005067; x=1789609867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJT8o863eEHoJK98pu1Vs+VG+YrADer7sNUuCodL15M=;
        b=VrjTizf8j23TsvXENNpsM+vBoWjMLTHD0tEOsl4K3b7xOLiQ2H540xKTTtVBOf4ylH
         IAMraMTxNkEz1rhK6nesfkfbcmyLiB8YCdds/KTmP+PcbidwfWtCnGSn8J5eQ0c0oP20
         ULeJ0z19PANPR90bLJ2acC546CN2f3ZapmzLqlpda/9GQK2P7xjfDDBsuwtqtSHvG0vu
         4gaK2jdtFK3wZgZ6GvRK7mQgX67VRY6BbBYDZPNjgr0xcwjow6m5REIzZ03TcrFDY2QB
         kjzqaP9Vep+bUc+UcP1y7ilBa7rvXam8VfsVeiKx5HoNX/bzAHwFoH0tNHfoRdRl6TqW
         7F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005067; x=1789609867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJT8o863eEHoJK98pu1Vs+VG+YrADer7sNUuCodL15M=;
        b=QmGtDRtl++jlp/Y4u5lyzSqoylN3xNcJTmzywloLs3JXHCpYlxHfBZVZBsjt05Zasl
         XeUUY0FrGypbSB7lw5Qm7kn/VX8uRLGgNYnk1TLJjp4EZUq7dEoJeqY4xDZnD0C+kafy
         5twMWmR667PgmzlS7lycyts83nMQWHQawkrhfCjXanZBJaa+UkOkdb63abz4MXjArGsg
         fKqQa80UKPfynBYe53DUckWy74umQ4vL/y52Z4NODldlGyVnZxk3e1DL3rDJRxkBKAJZ
         WXM4VxDVilpyo2uXHlgmsJUPV97ui8QA4VBuQKfAGNdQyjwGN12FBuEiPoKhtUdTvlCc
         2d4Q==
X-Gm-Message-State: AFuF++kP32CDlG0QwMMouZ0YAKOJLNii8vvEC68/khEixjZfptr+35dp
	54bzBDNHhnZ7zA0F2jBApZDZe2RM66jEZVQF+Xg6QQxFIwYxGA9uAfAX88p5ow/JRCZVtMLE3Ms
	8MBBxOIHtk/w9Yh7OotgwKcKM7oSCd7G+6h613ofLJ50LKUAmy8skZUcUUXWhbQH6Qwmaroc=
X-Gm-Gg: AYBFou17cs/VuCB8BiAxYwteCL+BLegWqZsegA1qfa5qZVUme0wecR9Gpob6Ui1/onV
	tvKpiM02Xdi1vuluXNmW+pZ0faoL96lcI0vQxn1s6WskrvJeiVtflQTn4u8DhGgJg3BUEXW8a7U
	S7qZPRXIJA4x9EyMJegkRRaG0DR9xUMag/pIihgBS7RObV8aOQDK0qMnQ72diN6yBXOAtf56JdJ
	wAYX/HJW4awcgLOqI6Os9yMTGc4pzaD00K0J6CtGKKwBDHa2UYb1w/HS9FT0fgOfYeKUyeANhXk
	kUaYFX+f5VejBo5GsyI3X5ziJ+2SxnBrn1R9sV6tUPBcVarlfpiFOPyGScZSPU20NZ8G7eIVa5H
	KdFh2pD2ftOzm/bEVp4YzJVLhLymDI8D+R93iXkPipoJYBDHzYDmC
X-Received: by 2002:a17:902:cf10:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2db126669d3mr560843325ad.15.1789005067292;
        Wed, 09 Sep 2026 18:51:07 -0700 (PDT)
X-Received: by 2002:a17:902:cf10:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2db126669d3mr560842685ad.15.1789005066790;
        Wed, 09 Sep 2026 18:51:06 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:05 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 18:50:58 -0700
Subject: [PATCH v4 2/5] usb: xhci: Allow to specify a different segment
 pool for allocations
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-16k_offload_v1_b4-v4-2-f24a86617597@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
In-Reply-To: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX/R7eCCZu/IXA
 xPRydcGy9WvEj/fk65F+7w4552oDogOkFim/U6IdsnYyOyI6aIvvClsJBp1/EgD/vvjCAyKWaix
 jUPCpjCWRGoPON9IKbnt62Vo+/ey4lorjjieieQgj3QRhfjhSu9mICtTn6wPL9Yxny8gowPRsT8
 HwnDzJ7QWOc29TDflm0TDhmSAu0LUzHmPlaeyybCaFxJSUO+wMZvTlidRS/u6XBgT3pR+Fzg+Jo
 MYmWV7f3vekUhkvtadx2nifch+mtIycJ7R8HcqiQecFi5hFz1Rebfk/OlRgStLZA6IzIMvhfaoi
 qz87e5NVq53Tj2Yq+JE28BY3wow0pyxMhVZlB3nZZgZjv1zirtL9KmSjjUCF7WDQSC5haKIGhZt
 jmrXi1pzSIuJZ1QTrD33trhTp/1ZTNARhQLfFmMGri1ff5L6cjCEITc9x3i1dgl23qf70yvOfY+
 G7pLTLFqvjhGUMj01nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfXxdhgm7tAmUQM
 5bQcNx8ywKOPE4JJ5eSaGtVikzCUPMBtEsTI1WjMjh7lcE04vN57yTbMkcBKj6xXZ/0XJMtJqpv
 /6Ea1ILqRD00Wl+edlb51Ka9x9WmLb8=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa20d0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qt4-_lkRHfeKUwQPRJsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hsqAxcE7Ugm1FJQI_aRvM8L35wu1Ocqb
X-Proofpoint-GUID: hsqAxcE7Ugm1FJQI_aRvM8L35wu1Ocqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100018

Ring segments are normally allocated from a shared DMA pool sized and
aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
larger PAGE_SIZE (e.g. 16K or 64K page arches), a segment can end up
at a non-page-aligned offset within its enclosing CPU page, and
multiple segments can share the same physical page.

Modify existing xHCI allocation operations to accommodate for a separate
DMA pool for segment allocations.  This will safely partition ownership
of segments between Linux xHCI and offload entities.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-mem.c      | 63 ++++++++++++++++++++++++++--------------
 drivers/usb/host/xhci-sideband.c |  4 +--
 drivers/usb/host/xhci.h          |  6 +++-
 3 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..6e52cefd6619 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -28,6 +28,7 @@
  * "All components of all Command and Transfer TRBs shall be initialized to '0'"
  */
 static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
+					       struct dma_pool *pool,
 					       unsigned int max_packet,
 					       unsigned int num,
 					       gfp_t flags)
@@ -40,7 +41,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	if (!seg)
 		return NULL;
 
-	seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
+	seg->trbs = dma_pool_zalloc(pool, flags, &dma);
 	if (!seg->trbs) {
 		kfree(seg);
 		return NULL;
@@ -50,7 +51,7 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 		seg->bounce_buf = kzalloc_node(max_packet, flags,
 					dev_to_node(dev));
 		if (!seg->bounce_buf) {
-			dma_pool_free(xhci->segment_pool, seg->trbs, dma);
+			dma_pool_free(pool, seg->trbs, dma);
 			kfree(seg);
 			return NULL;
 		}
@@ -62,10 +63,11 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
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
@@ -81,7 +83,7 @@ static void xhci_ring_segments_free(struct xhci_hcd *xhci, struct xhci_ring *rin
 
 	while (seg) {
 		next = seg->next;
-		xhci_segment_free(xhci, seg);
+		xhci_segment_free(xhci, ring->segment_pool, seg);
 		seg = next;
 	}
 }
@@ -334,7 +336,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	struct xhci_segment *prev;
 	unsigned int num = 0;
 
-	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+	prev = xhci_segment_alloc(xhci, ring->segment_pool, ring->bounce_buf_len, num, flags);
 	if (!prev)
 		return -ENOMEM;
 	num++;
@@ -343,7 +345,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	while (num < ring->num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+		next = xhci_segment_alloc(xhci, ring->segment_pool, ring->bounce_buf_len,
+					  num, flags);
 		if (!next)
 			goto free_segments;
 
@@ -362,15 +365,10 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
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
@@ -382,6 +380,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 
 	ring->num_segs = num_segs;
 	ring->bounce_buf_len = max_packet;
+	ring->segment_pool = pool;
 	INIT_LIST_HEAD(&ring->td_list);
 	ring->type = type;
 	if (num_segs == 0)
@@ -398,6 +397,20 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
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
@@ -422,6 +435,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	new_ring.num_segs = num_new_segs;
 	new_ring.bounce_buf_len = ring->bounce_buf_len;
 	new_ring.type = ring->type;
+	new_ring.segment_pool = ring->segment_pool;
 	ret = xhci_alloc_segments_for_ring(xhci, &new_ring, flags);
 	if (ret)
 		return -ENOMEM;
@@ -1424,6 +1438,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	unsigned int mult;
 	unsigned int avg_trb_len;
 	unsigned int err_count = 0;
+	struct dma_pool *pool;
 
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
@@ -1487,8 +1502,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 		avg_trb_len = 8;
 
 	/* Set up the endpoint ring */
+	pool = virt_dev->eps[ep_index].priv_seg_pool ?
+	       virt_dev->eps[ep_index].priv_seg_pool : xhci->segment_pool;
 	virt_dev->eps[ep_index].new_ring =
-		xhci_ring_alloc(xhci, 2, ring_type, max_packet, mem_flags);
+		xhci_ring_alloc_from_pool(xhci, 2, ring_type, max_packet, pool, mem_flags);
 	if (!virt_dev->eps[ep_index].new_ring)
 		return -ENOMEM;
 
@@ -2291,7 +2308,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 }
 
 static struct xhci_interrupter *
-xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
+xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs,
+		       struct dma_pool *pool, gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
@@ -2308,7 +2326,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!ir)
 		return NULL;
 
-	ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
+	ir->event_ring = xhci_ring_alloc_from_pool(xhci, segs, TYPE_EVENT, 0, pool, flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2356,7 +2374,8 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num)
+				  struct dma_pool *pool, u32 imod_interval,
+				  unsigned int intr_num)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2367,7 +2386,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	    intr_num >= xhci->max_interrupters)
 		return NULL;
 
-	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
+	ir = xhci_alloc_interrupter(xhci, segs, pool ? pool : xhci->segment_pool, GFP_KERNEL);
 	if (!ir)
 		return NULL;
 
@@ -2498,7 +2517,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters)
 		goto fail;
 
-	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
+	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, xhci->segment_pool, flags);
 	if (!xhci->interrupters[0])
 		goto fail;
 
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index beb637407e47..274da38f333d 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -315,8 +315,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		return -EBUSY;
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg, imod_interval,
-						   intr_num);
+						   num_seg, NULL,
+						   imod_interval, intr_num);
 	if (!sb->ir)
 		return -ENOMEM;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..15ce0bb7aa3f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -709,6 +709,8 @@ struct xhci_virt_ep {
 	bool			use_extended_tbc;
 	/* set if this endpoint is controlled via sideband access*/
 	struct xhci_sideband	*sideband;
+	/* dma pool to allocate this endpoint's ring segments from, if set */
+	struct dma_pool		*priv_seg_pool;
 };
 
 enum xhci_overhead_type {
@@ -1380,6 +1382,7 @@ struct xhci_ring {
 	enum xhci_ring_type	type;
 	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
+	struct dma_pool	*segment_pool;
 };
 
 struct xhci_erst_entry {
@@ -1865,7 +1868,8 @@ void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num);
+				  struct dma_pool *pool, u32 imod_interval,
+				  unsigned int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,

-- 
2.34.1

