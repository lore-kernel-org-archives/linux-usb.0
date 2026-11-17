Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903550;
	b=Ridq9cpX0pnnae7wPipRsl8ZGlRwljWl1JcEQ9/yZliWPvd5F3xANW0GJUbpArP4CI+M
	 KJFZ2oIkw7MxI7mZaJx0Ea+uLNtK3hR8ubHiifvs3Si0tXTCDAHHaBvg3GB8O0Ebn1PaG
	 9bUCVxxCIh/WK7RBXX0Gt7TH1ctMLVGzk+FiVlQAOY257WPjmSVdmw1p/sdZb9ByXz5mq
	 BWWe7KZXv3DC/dJ38ruJIfRDzUySxNAxM7XeRCFozsOswpI0rJXCgiKytUt+1MKRX5+Do
	 MpFPFQzseaFT4Ugu50YoF136g81tgErxuUVXcSYoOyfDr0mE+Z/LvH3UyOvo95KQn/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
	b=F3a3BecOTDhmyxTla7DTNaYUeUVSZj13cOXieQyAprJxKbbjk/0ya3Rwm3hD8fI014PX
	 K8cj8TziCjXx8EUuKGSQTMJsOly72fwZQ7hFr7/i+VdN++gYdTncH4+0KSSzUzaAawyfu
	 eynL8o8QNCjKvD5b5aKyO0Duz1+Kul35ln4Mw++a8s+HCzm60d2O0I11zXmyaAvL0Yatf
	 kT27BKCmk8YOst5wJNJxLGKtIUeyj+tp6k/qlbFVCKa+MlXSY3zse1Fjug6DLo0mbK+Uo
	 q3Leq6j2+z95LE97GCVb4gXYIXODktFaotZHubJXd8e2trwuYcr4pzJ9Zk4Oq6e1yVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHZGUf2p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKOrbTZI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067B5606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 067B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHZGUf2p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TKOrbTZI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8HjHC1800719
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=; b=JHZGUf2paxYzYRD8
	3IRgYDgQDh1ETHF24DfSjYaCnkKVRtZglxeHpj5uxZ2xz5HnaSbG9YdHmC9NzJI7
	x11hKhWjnpCU27JUdJUU6fc8BigqcgDn/lpKBSdLjqO8hfkB+KCq4pEG2dfxJK4S
	h6NbeciHn5RXapzceCUlUzMunF5RaZp9ra1KDIWz/917PVAILQ9qMqn8WCVWyQtV
	llsbxrZiPt9v0zGPsEWD8TSDtvBdDv+rMhhE/Uo6NR35LCd7mzl7iXPwNN+JIcXI
	RRwzLpBxLOtjlrQVs+ABKOvXvbapdKPHU+ghOnOJ8KMS9QenTt+2C56DuALiL6cj
	W7gRXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3tvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:19:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a05b68f851so552992b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903548; x=1795508348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
        b=TKOrbTZIO3rlsAKlnkR6J9ZJNpFTIBmGeRZMTN3EWbm/f8RgEphImG4Uv7NVlNnKf/
         QXq27j3nX2teB7YVjEulLto/ron0gKZfynKVvRZLWUGJUTa4VRlrmh1Z74Y+2evrzXQa
         tKPFY6EluG62mfMYbHKHUpyY5y2SpGKFuCCMlMIUpjk8x1dUg0KlS3b7vljgLJjIm6w9
         Kz2GECe2IXKvphOV4BuDdU4Lm6CPP1Wow60Jfdu12aEmGPR4qbgSH9iNXS1wnVjSztVl
         Ysjf54svOCLqyOHvRZ9pG0kyZ5ye8cgqeqvaMs2LwIIr45d0PAYXEgoiqDQtOScIXXRj
         moag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903548; x=1795508348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI06mvofhXRZg6+BWCeYj7tpzdX2vW9/vYd40XqO33k=;
        b=oQzqM+nASe9KVCZapDjjYIlXhBMwiCHzAOgPy3aDXoB7cYeaxx6Ylg/4T625sOXBqx
         kqopxJ2JLBaAQ/Z0CErya3tSQLaAcwbqOsN+pm/eamAsjb3XFk+KrWlXL60cBgQnNUzl
         OmB05qMImzMhYz2Et6O41s78xTf+u/Jw0kISesXTXL68mcgTm1Sq1iGAwwVPz934agIH
         NQuM00AZRgShILpjTT5MMPRjt0lzqk4GHSZx9k1Fgng2Y2RD2okUneHkl4P7U1+AfHYy
         /nRWdolFuiNjjJN9KZctM+4Yw19gQ3j8WC0azUZ4Z2BxFKt3i2NUl620jmDhvECu/Jbr
         La6Q==
X-Gm-Message-State: APuU4Z+WfC7MeAtyclm87/6lkCufx8cf9FHMkrBMH0Sv3fygRnJLof5+
	ysEn1jdaxB7ekUEmSfA2yFVs7m/UTWrah1RQQb6r2bR6iUEFDgPGXlTvXZdC5DIGrqPExBtcr4f
	t6PWCvUMStTqqvcLTZg04FV2x7PEI+I/pQK/ilAQZCSbwGMHRwlI0BcXCN/zDa8BHJzc+rsw=
X-Gm-Gg: AYBFou2YCcjV9F4AX5Irw4NNkOpb0cIQ25XO5+0oC9MwVAWxqtM56M9L0OjntAukvNx
	AMdqXUeNWJIUUewKXeGB9dghbkVdrMpc8Dp5on9APEd7wsJRey+nmLz0J/KNc7sk3GuQNfDOhjG
	+dDqfXKMr0cA3jSNdbT2ot5yy6XnSaQwnQmfA6RuLQPACQ0sVVl+trQVxUt/noXoIsCznNE+qfv
	IuYVLYUEbAeRPomzxte17pNZNLBC6asXaYmeSSEu3Wk815I+EmPj/GZ5C5wNgxg3myXaOCAHb1E
	ZU+9TnXV3/XmhlYFcINWU4+ByiolCWMioC0IOTS6PA1Rzi2vnfZBQ8LviGAyzV2DUUh2Fz2TK9q
	rIW3cf/jkedkhP06UNoGLRXIlN90+QCIBRwZs1NgSoiVOcLhBI8HFythWuq9EEVNfgKhbFgoBc/
	faazU=
X-Received: by 2002:a05:6a20:d090:b0:3f8:9fb1:211b with SMTP id adf61e73a8af0-3fd2a5f42ccmr1450191637.11.1794903548420;
        Tue, 17 Nov 2026 00:19:08 -0800 (PST)
X-Received: by 2002:a05:6a20:d090:b0:3f8:9fb1:211b with SMTP id adf61e73a8af0-3fd2a5f42ccmr1450168637.11.1794903547880;
        Tue, 17 Nov 2026 00:19:07 -0800 (PST)
Received: from [192.168.1.26] ([76.167.124.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm4729678b3a.36.2026.11.17.00.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:19:07 -0800 (PST)
Message-ID: <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 00:19:06 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wrbh3LlnQWVVK5Ltzjn8WzikGLsS774u
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc0dfd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=jLiqPQF7yFVFeg7DRIoZ9g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=oWt3uI2Zhp6YPFwEOV8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Wrbh3LlnQWVVK5Ltzjn8WzikGLsS774u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXwTWnp+2mvaqT
 Qm9x5LlcRzNZj/I9MwUlGu6ExncJTieyIIMdx4NI73ifNvg1MwURFRQeuG8CMIAbve/Mdk+0mN7
 v1QtpMSoEhoJlh4YqrPYxElnXIXtq7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX/aGUH5ir02eR
 6lbeeoRBdPILmfoBU6Q9a90dsyZ43sBLkkpqlyQOjH7+HYQ0b5qfXL/CwKqwkgd5/xtHoZGpGFp
 kHSbEMfDpR1Ncy/KXCFikt6nY3iIxR5hsXlcd3vPouPHUv17u9bWKlzAfkM6ooQWTuR3dnmRx4/
 kUUfy7GINWX7pCkL8Q3/vEdo2bD9+a53F+M5BNB9B0lAuxHkGdSq6kT3xb631m8YqwJdx+9U68u
 qJ3XZKirglTnPpK50QBtoMX5E2+KS0szyQQo4rAPqCk62QkBqe/A/OKfm0QJsRK/KPuZGGEjSRD
 dOmbfXHYwgiJqW0PUAK3sAsNnuDDk6XbCeBKwHrYyyrWTPMka1i4RAAWU/cbLemCVrv8ROmE3RD
 LhItY/+XugmQHkXs/00jIQYep7kdsziKb8Q+wJ1fM0Iyrf5Ge9yQmVIyaInnBrFihNTf1ZGzTB8
 pRtDGdKGF3nEcptcjiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170032



On 11/9/2026 6:38 PM, Wesley Cheng wrote:
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
> To mitigate this, sideband rings are no longer allocated from the
> segment_pool.  When PAGE_SIZE is larger than TRB_SEGMENT_SIZE, xHCI
> allocates the segments of sideband-tagged endpoint rings, and of the
> sideband secondary event ring, using dma_alloc_coherent(), which gives
> each segment a page of its own.  Before the USB audio offload path is
> enabled, the USB audio data streams/endpoint are not active.  Only when
> the class driver issues a usb_set_interface() call (done from
> snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
> resources.  The offload client driver therefore tags the endpoints with
> xhci_sideband_add_endpoint() before that point.  The new ring allocation
> flow for sideband/offload clients will be as follows:
> 
> handle_uaudio_stream_req()
>    ▼
> enable_audio_stream(subs, ..., pcm_card_num)
>    ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
>    ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; ep->no_pool_alloc = PAGE_SIZE > TRB_SEGMENT_SIZE
>    ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
>    ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_add_endpoint()
>    │                                                 ▼
>    │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
>    │            new_ring = __xhci_ring_alloc(..., ep->no_pool_alloc, ...)
>    │            ▼
>    │            xhci_alloc_segments_for_ring(xhci, ring, flags)
>    │            ▼
>    │            xhci_segment_alloc(xhci, max_packet, num, ring->no_pool_alloc, flags)
>    │            seg->trbs = dma_alloc_coherent(dev, TRB_SEGMENT_SIZE, &dma, flags)
>    ▼
> xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()
> 

Hi Mathias,

Was wondering if this design looked a bit more acceptable?  Was able to 
figure out a way to achieve what you had suggested earlier mitigating the 
dma free problem I mentioned in my previous email.  If there are any issues 
w/ this please let me know.

Thanks
Wesley Cheng

