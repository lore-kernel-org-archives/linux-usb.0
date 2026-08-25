Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2222FD69A
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787623627; cv=none; b=PRjy4vnUxnpBHCaePqSZyKKEom5tbRRe+orx2pz2GRf+RvXfQ1hkd7NeOU8osIdYXeSA8SNfC++HaE4OAhz8Yryq5TZqMIBrn0JvBhGEFdm0+l/fZAqOwqNfY97AJX608rGfFUwUoaUCw5iEgTMes6X2wl6H1sY+jSkoinVnfew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787623627; c=relaxed/simple;
	bh=bw2Fd23QEAimVApVFr9wzGRKtfj6Sd+7SDjVor0fsF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AW4ogRE+x2BHAyXg9sEm2i1Rd8HvEW30YcojB8P9ajQRl44yQ1VNioRWlYbnXhFmW0EjdR8rLQ/4NPt/tOLvjxtWmbDz0+Vv+H7AZsEYbRuBIpalcT9vyNq/hYoKe9lzoOV+Jah7PlY5SgaLgSot2vplggkSThhQYkFb9OCW5ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPqTQJXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDhLNxks; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPqTQJXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDhLNxks"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONMtK23932851
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=av7/GH7IP/rHCRO9ZppODb
	PhIB4IzyTdKOTfy8bl7tc=; b=NPqTQJXCzr7f8yAYoaaonvvPeB9IAmMvqKDaQV
	mOOBj1qBWDIxGon5vf1+S7ZEqKgOR0Vptl1uhAbURIwAR5lYTonXCbDsqYD2n5yT
	Av1p7GTEqHKDVLrhMnovM31rjiccNtGTqjw9PIXO9wP5oMQDhKyfglhMWVzuFCks
	8n+kpZCyc4sBbXuHQyAHd+VBBU/FlbxVp8kzzkVxZEgz9TMIPRmmowc4z03Q3vkC
	HfUuLB0Y0rDUv8qLPgsKsjfCn5VobcJbxDp3a37x0DcGOgG5pvP5vxzWXB96/Wm4
	rlqLAl+c3NLXSZ3C4fdA54xP1VtH75qZLOvYC2AwWHlyQq5Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8rquj3ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso58538735ad.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 19:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787623619; x=1788228419; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=av7/GH7IP/rHCRO9ZppODbPhIB4IzyTdKOTfy8bl7tc=;
        b=cDhLNxksYjmFFNkIDkOZM4ZmhaHcAjSLrhHUflza3fXUOtpD0eWIxJ1u4hVe5Na3Pd
         jwddRi1F33m7xn8jSd3T4JZGE9br4G8VRks3+ty71GGppEsm9DMthfdTGw3uW84rDUSt
         KGpn4CaTuVljlbnKYHzhv9JGL/lOo1Y/QgP97AA+T4QEkckP/5phNLdsv0IKE3ahU9eR
         JMi/W6ouQqbfO3QZi4H2bDziih/2P+YQfjrFfDKprjUuY7yApCRNnV29u6KP5CHlTNlX
         nEnu12OR46SNoP7HqSXIJqh/kXn15RX4EomgGLDJ9hTLhQmVexxb1d2sIM+YODGBGw/V
         KenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787623619; x=1788228419;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=av7/GH7IP/rHCRO9ZppODbPhIB4IzyTdKOTfy8bl7tc=;
        b=TiS9dNLDA/CpEA6noBTaFycwiTvrnfJDe0h6CyDwWr3UAsE5OKJnTrxxSwbklFBnY1
         X2xx44/4KfYBv3/VDVtqNnOkRuEEro/0LRBmv+hwelkK4YYxVJslwqHThS8L91PVLsQS
         rZk8pIZ7AOIeLd7mTYSdXzFwmyccJNnkFHNy/j5Ea/h2y2EPArA7s8N1Q8EX2ZN3UOXq
         fIIedC6jeewZ+n3DRTNFgZsHSvVtl2oGYz5OP2qGEyOstHKn4MOBqumV5Oxc+lEFQU5W
         htrgEfsl3glB+Cv5ac2nOGRGllSOWNHE6ObObhaLKzpoZNM4EBrA95bBJJZQ8EIcMOUE
         1bbg==
X-Gm-Message-State: AFuF++kCgns2OCEvwn9JMXQBixCAXFn5HJi6abhXa0UcN8cErBgvvbaE
	zrnTzqPBOJBZs/utUGh8EY3L48oYtHLAOefmDRY0TT5xAi5dbK6Ecq7VcHVNik9Yc4Fkv/t8oba
	qJjKEkhsIwKuxOtL0JFna4UpKv7LMvGKEQUYaFucJKMuTjd41ldiMtdpyZgvYG70=
X-Gm-Gg: AR+sD135rNhir8VBoEyG6zZ15iHobboBta+kUZZAhRoF5FBTsPIgkl8+wuRipQffyLq
	SiUwgu7YRpfdkT4VnSOBaJIgrpbG3fbfIzmNKApFB23MpQxfifVkUG55Lr2PWwmDrlXDJGWwPkX
	ivlCOGVFvOLBCfZulifLovn4oLm5DNNZCzcQmSjM6WDRYjYwwcaN16LwdIOroJ7Z0gRyx0ycLa4
	pEDXslYTDYoOOiE8xYctaIYC0K1bcI3cK8LB1HlubVvUDfKAhA5+LZZFG0Ii7Ozv7LGPPfKqVv5
	tJrYs6wO0iENv4qhrOVkkKubHRmYxpSKEw2826Lje2DlvJCbaF2S14ClowFkCD4w9DSCzOzItgE
	S/ZPYPXeWvejbLK5nogf+TSDmP2oYd32rAcZvoMVV/GmA2pyPO02Y
X-Received: by 2002:a17:902:f685:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2d670d5a2a6mr397085785ad.12.1787623619408;
        Mon, 24 Aug 2026 19:06:59 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2d670d5a2a6mr397085055ad.12.1787623618972;
        Mon, 24 Aug 2026 19:06:58 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d33dcsm39442376eec.18.2026.08.24.19.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 19:06:57 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 0/2] Add larger page size support for USB audio offload
 path
Date: Mon, 24 Aug 2026 19:06:54 -0700
Message-Id: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL74jGoC/yXMQQqDMBBA0avIrA0k6RhLryIlqJno2GJKUkUQ7
 95Ul2/x/w6JIlOCR7FDpJUThzlDlQX0YzsPJNhlg5bayLtGoczLBu/foXV2VbZDcXMKjURZ1TV
 C7j6RPG/ns3leTks3Uf/9j+A4fscOBAV1AAAA
X-Change-ID: 20260824-16k_offload_v1_b4-3d1460405774
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: jck6P1MLJqdbgJXBQQd0tkRfXbx8Ec5D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxNiBTYWx0ZWRfX3SfiSEnI3yOk
 CH1asadoApD0EPt+3/u37dDJT5v2b8JoQ8/Brt4yiy8175PbQxlbcXVW5KK2YVOZWTGkXSt+RHM
 vQWCAymIbzs7xd6Ejc3c5AHocsq0HBY=
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a8cf8c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zSXbKknVTylPcft043IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jck6P1MLJqdbgJXBQQd0tkRfXbx8Ec5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxNiBTYWx0ZWRfX8A1dCAjLyVI7
 wG/hh97clpGQMWwWj60VEoaW4hBrrTbTn0et9kNvruRxHdXJCfwNGrlNG7Q35eZXRBEOY/ifHZC
 6/+4xfUIzNT3jKQzAA5jjQ8rE96+GKSry2se4u98afXX2gVE835UThdj8vsxKcJ2nY6OKVGx+cl
 78mtbqap4ZQFcTfq1chliYVSKXqzHLzWe98V1E6SheY8fCioAfZoQgNz3xClavMUdw0ad21BZgq
 Rgu8++ApA8oV3WLKNvfGJktMDiWOF9EEA6/UQkd7MhRgQsojxvMHDakBP4Wl3A3rsNqxi2rN7FW
 IXQBI2b+NvIQisMM1qgPEW6V0u8L1byz0uW2vh5BfsILw5Qr1mlKxqXRuAkrblKaxbkhzyJc7jw
 pTePz8xh4fMJ0+TDOoelOL0kb0e9eAerGHATEMMMyBhWMrrgLEXTgCCUkgffvVLNTmKxDUWzjOS
 8DyNOvQm99kpAmODIHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250016

On some environments, 16kB pages can be enabled from the Linux subsystem,
which manages the IOMMU mappings for the audio DSP within the system.  In
the current design, the following assumptions break when 16k pages are
utilized:
  1. xHCI ring size is equal to PAGE_SIZE
  2. Ring addresses start at the beginning of a page

When the USB offload driver maps the rings (w/ the audio DSP SID), it is
set with a 16k granular, which is a problem, as several xHCI rings could
exist on the same page.  This is because the rings are currently allocated
from the segment_pool.  Hence, potentially mapping non USB audio related
rings into the region accessible by the audio DSP.

To mitigate this, this series introduces the alignment_req parameter.
Before the USB audio offload path is enabled, the USB audio data
streams/endpoint are not active.  Only when the class driver issues a
usb_set_interface() call (done from snd_usb_endpoint_prepare()), will the
xHCI allocate the transfer ring resources.  By setting the alignment_req
beforehand, when allocating the ring segment, it can fulfill the audio DSP
alignment requirements by allocating DMA-able memory on the fly (based on
what is being requested) versus fetching it from the segment pool.
Likewise, keep track of if memory was dynamically allocated to handle the
free path properly.  The function call flow will now look like the
following:

handle_uaudio_stream_req()
  │
  ▼
enable_audio_stream(subs, ..., pcm_card_num)
  │
  ├─ xhci_sideband_add_endpoint(sb, data_ep, PAGE_SIZE)
  │    │  alignment_req == PAGE_SIZE
  │    ▼
  │  sb->alignment_req = alignment_req
  │
  ├─ snd_usb_endpoint_prepare(chip, data_endpoint)
  │     → xhci_check_bandwidth() → xhci_endpoint_init())
  │    ▼
  xhci_endpoint_init(..., ep_index, ...)
  │    if (sideband && sideband->alignment_req)
  │        new_ring = xhci_ring_alloc(xhci, 2, ring_type, max_packet,
  │                                    sideband->alignment_req, mem_flags)
  │    ▼
  xhci_ring_alloc(..., alignment_req, ...)
  │    ring->alignment_req = alignment_req
  │    ▼
  xhci_alloc_segments_for_ring(xhci, ring, flags)
  │    xhci_segment_alloc(xhci, ..., ring->alignment_req, flags)
  │    ▼
  xhci_segment_alloc(..., alignment_req, flags)
       if (alignment_req > TRB_SEGMENT_SIZE)
           seg->trbs = dma_alloc_coherent(dev, alignment_req, &dma, flags)
       else
           seg->trbs = dma_pool_zalloc(xhci->segment_pool, ...)

Similar logic is added for the secondary interrupter path as well.  The USB
offload class driver calls xhci_sideband_create_interrupter(), which will
be responsible for allocating the secondary event ring.  The same
alignment_req parameter is passed, and during xHCI event ring creation, the
same set of APIs are utilized, so the runtime memory allocation is already
handled.

This was confirmed to work on the SM8350 MTP platform, with the 
CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:

tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card) 

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Wesley Cheng (2):
      xhci: sideband: support page-aligned ring segment allocation
      ALSA: usb-audio: qcom: request page-aligned xHCI ring buffers

 drivers/usb/host/xhci-mem.c       | 70 ++++++++++++++++++++--------
 drivers/usb/host/xhci-sideband.c  |  9 ++--
 drivers/usb/host/xhci.h           | 11 ++++-
 include/linux/usb/xhci-sideband.h |  7 ++-
 sound/usb/qcom/qc_audio_offload.c | 96 +++++++++++++++++++++++++++++++++------
 5 files changed, 152 insertions(+), 41 deletions(-)
---
base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
change-id: 20260824-16k_offload_v1_b4-3d1460405774

Best regards,
--  
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

