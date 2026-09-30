Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3508E3E92B7
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 22:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806986; cv=none; b=bT1Ky/NlFO/RHIWVDD0dNoX8sRk/HSLbWVfxQcnWxS4n4/WfqBZ6wpwx9w5M/oD7KxID/O2V0fiM+tDt2bU6CTAV2L8ZWxZaG0o4UnAl6GkDoexUwP2LSuy1wEBuzxV5yaiB4E/g2Kpv/SA6L3B16ulxEkzqiZGbrm+ds/+QTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806986; c=relaxed/simple;
	bh=j6l5bzYJryaaxbDUBR+bhu5E7GPmbfMXb6+qMF/zaH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeiYVPep5PaM7Mi3EQlqvAOwhW5hBvQ+jN3lL3u/c84QV7wR8I0KYlwRp+DQ255o5G722o0909xuhHG0ZbAQ+C+zVRMYrSED91WLhI7mTuH0dIAdT2v7tZhyJ4cF/b9EYzHJYKFa+tY2p5UM/DBMyCejibHSdi6jbuc8wzmEXng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSmNVh8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmz1ktWW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSmNVh8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmz1ktWW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHebnG1198524
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 22:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piLUlAkUIFGFWUCpI1nShR9BGGKE+Fd0tpbM9xTnfhQ=; b=BSmNVh8kPGYRp7ax
	prHisYIdQ543QTXH87LnBA8i3tlQjGy04Wkjwgb9qNY1ifll619Z3QBtZzZ/voT5
	z4Dt2FW8uUvWfl+zwHIeRujN+h/k85PVkD2W/UJ7j/w9IuO5ztu1XhMgfDbJfEQZ
	ozp9+/8BaFRMut1F+83cpARLfNURo2ZC/pptrZ7EVP31ufeXjHOdj2leJs87d4PR
	bWCsad5Lmxe/+zBYh9UBDqKvXw8pHS4ZPAr785TDPGfx15RlKkSQtijgcc4PWH9u
	AmVQIaCyhxLV3LX3AwYj8UFjdn2NnCNnpDe0oVVGFQw/H+Kd/+EoLKXRSRYY17h2
	H3MnUA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tj8sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 22:23:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33baaba6371so3347529eec.1
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 15:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790806983; x=1791411783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piLUlAkUIFGFWUCpI1nShR9BGGKE+Fd0tpbM9xTnfhQ=;
        b=bmz1ktWWbwR765Dr4cVTExIOmJmTx7heWaE3/6D0VvKtaMiYOwYm8GGg0ykVODud5+
         Rn1K5ug3g0wM5IMCGFsnT3LAlAku09CVjf8IzNbW9aL0ikB4lv3xMBRgeJt9cyhj0Ujw
         fyiAvBOK2cjWzWD38c1ELKPhm8Efxrr6cUJs7Zhrma2H4FCDTJQJbjPsfjr2Vuva/ISy
         Uk9qPqJW/1loldB0e+wv8FXvLKl7wy6fAh0TVkm3H1t7zAM676o6MR3qbn2lzSKLbLe+
         DsJANTIea4qrQKBUJKw7Ok+y8anJf68PLzTa6gqABV70kCYgHMpY+78hIuQ2mtieF0aj
         rIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790806983; x=1791411783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piLUlAkUIFGFWUCpI1nShR9BGGKE+Fd0tpbM9xTnfhQ=;
        b=QCl4LZwjGCKXiKZcR1u4OM602Pn7bR1+vwtAq7MC9L0SCmld1cSxu/RyRI6KLTJHg8
         EpinhDCQ9IJOHwT1ylz7r+QK4CTgJ9tEu6N8lKGwd/9K9dLKYu2Wz0K8+fWiHUP09xr7
         /dKc4AneF+6KhCWu9rRam2Gl4d1lWmuLlEEB44WzzRbt6J4lKXI7MG9XIJuaGfClEhFt
         x8gbIWZSv6ag/OkCoHGRwgMhpieIawdF8uNa+kFKAdo0fHnaiYyPzwLdrMAWLuapPf0I
         xY7AyvGe2WeM1YEDQRAl+5OI1fftuA7tkLIHzSNN9XYMPBYPqBGNdh30FdcBWesk0HCK
         qn1A==
X-Gm-Message-State: AFuF++lX5/Fzb38k8KvKVu7+GiwVSRkWC4A0gP5GXxvtk6XLM1BccMKl
	mIYgs0ernrn84kT3fHPpRpIRhiMB5TdSLbNLVwulUl3e82RvhyuQjpi5Z/nc1acGvSlfNl9xrSK
	0oQUntpY6sZLEqpNN2Csghpxj8oYlJr3RAFjK3XCJzOwhIZseKqsZkdqRd9pO7HI=
X-Gm-Gg: AYBFou2r7HHiawkKi8aqZDtRyNROilQFsqxQvemeS6qgNn9L1EbYFZvHheZWvy+m1gM
	DmE6MQbwyOGsZWEA9DswPD42N5gIRbaBvFinQPeDa3QKwEVgr0+gEG+0PEp1yD71DcYvzo6v8f4
	G8s8AfDYsZs1F6ClGHAdv+/eGkCi4EkQasx6/mjzJfz5y8eFgwr9t0bpHw78lHHM8JQAlldCjM1
	8iP3OrntFcnMO1ydVzXJySMde0pWBObPl7G4ryf7iUH0SRLngb2HC1ORLL5pnotLKIQv8AJ2oLk
	0kygwVtKExB5YvwaEqvkFbyEx80/NUpELnlKwqED/OxrnEkdkwKAk4u5rr5LCvikV1f1RhWYc4v
	2CjFBBc3CD2MQNczKnAYMmRyQ46m1YEPlrjL+Vihuh8uD9w==
X-Received: by 2002:a05:7022:3c12:b0:138:12fa:3788 with SMTP id a92af1059eb24-14d35f360e5mr2359738c88.23.1790806982351;
        Wed, 30 Sep 2026 15:23:02 -0700 (PDT)
X-Received: by 2002:a05:7022:3c12:b0:138:12fa:3788 with SMTP id a92af1059eb24-14d35f360e5mr2359724c88.23.1790806981780;
        Wed, 30 Sep 2026 15:23:01 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df47ce61esm1418193c88.15.2026.09.30.15.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 15:23:01 -0700 (PDT)
Message-ID: <d7ce8b23-64c0-43dd-a8c8-268224b9462c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 15:23:00 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA5MCBTYWx0ZWRfX2+VtEEehAJEN
 bFwawO/Qd5MdSKWLz+UVwytHRilPoxk9F/zhSkoBy9pbv9KmpM5N6QmyZ11HB8C5uVMJgFsCL71
 DrxEMKHmCjOo8e0trJKwjkrr9m5dQuY=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd8bc7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=Sc2N9AbJxcu_dAGTm-kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: qtmNZNFHJD9SZue77lpAYgYzoU6029l9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA5MCBTYWx0ZWRfX1greUWrrhy/H
 Ow7Bo0EfinWBEyNkgH4IzK6O1AmU2qY0abrd1aPO5hYBNl2o63lfdj2OvvXuNLRfEBfz2krKE1p
 k38tMxs5Bl0IV4Nkm4Q4pIBffZwPNnGLMLVYHUrDIGWlmujk6Fx1nZ+owiL0sq46qurIMGG+nmm
 lmRDBzdV5L4KwA7CZZ/KFKJVjHNnIyB3e2nLoDCFSEITcvpXqtj50XqmSgjjYOFzNK4D05Qhu/0
 FZdGCqYKR7wkCRwIBNQC2kDU1sMCKG8gtOV/9de1XR0VTBNQis7MhyLc7ZiZP1d6BPzAfzAcPEf
 iNy9Z/68SnsGnViXbgT4dJVcbXuOEMg4oQn9UpKD/pbs4Ah8owf4Kpwi9+NAzm02ZiaVbqV1L2Y
 b9BaVJXCQi1GZBcK0Fm77cnFQbW5R14gBTy62271YavXVQkQTeCQOgZcwxp7iKycH+cq5hEk5z8
 AxI/7YPFYB85A3HN09w==
X-Proofpoint-GUID: qtmNZNFHJD9SZue77lpAYgYzoU6029l9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300090



On 9/9/2026 6:50 PM, Wesley Cheng wrote:
> On some environments, 16kB pages can be enabled from the Linux subsystem,
> which manages the IOMMU mappings for the audio DSP within the system.  In
> the current design, the following assumptions break when 16k pages are
> utilized:
>    1. xHCI ring size is equal to PAGE_SIZE
>    2. Ring addresses start at the beginning of a page
> 
> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
> set with a 16k granular, which is a problem, as several xHCI rings could
> exist on the same page.  This is because the rings are currently allocated
> from the segment_pool.  Hence, potentially mapping non USB audio related
> rings into the region accessible by the audio DSP.
> 
> To mitigate this, this series introduces a separate segment_pool
> associated to a sideband ring.  Before the USB audio offload path
> is enabled, the USB audio data streams/endpoint are not active.  Only when
> the class driver issues a usb_set_interface() call (done from
> snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
> resources.  Which pool is selected is all based on if the sideband path
> is being enabled, and if so, memory can be allocated from that pool,
> which expects to be owned in conjunction with the audio DSP.  This
> concept allows to keep the same model existing in xHCI, where multiple
> 4k segments can reside on the same page, which reduces potentially over
> allocating based on the page size.
> 
> Likewise this mechanism also allows for the offload client driver to
> determine which SID is associated to the segment_pool if it decides to
> map outside of the Linux subsystem.  The new ring allocation flow for
> sideband/offload clients will be as follows:
> 
> qc_usb_audio_offload_probe()
>    ├─ segment_pool = dma_pool_create(...)
>    ▼
> xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool, notify_client)
>    │  sb->segment_pool = segment_pool
>    ▼
> uadev[card_num].sb = sb
> 
> handle_uaudio_stream_req()
>    ▼
> enable_audio_stream(subs, ..., pcm_card_num)
>    ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
>    ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; sb->eps[ep_index] = ep
>    ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
>    ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_check_bandwidth()
>    │                                                 ▼
>    │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
>    │            pool = sideband ? sideband->segment_pool : xhci->segment_pool
>    │            new_ring = xhci_ring_alloc_from_pool(..., pool, ...)
>    │            ▼
>    │            xhci_ring_alloc_from_pool(..., pool, flags)
>    │            ring->segment_pool = pool
>    │            ▼
>    │            xhci_alloc_segments_for_ring(xhci, ring, flags)
>    │            xhci_segment_alloc(xhci, ring->segment_pool, max_packet, num, flags)
>    │            ▼
>    │            xhci_segment_alloc(xhci, pool, max_packet, num, flags)
>    │            seg->trbs = dma_pool_zalloc(pool, flags, &dma)
>    ▼
> xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()
> 
> qc_usb_audio_offload_disconnect() / unreg_xhci:
>    ├─ segment_pool = sb->segment_pool
>    ├─ xhci_sideband_unregister(sb)
>    ▼
>    dma_pool_destroy(segment_pool)
> 
> Similar logic is added for the secondary interrupter path as well.  The USB
> offload class driver calls xhci_sideband_create_interrupter(), which will
> be responsible for allocating the secondary event ring.
> 
> There is one point that was seen during disconnecting the USB audio
> device while audio offload was active, where the offload client driver
> was pre-maturely freeing the DMA pool before xHCI core was able to free
> the DMA memory allocated for the rings.  This is the reason for needing
> to explicitly call the ring free during the sideband unregister path.
> 
> This was confirmed to work on the SM8350 MTP platform, with the
> CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:
> 
> tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
> tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card)
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Hi Mathias,

Just checking to see if there was anything that we needed to account for in 
this series?  I think there was the discussion that came up here:
https://lore.kernel.org/all/TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/

But, I think your suggestion about adding the sideband check in the 
xhci_setup_device() would mitigate that problem.  Esp, if we don't want 
xHCI core to really know about sideband ops.

Thanks
Wesley Cheng

