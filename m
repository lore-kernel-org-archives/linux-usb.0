Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749207;
	b=22BbQArebfkdrx6iuJ69ZlHI6m7osm5CO0nrFVzwX3Dg0dfbAC2c7Vch5SiEX+nnPsxM
	 vTlHgJOftu2RtD78chJ8HAMSaZDI40pZoLcRArJ4kdD5njr90yMrq08g/WDpCsrorCe3Z
	 Hj+nIQwgAuvcnO3TdxBR6FLgDGp08cVRc8YMXQxMgzKzy8gp8g7HGceSX97gddbqVkEKF
	 5tysf/SWQI0CuqjNTFbz14Eyy5k6ZWbchFJJYQEm7fY1oBedab7xhCqos5nscLz+dTdK/
	 x4+B6pGiTkubNBKyVhabCjW1Gnoo4YGJmfmXJ1HF013Zffiq0/5utgC9W6GdK91JF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BMJRXIBnzBDnhpP0qSv9tAh0Q24G4628Xt2fKxucKGo=;
	b=HflTMyM7JtClqBkzdTaqPb0kLQlemEJUgaTMrBrjM895N+K5/5cd439gFCXOEMTvEpPJ
	 sXLKp3x5pmcu/9zvTGo+aPUEXo6JdSdBGiNrXjhIAnq4ZHypCzUw53RiBnjKA7354Nwdi
	 G5UIOWbcsmwf/Cns3Xilh7aIKtnkJAzhzR1XxV2Ur/oyoC0sCBnKxuqJ1X4LeOZu081Gr
	 OEGnze2IJ4Lqhtgevqv0zMdrDSfsmJXfmBijFm4jOh9GrIMzt8ZSDtO+cTo2cVG5mLC4v
	 A/hA6H9WB2apgga63PWcxcRTKRdKShfWm/INiyijY4Lfiuonc1+pYvv9FqnyY5qRqjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kXk9st5M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ah15+kEg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7E4606A339
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7E4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kXk9st5M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ah15+kEg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL38U3678053
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 23:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMJRXIBnzBDnhpP0qSv9tAh0Q24G4628Xt2fKxucKGo=; b=kXk9st5MYKn0AuQS
	ISPexGWmEj2v/94hfv6+6qmXlu9l663rFvhpO/hMc3t14zd8JOMhtZV0pmDZKrcT
	sg+UgHnRqrrodiy3X+BrX644u9MXiDnr4SmKH6NAs2gs4AB36JSTqNqv9R2KLRRW
	aBF2xcr2X7bONrd0FzdDf0LCfVzTSizBkMeNWnBd6bon+S7AIbadDUr9fTkzwz4m
	IaCe1vcCfh3a3/RakERBLBiIuGlYf1SiQ+BhKN8r2zywn2rDOy8LCoXTgd9pPr2t
	s0QDDOMeO00qO+04Q/xdaLlCPQ7PAD8vG4MZUeE6H1WR+pgPfGC6Kd4/X6IMcYTt
	QEat3A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bj93k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 23:40:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ac19c6bc71so130866c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793749199; x=1794353999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMJRXIBnzBDnhpP0qSv9tAh0Q24G4628Xt2fKxucKGo=;
        b=Ah15+kEgi0FCPusQlLg3nyuv2Op9c3GFNWWgIz2VfknlqtkRZmCemsyYpCduwfn4lF
         +lFCQ5CO1OxsT1zLEV2uPB8snz0xeQHEzpWUJGCNQLxxfhTzwH2RVySQUUpgYJXlf5g7
         uYqS2vWWHbYGH7IEEy0b5EmUaAiy9hljsDcA3wl6X6fAgbnY7pZZ4Zon92VirVdbXrlp
         1LPsqwEdT9wOe8QumZ6qBEvyPU5kOo/QSsJQXKxu8XUeLMQBRdEWc8h3TIjPO1zL9Go4
         kbYvLFqxixuYB1y14cW7z9zlTUIsxbXAADEFhRs4hnkDg8EWvHemTvYe599hBwwmQzq5
         iTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749199; x=1794353999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMJRXIBnzBDnhpP0qSv9tAh0Q24G4628Xt2fKxucKGo=;
        b=WBwGtVPvzX4JvTc6R3Mlv73tfZc63CM+daepWfCFPGBRljCmrbxjm3ZURhzi07KW73
         0o3tSGJlkiYSebNDwVg+YdqxOssYd1MP9W+tK2+R2nMzq42R2k7AWpb/NIjmy7mPOSEv
         T8tcSrXYjQz2kxL3bG19BvaCL9knGNIwjsWpY087E4gsfC4uxUNQdDjOLDlu8/QOCGJt
         vMaXM7BMXxQIiI77v0rWNXANrMgReumPACjybSPSHWkhwGv252gWd1bXUMRhgd2Pt8It
         xJHhmE6AFO5cnYPuEanq8UyZeRMz2YpoiJJh0Clufciidx+geR25wQ1C+N7vbFwQniGC
         a+RA==
X-Gm-Message-State: APuU4Z+Q6Biry0MXZZF4QfLGTtPOIVgjatJ5MsWAuXKShHB7y/H9xxqP
	KdEdZmrYxw8M3dBwVgBEYkqzj4wKmU5Ud11li+VZGxsqiWf2qGqJf6cO2y2dc5ekxabAocDn86n
	RX/dj6/bXtyz28q0OxFa4fNfcK9O7ICCCk2I39/bQqEec13MDLKnlrATyc0zFksg=
X-Gm-Gg: AYBFou2stCEwHq1bAhRw/5Fb+3y+ZosaG4bIEX3zP9GGSIsbBsoFDtownF2rSFJezGN
	ocdHv+SCc0aZTzLJx8pjIzIwac1t8fTDL9BWT1bijA7V5fYZipTOxWCv20snvXlG3MTK0lbekyt
	/OvzpSiS7AZqTUN9pO9/4CYzwDr2KNu3sl1SwjhzYvoHiDvgKjdlBxwz7O4GeWsCaAIWZIeOLtJ
	AgQCkWzm/JvewioyYi2u6WSVLHoj7H8NVnmMCrEZgKaEo/i6D/1B0wnR0rB3tbQdKe+JavYGBZc
	PJvPv6BEYJTk++aQLhDZs8OkTguF2o0SQAheBpaFWRefAmaIniEyIRxov4jJDoHEv2srUpjQcyO
	mM9zr8/AdLzn0n0nPm/5TsegpLtc7BOBm1BU3g5UF4HA46xNHwCg5FA8rCMx+XDxoS2VvhHcj85
	UsdgB0OfM6gIUtyJ5TXnZ0O2enpw==
X-Received: by 2002:a05:7022:1308:b0:193:7fb5:2c3d with SMTP id a92af1059eb24-1ac5e3233e7mr18367549c88.21.1793749198870;
        Tue, 03 Nov 2026 15:39:58 -0800 (PST)
X-Received: by 2002:a05:7022:1308:b0:193:7fb5:2c3d with SMTP id a92af1059eb24-1ac5e3233e7mr18367510c88.21.1793749198175;
        Tue, 03 Nov 2026 15:39:58 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm2356442c88.1.2026.11.03.15.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:39:57 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:39:54 -0800
Subject: [PATCH v5 2/4] usb: xhci: Allocate sideband ring segments with
 dma_alloc_coherent()
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
Message-Id: <20261103-16k_offload_v1_b4-v5-2-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
In-Reply-To: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX8Q+OIEmS8AHY
 FdrPawU1TMkODM54l+PfVpmqeG3+qZTRCZTbCLEbVswqUnkR3A+kb4esIkGqBWWO2nTnPZHVs4o
 U0r+ojJWuMPTrcsT75z1TZHv1+eFD2c=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea70d0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=R5uxNPeLo-eXpQxxT6kA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: vUN9tsETcYVHbq15_qNRJW1XonR1aQ9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX5OyIF6M9iqme
 JLPUBqhxEIW72/gbdPuSz6oLjvL3ctYsQQQEHLA0SAxzCip+CEcqaNR9rLzbtYgTcoHrtnKIrVm
 x4afbmUku0x/RmXQZL+Bkx+wEn6djoLubS7EZX1s+F6wGHwpfB5fxk67FPGr5XAKFeWDFxXQrc7
 n8j1tu1sNVa7jhNqblJw77w2zn4wFroy/5b+JQwN015cHtQizq1Dmo7jE0qfyiydgg2wJ8HWH4Z
 K74U0YxBv2G6f7j07BdmElfRAVHHVuCB0E71qcSW/MifdgOoIvkK+dPBPD4a+eEQzfiCdaWQJjN
 s1ZxbzuyBZvzgoSwmVn449aJd+IFCsxmLGQnKMi3plSqhfPKhoyifwEoRaZiU54NDihYYAjmWL1
 GQsJuxRN/4/jjYIkSOK55zujUSr714Kbz2OjpIlq93UFWrx1YSMhpiLqtzOBcWLyY71HACY2rYo
 Ha1GzJzWanlLmtqQoeA==
X-Proofpoint-GUID: vUN9tsETcYVHbq15_qNRJW1XonR1aQ9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030094

Ring segments are normally allocated from a shared DMA pool sized and
aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
larger PAGE_SIZE (e.g. 16K or 64K page arches), multiple segments can
share the same physical page.

A sideband client that maps a ring buffer directly via the IOMMU
(which operates at page granularity) would then also expose any other
ring segment sharing that page, as well as the dma_pool bookkeeping
kept in free blocks, to the entity handling the offloaded endpoints.

Add a no_pool_alloc flag for endpoints and rings, which has the ring
segments allocated with dma_alloc_coherent() instead of from
xhci->segment_pool. Coherent allocations are page aligned, so each of
these segments gets a page of its own. When PAGE_SIZE is larger than
TRB_SEGMENT_SIZE, xhci_sideband_add_endpoint() sets the flag for the
endpoint, and xhci_sideband_create_interrupter() requests it for the
secondary event ring. Normal (non-offloaded) endpoints, and kernels
using 4K pages, are unaffected, as they keep allocating from
xhci->segment_pool.

xHCI still owns and frees these rings once the endpoint has been
dropped or the slot disabled. All of the ring free paths run in
sleepable context, except for xhci_free_dev(), which frees the virt
device while holding xhci->lock with interrupts disabled, where
dma_free_coherent() can't be used. Detach these rings while holding the
lock, after the slot is disabled, and free them once it is released.

Since xHCI never queues transfers to a sideband ring, refuse ring
expansion for these rings. The flag has to be set before the endpoint
ring is allocated, so have xhci_sideband_add_endpoint() return -EBUSY if
the endpoint already has a ring.

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-mem.c      | 63 ++++++++++++++++++++++++++++++----------
 drivers/usb/host/xhci-sideband.c | 17 +++++++++--
 drivers/usb/host/xhci.c          | 13 +++++++++
 drivers/usb/host/xhci.h          |  5 +++-
 4 files changed, 80 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 75577f441cdd..d280023ecbce 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -26,10 +26,15 @@
  *
  * Section 4.11.1.1:
  * "All components of all Command and Transfer TRBs shall be initialized to '0'"
+ *
+ * If no_pool_alloc is set, the segment is allocated with dma_alloc_coherent()
+ * instead of from the segment pool. Coherent allocations are page aligned, so
+ * the segment then has a page of its own.
  */
 static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 					       unsigned int max_packet,
 					       unsigned int num,
+					       bool no_pool_alloc,
 					       gfp_t flags)
 {
 	struct xhci_segment *seg;
@@ -40,7 +45,11 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	if (!seg)
 		return NULL;
 
-	seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
+	if (no_pool_alloc)
+		seg->trbs = dma_alloc_coherent(dev, TRB_SEGMENT_SIZE, &dma, flags);
+	else
+		seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
+
 	if (!seg->trbs) {
 		kfree(seg);
 		return NULL;
@@ -50,7 +59,10 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 		seg->bounce_buf = kzalloc_node(max_packet, flags,
 					dev_to_node(dev));
 		if (!seg->bounce_buf) {
-			dma_pool_free(xhci->segment_pool, seg->trbs, dma);
+			if (no_pool_alloc)
+				dma_free_coherent(dev, TRB_SEGMENT_SIZE, seg->trbs, dma);
+			else
+				dma_pool_free(xhci->segment_pool, seg->trbs, dma);
 			kfree(seg);
 			return NULL;
 		}
@@ -62,10 +74,15 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
 	return seg;
 }
 
-static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
+static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg,
+			      bool no_pool_alloc)
 {
 	if (seg->trbs) {
-		dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
+		if (no_pool_alloc)
+			dma_free_coherent(xhci_to_hcd(xhci)->self.sysdev,
+					  TRB_SEGMENT_SIZE, seg->trbs, seg->dma);
+		else
+			dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
 		seg->trbs = NULL;
 	}
 	kfree(seg->bounce_buf);
@@ -81,7 +98,7 @@ static void xhci_ring_segments_free(struct xhci_hcd *xhci, struct xhci_ring *rin
 
 	while (seg) {
 		next = seg->next;
-		xhci_segment_free(xhci, seg);
+		xhci_segment_free(xhci, seg, ring->no_pool_alloc);
 		seg = next;
 	}
 }
@@ -334,7 +351,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	struct xhci_segment *prev;
 	unsigned int num = 0;
 
-	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, ring->no_pool_alloc, flags);
 	if (!prev)
 		return -ENOMEM;
 	num++;
@@ -343,7 +360,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	while (num < ring->num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
+		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num,
+					  ring->no_pool_alloc, flags);
 		if (!next)
 			goto free_segments;
 
@@ -369,8 +387,9 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
  * Set the end flag and the cycle toggle bit on the last segment.
  * See section 4.9.1 and figures 15 and 16.
  */
-struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
-				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+static struct xhci_ring *__xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
+					   enum xhci_ring_type type, unsigned int max_packet,
+					   bool no_pool_alloc, gfp_t flags)
 {
 	struct xhci_ring	*ring;
 	int ret;
@@ -382,6 +401,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 
 	ring->num_segs = num_segs;
 	ring->bounce_buf_len = max_packet;
+	ring->no_pool_alloc = no_pool_alloc;
 	INIT_LIST_HEAD(&ring->td_list);
 	ring->type = type;
 	if (num_segs == 0)
@@ -398,6 +418,12 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 	return NULL;
 }
 
+struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
+				  enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+{
+	return __xhci_ring_alloc(xhci, num_segs, type, max_packet, false, flags);
+}
+
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		unsigned int ep_index)
@@ -419,8 +445,12 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	if (num_new_segs == 0)
 		return 0;
 
+	if (ring->no_pool_alloc)
+		return -EINVAL;
+
 	new_ring.num_segs = num_new_segs;
 	new_ring.bounce_buf_len = ring->bounce_buf_len;
+	new_ring.no_pool_alloc = false;
 	new_ring.type = ring->type;
 	ret = xhci_alloc_segments_for_ring(xhci, &new_ring, flags);
 	if (ret)
@@ -1488,7 +1518,8 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 
 	/* Set up the endpoint ring */
 	virt_dev->eps[ep_index].new_ring =
-		xhci_ring_alloc(xhci, 2, ring_type, max_packet, mem_flags);
+		__xhci_ring_alloc(xhci, 2, ring_type, max_packet,
+				  virt_dev->eps[ep_index].no_pool_alloc, mem_flags);
 	if (!virt_dev->eps[ep_index].new_ring)
 		return -ENOMEM;
 
@@ -2305,7 +2336,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 }
 
 static struct xhci_interrupter *
-xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
+xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, bool no_pool_alloc,
+		       gfp_t flags)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	struct xhci_interrupter *ir;
@@ -2322,7 +2354,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!ir)
 		return NULL;
 
-	ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
+	ir->event_ring = __xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, no_pool_alloc, flags);
 	if (!ir->event_ring) {
 		xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
 		kfree(ir);
@@ -2370,7 +2402,8 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num)
+				  u32 imod_interval, unsigned int intr_num,
+				  bool no_pool_alloc)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2381,7 +2414,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	    intr_num >= xhci->max_interrupters)
 		return NULL;
 
-	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
+	ir = xhci_alloc_interrupter(xhci, segs, no_pool_alloc, GFP_KERNEL);
 	if (!ir)
 		return NULL;
 
@@ -2512,7 +2545,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters)
 		goto fail;
 
-	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
+	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, false, flags);
 	if (!xhci->interrupters[0])
 		goto fail;
 
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index d0c0f75d6085..04eb39e540c8 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -98,6 +98,7 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *e
 	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
 
 	ep->sideband = NULL;
+	ep->no_pool_alloc = false;
 	sb->eps[ep->ep_index] = NULL;
 }
 
@@ -150,6 +151,9 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
  * After an endpoint is added the sideband client can get the endpoint transfer
  * ring buffer by calling xhci_sideband_endpoint_buffer()
  *
+ * The endpoint must be added before its transfer ring is allocated (before
+ * the alternate setting that enables it is selected).
+ *
  * Return: 0 on success, negative error otherwise.
  */
 int
@@ -177,10 +181,18 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 	 * to add the endpoint the normal way, but instead offload it immediately,
 	 * and let this function add the endpoint and allocate the ring buffer
 	 * with the smallest common DMA mask
+	 *
+	 * Ensure that the sideband endpoint is added before xHCI has initialized
+	 * the endpoints.
 	 */
-	if (sb->eps[ep_index] || ep->sideband)
+	if (sb->eps[ep_index] || ep->sideband || ep->ring || ep->new_ring)
 		return -EBUSY;
 
+	/*
+	 * The rings are mapped for the offload entity, so on kernels with pages
+	 * larger than a ring segment, give each segment a page of its own.
+	 */
+	ep->no_pool_alloc = PAGE_SIZE > TRB_SEGMENT_SIZE;
 	ep->sideband = sb;
 	sb->eps[ep_index] = ep;
 
@@ -347,7 +359,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
 						   num_seg, imod_interval,
-						   intr_num);
+						   intr_num,
+						   PAGE_SIZE > TRB_SEGMENT_SIZE);
 	if (!sb->ir)
 		return -ENOMEM;
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index fc1b0a6b0429..64710df97697 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4106,6 +4106,7 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
  */
 static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 {
+	struct xhci_ring *no_pool_rings[EP_CTX_PER_DEV] = {};
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_virt_device *virt_dev;
 	struct xhci_slot_ctx *slot_ctx;
@@ -4138,9 +4139,21 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	xhci_disable_slot(xhci, udev->slot_id);
 
 	spin_lock_irqsave(&xhci->lock, flags);
+	/*
+	 * Rings not allocated from the segment pool are freed with
+	 * dma_free_coherent(), which can't be called with interrupts disabled.
+	 */
+	for (i = 0; i < EP_CTX_PER_DEV; i++) {
+		if (virt_dev->eps[i].ring && virt_dev->eps[i].ring->no_pool_alloc) {
+			no_pool_rings[i] = virt_dev->eps[i].ring;
+			virt_dev->eps[i].ring = NULL;
+		}
+	}
 	xhci_free_virt_device(xhci, virt_dev, udev->slot_id);
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
+	for (i = 0; i < EP_CTX_PER_DEV; i++)
+		xhci_ring_free(xhci, no_pool_rings[i]);
 }
 
 int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ec4bfeb4887c..7e5152862562 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -711,6 +711,7 @@ struct xhci_virt_ep {
 	bool			use_extended_tbc;
 	/* set if this endpoint is controlled via sideband access*/
 	struct xhci_sideband	*sideband;
+	bool			no_pool_alloc;
 };
 
 enum xhci_overhead_type {
@@ -1382,6 +1383,7 @@ struct xhci_ring {
 	unsigned int		stream_id;
 	unsigned int		num_segs;
 	unsigned int		bounce_buf_len;
+	bool			no_pool_alloc;
 	enum xhci_ring_type	type;
 	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
@@ -1870,7 +1872,8 @@ void xhci_free_port_bw_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval, unsigned int intr_num);
+				  u32 imod_interval, unsigned int intr_num,
+				  bool no_pool_alloc);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,

-- 
2.43.0

