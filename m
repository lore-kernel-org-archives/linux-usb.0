Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818941F5F3
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505094; cv=none; b=a4TWPvxpy5r6uP05A6qUd9Mq3UelusmDg+S13Qb78I9f9Zq6flapcoTG+FErK6UDPvVdFtvmUeKpBM1CgkRODz/co5DljYtuHNi7b5iNiuCMoYq9IH4YrNSRm3JWbKbFSZzHEaVHimSXer/0Wv+6FtuSkCTsrm9HJ+NbAecoHnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505094; c=relaxed/simple;
	bh=ZFeil9OwyvB+ttevEGeLJHHBev8PjDjG10AnscfM4Ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CD8MoECfP+zHrFnC5beDQTwXC068kqMhf1/8/QzZN6JKUprk4yGvJstlRuzZcmihiaedt0YvaHMCfwBKoVqUd78bLfxtf8VAEUe0w6AmJyYjxR9x5RzawCd6l7Uo2WF7C36R2NgIK+X5XU8GbAoKUMQdwVUXcPvXWEubchQzZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=il67v3Ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqP7ATi9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="il67v3Ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqP7ATi9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462iZu2718633
	for <linux-usb@vger.kernel.org>; Fri, 4 Sep 2026 06:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLwSipIlwt4Uh35Xbe9B2buRpk0lXStHU+U69Bwrflg=; b=il67v3Ue4qQ5DvXi
	hNWbTorQL6HNxFFZRiBkUyztCfJmfLGiYoLHTHZAHPwk7yJeaVfdbuDjkmrjBf5x
	qoeQYgpCfE5zEBqMxZ4qWk+5QU42faVpl9DuEIOsCX73q+zbgIFqogC1zXrHBtjW
	/qqH3ceNPBsSpjoVcEiLJ3B1UuX9TyZw0A1o6iKuUu77TLEMw/xpb8Vb3GSCEzmj
	gA9WnXkxQvw4VH3E2JP/xbT2Hb9g2xQazdMAY2+3W3pPzRX3uqRSp2bNnx5LBmY9
	sXTxtU3UXvq7YKyKgll6Jg/2lN2jZ/O85Ghq4FWHE56Lz+BCga7j6As2gdhU2m2a
	ck/ZlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd0b3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 06:58:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso2138582a91.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788505089; x=1789109889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLwSipIlwt4Uh35Xbe9B2buRpk0lXStHU+U69Bwrflg=;
        b=TqP7ATi95xRKdqn6Bb+x64j5JWXxk6v7LuhoYSDqf2oCh4GMPzqLCZxX0NoHhBJl+Z
         oYMMQDWYyWgsxMkRstsTDPLNiDxwFlnNDnieESqEKhJF4k4U6yCYpW6fSw0GJbCQVsZJ
         n5kGG2MruW1zOXnMTJ+Dlkeil4fmSRDuxf3BvFqnAk8Hn3S13afXZq+sNPSay5C93u0I
         tegT0ei8axmBWM+jzHc/3FTTT4qxAEmJ+n+X+pyheKbcHbos+WF4hommZQ/e46/pD2pH
         UflIlcXDO79EvwTIWuN4sSOitCBzA4O1QbtWgmR3UthiQE/uUvBB6FhDmZ2ybeWTUlg2
         wkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505089; x=1789109889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLwSipIlwt4Uh35Xbe9B2buRpk0lXStHU+U69Bwrflg=;
        b=jo1CXV++6JW/1ir2JPNlnGD/I4lyQjdHexlyoDoVj/5mX/fXWYw6m4J3Fqe5FuD6+t
         t9RXW2eW0+ifvJEllylwYBXT63/FWryMZR+zeaRFI3W0uUgeQVOARPcmlJ0YxW7/XSha
         PVZ4hGWmrm2PzvFBcUWH8f6SuNY5u+oK0dRnrO7DGvrIMFB+aobFXELisdFHZjQPQVXZ
         +ZPpRxiMXsZn2JNoAMswSGFXjqSLIsTUxZlZOby/6v8kA3zGYfR6qYHq1M3aG+/GI/J0
         EvDPLvnPbOzm2SNvaNE/FAR6/7OB1L7iFvorOBXQYsP6D7wwBBXNcUpWeYWHNbNyyRa+
         52YA==
X-Gm-Message-State: AFuF++mOcaw4Ncx3DKn+CmkXd+ce+eL9mD6JZMyVWPUYB2N8PDxsPlQN
	Uqz6dPyRb2/Bh7849DBBZKKw0OBEUEcHTMQDQ+tZHNTdn10AbTk3ptb6e9aFuLzezlqUJW0P9lg
	pX3sEyRqAWDfOC1wAJtrfCFcvreS6ZlipwoQ2V/YpCSH+E8+eaQ42zYKqDrDL50g=
X-Gm-Gg: AYBFou2msU20P40InvQ37qMtuLwW4bxbwiGK7Tlv2/bQILINmscpnBW7ZtvE6zqIh70
	LXXA+gzkmSueB15R+0luGuQxSUAguvx2WlZTJmJLRvS3fD/wt8m16DR+Ly6nC/N4tke541dm9Vo
	CtSURvVKsIHSC7b/BT0SW4kLv2CSkFyqY/5P6t9TGm5plO5DNhW7usJJOPiLyWBP+5lYJ3f+HwO
	TPnz0T6+7Xxfe46MWPf0XL4OoGa39iAuMUVYmEJPrAQrxfhHIe+YWSquQ6JG5mmwxpOr5MQrDmQ
	IUxf361ygkd5ol4A1yc+KzOLQTEAU9qpMSUmHndG74xG37hrLr0c8CyLHrtu3GS6bfCvA9uLU9i
	bDKY+/dW1tibq2OPgrULQWB0ez3hPb1TIGpKbDH8cCZQECqWoq3QS
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr12594511a91.20.1788505089321;
        Thu, 03 Sep 2026 23:58:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr12594444a91.20.1788505088769;
        Thu, 03 Sep 2026 23:58:08 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm4760900eec.2.2026.09.03.23.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:58:08 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 23:57:53 -0700
Subject: [PATCH v3 4/4] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on
 16K+ page kernels
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-16k_offload_v1_b4-v3-4-135928dc2408@oss.qualcomm.com>
References: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
In-Reply-To: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: b-RUxRrK-_tU2bQXVKcCDu3U2ebLALXQ
X-Proofpoint-ORIG-GUID: b-RUxRrK-_tU2bQXVKcCDu3U2ebLALXQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfXyvXsKiykyK3y
 RcF4Q3xBHdHIY1H6stbg8x4KFbtsV9P8FpnQTwbc1BKImYnjFMtAph5KSX2GHOY5I/Wkuli8s2u
 +ow3B7UPpUXUR4rkAAbuPjeqQbtVeiY=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9a6c02 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4X7XonqLFEBPzPt-dYYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX2MILEg43CYi6
 y90eWU9jhhzwpdwS/PE3cvxAJU2G3e0MuOYO7Mu8IWtK6k/iOAoGC/1S7NaJifFCyPUoJxeAMaS
 V0mpGMbeC8ra431bPw4s1zNoteVnmsLnNOHVGoSFJoDz1sOssDKAysLDxkD0o12jMcFn8SMm9LJ
 fdcVSRT5T7Io2GGrcK8TyCAQCil57dkLbLxfG8p+D1MQB28yfiwe9sVNqpZuPMN5HstUTw7gnnE
 xk4vyMIuM8AsCVogxxd+wW024SLET6RW7kIDf2z/V5oKSAjYmkD5176mAtfvUdbXe9ZCUYYRiKJ
 SQzpeZr7aUFHolvw3nkIGadutZsNG/CzZQNYBTU3x4ZMXKP8xacve+/mxtOvHTTVZm4YWNQQVcm
 EBBil7etPDe7qzVepEgTVFrMQLjEv1sp0YVg4WaMSJWiOi8tnftpsev3bp3XJc9M0y3tiGJxKIr
 6eg4lAX6Za6R5O69AkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040063

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
 sound/usb/qcom/qc_audio_offload.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index f09dae8334d0..515f4271a58c 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -58,6 +58,8 @@
 #define PREPEND_SID_TO_IOVA(iova, sid) ((u64)(((u64)(iova)) | \
 					(((u64)sid) << 32)))
 #define IOVA_MASK(iova) (((u64)(iova)) & 0xFFFFFFFF)
+/* recover the raw xfer ring iova by subtracting the intra-page offset added at setup */
+#define RING_IOVA_BASE(mem) (IOVA_MASK((mem).iova) - ((mem).dma & ~PAGE_MASK))
 #define IOVA_BASE 0x1000
 #define IOVA_XFER_RING_BASE (IOVA_BASE + PAGE_SIZE * (SNDRV_CARDS + 1))
 #define IOVA_XFER_BUF_BASE (IOVA_XFER_RING_BASE + PAGE_SIZE * SNDRV_CARDS * 32)
@@ -1241,8 +1243,10 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1311,8 +1315,10 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1551,10 +1557,10 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	/* cache intf specific info to use it for unmap and free xfer buf */
 	uadev[card_num].info[info_idx].data_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_data.iova);
+					RING_IOVA_BASE(resp->xhci_mem_info.tr_data);
 	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].sync_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_sync.iova);
+					RING_IOVA_BASE(resp->xhci_mem_info.tr_sync);
 	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].xfer_buf_iova =
 					IOVA_MASK(resp->xhci_mem_info.xfer_buff.iova);
@@ -1589,13 +1595,14 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 drop_sync_ep:
 	if (subs->sync_endpoint) {
 		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
+				   RING_IOVA_BASE(resp->xhci_mem_info.tr_sync),
 				   PAGE_SIZE, PAGE_SIZE);
 		xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
+	uaudio_iommu_unmap(MEM_XFER_RING,
+			   RING_IOVA_BASE(resp->xhci_mem_info.tr_data),
 			   PAGE_SIZE, PAGE_SIZE);
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));

-- 
2.34.1

