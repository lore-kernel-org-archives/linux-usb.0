Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749200;
	b=Osa5a2X5VYjibMBcu7M7evZkLa6Pa2SWyEgpzBF+py4Gty9Ca1AgYrEZatTgxXqdCp1t
	 mgzD6m9cEgOJrNyYQuP6TqlmxhNmaqrdojh2ybtgVMzshmB67MW2v1TKj32THRAuYzKHB
	 i1UnQ9EbJ2nFYsepyw7q7Sapc0bhZbd1IX63LsoUTYZ6WGRfMSRCEty1OuE3rn58bOQdD
	 9lFoV/8Ux+A0LoUBcbXfULIF5+y68ykZK8PlZRvc4Co1GgGEua/n8OXZGGfDg3QNDtdK1
	 whSKid0E/a9scr2T0qK3d68UT+EaV9+yDgVk7oMX+ch5dh06iqETocG9kR3bfVohbaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ODVxWNmMdKejpIzRU8i3GHd6rEhkDG7I1sweDfnrATo=;
	b=DpqWX24DQR7lWOp4A1GM/WYoL6pa+UiWBXKFEQ+T0fJsHSxs5Pr/bTgHA0ldNroolc5+
	 5aN40vCjoYMkmrgNAu76hCYF6JKbPEtnvfNj85oGzHD1UM7xhL5ajdfr/liZq/WZcn0Ww
	 37yUX2rEJZA6dZhawkTOc0Gg2xl8mZmgzxAZDJ9TK4tTls+Jg83VyEIorvdbmqOZmuUfg
	 ODB+GA0ag3ADMH8wC6raMexFAMCmTdzmaEwYexGjmKk9MupTNCGljglTeWSykaq39o6OQ
	 m+c6VV/3Gb2hK81yMhPWu//6JxONRcHNniFo2kploFA0o3BMWtcUhHhDx6Ms0HDdI8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZEyuYbu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VLvN8TLX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106E606A326
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B106E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZEyuYbu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VLvN8TLX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL4nn2944193
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 23:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ODVxWNmMdKejpIzRU8i3GH
	d6rEhkDG7I1sweDfnrATo=; b=lZEyuYbuAB7ar7h/AwOhYRaQbwpENXlMH+h1Fs
	D6we0IyqXug9+RAR3QJzxE2ynG9sfNBEs8C5XDcf131eDha9UzsctUywI2Sbymyk
	AxVgvo6vLnZDLnb3ufrtBzwc3zboj9ih4AmdoCFRRBeR0EI0FXvltPnOkvlTOUrZ
	gFngAXl7HkYa7JMY5myZdEkCvnMnwuLTS0UoixZslqBaTWu81N0Hj8NWoNoB3ais
	e5gBVDFC5pCWDYodmmKxRAwW++/OgOYE65p6oq2oEyJUcWQyQqm21Z8e4Ocfu149
	WZEAJdA65q15+HOepi9aRv8Oy5zUmXoY14y8kb27suU9qFyQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbs4hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 23:39:58 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so280326c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793749198; x=1794353998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ODVxWNmMdKejpIzRU8i3GHd6rEhkDG7I1sweDfnrATo=;
        b=VLvN8TLXC8kL1m+VtDr8C2gefB+sCib5mV9EIHfVZvApUw6MEQiYl9wu4G4HeGp1rJ
         R56KhOcWnx9khmZ5gDFfiUvF5qOKnizpQticBvvGRd2SeevpyE8FsLWBIcd42FsA6p8r
         f9qLpZKL8T2/4T3ttKPIkrLylL9/MzbO0mAS+EoW4j2tEC8XHszvMgejO3DkbiaaAUCJ
         4JkAade8CAoqTzc32lCGt3sNcmrmdi5CIUPjtxW+y+8F5/8o8tznJOMjdyyJWV4PQiRs
         S5hr4m0n7jl5R+RdqVw7vkMqJQgxyavrqQAvUL5J9PplI/bUu0PXZ/ROxHjlXmJ4Cpxr
         BR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749198; x=1794353998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ODVxWNmMdKejpIzRU8i3GHd6rEhkDG7I1sweDfnrATo=;
        b=WkWcSVs1TMl2J07QS1hLAcBPf3TkFRQujU4msv90PQJYrKVislnsSzq4sVPcbDNapo
         7Gqkx2itmSDQVeRBrGwFiFFEzOwiZlwI93oivq8m4+HLLNcpbwOd5N4nOfNkc9gNoN1m
         8C2uHXsljo6PWZXysQv7uXZOOKZknXSrshOTA1vFwTSF3aaJYXaZEolAPqezgmltEXQ3
         L5T/7c3EjbOzTJhPxocOomqIu3l5i2uFO6IAP97bLdpV0BqoMKl3kWzErWG1jjLDvP+r
         HtlTgOaZQs3JrI/JJwLqiFqTmnTrIQj3US+Ic/h6bgtWLi7MxIpCznjDUwx6e4pWwQlH
         dXrw==
X-Gm-Message-State: APuU4Z+LRdZBUDrRoWzueGJVPAiWuAKBEvw0S89mQQn64C/5B08C5Jlv
	yPyOGzrA3q6jDtuvRlCT/DqWFmLumc30RYc2dMoLt+OhhmIJZFUuXD2lHw9el1j7EH3AkM5wvp4
	P6poukN6zaaPx5EP1piCy6sOb2+b6qes5HuciHJJp2a7RCejJyk/L1Y8Q5+aZTxA=
X-Gm-Gg: AYBFou38zVRTqpP1YSm+GRR1egQsVnTWVE31neJWB1EH/0pQw5D7Dq1J+eEHvuI1Y8B
	y1FFB+RYc0Ki/sBwX6HeDebJmsG42w7i0G87nkuFe3ZLWl+PlwZXutxaVybdyZq2lCso+q/PKTr
	f+ElhSMRyDAkNBxdLula7Nhq3gqDE9C+Lzb5vIXp2FKo4SS/LiQoaBVqdVgv9H1a5HLBrUGKSLY
	snSFSwkpMYt+lOopnpQFul2Bt+WQcvBC6iyRDpbz6qpYU9TEdTZc9RUuarm5CCjHOge59xvDVEq
	edUWzQB/JPauqMeyLBeKeB7yUzwIW1Blp+H8Hdyzy9ZY7kcxoz/ZUJFB0DBTbxnLEf+ZyK9UtUs
	ObHPIdS2GfzPLR6U3RILt0klf9IJHgMoIsbKcNwL+ZTnXiscnEB0YsXl54iXCSDdPlyQ0sp/kKL
	gh9yU/tCFV9S5s4RZd9FJcUbFYVw==
X-Received: by 2002:a05:701b:42d1:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1ac5ceee0dbmr23120748c88.32.1793749197103;
        Tue, 03 Nov 2026 15:39:57 -0800 (PST)
X-Received: by 2002:a05:701b:42d1:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1ac5ceee0dbmr23120685c88.32.1793749195761;
        Tue, 03 Nov 2026 15:39:55 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm2356442c88.1.2026.11.03.15.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:39:55 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Add larger page size support for USB audio offload
 path
Date: Tue, 03 Nov 2026 15:39:52 -0800
Message-Id: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMhw6moC/33NQW7DIBAF0KtErEs0wHgMXfUeVWUBxglpElqTo
 FaR716cLpKFk81IX/rz/oXlMMaQ2evqwsZQYo7pWEPzsmJ+a4+bwGNfM5MgCbRELuizS8OwT7b
 viugcctULJEBo2hZZ/fsawxB/rub7x3/OZ7cL/jRDc2Mb8ymNv9fRIubeM78IDhyNJRcIvFXwl
 nJef5/t3qfDYV0Pm2eKvIf0EiQrpC2SIhOcc/QAUjfIgFqCVIWEaozUvZcI+gGE95BZgrBCg0S
 riUTbmHYBmqbpD/mICsWmAQAA
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: Rhw_7-XmXrckwWMR5NdR6XSKDIt2pZrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX9rO6EQeoUXvC
 IuGGVS4BvKAw4pgmCZ8efwphvBsranE+Cvdgjqa46BHiPWXh3bj5ji/EJZQmVZClLw9+fnmJ3g6
 QhmVnZnXXLiH1d2ImQBdzFaKQSOgZ1aXVPiSfhRy5J0WZJmAsV5r9MOa9IVXwRtcq2e1EWH3Ogm
 oKIoVYpRLrCEw7lFrfUpILjDFXRSW67j4srjvtLEvVOIwnueGAXlui/bBOnUPvMXPGLdtKsOQjj
 xT4DjdLiDx0tzVaN486s6VB3a+6y5azBg20ouRbjW1VpV6WM63tPPEKqMqArYEOGItrsq1d2Iw5
 Sni5DZAHh5DzS6TLTdoVJf6BHjJhMy/3DEULQ9fa0mo5u6RgprfKMvwvfJvyCzUs2WFx378klDy
 4ANm8SdtivOpWNX95fUr0B8eRTLdzc+aESgX1SFBPW6OuTBJIL09tOflaEOBq6yfgohf3dtSA/Z
 QcGNHxkzMamCkXhf9xQ==
X-Proofpoint-ORIG-GUID: Rhw_7-XmXrckwWMR5NdR6XSKDIt2pZrh
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea70ce cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8
 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=GjhRyQdd-c_DPEUQ6LMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX0HDkX9afVYHk
 HC4B9V0g3rji4I5E8l17v2ia1csktatTDNDbQjFUpXQLNb2wBexCDR/uuianQbGJKd712r6Kuwk
 2UX93Dj879vjdp+8D2sDU0qaWKnxHHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030094

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

 drivers/usb/host/xhci-mem.c       |  63 +++++++++++++-----
 drivers/usb/host/xhci-sideband.c  |  97 +++++++++++++++++-----------
 drivers/usb/host/xhci.c           |  13 ++++
 drivers/usb/host/xhci.h           |   5 +-
 sound/usb/qcom/qc_audio_offload.c | 131 ++++++++++++++++++++++++++++++--------
 5 files changed, 228 insertions(+), 81 deletions(-)
---
base-commit: 69f0645f043feed4dc07690c74597574f43c41b4
change-id: 20260824-16k_offload_v1_b4-3d1460405774

Best regards,
-- 
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

