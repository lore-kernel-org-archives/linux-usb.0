Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964D30568B
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005068; cv=none; b=Hh2nFbEhLXj1YW84Lc15Cww/QqXJeJPOeNl9izJtiJYQ0Q5LhjjUcBj4Iwu/MbCqIGHS6P9/BqQ9w76FaD9UipjokEIIXrMv3KsbH2zDvWNL54f6C/+ebqsSPVnDGc1Zacsdxjv0n+ehJT+9nElJXizF5M9mJq+yMZ/yB6aNcXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005068; c=relaxed/simple;
	bh=FOlFgBzNQmsmf2mxM1qain+v9nwTFgYyvo/6ZqB1Hhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rsKf/5ww9THYTlLvL/tP+4qrsxuCF2zGEyonLPjkV2AOsgl87QW9qNf5CVY9mFqsCTMb9Ct8eGUT/wKxLM0azEVTO9V8wiQ6N48UmPW+5+MR6U/3MHwGTf/7YYm7Kkha5fTAWG1XEWH51cYBICqC2mrfHuYnjJnSVVHB9xV7/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JR4ygGUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyq6ItSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JR4ygGUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyq6ItSP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lRJQ4054737
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SrSZI6Ybjmzh+sw0W1djqr
	FbVUp/nFn43K58gfPIONE=; b=JR4ygGUu0euvgNocvNM3Ix/rArZBvgIXjBlhtg
	R56sLgoTBd/bwQmbev3TPNWOqwsRDCUisEV9Mizk20dreyq83NyBtab0zryReJWq
	rwRc7XNDkVmuLjoNNHbAnFID0nYEnvnsHsYohLGluVyQ4VSERQKVn3ARLIgs2pNw
	b1qPWDZwmg0lhi/347KAsBuSLetPbT1lxepyzvF3ScwsnIh+C1p13w98bu3lDLxF
	tS3JL1wVRM6WSU9soiRapu25dnLWbICmhIb1IxyXG+Q62Mj6puCYxz2+B9cyjq0Q
	E347V+vSlgFOobNnIeKI647kyYfLJQbAcudZ9/b8YqFBbsyg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg1gxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:51:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc487bd6bfbso3916131a12.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 18:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005065; x=1789609865; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SrSZI6Ybjmzh+sw0W1djqrFbVUp/nFn43K58gfPIONE=;
        b=hyq6ItSPWofR495e6cJXk7S/IhC5djxZht6HmDAOC9M+CSbgmYLGuNX5NxNC0z8KwT
         3qRs2Y3iBb/POprsXS0xKqMMnuq586IOXjFDyvRIx/8anv4vfSJVxeo0FK95YRKI2mBZ
         wedH/Dqyik5mwGaybXInYS87GMGWqSfTQAxAN0pMQwlBxaQ9U0nJsBLXYPX0EbxbDxxM
         O5kzgv3aep3PhsuxKrj01At0sx8c1GxwRhTX7gL/+OsuAaLrYtczKKitfjrVk1Ok/i4G
         lqYHYhBD7muCV9raGFHVac4Juu+duqNxThIE2m1Cr2teFxwV/sfqghp1RXzzJLq2issh
         yhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005065; x=1789609865;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SrSZI6Ybjmzh+sw0W1djqrFbVUp/nFn43K58gfPIONE=;
        b=U9Y9sOSGcDfC6FV0PTKra/kVYEhAtRRThHzALpLqsy3Jf15yRdc/rw0sk223/paAGL
         u4uPyPcpPj+Tj3L9MnVNp9WIcQnvUnFIViSC9ZIQqb/W9yFXwrwBjX+tZZFERCcSvSlr
         x9uVwZJ8NwQTY1T5W1YQF7AGiIdtQP6niH9aDdw2g8buE0+gvcGQx5v1MnwpYlzDpcy7
         GezwOvoLMnTTxSCAlefQSpkxquyejOiig5SHxanS/hH46OuOi9nJoUqNqdjwH6dRuY6Y
         JsdwNQO68r1orhgT6Nx7+5xzRyU0kK79WA8YZyGRwJjDeRvFho+wHZOutW2+19VzWGGs
         psqg==
X-Gm-Message-State: AFuF++nCuPXrpZH6fCHMBVzVm98qRMvBkRMLD5TZbDSsHAK1PH6dI6Bo
	tqFjmtctazoQEKC1eD2aiIusEydtq4ztcnHbWDEcI5MoI0KhdQq2mAIeqhoFmciUNZvAzBNh8t3
	44OmaIFi75ul6eBpmn/4SrgY+CMhBVKuBjlRlMCLhfyvzkYN8xMYONwFLHoI2W6l9rTtr2hI=
X-Gm-Gg: AYBFou2umD6G/ROaSOewXuznjYMOlNHnFF4acN+lafMmjayuNxu2WyjKCa5MBQ+W0vO
	7PMTC/Im2ObSRLozEbAcKWWJmykc6rpDV36JZHO+OzpYqr4HxxoIfJmQzxdS+7zY4jN2a9Xgxu3
	sytoEqZFd8cghu5uV2EjRWfsUatwWkon+xtFKJvawERgkSuit2SI9GM8moqEhztPru/nhs2zceQ
	oZ9xeLu1J6DUSOFXRujslHLNue0IHOsWjj0rXnY7P/iYrH+wPnNiwmVuaz940uxMw9mAJX6KEu0
	yLih5FlmpJBdjlQ6OeppOaqwxJdUlk2vFEC7ke+Aw3pUQ35KKwjY6bsNR9HVGi42zWGK2YhXXcl
	AEuEOdmRz51NSChQ/cqLc7XCg5ZurgskjI54VUkI4NdvK+cBFQaI4
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr52970997a91.4.1789005064798;
        Wed, 09 Sep 2026 18:51:04 -0700 (PDT)
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr52970946a91.4.1789005064302;
        Wed, 09 Sep 2026 18:51:04 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:03 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add larger page size support for USB audio offload
 path
Date: Wed, 09 Sep 2026 18:50:56 -0700
Message-Id: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAANomoC/33NTQ7CIBAF4KsY1mIGGJG68h7GNECp4h9aLNE0v
 btUF7qobiZ5yZvvdSS6xrtIlpOONC756MM5B5xOiN3p89ZRX+VMOHAJiiNl8lCGuj4GXZWJlQa
 pqBhKQJgvFkjy36Vxtb+/zPXmnWNr9s7eBmho7Hy8hebxGk1s6P3zE6NAsdDSOAlWC1iFGGfXV
 h9tOJ1m+ZBhJvFvSI1BPENKoxSycMYY+QMSH6gAMQaJDDExL7iqLEdQI1Df90/P6rOcXQEAAA=
 =
X-Change-ID: 20260824-16k_offload_v1_b4-3d1460405774
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa20d09 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8
 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=GjhRyQdd-c_DPEUQ6LMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfXx7MU9vPkkwmd
 4yCue9jElXao3sGvGTEA/CY00ndHg4v6491BvXsjomRj3qKtDFxr9kxyXTWTy4YK8IdF6w/xNxA
 bxO/coj5soGpK4lzDj/o8LUnUepybjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX+8QmuxHnRiKN
 up2V7yF6cL5Zf+qaZLnLb8575oOY0q83CsOB39aTMo4oPBG2mpOV3gnNta4WaLNfTraSbG3brHP
 kgSrJOmuYpleQtHxNp3JXaaHRB7nLTv0QnGXz6y6N/o3iQ6fUTls7InUvQQYt65U8TAOS4XTVuB
 QKGjXC0gyXh2PW7suKcFoSf94Nc41fPpLH+jWMPEfJKb5GqTAa1KJSk04iO+uI3DOeN1r59Tiqt
 tmZ0Z3/EKdSvik8z6KPRzmULxuxj2LDtYr/c2GalqxOGyfZPchS2QGUE0n7tZRg7xNTqN2zWWD6
 jmU9l1p0wjTFhVEduCfQtxRRML8lC2971l+1IzbsESLl0wdt+R+6qZqInaSXNHdGAumgsR/FZUI
 cxOlRDqGopycGQYrEdiucNU8vy49F9EWWa9Ry6ZDD+N3uXzLc46KWNqT8NoJVWwGhfL2X8ZWEbP
 Z1M87lY4cbbd7fg4khw==
X-Proofpoint-GUID: ykq4FHAI5nJ3jX76AMZy5jihjkOauSp8
X-Proofpoint-ORIG-GUID: ykq4FHAI5nJ3jX76AMZy5jihjkOauSp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100018

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
associated to a sideband ring.  Before the USB audio offload path
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

There is one point that was seen during disconnecting the USB audio
device while audio offload was active, where the offload client driver
was pre-maturely freeing the DMA pool before xHCI core was able to free
the DMA memory allocated for the rings.  This is the reason for needing
to explicitly call the ring free during the sideband unregister path.

This was confirmed to work on the SM8350 MTP platform, with the 
CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:

tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card) 

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Changes in v4:
- Split xHCI patches from xHCI core and xHCI sideband.
- Make the dedicated offload segment pool optional for secondary
  interrupter creation. (xfer rings support this already in previous
  revs)
- Fixed some inter-patch build/functionality failures in
  qc_audio_offload. Incremental builds between patches now
  work on 4k pages. (16k support at end)
- Link to v3: https://patch.msgid.link/20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com

Changes in v3:
- Moved sideband segment pool assignment to when a sideband endpoint
  is added.
- Address an issue where during USB device disconnect (while offload
  active), where the offload client driver is freeing the DMA pool
  before xHCI core is able to free the dma allocations.
- Update xhci_ring_to_sgtable to correctly allocate and fill the sg
  table which capture rings within page offsets.
- Link to v2: https://patch.msgid.link/20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com

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
Wesley Cheng (5):
      usb: xhci: sideband: fix ring sg table for sub-page TRB segments
      usb: xhci: Allow to specify a different segment pool for allocations
      usb: xhci: sideband: allocate sideband ring segments from a dedicated pool
      ALSA: usb-audio: qcom: tag sideband endpoints before ring allocation
      ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on 16K+ page kernels

 drivers/usb/host/xhci-mem.c       |  63 ++++++++++------
 drivers/usb/host/xhci-sideband.c  |  97 +++++++++++++-----------
 drivers/usb/host/xhci.h           |  16 ++--
 include/linux/usb/xhci-sideband.h |  20 ++++-
 sound/usb/qcom/qc_audio_offload.c | 151 ++++++++++++++++++++++++++++++++------
 5 files changed, 247 insertions(+), 100 deletions(-)
---
base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
change-id: 20260824-16k_offload_v1_b4-3d1460405774

Best regards,
--  
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

