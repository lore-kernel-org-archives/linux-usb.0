Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF2379996
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005076; cv=none; b=GFUPnDS1r5qk1BGAuev/OZbpvk2/sQ3icANXrDB62KYnpFy9vYj4GnZjiz2ZG2If9vvW8pcadfTnNGqTonsRTDY5Ol44e+/7FUGyTyHuz433z2gJc4s4qP4kjM+TwekcbQHhgeIlxVt1nongLQA5T9cJUU+kgM4nD/c7PJA5SgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005076; c=relaxed/simple;
	bh=ynT43ZlYjgcPbqe8Z2Sitet6cthgPvBbmZ1TJ8jAs90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCY2+IyO5rxRDeXGQ9TAih7kkf1RmGCqBMxKWZOtAzk3DwwlCJEtKMho1RHyKUWT+1Z/425TLAG+ezh78xC5ekZyuHicYxi2CrkCGA/ipHDJZ2rCMfj37wG8fhXWe68T2BORUF6DKClTBdG/qDczLkkOqxmjkjPih3zkYI7kghk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+uxZgmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdFwU8tk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+uxZgmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdFwU8tk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1ltnd2518481
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6p/ZNsYDwIyedUSRxVruTRQWYBLvpIq5hDQ1FGef1BM=; b=Z+uxZgmMztw7TZch
	MH/m1oP9vKWT2fWldgHsAt1dzxYUc01Pb4ol+aCd1EHwckuzSiAR2UYA6UF+nDeE
	qdwhOwHCFL12DvloklDWgSRTZlZCDyTuD6rG9RUENoJlkwnbdcbvk6XCny930uQv
	z2eTcuF/a8Z/1lsTic/WX3w5jbbCHd5S0dR15iwUYjaAiXsnAlg5cD7NJCnxxZ/u
	dBC5WhmBXkkm+8WMOo/hamq2tUPg5JH6PEDRBqalPN0xyHyK7WlFxx7rwhepT0bD
	HpG5651KRLoQtFWC+2TZEihXHwJc3FEPLqfh48YnjVG5m01FG5LAvk75cGdl+Pnn
	UXYjCg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg1gr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so11596420a91.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 18:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005071; x=1789609871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p/ZNsYDwIyedUSRxVruTRQWYBLvpIq5hDQ1FGef1BM=;
        b=fdFwU8tkaVlfkwXlwZryzWhu67PicCDrG6kzrbzlTsnz2YNyhTCn8KUo8YMgr2Ge+J
         IM90jttQDMY1P8zZkco2WGmyDlyxIN5gjRDoNoL5bHF5Q/80BwmBL+0MNArjZH8/doyB
         GXHpftejuHp1yUWQKyzFU3GvlOkRtLWdY4M6y6uEHd6AWCPQ2ZLBqV100ROV56reSnz2
         7lgogbD2ddkuJOTbAUZp37SC+xAGEluLmrbYzMm6DAjVS2068hHFwBHrzeu+pLeUiGZL
         O49kw9zwNQmqj8XELOUK+Nv94M9bupunDMK3ZAiGh1E99kGy64hClNsMO+AvjwGNTmFD
         90zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005071; x=1789609871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6p/ZNsYDwIyedUSRxVruTRQWYBLvpIq5hDQ1FGef1BM=;
        b=jT/FUbtwX4qBMCj37oKk4fs0rR5VAivHr3pdIKlo0xUUKQpbUKZkMRk2ccSfrb6qOU
         qG5lXAy20VUZy54GW0BL+uJ28dCc/RrxD8kFgPYRDNRYNf6DrCENFJqDZkndY3ljbl3i
         l0WU7idGKMpEgvAGYFlSbCXVXg4P++2JFNXUoqh2KTFThg9oidb3OR21ZzG+Thbq1syB
         SKhR2E5icFRGUexhF4/BpiQpMggx6qAeGpdAMReTm7DCLVDRo9gmIj109G5QUJZFRMkU
         UCuKKmrP772rnbET49Uy+vm3zYCNfEJkMCvww2Cqlhqe0PR/PDbSySMGV6oi6YvWFr0+
         /atw==
X-Gm-Message-State: AFuF++k+Nk9yxksskFVMnexBO5qZ9dOYMghNCoSWP3WP3UjE2yTqkuXV
	HFwXNnnWsz9sEUj8zTPcsMsRLtskcDMguxAQD8Rkz8uP7R0K8UxX6XP0915PVhoHIu75P2nBZ+y
	QtH+alOFgV8zpGfGKs7OTP4oS70jrntgsZjxbIzZrHpIhc0tXJDi6NIVhKD/NnG73fpVIA/w=
X-Gm-Gg: AYBFou2Gl+STd4b1M0Lt7ZBNMgoyLXTsxaBRS463vJ1AivGMD6NfbmgqZ2piNezhlfN
	kkOXhX9ZPPr7soa6snhrDp/r/EfcwT5sqU9vandW5w49K8Ir6JnL+PDf6CG5bUmw1UmYbZY8Ham
	Ox7RHLoi/m8F0eGdrUkJ9k25/FnZwXBvR316NiJHUFlzzbMPBGIJ2KX1uchsfzMNDjwY4qRFyOG
	eqYlxSgP7ortSDZnHqHJszePf13DewxMQEMJpffkAXNaYSGmN5OCnRdJ84XI/daOLUjNg4AZnGf
	mAqobtW6PLS5Q4l+4Ssw9xSjNGiKGtwA9pxiS6QMK/xgmRUj2lp0VbwiEcJtJTP4C2zbKzUMeYy
	6/LB5ThnYZXl9spwi7UtyFljuLuG4pt2kCzVUXkK1a5tDDtxVwsa1
X-Received: by 2002:a17:90b:4d84:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39bac138257mr13113631a91.1.1789005070558;
        Wed, 09 Sep 2026 18:51:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39bac138257mr13113546a91.1.1789005070066;
        Wed, 09 Sep 2026 18:51:10 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:09 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 18:51:01 -0700
Subject: [PATCH v4 5/5] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on
 16K+ page kernels
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-16k_offload_v1_b4-v4-5-f24a86617597@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa20d0f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LmYBifCbusCXSjBzSPcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: WFswiLFqxXpy4GXfRd6ZBAhtJ9JEyiET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX6jsa2a5oWWmo
 wdDr8lbRjGzk+8kXp63jqj152KlsRxLhsDWgkBx/hj1RavG+f74+ug9uYI3TvlvixEQFpkE8wjz
 WtbGTAQ2IoVuRquyGLP+QUG7rJxtqiU563YVxhIYBX4sTB/E6nQ6yCPmYWR6GGIruR9n5SB4JIH
 2qVXit9KqkYSAGTQS4N/sXv4R1+lIC/JXI2voK13jQ+2PnnGB/B2Dht57gb+ThmZJO2dfB6fnld
 Fh9jtlDjB15KsjPP8S3/0HfVqYh2yi3ozLVic8k3zKyxM36SXv9OexK33Zr104UpFFMhFKG5w5p
 KFo4qgiz9RpVyJ4HcE4wslVoSrXt9J5QVoQg0EWjAbQu69T0GFFXooJA55TNvXn1dgNpXXnyMec
 OqMZAFq2rs4FUvgmd/98Kph21S8NuJme683yDa563j4eYTv6DRnt82CVh5cn0mFEswjF4oMTZQU
 WUhmtoXM07yCGmksy1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX4NPYMmJKBStu
 +kJP7GmN107zvLHu7PBHL6nDdX2fVCMCn6ifZgorgOpz5D3oKyDfkU35x8eyrlOPiQnKjf+NMY+
 hEpE/PgDGhMhVT/6dNH6Y7oYnxTtuOA=
X-Proofpoint-ORIG-GUID: WFswiLFqxXpy4GXfRd6ZBAhtJ9JEyiET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100018

TRB_SEGMENT_SIZE is hardcoded to 4096 bytes, but on kernels built with
a larger PAGE_SIZE (e.g. 16K or 64K page arches) the IOMMU still maps
and unmaps in units of PAGE_SIZE. A ring segment's physical page can
therefore start at a non-page-aligned offset relative to the segment
itself, and the DMA address handed back for the ring
(sg_dma_address()) carries that same intra-page offset.

Add that offset back onto the mapped iova before sending it to the
ADSP over QMI, so the reported address resolves to the start of the
segment rather than the start of its containing page, and report the
true TRB_SEGMENT_SIZE instead of PAGE_SIZE as the ring size.

This broke the reverse direction: recovering the raw, page-aligned
iova for iommu_unmap() by masking off the low PAGE_SIZE bits of the
QMI-reported iova only works if that iova happens to already be
page-aligned before the offset was added, which is not guaranteed.
Add RING_IOVA_BASE(), which instead subtracts the exact offset that
was added at setup time, and use it for both the cached
data/sync_xfer_ring_va and the drop_sync_ep/drop_data_ep unmap error
paths.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index bb5a0d54cd72..2e6397f9cab6 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -66,6 +66,12 @@
 
 #define MAX_XFER_BUFF_LEN (24 * PAGE_SIZE)
 
+/* recover the raw xfer ring iova by subtracting the intra-page offset added at setup */
+static inline u64 ring_iova_base(struct mem_info_v01 mem)
+{
+	return IOVA_MASK(mem.iova) - (mem.dma & ~PAGE_MASK);
+}
+
 struct iova_info {
 	struct list_head list;
 	unsigned long start_iova;
@@ -1241,8 +1247,10 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1311,8 +1319,10 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1551,10 +1561,10 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	/* cache intf specific info to use it for unmap and free xfer buf */
 	uadev[card_num].info[info_idx].data_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_data.iova);
+					ring_iova_base(resp->xhci_mem_info.tr_data);
 	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].sync_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_sync.iova);
+					ring_iova_base(resp->xhci_mem_info.tr_sync);
 	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].xfer_buf_iova =
 					IOVA_MASK(resp->xhci_mem_info.xfer_buff.iova);
@@ -1589,13 +1599,14 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 drop_sync_ep:
 	if (subs->sync_endpoint) {
 		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
+				   ring_iova_base(resp->xhci_mem_info.tr_sync),
 				   PAGE_SIZE, PAGE_SIZE);
 		xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
+	uaudio_iommu_unmap(MEM_XFER_RING,
+			   ring_iova_base(resp->xhci_mem_info.tr_data),
 			   PAGE_SIZE, PAGE_SIZE);
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));

-- 
2.34.1

