Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278310;
	b=qiHTwGdXhCUE2HHL0rMU3uEFKM7DLDoQvI046c2TIlSM0KGX1rfaejfI14tkNSZwBJ6i
	 NAuCeSl7XlU33B1cEVV/OPR1YglF1YiHFvlzp+stk7Dsw83vAnweFWC0Iqjx3fMEWBeLl
	 aOI0+9HzMVn11HpVAJxFQMA/3OdRLlLnetGPRKa8mtQ3etbbksQchzm80IUYJeC6B1yPG
	 fKw7YJ4jN0+FEZGljLhobtdpxJIAzqF4dGHDkZh8qa/aTj3CZdjq5ChMC0uH8iucwVnpV
	 t4EVNN4pjPQ+jx+1FJitT67v8fYMvdZr10z8wgeJOzcJ6dhgjxX/eYfWwFvRQtXvVxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XaQB+U4GoYY66MC7GcPAIZ993UGlnF5ITav/WOOQC5Q=;
	b=Gu7puQbqeExuz4hd79SG1U3MPKTA8TbsAaa11n7EhJjGT6M3FQSQ4toOLnIQYxBAlqWg
	 KSqmqezV98YCdBgRg29t0LNAEBQibBr+MnQCQ7/ynmeaZ6abMUjpIQE887kHNsX/QzZYb
	 d/4bTZXPr+P/4nnlCIEW6/tH5YxiA3z6tqfqH435PPzklcqqD9ygV2C6zuZ3XeMQG99bu
	 AN5UtUCo9QGPf4srDtFd74ZGyP5p3qrt9oa1VwKMilRfIpRaZPnncov2rT0iEdI2QMiJ9
	 /iVwli+KS8qBJYyKK5GI3xOfUdbjmyAlgkafG2KvIVrbpDJaKFhTQoZbSEMwLyCiQQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bc9ljv0p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUAKy2yE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178A560A260D
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178A560A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bc9ljv0p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUAKy2yE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jJL51804458
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaQB+U4GoYY66MC7GcPAIZ993UGlnF5ITav/WOOQC5Q=; b=Bc9ljv0p4HXJhOz9
	CfGHi9G3sztFEtrvfkiBj2rzlMXH0Yl6eliWTXci704Ks7hl0CRIkRGcXJezxvr7
	A3RajH5n6BWe+MbRHNOF+PQc6ZyXa8rKEZ/C/8l29pchNOcsJp1TnrEWqHtoFz8W
	nLwVjArfrs5iIz8LwaYpuhQ9DnyfDulndx9njI5kLJo+9puHUlwMtwHTj14hRv7z
	MLGda0TmIWw4yGqMfEnEpzD+GJVk6ZTFsF61u5tF91u3DvLcz3hDKD8EpKkzQzTk
	hB022orpzhkvz2onvOJxHzm82nDMmDNFyzPt02QtDL8WIGsqlsa9jg+mtCx0vAHS
	SFcxFQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapb8fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so540016eec.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 18:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794278303; x=1794883103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaQB+U4GoYY66MC7GcPAIZ993UGlnF5ITav/WOOQC5Q=;
        b=MUAKy2yEFVDyyTrF2ylW79HcMFgWNNli0mwkKGc5kVCNZy4tzDgUsCPzx/L2JTI1rr
         gAVTWsbGPK8wZ3/4NjTpgOmkwQ7K123tmTenfFl8fnoarrme4Y3CS/QfdlyA1zLBsGo8
         6TP0VBxVQsOOKA78YLucPnSK1mi4GuIW89+7hV5035PvR6xQeJeXhUUzUFVBcV5u1Oyw
         upkmlt3vIjDVqbTeu+3qXEGP3JM4Z+Tst7QU3UVSbpGegMVCtj1U/RCvXcfRTNiPETBF
         KpCF8FUTaPDx2V9nNhNCyYLiZ2X799uHqhCpFeruFJilzekFraRmcZjTKpfZdYbcZfuf
         H4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278303; x=1794883103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaQB+U4GoYY66MC7GcPAIZ993UGlnF5ITav/WOOQC5Q=;
        b=MPsVJ+Rok4U5DpnrIBXzz8ODFz7YgjT3zX47ZsbsHi4ybn7kRFC3Axyuipv7+OXWrB
         Fj0XrOZeo4pD8XrnLNX4gXbxSqPRzfeFcccM/huad4HLPKb5aHSFLEhkmzcchK+unNob
         ZD+fJPshdNTO1R3Bpkyer5WL24Bh/wNiUQH4wfii1fC3O3an3bdWOicJ9o4yXBkBeM3h
         Oso3UV/2Rcg/m2j0nvviuHWKyX1RSv9s/JBh0XUqz6AxWYWMFmUopUZTF56gCLUwyKzK
         Es5TpPI8iSsHFxjonHZtcEn2tYg8+6f2gk2/6lJrbOFnDPbYPyVLISekDUY0u8CP4AQq
         N2XQ==
X-Gm-Message-State: APuU4Z/w6dj+7xdptv2o9pxuGeqBDcJTnGtH3A7gl/Hyhs9/iJFlzMmh
	qaB3T4a5SstjWEpL/xlcR0gQdOCoLCQbui2Bq77q5Nx1UZFLN3E8+tPHR+LYNtyjgKLaBhSz0Lo
	tMofWtZ2oEW0ocD0C9L0ID4YDSAwq3byrR1t0B+PfveREQVKOu5rcOH8ol3Q5Cqc=
X-Gm-Gg: AYBFou02xMjLKSQFDPLceGN7aYBKaQCfS1Pb3YQ5EF7grfFWxSX0ixMhRqsOLXky3FJ
	7tE9PNGhZYQBWxoR60m/AgZAoX2fZyT9wFDEj2Pmds2lrxaXs1yCzovfkJmP84QfzKPMYKeccQw
	uHMGsHQMUiwODbWcFxJLrGKTfJjNZxJFqWJ6uiKMv2mdr88yJt1PmXmTgjavearmMwmLNK011yF
	gEsDg4iJE4+V5YYvc0cGk0mODPxS9TwbLiDpiS2fLTxLTMKFChgfxmqDYZ0LcpOPJX1BL6k7mPi
	nVpsJ31Go3SyGz01xB9PNuOnW1AYWQcOIADY5qHlbaaV6okU5kQukPe6fQCwKzYGDnklnoO9lRC
	wi9ReJbSLc2ZhidvMfw/m8U5P5do48znHX2syGFMMqqEiUlE7AhlYKQRrLDuZiauZPWWMdei+2B
	CccZmCdf2/a/XcbNEHZqwV1jZK
X-Received: by 2002:a05:7301:4d0a:b0:36c:b138:651e with SMTP id 5a478bee46e88-3751f659239mr1461357eec.22.1794278302177;
        Mon, 09 Nov 2026 18:38:22 -0800 (PST)
X-Received: by 2002:a05:7301:4d0a:b0:36c:b138:651e with SMTP id 5a478bee46e88-3751f659239mr1461328eec.22.1794278301375;
        Mon, 09 Nov 2026 18:38:21 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm3800183eec.22.2026.11.09.18.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:38:20 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:38:08 -0800
Subject: [PATCH v6 2/4] usb: xhci: Allocate sideband ring segments with
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
Message-Id: <20261109-16k_offload_v1_b4-v6-2-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
In-Reply-To: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfXxaCL2dd36wwb
 K8XCj6PRIkbx4J4mExqZXqNIHh9ZUWxu+mu/PmVql+bGy1exM1DBvYHfRXveWJjeIp3556cmy+b
 nj3BGZzL9gVbdrURAQj0P1+gi2aiJG9mCydDjuF0/pulJwhIWPTrzaBVwld9Cjq1mjs4TkGV8VN
 3Myw3y13Rto8EGxQVOO01m7rQkFySgIUxStKsITNWQum4TzC48kqNRZaWib+kCc3uGlG14wcRCh
 ZcI1Z6jPXquWhmY0nkBCc8Fn3K36pkPhQ3Rc9ISyM8aRENBNtNJSOtqiHFtNR341a8S9bR8IPTz
 bo324qmDx3vUXoKWrkhJPTxuo0UjIE5uNX+uXHAskCp0mB94Wcty4Ys8/9q+OIBb0b/nJhGR92C
 9pYTulj5N3PxD/yaFnAiaZ6bQkUxrfkkNEzJse+X1u/lwBmoMTpdh1BfQ9qmLqg+IKKwSlA04DT
 wllvuThN70XE12mo4vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX8PoQ1PRAnIcY
 MmROLb4/r88Fk2857gugTw2WHWbYLoGGXdeR1fxDh4NwXeiNsHD387Gh6FvUIDTKoqRibYakD5s
 FxtYMfiXEb1SRXKEkJs9O3F0lkJGObo=
X-Proofpoint-ORIG-GUID: yKc_ghbd2PB1HZIIEJEy15ux74RtRBHf
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af2839f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=NecMWWT7E0M2Fxj5b8MA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: yKc_ghbd2PB1HZIIEJEy15ux74RtRBHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100010

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
expansion for these rings.

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-mem.c      | 63 ++++++++++++++++++++++++++++++----------
 drivers/usb/host/xhci-sideband.c |  9 +++++-
 drivers/usb/host/xhci.c          | 13 +++++++++
 drivers/usb/host/xhci.h          |  5 +++-
 4 files changed, 73 insertions(+), 17 deletions(-)

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
index d0c0f75d6085..a88698b085c7 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -98,6 +98,7 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *e
 	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
 
 	ep->sideband = NULL;
+	ep->no_pool_alloc = false;
 	sb->eps[ep->ep_index] = NULL;
 }
 
@@ -181,6 +182,11 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 	if (sb->eps[ep_index] || ep->sideband)
 		return -EBUSY;
 
+	/*
+	 * The rings are mapped for the offload entity, so on kernels with pages
+	 * larger than a ring segment, give each segment a page of its own.
+	 */
+	ep->no_pool_alloc = PAGE_SIZE > TRB_SEGMENT_SIZE;
 	ep->sideband = sb;
 	sb->eps[ep_index] = ep;
 
@@ -347,7 +353,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 
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

