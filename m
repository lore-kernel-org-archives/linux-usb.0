Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749209;
	b=mfWQIh3SoWHNyWpQRKBYAiSpKrJ8wMU1oQBGBlCuWIeq2y0asKJqH0YV/Dlca+kWM9Zs
	 InwAKvZ5ukafvrJ3XMmnRryHoc9DAaC58zPn3v2HdKXJhBVyMHhOcSEckALK9k73su5iv
	 ubARgK9T3UOYmIM+e/dh8pnmXqvkPMYIlxtTVfTpN3Wyo0YowJ0wbz6UrPNUEt4+jwhj4
	 ScHBXY2/m4NHuwy6NiAtdsFJEohhzWsZ/ssk4tQtgSKEBlaNhmCcnYcbya9PRTWY26can
	 HFVb1fs+Qa+no2xXO6cuw4oiGDcCVD3xnSaVUmkUE6G/EIFCuvFH96zssa6gZl56Ugw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JX49NbLw/imu5a3gQoSE/HYEqmaqAKFCIu6+mIAnbrw=;
	b=ZIMke18cAJxDKUWkqsd79pYi9upfiI9GKSwfcjO9AECpqQSqGhc/4MDZtTczMzZhg4Rc
	 zNGqylS6Tc3UlupNxCi6cu+OgAn+BeRTMnyf5eHc7/849DftiJGn9/O+W+lokOnRV0ufB
	 sEogg/d8MkyrAq4T+x0EGuLqWbpmnaygLgn3MvQM2bOzD5LLhDevsA2njiNJDiEb1ZXjw
	 8eIKxPq9eDQtErwG4t1eT+fimTgCma/5JWWBlCGXllSDFzt9GYZC5AntFRZ5QB+bYuQdM
	 tReKDaJb6bwdlHzBsb3mx+ObOZS1lypck7UgcGmhoVo/4YAnTUBP/wVChqbNdXGGmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BOOS/NPX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WdNmF/zE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D6606A334
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 694D6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BOOS/NPX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WdNmF/zE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL5fB2944212
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 23:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JX49NbLw/imu5a3gQoSE/HYEqmaqAKFCIu6+mIAnbrw=; b=BOOS/NPX6wGS6zvg
	GluggTnkfy2nKk/0ZYLGHqWbtou70j/15Vn1x3P0rM0S47QfD4fLDrxgyfpDid5f
	SIf/lu0SvUEqP/tz54UFZh6ipIVM10O98qxD0pBVjzw7/dKCVHYH8JYakHhNkkP+
	Lg6MpI5JNngWNEHo2UBu47Tjk7Bem0SvVAV78Fz63cM/UeK261n1Zt5o7umoy+q7
	SyOrYpCTn7Nl5G1P/vHZ4RqlaIAJCrTKlyNa0Q9fu7XjEo0KDF7MA8OL+4Ngnbpq
	27Zn7/RocITaK0f+JkWAXNlHM75iSaeKMKWlBnrXzCfzV7hDnVAXp+0J4v1r+VsH
	lv/wAA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbs4j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 23:40:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so92217eec.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 15:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793749201; x=1794354001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX49NbLw/imu5a3gQoSE/HYEqmaqAKFCIu6+mIAnbrw=;
        b=WdNmF/zEQ39akvRZFt7KAYgmcGnaK+C9bB1lv5EkjJrzzP4QfPu7zwX19Nt0oY6BeA
         ijlw+Z+J2exS4a0wZzhAqbsaTla7wZmbFm3P/siVNHj5oxn4yWUTggLwf2gE5fQKffc0
         uER8KGTLwBccwKp7dUbiiMvcNFLfgZHK1B5uLdRUpWIYYrIYDqexnj8zvcgppnoPVAq+
         FSkmG55FliUkLeUfisUc39M2rIJDWzKcKOmswQNKbyUpB1pzxiW3gegP/tEBlDyNckK7
         XJ8mtqs4SucIZsm4QgYTGYGZhWJFMlup/msfDX7nSMbV6ZJ0DS+i/LHgC5YdKeyF7Zug
         g4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749201; x=1794354001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JX49NbLw/imu5a3gQoSE/HYEqmaqAKFCIu6+mIAnbrw=;
        b=T5NHWGAlA0VGjpYnNnvns85XJogpqyW1oNO3V8KC3qvcMLni5pVfwSoiCLfTUaQpzn
         W4dlVTWMaHxk5vKqVvGSKF3/asFJM6K4BeCXwvldWScx9GUHoIosBOo554odnThxSb3T
         Q3IC8GLM/3jPoAICWwIet1VofbLlQkva0Yznr1xjZJwsJjBCk0bj33DTk+NkC8/N0qLv
         RsfFn9Y+dpi+1L+wBmTCkc5mLwt+CecpRVZgw/PHAmGUR70I2mpq2HPCLQ+GjT0LgqwY
         F2OhX//MNb/0GrI+44hFwHuSI2w6HAPQxQi0Puk2hTWaNuJv8DlUc5vKjGOLzXAAaSWT
         crvw==
X-Gm-Message-State: APuU4Z8Swgdqqi75arZK7taX/R26qqv3Q+eOiE9SAFOhWhPcsmgBOBUp
	x0GvUPBhUYEn8e8yDYJFAya0xVEq/qK3nIhoBOTBFb7TkHX91WdAKBld5lZV1GLFkNUlCDJ5pP9
	6rH26/5PyOj8ozGde0OQIms4JNiGWv2q7YEwTcFRTTB3LJac9HS9DNVeDyVLbXXM=
X-Gm-Gg: AYBFou16Mijg9DbkBd2LDB7tro6KsUEt7e3rLFyD4GRB2IcAl9x3xydTlW/FrklPvbq
	dRyDyW5sL3mH2oATzc2ocOpUad54imlPLXdIojxejGv/i5mS2cTDEzCEDitpziO2Rnty4BaAY3m
	+VN6fG5Eixd1hJAVyx/9t6wTl5OB7BAzMVZyuJCy0i/ttikMArFN/V/D80NwTN9POCdrrYRyySS
	tEG9TisXVjOHhnSuONENObSXkneNKBjoiYhg3k+j+bOpi+ree9uVM04fOuOK+ZOshIywH6dwrF+
	FofT9GXuagOa+B2TLe2uDVrhRBMRuyIxHuDHqwGR1YJO9t5ZyxLdUck/LeP1mJWUjflc0yalRxx
	VgiaNdSGij9dSKsUEytexuPpwPJAcz9Is+8yurZMrSXVXnkO7Z9Z36G1P8zkHVgdzJKNwzU/D9P
	17neZsvWoS2NlkRZeuf6/WlWW/3A==
X-Received: by 2002:a05:7022:b042:10b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-1ac5c92da1amr21435003c88.38.1793749200873;
        Tue, 03 Nov 2026 15:40:00 -0800 (PST)
X-Received: by 2002:a05:7022:b042:10b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-1ac5c92da1amr21434962c88.38.1793749200087;
        Tue, 03 Nov 2026 15:40:00 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm2356442c88.1.2026.11.03.15.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:39:59 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:39:56 -0800
Subject: [PATCH v5 4/4] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on
 16K+ page kernels
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
Message-Id: <20261103-16k_offload_v1_b4-v5-4-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
In-Reply-To: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: cMWg4OfuXdx_0936WL0qtbCLxKO-naAU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX5NtTHQFdMmZe
 JnVhcKnWrT2A1iDC1F2X5WlBD8dS1NZ22RVsMgBFNVufAWKu/ECWp01XG/hyUAQ6EIdeVqLAdM/
 j7B7hM+82SAO55El9uo/YEcZq8gyyoY7uWbSCILLIPZq4Us/i5hVhxjurRTu77x+ydbGfdeV3wN
 yMfjM6aEAj2aZwnMmzVUdAnATL1dcbHLciYCums2HGtptDsAR9CCsGr6yBTz9xH59OlVsnGud/E
 YsGSeEzePej/rF2U+1fxCptL0nLWmF68ItoQ4vPe4Ao9WFm3lQdLJNMTCipZb1ehCyFJwDCg/z0
 fpsTVvDb6jHnv5oaSNuFsmqtQX8aCmOKdO1p25HsbpqF26W93Piqs5oxkAu0Ci/f9m9YWRyNNkf
 1MOv8BaO5FzaC4DkeaXncfkH3rKdEHl8ENFj/aekqL9dl/A/sdowVgp2xdm/mHnkvGwV7u1V2MQ
 qzS3Lr+V3ypmgzUVH4g==
X-Proofpoint-ORIG-GUID: cMWg4OfuXdx_0936WL0qtbCLxKO-naAU
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea70d2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jlV98JOHXxtXOl5fqgUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX+FJgwi+zG/f3
 cbsdKjC1EBeQdNJo3Cknla1aYA/VC/g/U4P7YZAtONug9MnU2Sl604GtfrPcx+iJM/jDe0/YsVS
 MV6yOoHsCs+RBxX1MSZu/mOxSLrY2qc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030094

TRB_SEGMENT_SIZE is hardcoded to 4096 bytes, but on kernels built with
a larger PAGE_SIZE (e.g. 16K or 64K page arches) the IOMMU still maps
and unmaps in units of PAGE_SIZE. A ring segment can therefore start at
a non-page-aligned offset within the page that gets mapped, which the
sideband sg table reports as the offset of its entry.

Add that offset onto the mapped iova before sending it to the ADSP over
QMI, so the reported address resolves to the start of the segment
rather than the start of its containing page, and report the true
TRB_SEGMENT_SIZE (the sg entry length) instead of PAGE_SIZE as the ring
size. The offset is taken from the sg entry rather than from the ring's
DMA address, which is an IOVA when xHCI is behind an IOMMU, and whose
low bits then need not match the offset within the page.

This broke the reverse direction: recovering the raw, page-aligned
iova for iommu_unmap() by masking off the low PAGE_SIZE bits of the
QMI-reported iova only works if that iova happens to already be
page-aligned before the offset was added, which is not guaranteed.
Have uaudio_endpoint_setup() return the iova it mapped instead, and use
it for both the cached data/sync_xfer_ring_va and the
drop_sync_ep/drop_data_ep unmap error paths.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 45 +++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 48ee55116004..dd904d72badd 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1178,6 +1178,7 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
  * @card_num: uadev index
  * @mem_info: QMI response info
  * @ep_desc: QMI ep desc response field
+ * @ring_iova: returns the iova the transfer ring page is mapped at
  *
  * Initialize the USB endpoint being used for a particular USB
  * stream.  Will request XHCI sec intr to reserve the EP for
@@ -1189,7 +1190,8 @@ static phys_addr_t
 uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		      struct snd_usb_endpoint *endpoint, int card_num,
 		      struct mem_info_v01 *mem_info,
-		      struct usb_endpoint_descriptor_v01 *ep_desc)
+		      struct usb_endpoint_descriptor_v01 *ep_desc,
+		      unsigned long *ring_iova)
 {
 	struct usb_host_endpoint *ep;
 	phys_addr_t tr_pa = 0;
@@ -1197,6 +1199,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	bool dma_coherent;
 	unsigned long iova;
 	struct page *pg;
+	unsigned int ring_size;
+	unsigned int ring_offset;
 	int ret = -ENODEV;
 
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
@@ -1221,6 +1225,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	pg = sg_page(sgt->sgl);
 	tr_pa = page_to_phys(pg);
 	mem_info->dma = sg_dma_address(sgt->sgl);
+	ring_size = sgt->sgl->length;
+	ring_offset = sgt->sgl->offset;
 	sg_free_table(sgt);
 	kfree(sgt);
 
@@ -1232,8 +1238,11 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + ring_offset,
+					     uaudio_qdev->data->sid);
+	mem_info->size = ring_size;
+	*ring_iova = iova;
 
 	return 0;
 
@@ -1263,6 +1272,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	bool dma_coherent;
 	unsigned long iova;
 	struct page *pg;
+	unsigned int ring_size;
+	unsigned int ring_offset;
 	int ret;
 
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
@@ -1291,6 +1302,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	pg = sg_page(sgt->sgl);
 	er_pa = page_to_phys(pg);
 	mem_info->dma = sg_dma_address(sgt->sgl);
+	ring_size = sgt->sgl->length;
+	ring_offset = sgt->sgl->offset;
 	sg_free_table(sgt);
 	kfree(sgt);
 
@@ -1301,8 +1314,10 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + ring_offset,
+					     uaudio_qdev->data->sid);
+	mem_info->size = ring_size;
 
 	return 0;
 
@@ -1438,6 +1453,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 				struct qmi_uaudio_stream_resp_msg_v01 *resp,
 				int info_idx)
 {
+	unsigned long data_ring_iova = 0, sync_ring_iova = 0;
 	struct q6usb_offload *data;
 	int pcm_dev_num;
 	int card_num;
@@ -1470,7 +1486,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	resp->std_as_opr_intf_desc_valid = 1;
 	ret = uaudio_endpoint_setup(subs, subs->data_endpoint, card_num,
 				    &resp->xhci_mem_info.tr_data,
-				    &resp->std_as_data_ep_desc);
+				    &resp->std_as_data_ep_desc, &data_ring_iova);
 	if (ret < 0)
 		return ret;
 
@@ -1479,7 +1495,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	if (subs->sync_endpoint) {
 		ret = uaudio_endpoint_setup(subs, subs->sync_endpoint, card_num,
 					    &resp->xhci_mem_info.tr_sync,
-					    &resp->std_as_sync_ep_desc);
+					    &resp->std_as_sync_ep_desc, &sync_ring_iova);
 		if (ret < 0)
 			goto drop_data_ep;
 
@@ -1540,11 +1556,9 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	uadev[card_num].usb_core_id = resp->controller_num;
 
 	/* cache intf specific info to use it for unmap and free xfer buf */
-	uadev[card_num].info[info_idx].data_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_data.iova);
+	uadev[card_num].info[info_idx].data_xfer_ring_va = data_ring_iova;
 	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
-	uadev[card_num].info[info_idx].sync_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_sync.iova);
+	uadev[card_num].info[info_idx].sync_xfer_ring_va = sync_ring_iova;
 	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].xfer_buf_iova =
 					IOVA_MASK(resp->xhci_mem_info.xfer_buff.iova);
@@ -1578,15 +1592,14 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	usb_offload_put(subs->dev);
 drop_sync_ep:
 	if (subs->sync_endpoint) {
-		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
-				   PAGE_SIZE, PAGE_SIZE);
+		uaudio_iommu_unmap(MEM_XFER_RING, sync_ring_iova, PAGE_SIZE,
+				   PAGE_SIZE);
 		xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
-			   PAGE_SIZE, PAGE_SIZE);
+	uaudio_iommu_unmap(MEM_XFER_RING, data_ring_iova, PAGE_SIZE,
+			   PAGE_SIZE);
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));
 

-- 
2.43.0

