Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132347;
	b=3SFZHlbycj38ZZ3jQ7dB551szKxJl1BVBcSPIuvDB5O/FdaajfleRD0kEyBmG8Q8VLho
	 ePvHi53vev6/VVpDosarUNHnR+ew5QxcpOJeOR9cHRXuk+STS613B972TadDULcHaWnBG
	 yoGHULszzNicVRl2/e1seg1Ds+p9L6ul8f78dP/ZXTFtETMwve5i80JBxtziPEEytTCVf
	 x6toMI2Kd5IsWHt6YGa5H+kF135QS1g/TSJgEQlm/6tApMdwihZHUPAFwV9mJ54HSE6yO
	 WwLyM52gQpK5j4uN8BgBVIoxF30UVLmqUQJGhnNwWx2s1lcKIUk6Pa8tbGABfnwNFeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gstXcJFyhcfBVxDsWA9SzQ4fPhsbE40nz4bvlR8BgIY=;
	b=AwzKgxBiO5Un2ysG+SgsWn7no1ZBSh7fOOnvIm3D+wN3f3J4zVSwnhhNmh7RNWbNJpGN
	 QJWxmmXWWYfz/zMqcLHUq6EvDPAUL7BddTIsfnXaimf5dw339Cw8WpioZZ4aoljPqeWI4
	 lOuYFIHE8zvW+C5yteuSolzMhKUra+BabkSwO3o7FqFtSZuGHtaEw+W4jAlzWzj6SeEVn
	 QT6xOpU2K7Yae/T9CKOsmxz5NydLAntffCpLvu+J9PQH5Msy8H9cUQz26wGGGrtw3pEkX
	 NxzksY2RvEHFiFGyJCKAjSP2k/oSQ/wsbEhAHrYnANV7WQE6NFvPDrIQcbFbdYRHWXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEXcYDZA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+6A4oBB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DD606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 20:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEXcYDZA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+6A4oBB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHr5t1459825
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 20:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gstXcJFyhcfBVxDsWA9SzQ4fPhsbE40nz4bvlR8BgIY=; b=KEXcYDZAEWzfnG7U
	QZFrOGkok7PHvc1t0irivsbOEZozq9T5AwN5CMGnqUvRkOprSnBjZXPZveMQHy1C
	CVxXM8wwU7vt7I9WbZ9IhWEJucP6vwFu6eiv593YA6ptn3OXbFD8YoTnnujkPB05
	qoX8O/MNt8GSXTVy/SLwemcbfszIq42FRgc1VMJtQxkqy7OS/Sb+5+77MZPIggYg
	9nFgKuwtDxOvzUzK8yGwsHd04fs1wVRuZTek9NmwY8YhWCNGXh4W6jSVhaRPeE24
	2veHCo3aWLR/Rlcnmq6kQ7RBJ+m/+hsM3HN/TJVM34D+m/iLHsChzRZ+DjcKrxYq
	0uDe+Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7111rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 20:19:05 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso381278c88.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 13:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793132345; x=1793737145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gstXcJFyhcfBVxDsWA9SzQ4fPhsbE40nz4bvlR8BgIY=;
        b=V+6A4oBB8ZgDXGJHAeQSgSjTy4fIgis7+kK00d73yX/A78S4bexKbl05KUoznfW5dU
         GMSCZypeFkQTXPSDWul5yp0X8OYp7wCHKXTQfs/YQq+qvoUi/ly3qZa1x+hrU5J9SRrU
         QyEEviwpNH/WuEtj8U8HNdDqKAkhl7Po97RlDa4kPk+fgTLVL+bGbSgDB/vAGVD/om2c
         3KI+6E0x73CDcxQXuWcNZq2sV2eR1qM/i9C/osYectl4yiRSe5a3GXcQBaPDz2YyDfWH
         2E9/VjA67v371tiLcBIqm/ySUnr0Z3jCeHyT6IQ7qTy0WSoHn1ubvFUQGt35Ixrt4EMs
         F8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132345; x=1793737145;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gstXcJFyhcfBVxDsWA9SzQ4fPhsbE40nz4bvlR8BgIY=;
        b=2hM7t4/MwS2ObOX8uk76ScabQ0l1NR45Ia8OfqSVx1eahYPnd6JrxebSU5M0R8no8e
         ywyDX+qZygXJmXaINM8gmoL9J8toeEMxqePFY1U/dEwyx3J6RN2MDVKOvQYMz5152yBR
         VCdUZaNtQ4hrJjy4M3ejk7/ynnpRhbKwtB4Gfppgyq0e2dKJ1Wgp2Q6bfeELB+e4+EpJ
         v0+o1sBN2zaGJIqoegUDs4fjPRD2VswF6OnTHwp2Qi93EYd9Up1XLqKK1wazrRtHdMa/
         DLBzl/msrdXszOBDhWVZEbPCRq2VfE7DB4X0xAc1KeKHTsIVxc1CrQ0LS29iu7yhOcd7
         2GaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSP12kZxh/bC+hBM5DkGhYui9zrx0RdBRJbPwm6rwn01ZCJ73xwNXG5H03FprsVJqBJ6B0EdThods=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQKPpkN7JKrEPdEqpxXIXKdsKaN4fz0iaANLAGqlZDRUeMFcu2
	l4JG/ErRefyslYt/Zt2dwt/lkMfNfjrhTr+1ruGUaRBuiZe59KZwx4B20IZt/IPT8rbhU6MiM+L
	fOmdGZPXelpTYRI3Ra1Amyp4B9LmJMTv3MucI3JaSZ55cTNx8L82FEt1KOdfmow/z9vLakaQ=
X-Gm-Gg: AYBFou0AU8CQf86cVj4c30H91bxXCc/vu3m6glKAKIm2PFSQGHuyuC+aIPpLw7MaUxs
	nbF3bf3XvoM8F3xXofcbfzaqnY8HWUc+EfxYXgpPDdf1cQlcqWjrBR1hjx4rG+zyc5+ZxmZKLoH
	FLUBXyABzIXx17Bk97cQtU4tbXdaTZC8sVRjtX2m7vgNqSjkpsL7tTzbdiyQQjDAuV3sVs/tXIC
	zEcLBPv2eAh4VgzpjI7g6tUt26JJCYW2Uhr3HlPOVIaQJmR2n+CiSKGrMMlaFm/iMXZ6VusWDDh
	mOZZV9z+HCQ0/Z8oSqflgD3q1YpRPFpauVAQ76/Bm1V2c1VDVPyvXrT3LcimuKczqUswYLRYqeg
	YHYXAKbtSy5Utzf4pU/oMUuv5FYHv/F9QtEraPo3nq412vw==
X-Received: by 2002:a05:701b:4641:b0:144:fd7c:84fe with SMTP id a92af1059eb24-1a6cf72ac18mr314154c88.35.1793132344864;
        Tue, 27 Oct 2026 13:19:04 -0700 (PDT)
X-Received: by 2002:a05:701b:4641:b0:144:fd7c:84fe with SMTP id a92af1059eb24-1a6cf72ac18mr314124c88.35.1793132343969;
        Tue, 27 Oct 2026 13:19:03 -0700 (PDT)
Received: from [10.73.199.44] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6da6355a6sm520361c88.19.2026.10.27.13.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:19:03 -0700 (PDT)
Message-ID: <24d045db-b8ab-44db-83c1-9832d22dc9d8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:19:02 -0700
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
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
 <68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
 <82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
 <20261013111110.423dd0ff.michal.pecio@gmail.com>
 <73096f91-146a-4754-a685-f3b22f1ac3d5@linux.intel.com>
 <5a60513e-9d39-4cbe-9f2b-dde8ca71a8a3@oss.qualcomm.com>
 <090277e2-e36c-437a-8c2c-f6f3b63abc89@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <090277e2-e36c-437a-8c2c-f6f3b63abc89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA4MSBTYWx0ZWRfX4FukBSz7mAAY
 EWsZZ04ozsCHKr7tlc6QgUDwa/3B9Z8QD08C7mjbLcd+908y7sQtEhLAKSGFa9+ejHp1PX4z/AT
 Xs/TisBPQl1jMpqOL91uGDqmXI74K3jaCfgNHs9ROqoNHeKChTvl76BoQ+blRiH1UudpRGDGFFC
 kxykBI8ucb5pUxM8bwGpzKgQDLZtaGn5tZrujK6+xOaqhVbmwnQnvHChhqLwODPsqCig74KlL6Q
 20ebvooLOuqlkvfk+iwloX/u0mA2v7j6tN1a7kNncBL8zj3jN8ymvvKa62MyG6Rug4vz73fza8o
 rj728pNBuoie/YCyAfGP60ZYz2qYvD/ZzUxyocYnaBZbibIoO7LH+bObTIviteJqKGGXWg1Wuut
 vaQqVPvWt0bq1VpvQoiGgVSRF1lgRGpzrHHxCVHtZQOSib8jG27p9hurBP/vt+3M8NEEarBmZyc
 Ba3+eiRvD2kmj3+r0EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA4MSBTYWx0ZWRfX1upajOg5thtt
 5GnFyD8WIsj6llRtkT6FCvbO2yYxvWPJWlKEGjLbHyna4bo7l8GCNfnD5X4FE64/lnlha/GlRhC
 6LT9+2gjhGeHN62C5jTE7L6K+56hs3w=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae10739 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=x95Msn0_mbxkGruDv4oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: mQNdf9lkYHgwWsPhx38LRlu7N09-JU6l
X-Proofpoint-ORIG-GUID: mQNdf9lkYHgwWsPhx38LRlu7N09-JU6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270081



On 10/20/2026 4:13 PM, Wesley Cheng wrote:
> 
> 
> On 10/14/2026 5:44 PM, Wesley Cheng wrote:
>>
>>
>> On 10/14/2026 7:26 AM, Mathias Nyman wrote:
>>> On 10/13/26 12:11, Michal Pecio wrote:
>>>> On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
>>>>> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
>>>>>> xhci is the one allocating the ring when adding an endpoint, and
>>>>>> telling xHC hardware to write to that ring. It seems more
>>>>>> approriate that xhci should be the one freeing the ring after it
>>>>>> told xHC hardware to drop the endpoint, and there no longer is a
>>>>>> risk on hardware accessing it.
>>>>>
>>>>> Hi Mathias,
>>>>>
>>>>> Sorry for the late response.  Was out last week.
>>>>>
>>>>> Specifically in the disconnect path (while audio offload is active),
>>>>> when we utilize the usb_set_interface() path, it'll return early due
>>>>> to the iface->unregistering check.  This would lead to the
>>>>> drop_endpoint not to be called, and rely on the xhci_free_dev() to
>>>>> handle the transfer ring cleanup.  This wouldn't work in the offload
>>>>> situation, because qc_audio_offload is the only entity managing the
>>>>> DMA pool, and that would be freed during the .disconnect callback,
>>>>> which happens BEFORE xhci_free_dev().
>>>
>>> You are right, audio class driver .disconnect is called, driver unbound
>>> and interface device gone before xhci_free_dev() is called.
>>>
>>> If sideband is unregistered as part of .disconnect callback it also means
>>> ring/pool would be destroyed before xHC has dropped the endpoint/disabled
>>> the slot. Would be better to free the ring after we know xHC controller
>>> won't access it.
>>>
>>>>>
>>>>> Would you be more inclined to prefer a solution where we can defer
>>>>> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
>>>>> adding another sideband notifier (sb->notify_client) enum to tell the
>>>>> client driver that it can release the pool?
>>>
>>> sb->notify_client callback has the risk that this sideband entity is
>>> unregistered and gone by the time we want to call it
>>>
>>> Deferring freeing the DMA poolby some kind of reference counting again adds
>>> complexity, and maybe not a suitable solution for this issue.
>>> (taking a reference at sideband register and every dma_pool_zalloc(), 
>>> putting
>>> when freeing or sideband unregister, finally freeing pool when reaching 
>>> zero.)
>>>
>>> I'm trying to figure out a simpler solution.
>>>
>>> How about skipping dma pools completely for endpoints in these cases?
>>> (page size over 4k with offloaded endpoints)
>>>
>>> Instead of sideband client creating a custom dma pool it could just set a
>>> 'no dma pool' flag for the endpoint. xhci driver would allocate the
>>> ring segments using dma_alloc_coherent() instead of dma_pool_zalloc() for
>>> these, possibly even allocate a full page for each segment?
>>> Freeing would be done similarly.
>>>
>>> Would this be a viable simple solution?
>>>
> 
> Hi Mathias,
> 
> There is one difficulty I ran into, and that's w/ dma_free_coherent() not 
> being able to be done in the current xhci_ring_free() context, as it is 
> under atomic context.  I could move the dma memory ownership from xhci core 
> to xhci sideband, which could probably get around this.
> 
> xHCI sideband will allocate the DMA backed memory then populate the 
> new_ring reference.  Then when xhci_add_endpoint() --> xhci_endpoint_init() 
> is run it'll check if new_ring is present, if not, follow the non offload 
> path and allocate from xHCI segment pool.  Then on the sideband unregister 
> path, we can handle the freeing of this DMA memory as well.  This kind of 
> moves the memory operations from xHCI to xHCI sideband.  We would need to 
> have a set of sideband specific ring alloc/free though.
> 
Hi Mathias,

I'm going to go ahead and start working on this approach.  Feel free to 
comment on if you have any major concerns from your end.  From what I've 
looked at so far, I think it is a feasible solution, and the only major 
shift is that xHCI sideband will own some of the memory allocations that 
will populate xHCI core references.

Thanks
Wesley Cheng
