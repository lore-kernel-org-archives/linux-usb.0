Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278303;
	b=NvrwaCP8DvjDHQKYLQcCLNwosn+Bv/KhOHJCQ9UtJdnnls4k5tsG0q1zzOomi8TuR87F
	 YsHQZQtFMpOg60ZIM9BOSHTjsxhbgmhn+7TnjCpEQJNzXW0lw141B4iWMY7/MCz9vPJFE
	 JJXVh/JRGoi7HxyUd/4kBwYRAr2PauEUl9kYvRgvKHxbCDk00oIvnzy0mm6CI/Az6gabQ
	 1l0sU0ZlG5AHL74RvNIbD3uayqPgp+454wjUo0j1i4DLqyK+SmWfBhh3uiRhd2pfOaE5J
	 h1UPBniq2LeGKSgh+wlXtkVWiQL4Bo3FoJpyXXqefwXcpZfcha1M6loUZ+lAPaVSsHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jwqr5KehRf0JAKmVDZO29o8nyAPbE63SU7MvF9tuWS0=;
	b=hwM/7RdvT7JJoELeO0ceJIRhDO7OTnqnQaKLgi8Zf67qYq6ygI67qrvsDukO/2na8c5o
	 0Yy4J9YCZ18caJma/B8QMx2+Kz4NDeJf3R+AeeCy9kXzpTlmX5cOEw2rcEkmiNO77qcsi
	 Lkh0jB7rPn0b4l8BlngQE83W87NF85AKeRHCRmVzna+hQGgeC8UsXwibrZ196hu1zFTpz
	 nUNXW4EctpzAm/OaOiAEYvJ14LI/hku8wkjfBf/UM3IfrjGFMUQc6qBoPslgesxjTJIvT
	 aDmKcDICF9UOdz1WQL8/0Cf29rvxMmqFuNaenvCJs9AvpOxpS2j/9mvK4jmDGm/icRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nl2YDSP0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3dsJJD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FD606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nl2YDSP0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3dsJJD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0irsc887512
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jwqr5KehRf0JAKmVDZO29o
	8nyAPbE63SU7MvF9tuWS0=; b=Nl2YDSP0gF57gn+DbMgf607+r6oMJNjNp+UPA5
	zBGIsU8XTMmlgA5uK5l54yHLVl3gmz/OTCgHNFexWCYg2dN7RtbtdRkFzTcCpM4R
	f/vG/qA5R6zEVrxHFrjzUekwNHUaT7oO1hJSHJuo9YvwoHjkg3NByJXcr4GxzGRW
	9XG2i60dPkzKGHkKAFVhjGw48dZd5HihUlQgxtUb4dH2Br3Ua5xpo0XTTT0Zd5Wh
	mN5J5CiFFxIrJfy0NbRQP/+atACgum8PGQv0H+Tm0HFmvwDHpJWA1DVmeseo7wGR
	CdDze8SK0W0KP+uoQqG3IdaqKKndgwc2L4nhB2mWT/rCi37g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjb1tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:38:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so439884eec.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 18:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794278301; x=1794883101; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jwqr5KehRf0JAKmVDZO29o8nyAPbE63SU7MvF9tuWS0=;
        b=eW3dsJJDklRvldzzJK1y6MwaNMvFkfTETucQ8euLrPPFYyslFc/4gzUqlP2xj8Mp78
         0FAJDJPoZ+MQUr+DuAyUijwEQhYe17u4U0fiB3wWtJyCpIUkDQ77s9aOkNX5BlcoGZPc
         5LggEM8bqcY+pYBdpK6rinS7IEGFwR5BbY7o1Z9Xxpr4FJlDBDW3dm6XGfaL5PqkEA0c
         fYoXBosZRAlW8eSVk/0HLVuAI5ZCDOB498jMGtFSK+KHjBZanyOGiokYqE2Mv3iG+xVr
         6+Ua5d42YRoAh1Wb8LhvSObvUdfy/u8alm6GhmoHm3UDmT2yfiy/It+ilyBOX87zKHgg
         ortQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278301; x=1794883101;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jwqr5KehRf0JAKmVDZO29o8nyAPbE63SU7MvF9tuWS0=;
        b=l/rI2uyIwk/QoVdWlvPKSj7EzCLjTyracRCz7CIlM22/yWZVmw/DV3mMm/+5thiFsV
         eEn6de/k7t33V7hDF8Em9lZ7lZvlFrCv9UdQLgL1Y2exZ9m8ON6TFPlV2hn9T3DsDNQv
         wgUsUb4Ba6p+4WD3Etd4fdYy4eqzpy9ATyEq6afqsnmL7klAWws05A+V7tH/eAdLty5m
         os4bXtjeJJ4ecAAvSZ2RvWGdSsFubp8ihZLKLma8u8iFHK3Q7MBNamRGTz3AXOIIOcZ7
         3UjEx1w+Ep2yv9DY4knEoczk5nJNO7c2R0Vad0b99dbTB6kheiUP+aEMQVTtOyFuV7iW
         Ma/w==
X-Gm-Message-State: APuU4Z/CJxcZOd0YmY470BdvXpGhsZ5D3n4h3apHvRTwyOvjqnJUlZ2J
	ff30kFXgNcCYaKIwewd8xlHzmXpqOm0OuuOmdNgNS5lDNFYQfXKuG94vMgEzxgsMAkZ0G6jweil
	AQYftbmbzT6is/4em+jva5dKnvUFGUBHUs8uug2S2tDZNgv1UMaDt5PS/Uuz4KFwb3x03cX4=
X-Gm-Gg: AYBFou26nhIjL3ohg/NYsaESOfcJnzPRQ9WNX+6ue+XpKIlhMvOc7+NiwtaU3oKfici
	skBOXeB8A7E9Ht4ksYNtY8RPYZHanaPaz7s7hnv6bBVlmeVW7MVfAakXbOlCo+LQNoJYF2OUqQB
	hVd1BQkFyhNq22FVugz+CBmtZitcEWDIl90ip6c31YHr0hYYvKcAp3j+iVUZ1UlgpdmrD65DBDC
	jtGpfp5KWKxxHE56Q6G4IugHv/rYT3g3+twrwYyGsAtNY5NxWJrdaB6asuI0nsv9+97SdvYSrq9
	kY9AlZ54LrWZwxPSIUftuV+z1vMt1WzuQClSdY2ZIeN09y/klxwHdPC3tU3vA2xSn7ap86cwHFC
	V436o6ACvCRUeMG+kNs3PdlOA9ONajyDFZR4v4WGQKDikxnuKLI4l6Wlux2ZSX+9G3KEkhgv/IR
	I+HXmnnJ1ejLKCITUltiqQEXKL
X-Received: by 2002:a05:693c:80ce:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-3751c92d397mr1493937eec.5.1794278300639;
        Mon, 09 Nov 2026 18:38:20 -0800 (PST)
X-Received: by 2002:a05:693c:80ce:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-3751c92d397mr1493894eec.5.1794278299831;
        Mon, 09 Nov 2026 18:38:19 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm3800183eec.22.2026.11.09.18.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:38:19 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v6 0/4] Add larger page size support for USB audio offload
 path
Date: Mon, 09 Nov 2026 18:38:06 -0800
Message-Id: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI6D8moC/33OwU7DMAwG4FeZciZTnLhushPvgVCVpCkLbAs0W
 wWa+u6kQ4IdUi6Wfun3Z19ZDmMMme02VzaGKeaYTiXQw4b5vT29BB77kpkUkoSWyIHeujQMh2T
 7boLOIVc9IAkUTdsiK3vvYxji5818ev7J+eJegz8v0NLYx3xO49ft6ARL7z9/Ai44GksukPBWi
 ceU8/bjYg8+HY/bMthyZpL3kK5BskDaIikywTlHK5D6g4xQNUgVCFRjpO69RKFXILyHTA3CAg0
 SrSaCtjHtCtT8QgD1j5oCUQsaQVIw4CvQPM/fOffyT+8BAAA=
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: jkpa8Q-690sv2jS7SO68xFFgMEX1eh24
X-Proofpoint-ORIG-GUID: jkpa8Q-690sv2jS7SO68xFFgMEX1eh24
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2839d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=QyXUC8HyAAAA:8
 a=ag1SF4gXAAAA:8 a=iox4zFpeAAAA:8 a=GjhRyQdd-c_DPEUQ6LMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX0BeeBy9GblGO
 tuQ/aPFBTUXGvd5v1wbiuJShcv4Y+U9ur7ztH4YDA8CCTXYog+F1DXkcYga9ecSF8sypOPlli4Z
 zN0hO0Pjr2iSQeKeCQGjKkJfxvS8HAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX8sT0WPQGfSpa
 VR9xtelwQwPkjQxbC2Ln3/7Dm3JJ/5fuqWvRK5BGE7lwhc4O2xZU3NySSmWzQSxm2oOGwUHtrhs
 Yt8XJww5lIl5+dmSy1OOMWamhPiFsx8+pLpYPzB7dt35shB8RCb9yu4oEXx2pfyE0Q0Za1Ss8wB
 hrlzk2r5WbX09Aka++tvjHQPqGSfnnePC/m3/NOyQjUei4zDabQ+GzHbDVk2gW0t9f+Aps4kLmf
 fIHZXmy/tymX09KVdCs2hHwbN+jCKtzK+b2tMgkdMSnNti2h+0KJHdU6NqjU+jE7HrOX6aoOH3X
 8+uvVKR2OF4LLZn2DbD+Yzer0v0gj6WAc9c4B8dZ4NdoMAbjCColcbXeAnKkXL70I17MAej+BVu
 xfXg+mWjiCNR0faBBrJxfivqmkVRPNRoycShMTl7GLr4d7p1a4uSOwEeNbiM+zRXVINjpjdF48X
 Ej6BhpSXzJ+HxteGlnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100010

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

To mitigate this, sideband rings are no longer allocated from the
segment_pool.  When PAGE_SIZE is larger than TRB_SEGMENT_SIZE, xHCI
allocates the segments of sideband-tagged endpoint rings, and of the
sideband secondary event ring, using dma_alloc_coherent(), which gives
each segment a page of its own.  Before the USB audio offload path is
enabled, the USB audio data streams/endpoint are not active.  Only when
the class driver issues a usb_set_interface() call (done from
snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
resources.  The offload client driver therefore tags the endpoints with
xhci_sideband_add_endpoint() before that point.  The new ring allocation
flow for sideband/offload clients will be as follows:

handle_uaudio_stream_req()
  ▼
enable_audio_stream(subs, ..., pcm_card_num)
  ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
  ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; ep->no_pool_alloc = PAGE_SIZE > TRB_SEGMENT_SIZE
  ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
  ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_add_endpoint()
  │                                                 ▼
  │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
  │            new_ring = __xhci_ring_alloc(..., ep->no_pool_alloc, ...)
  │            ▼
  │            xhci_alloc_segments_for_ring(xhci, ring, flags)
  │            ▼
  │            xhci_segment_alloc(xhci, max_packet, num, ring->no_pool_alloc, flags)
  │            seg->trbs = dma_alloc_coherent(dev, TRB_SEGMENT_SIZE, &dma, flags)
  ▼
xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()

Similar logic is added for the secondary interrupter path as well.  The USB
offload class driver calls xhci_sideband_create_interrupter(), which will
be responsible for allocating the secondary event ring.

xHCI core remains responsible for freeing these rings, once the endpoint
has been dropped or the slot disabled.  This also covers disconnecting the
USB audio device while audio offload is active: usb_set_interface()
returns early as the interface is unregistering, and the rings are freed
later, when USB core drops the device's endpoints.  As xhci_free_dev()
frees the virt device with interrupts disabled, where dma_free_coherent()
can't be called, those rings are freed after xhci->lock is released.

This was confirmed to work on the SM8350 MTP platform, with the
CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:

tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card)

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Changes in v6:
- Reordered patches so that offload works in between changes.
  Specifically patch#3 added a change in xHCI sideband to require
  the sideband ep add to happen before ring is assigned.
- Fixed sashiko bot warning about the cleanup path in qc_audio_offload
  during error cases.
- Link to v5: https://lore.kernel.org/r/20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com

Changes in v5:
- Dropped the offload client owned segment pool, as suggested by Mathias.
  xHCI now allocates sideband ring segments with dma_alloc_coherent() when
  PAGE_SIZE is larger than TRB_SEGMENT_SIZE.
- Free rings that are not allocated from the segment pool outside of
  xhci->lock in xhci_free_dev().
- Modified the xhci_ring_to_sgtable sequence to address an error from Sashiko
  where it questioned the safeness of virt_to_page.  Leverage
  dma_get_sgtable, which will call the appropriate DMA mapping
  implementation.
- Link to v4: https://patch.msgid.link/20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com

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
Wesley Cheng (4):
      usb: xhci: sideband: fix ring sg table for sub-page TRB segments
      usb: xhci: Allocate sideband ring segments with dma_alloc_coherent()
      ALSA: usb-audio: qcom: tag sideband endpoints before ring allocation
      ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on 16K+ page kernels

 drivers/usb/host/xhci-mem.c       |  63 +++++++++---
 drivers/usb/host/xhci-sideband.c  |  93 ++++++++++-------
 drivers/usb/host/xhci.c           |  13 +++
 drivers/usb/host/xhci.h           |   5 +-
 sound/usb/qcom/qc_audio_offload.c | 203 +++++++++++++++++++++++++++-----------
 5 files changed, 266 insertions(+), 111 deletions(-)
---
base-commit: 69f0645f043feed4dc07690c74597574f43c41b4
change-id: 20260824-16k_offload_v1_b4-3d1460405774

Best regards,
-- 
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

