Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683F83E073D
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953081; cv=none; b=OzFkhvecbzWAToAa+0XVLxtMOe/q+ADdVk5OgwWK87YquISqVhcioPfljtLBQ6zzW1siWwcqfJeYiEBG4DxlV9KwfI/pPl75Vt0CzdyJnuy/Fc3Mob0SE1TZNdKXW7AnQfTGQoBBV/1jj1DXj9Kwxa6xOLomrdUQgbWB3TU3G5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953081; c=relaxed/simple;
	bh=UURJWOTzlG51S41Il7UIJcFRFh6Dd8TWBsizC4ayaQg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QSd9AHL565c6gEynegs0XQNzy4DdIivx5rBgfu5afKzcUazuPl3D+M0XE6Sx0C69VcyspB9TQbERk+3qTme5M4h8F7ytUaW516j5DNP02IK4DCikNNPNpB3EtWLNcpAUJRxeq68aDBA/cbT8iPAHS/wB8pqj/545twUKAkJIzgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ls1RiNM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYGLuPfi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ls1RiNM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYGLuPfi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SKdOn04186541
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=01DPMXErymuRJr9NOQUo6L
	zOGxM7Id9WaWkgeaHQ6aA=; b=Ls1RiNM19zTQMp0w8iyjgXzAqGNSYLr8LgCpmP
	R/RlycYODF52ROl2vFQvj9Z6yJv2KAyO9gMFXZbC9wBS+704m24/Lo3zqD5Tl6iK
	EdV7+mpSp0VwE/xbybLhRnD8SdB6Se0Zq8+qzgHtcGnB3LOwPmWGHVPH0Q5E+D3C
	3oro6GoTwdWWxGa7X9wvxyFF4kOkzzO9FFBEhACw+lNLZTkWUdr5AlTK19UtKNpg
	ZFdIrajNHN6qTRJZhZYLV+GL5W6vZgZZ1jEFUwm34qvxO5FioAd/2loGFnnSo0ut
	pELZ1dMdydv/S1r1Gvxx/lz4ZwM3wbv7tntnIH9VTovScOlw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h336s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 21:37:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1219132a12.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787953077; x=1788557877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=01DPMXErymuRJr9NOQUo6LzOGxM7Id9WaWkgeaHQ6aA=;
        b=YYGLuPfisb2l32Zp5y1qXT70xAhJcsC6ZMBUGrYvpjbecKdv0zdVIZAbPwb1NPN3JA
         YEq5wjufRK3J9cI7wmHvQt9dZG5oHqTAj7IN+/CzJo4eV9mh0Wj17KTHkQUO3l3Yw7cP
         pHCiI1nNSXwOoNYF7LYc7NjkM0mTAntalJyciIT8XBIi9dH3Xh9XipN4Gc+vQ/nx7a/X
         3k9yr3WHHvPFR7/4BX+nK/0Dm1AeoDpM8abGK6OsZiXyR73eHeFw4EvBPSmpTEyM6pVZ
         c4NQpcwh9ALrghAd3nGMZDNOw5nRqwrw72qiW381TlhLsuTX5DChsQtwyrdIQ5wUQ3xN
         kAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953077; x=1788557877;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=01DPMXErymuRJr9NOQUo6LzOGxM7Id9WaWkgeaHQ6aA=;
        b=MBf9xgzDQp5CRaiqyTYXj2C6NsR6qPbMSHCUuqfzCTEAWj+nxUw3vYNobqgrQ08Nbs
         oHPybgDKVuOQXpzjsma/DcoH9/vdHv9YfqpJmPta1rwqNKqUpSQsZluD3gz2gmdYDw5j
         r/TSzgJCq172giZIjHsArj3Zqq0masaZB+CHKVozLllb1mOaIcNfeYUIBeo4BpIwT7XW
         udFn5Ys4JIRxNh+OXgcWhmfiEaNcW30rvxFkCKzBdsOgfWAZw/WLtLnzEW7rWAS4Xmf6
         kXl1yLuhjg0X3QInaoPSfQphiFtrjLQJPAjRA0S71HaIprpaVyOU5gRcIVh+9NhkvNpw
         9tbw==
X-Gm-Message-State: AFuF++k3/2ps0XbVR8kHivVmn4As6Xwe+bnHcMQKnTPQFiUoBs/wMZFH
	J0y/61XJl0OxjDZCudZba2WPlX4C+WzaU80jURDD9q8OJ6hjVLS3M+bUC2QJeYKBGK2gP+7zfQY
	GYLh0AISgH/2CX/QxpdWvCRQghftAK4z3zx3mH2/VI1bO7MBxxv1qTyzkSi1j+iw=
X-Gm-Gg: AR+sD122+MG4iTfUgWm9jboYK3OHd5u5tdGP6vLU8FWAbUq++1SDgWjOGXixDbmtHLn
	8pxeR0LCHt8ytHX//cV0sRp/ldk4pApVo9qfWESzZ8MvygES4SYa0khNGmHqZYR98cn/9VrWZ6E
	TrrL7SrtfIpOH2NUdniwEfzXdUj8FloER+EwAE5yUyyRcQ4T+YbaykItMd8/wUd4gveC5DcJaab
	O/gNkEytFNTjjw3D/EciBzevOzv2p+wEOPrc5u8SI0RXRQwcoQGRoBfobLGohkDRx9kqE4mwtc/
	fk0lQTT19e93DbQTxgATduKssO2g6ApX72bAnOsSPMNqkKc7RxXDEbrLdkdVRf1TO8cQPtHTlbj
	Ri/Yg/nt3q8N3fisP+j1cxgY3vKwQQP6W6upNS3EzC5f4JSatxo4Y
X-Received: by 2002:a05:6a20:430b:b0:3d0:c5c0:d9b3 with SMTP id adf61e73a8af0-3d269b4f03emr17392804637.18.1787953076843;
        Fri, 28 Aug 2026 14:37:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:430b:b0:3d0:c5c0:d9b3 with SMTP id adf61e73a8af0-3d269b4f03emr17392752637.18.1787953076346;
        Fri, 28 Aug 2026 14:37:56 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm5892112c88.11.2026.08.28.14.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:37:55 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add larger page size support for USB audio offload
 path
Date: Fri, 28 Aug 2026 14:37:52 -0700
Message-Id: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALD/kWoC/32NQQ6CMBREr0K6tqQttSgr72EIKeUjVaDaD42Gc
 HcL7t1M8pKZNwtB8BaQFMlCPASL1o0RxCEhptPjDahtIhPBhGInISlXj8q1be90UwVe1ZJmDZe
 KSXbMc0ni7umhte/deS1/jHN9BzNtoq3RWZyc/+yngW+9f/7AKaPyrFUNihmdsYtDTF+z7o0bh
 jQGKdd1/QJxqlBaywAAAA==
X-Change-ID: 20260824-16k_offload_v1_b4-3d1460405774
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfXzQcOhNs3a8gR
 r/QOWQbA+C+0vp8KHorzeV4VZXOBqoXL0zG/MQYPs/dmL8+nw+ydpUqdJNvfumzuUbLmPEVp5/G
 ODIihT2GNHiSFqy+eJyqRg/IRhUCFMU=
X-Proofpoint-GUID: K6g5YR4lyeyDd1DGsUyKLpYxI4uBjFzu
X-Proofpoint-ORIG-GUID: K6g5YR4lyeyDd1DGsUyKLpYxI4uBjFzu
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a91ffb6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8
 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=nKvUht_5Mi2ac9G_QM0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX4fmkZulDf/vC
 OxOxRc0oHMz9mem23Lzgdw5C9MGRodHCs+eSZetqg+kSUM5mHTkXwx1WoJcP92Fdy6FcWKLbTrL
 LhSsjndMiH02S1Wx26eELS2ZBH7ADePCyiHNuw6jECtFXGpEEMhQTKT+c9UIZ1U1xksrIe4VsDC
 s+Ss3HM1pfpniUhUjYyAqWj6nJlpE265cy8O9zpLuwQ8mrPlwFhJVpRDo7J798WfLZEmB/NuJCU
 BJzp7fgBh/HQZIkTt1yM/pemK7M4sjcyvLPIJLLHUIm6WkyWLxy6LxABC9T4I2/X5o7iIt4XXZ8
 FBkXrvt6lnbtlKdaiJlh59G8Fu33rGZfFGo/BxSxr0utjVWSXE8qlnl20lEXT0z4uALU+9NaiLz
 lSK6Abk0Na9n4OLoao9ghvsHmZ6oiDX+B+oLTyQ1pC2343yJ4WB7m1SR65vyljwL9kPRZpoRhpC
 r6+HN43DbznRziMHjtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280188

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

To mitigate this, this series introduces a separate segment_pool
associated to each sideband instance.  Before the USB audio offload path
is enabled, the USB audio data streams/endpoint are not active.  Only when
the class driver issues a usb_set_interface() call (done from
snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
resources.  Which pool is selected is all based on if the sideband path
is being enabled, and if so, memory can be allocated from that pool,
which expects to be owned in conjunction with the audio DSP.  This
concept allows to keep the same model existing in xHCI, where multiple
4k segments can reside on the same page, which reduces potentially over
allocating based on the page size.

Likewise this mechanism also allows for the offload client driver to
determine which SID is associated to the segment_pool if it decides to
map outside of the Linux subsystem.  The new ring allocation flow for
sideband/offload clients will be as follows:

qc_usb_audio_offload_probe()
  ├─ segment_pool = dma_pool_create(...)
  ▼
xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool, notify_client)
  │  sb->segment_pool = segment_pool
  ▼
uadev[card_num].sb = sb

handle_uaudio_stream_req()
  ▼
enable_audio_stream(subs, ..., pcm_card_num)
  ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
  ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; sb->eps[ep_index] = ep
  ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
  ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_check_bandwidth()
  │                                                 ▼
  │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
  │            pool = sideband ? sideband->segment_pool : xhci->segment_pool
  │            new_ring = xhci_ring_alloc_from_pool(..., pool, ...)
  │            ▼
  │            xhci_ring_alloc_from_pool(..., pool, flags)
  │            ring->segment_pool = pool
  │            ▼
  │            xhci_alloc_segments_for_ring(xhci, ring, flags)
  │            xhci_segment_alloc(xhci, ring->segment_pool, max_packet, num, flags)
  │            ▼
  │            xhci_segment_alloc(xhci, pool, max_packet, num, flags)
  │            seg->trbs = dma_pool_zalloc(pool, flags, &dma)
  ▼
xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()

qc_usb_audio_offload_disconnect() / unreg_xhci:
  ├─ segment_pool = sb->segment_pool
  ├─ xhci_sideband_unregister(sb)
  ▼
  dma_pool_destroy(segment_pool)

Similar logic is added for the secondary interrupter path as well.  The USB
offload class driver calls xhci_sideband_create_interrupter(), which will
be responsible for allocating the secondary event ring.

This was confirmed to work on the SM8350 MTP platform, with the 
CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:

tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card) 

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Changes in v2:
- Moved from using alignment_req to having the offload driver maintain
  its own segment pool.
- Fixed OOB condition seen in xhci_ring_to_sgtable() and will capture
  page offsets properly.
- Addressed inter-patch build failures.
- Link to v1: https://patch.msgid.link/20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com

To: Mathias Nyman <mathias.nyman@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org

---
Wesley Cheng (4):
      xhci: sideband: fix ring sg table for sub-page TRB segments
      usb: xhci: sideband: allocate sideband ring segments from a dedicated pool
      ALSA: usb-audio: qcom: tag sideband endpoints before ring allocation
      ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on 16K+ page kernels

 drivers/usb/host/xhci-mem.c       |  64 ++++++++++++------
 drivers/usb/host/xhci-sideband.c  |  22 +++++-
 drivers/usb/host/xhci.h           |  14 ++--
 include/linux/usb/xhci-sideband.h |  22 +++++-
 sound/usb/qcom/qc_audio_offload.c | 137 +++++++++++++++++++++++++++++++-------
 5 files changed, 202 insertions(+), 57 deletions(-)
---
base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
change-id: 20260824-16k_offload_v1_b4-3d1460405774

Best regards,
--  
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

