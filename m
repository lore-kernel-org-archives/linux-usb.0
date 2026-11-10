Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278303;
	b=Qts0OEFbPNkFW8KgiSE4Kqa0MRNW8Ug7grD/sg6sCAEiSXlmauGDYjlqnspUwVCwGCZR
	 0HtG8pkP7FoiT7CsulGgT9iDmT9ce16Z19Dqi1mKj9j3z4hNCAHiitFzPs/5FO5n0FJzI
	 1bjaZCd3516jLYxnBNEpvsOK6bg1L/kdpfkY/L8/5ANiP/dBCtYHp1pf6QwJErjvZJHeQ
	 usLS7PqtOexXJH7uI13d4lClAsucKWorc2ypFM69Ahsn26tqFZEfcwEbdI0E43H6+NsyL
	 jcxfcRw5PN9Ju4tcsPPTspB1/reShZgBNh+krGKHqfpl/vuJDX8z3wryLHKDr/nxXTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
	b=z7ufQHb6Vpoc999zQPwHO2Fly6pHw9jUXNJm/IWFzzzWJ64NOEmoBL36REBf/ELJ2AMB
	 6ok774OdNKcOvVWYwGYjw+yyWM0TngZqsBhBb0J+Vppi55mAWRNH3Lfbd9wCHTUuIFjTr
	 nwYqxIE+3mz9y4ApMlKzfgMMYbHmyPWipz9dMrBZZvrY6UN92rdAv/q5plRZxU46zz5h1
	 435ZRwaWNbxM42pOPI4XruS8+KUq5RndD/Ph3dUqz8elLguSRt5BJ3DWHO/TlPiJCZe/Q
	 jp9j/YFrDDEhqFpBXD8VqsLEYPhah2FvMJuQaXde8XbnEMdigdYS8cwv8IDIl1YJDGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c29rIQ9I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAuiZEau;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F0606A330
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE4F0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c29rIQ9I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAuiZEau
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0isJL1850012
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=; b=c29rIQ9IjlYx01iI
	Gsf/ypiBEAhSB73FLPnpRnCOVBagg/nrnCHB9eHRgfcHSBDu0fCvScBekgev+omc
	y050Jhh3nhD2X6PLlzbnZtiq5KYi/aOeyQUHblpJGuK16jFflQrJ3yrhCup0FP+9
	DUqIlp46U5YSeffFUFWpDpu2OiDGji3y5ZQcLYPL/d32i6yhrrPEGiMgDS8taWTf
	1rVPiaWFwreSloVBKll1VqdxL7kVVq5gckjRNOLXimpiOKtZdx/mvJ0CBDsa3ufa
	/jnRDmG4V4ETnMHbwrkUabUekFbJIqCSKqeglyXAnjYlFVW5erGgspPtmFjaCe4O
	J0RwkA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5u75d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso3007670eec.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 18:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794278302; x=1794883102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
        b=bAuiZEau+8FJ3DHFCjUS1ftDnAxPvBQJfjXKviLWnpg67dwFgnR5teq9yodXoRZ9qt
         vieMgQY4ZAnRxT8HE50b/CkS5nnm+jyu/ILyK3jQau/yoLuNN+MEKaWo4D6Nr9MsivLs
         wBjRXR+9R11rTeB2pG7yfERGnda1loZMNbSOntbOXbGI7JbeulM0TwA8AtjQZNoloMyW
         Ohf+BZr+fozcEApU7HPSAZ58H6Xm+2tbLjIHlZNt2vdeV2YBbg4hNnR4kkiAsyAYpaHk
         YO0n8BYa+5zdpAwgoDv5mD0t+24uSzHmtBfXWJWZpBwjM1ZSekEaHafn264J2n6XP+k4
         UqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278302; x=1794883102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
        b=dpWnhGXt97Px/UObX2KJHLczNuMeFYV1CyROBYHQixH/8rHzbnjh6xCFi7xINB0Ve0
         4kFxzE+oF78uRAiSFHwlrtwalPZ/v4qUCEFWqyr/azTiziaqmqy5pUpWjmL6V5IFPpuo
         jfCUq5QtNg4i6A3U6Y19datAi8QEBsOvjXl0yxud3yG+/nQNoA4RjRuUaikl5mFFkOLU
         xb4ZoM9NJHCiJx3hsvLE7eVaHrK5Yziu4nD9PNnm70D8eGTBzAM4WXkbNMcIbbtNfzGe
         asj4bbzE/B6egdBSsgrbA0qghRTs6EPawG8qnYhHFqREzPP+GYGMQvC12dwFGQuFURdX
         X4gg==
X-Gm-Message-State: APuU4Z/NfN1NyKAQOkD7ED2OHhVilYFSgJODivbEoiakYkRnaXY9AcIf
	QxdUdFHbo94SVpBzidvUA7n6fFYxVWsT3YNLJ+9pHKmzW1fV+otqrDghgLz89TH4cL7NNs3IdqF
	OavtG8m3kiJoVAIPiSSO1MuL2kjrddC6NNlStBUGIBR9zJSaejfRTDGB1L4hQ7eo=
X-Gm-Gg: AYBFou0sXtQwq7Ug1CzNq1Cp1N5zZ8HHUBazXGbmUtmx5ReorKYngaQW0LCKZSzxYkf
	SAyCVHcQXLc4Szs0x4pm9ICw0jn1OULyorjxEnxkQHZ9owfoTjKDF9uAWU7FDjJ4i8aTacKt7mb
	KORUY+TAWWbbTxE5gGPXevBCPCCTBi5Z0HPqr0JFB47AiF6X7xiPcKOMtwrjYT0Sanf4az0hE0g
	mYw1C+0jFrfaA0ZqzcWd6vyEmYJqropoKTzd37rL3+mbA/FhonzhISrDjA4Xv93kfQ78lGivVrx
	LtaJfGXTXxU810umpi+9GeBYXjjH6GdQ/UXM/6WrXBUI38hfiScQhEG/AjUJzFBh5BFFgZYwauN
	5P9JHNbRrt81keoWij4O7uk6/E4FgfR6Dq9iBCKOudYLpyKBSCrcNDaKosJIiUaPrkPIr/Zi+Et
	hKu7yy3uZ5taGvCG2eY6gemTXw
X-Received: by 2002:a05:7301:618b:10b0:36c:a93b:1ba3 with SMTP id 5a478bee46e88-3751ee7bec5mr1628486eec.20.1794278301255;
        Mon, 09 Nov 2026 18:38:21 -0800 (PST)
X-Received: by 2002:a05:7301:618b:10b0:36c:a93b:1ba3 with SMTP id 5a478bee46e88-3751ee7bec5mr1628456eec.20.1794278300600;
        Mon, 09 Nov 2026 18:38:20 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm3800183eec.22.2026.11.09.18.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:38:20 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:38:07 -0800
Subject: [PATCH v6 1/4] usb: xhci: sideband: fix ring sg table for sub-page
 TRB segments
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
Message-Id: <20261109-16k_offload_v1_b4-v6-1-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
In-Reply-To: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX1Ao5wfSBo+30
 6UhV5sRRRTvD8uBS3mGKQdR3MaR877BR8JXxI+GK/39xNZT5W15r6BmLoM5eKde7raKRtO0i1hl
 4B1Y936xFPOE8Q0n2J466/Wtjn9XvwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX9JG6Y+B+9frK
 G5gajkphpqMoxASSB4mTuCFGCa4ZIFvuZoppQ77bigbsoL832cmd4UWqO323EEfpnIIRpaFMlpI
 T1mW1cooG/zfOsqRWp263XljtkRhzwS1Th2JiIcRD0QIc3ZEd/cDTpN4Anwm1+cnFP3LGIv8cjq
 mJBpuRigN+FcCBjrQvrC+56yVlCu2eUstUj4YwZYNJJqT5qJxxMc6zfklvJuBy8MeLLK/zPAc25
 g6v4ztWy9ojvANnSfOSHO7pScltmCVbcCuEgzFAgOPe+Gk2+w/zcz2WCbsXn0khQ73JjIPh6pd6
 rC33FWIt3olvSB6/+Tn/c/MhzYl1LScVQvi2mskSEMdVjlypylrdUG/wS7jr6C7g8wSgHo7GgRO
 5fHzRERQB60B8e3m7eiVg6Ab8hxalAvdIL/+OQ9fLDyMrU7UfptIAMY7N4L+m/Ysw07W9Y9HhVE
 hf3z4Mk404eJHxYqADg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af2839e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zbI7ttHqI6kfeEXDPioA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: uDDZDB2lvNstBFasM_JNKeyfF8ynOtvn
X-Proofpoint-GUID: uDDZDB2lvNstBFasM_JNKeyfF8ynOtvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100010

xhci_ring_to_sgtable() populated its sg_table via dma_get_sgtable()
per segment and sg_alloc_table_from_pages(), both of which only
operate at whole PAGE_SIZE granularity. Since TRB_SEGMENT_SIZE (4096)
can be smaller than PAGE_SIZE, these helpers describe a full page for
each ring segment on larger-PAGE_SIZE kernels (16K/64K), and cannot
correctly represent segments that share the same physical page.

Build the sg_table directly instead: allocate one sg entry per ring
segment with sg_alloc_table(), and fill each entry explicitly with
sg_set_page() using the segment's own page, TRB_SEGMENT_SIZE as the
length, and offset_in_page() for the exact intra-page offset. Walk the
table with for_each_sg() so this also works for chained sg tables.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c | 80 ++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..d0c0f75d6085 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -8,68 +8,78 @@
  * Author: Mathias Nyman
  */
 
+#include <linux/dma-mapping.h>
 #include <linux/usb/xhci-sideband.h>
-#include <linux/dma-direct.h>
 
 #include "xhci.h"
 
 /* sideband internal helpers */
+static struct page *
+xhci_segment_to_page(struct device *dev, struct xhci_segment *seg)
+{
+	struct sg_table sgt;
+	struct page *page;
+
+	/*
+	 * Remapped coherent memory is in the vmalloc area, where
+	 * vmalloc_to_page() finds the page for any offset into the allocation.
+	 * dma_get_sgtable() could describe the buffer from the start of its
+	 * allocation instead.
+	 */
+	if (is_vmalloc_addr(seg->trbs))
+		return vmalloc_to_page(seg->trbs);
+
+	if (dma_get_sgtable(dev, &sgt, seg->trbs, seg->dma, TRB_SEGMENT_SIZE))
+		return NULL;
+
+	page = sg_page(sgt.sgl);
+	sg_free_table(&sgt);
+
+	return page;
+}
+
 static struct sg_table *
 xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 {
+	struct device *dev = xhci_to_hcd(sb->xhci)->self.sysdev;
 	struct xhci_segment *seg;
-	struct sg_table	*sgt;
-	unsigned int n_pages;
-	struct page **pages;
-	struct device *dev;
-	size_t sz;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	struct page *page;
 	int i;
 
-	dev = xhci_to_hcd(sb->xhci)->self.sysdev;
-	sz = ring->num_segs * TRB_SEGMENT_SIZE;
-	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
-	pages = kvmalloc_objs(struct page *, n_pages);
-	if (!pages)
+	seg = ring->first_seg;
+	if (!seg)
 		return NULL;
 
 	sgt = kzalloc_obj(*sgt);
-	if (!sgt) {
-		kvfree(pages);
+	if (!sgt)
 		return NULL;
-	}
 
-	seg = ring->first_seg;
-	if (!seg)
-		goto err;
-	/*
-	 * Rings can potentially have multiple segments, create an array that
-	 * carries page references to allocated segments.  Utilize the
-	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
-	 * that page links are created.
-	 */
-	for (i = 0; i < ring->num_segs; i++) {
-		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
-				TRB_SEGMENT_SIZE);
-		pages[i] = sg_page(sgt->sgl);
-		sg_free_table(sgt);
-		seg = seg->next;
+	if (sg_alloc_table(sgt, ring->num_segs, GFP_KERNEL)) {
+		kfree(sgt);
+		return NULL;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
-		goto err;
+	for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {
+		page = xhci_segment_to_page(dev, seg);
+		if (!page)
+			goto err;
 
-	kvfree(pages);
+		sg_set_page(sg, page, TRB_SEGMENT_SIZE, offset_in_page(seg->trbs));
+		seg = seg->next;
+	}
 
 	/*
-	 * Save first segment dma address to sg dma_address field for the sideband
-	 * client to have access to the IOVA of the ring.
+	 * Save the first segment DMA address for the sideband client. The returned
+	 * table is metadata and must not be passed to dma_map_sg().
 	 */
 	sg_dma_address(sgt->sgl) = ring->first_seg->dma;
 
 	return sgt;
 
 err:
-	kvfree(pages);
+	sg_free_table(sgt);
 	kfree(sgt);
 
 	return NULL;

-- 
2.43.0

