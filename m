Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF42D38F945
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730659; cv=none; b=WUScC0Z6umjJxmc7+mI812/oiPfhJwfolUWC0YZEizXdH2B6JuVEUhmsIuBbhpJueYyu5lsfdUCCsIy8nkr2FhRWGeMZXQjtSDALifpuPVpDV1IRByLR+FxBckIbPUD8N63ZF+/qKT0+WimM/paqsDpE9X/bnztfHlcl5FOGa8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730659; c=relaxed/simple;
	bh=AGLvPVl1km06Qd2SJp9Kfnk85aC+F3AEnFspKy5slLo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hECZucP+upe3S10n2Bm4BXz6TJOAfSOoPgdgQ+THMv/iQ3/PphbRCJyoqn4WN1b3Ix1elqehDGknVjr2NDaIGa+tzExEPjF0P40sFpr+SAOuGJJ2xhmETmmLouB2Mzzh7XkW5T1yHy8UjQ28ub/0otobVZfRHeEtugsbVtyp/NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+iynFJQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YF/Ql8R8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+iynFJQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YF/Ql8R8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RcaC3794497
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 07:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVQm7LcKqb3/uCDJ8rBRntP24G/9E0sp761G2/nC4u8=; b=P+iynFJQre2Kk7SU
	hkukfoif+fCGeK/xztYy5ZwmNTUcax5AIoxD9c1Nh2hLWmRVeQb2H2Bc/TG6DEOk
	d4q4EtX7HD4x5j7VMg/VC/cEJodadCNjK/T6Ct1pbVrFMSvG5A9TwEv+Wr2jNCWN
	eFN26s4659McxUBQiXcFM6Q6nbFggvU9nLqeGu1y2eGZjV8BjNboSXqQM35QOIW0
	KpyhhdzkqhLB6yt1wBGQ0BynaIK8EdRd2A12YzdlCNnqqGFr/FZ34Z4opNyWUEYP
	42OuzAMDUkkZnfZgQfjTj7T+2PD93W5ryvU5uJzTZmsqZPKv0tfV2SXE/VusRerO
	KREmeA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx8nmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 07:50:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so11267765ad.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 00:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730656; x=1788335456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVQm7LcKqb3/uCDJ8rBRntP24G/9E0sp761G2/nC4u8=;
        b=YF/Ql8R81ee3a/Ypu9dwHoj/kz+GfMQZNwcKnlpi1oats23xcv7RRVS+DGyFuo94h7
         +XdYKMn5AAVoMM8pX8wQSdvzuyUYY2fTTIZQBl60NdeAGC8wF68mqncf2n1j7pafGdh6
         lQvoDo5SMmn1fPpl/F5SXz3dhFW5VcJFjfpVGOPzp3a57Y0XaNrlwfgJz+dxdWNyLLAr
         sAQEjEX0vzWGcNOJhOlXnDnZP6hmM6oU1LmEF2/etw75M6+1l9pXllAy2funub40NnaE
         02cEDpkDfh5dYa7w5mvOiPw332xD9z2XRh44mixINWuAoYj90kOD4H1or3IVgbTEnWt1
         HLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730656; x=1788335456;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVQm7LcKqb3/uCDJ8rBRntP24G/9E0sp761G2/nC4u8=;
        b=lZX5VWF4/gZjw78W/L8VUIu8h4+9yfxYz5UYGBpG3Kl5/oou+FRDmv+T9gKmt2f0dN
         MEhXSXuQq/XwpiLgmPh5PaGn8eygXa3Hft8PVccP05kui1qnAsbwe4w05MbV6E/UFV0i
         B6F+TIpHaLO5qCXuZlRFHWoPPIFvwgxy5dbHaBuZh2RnTaNJ1Q04sL32bFsF4KHfvTvk
         l2YFiN4NeWTxlgS9yUHwSrdwLltwtd1xDg2x/vf6clkCS4GUxabkGwFheFihFzO9HSRx
         s+M3C8/NmndaEB/gh8ghVHh0QVL0bnyKwwiwDY7gGft3Wyt46vH+Hasr+LsZSkmkx+XR
         HZ8g==
X-Forwarded-Encrypted: i=1; AHgh+RozNvQuxfD8u7x76S/0mCJLrieWNt5O0seHXHlcUbTQvt5/IyOvKadTjmjoPLY5XZ5zVETlhnDFL/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kX9tgbl/sqHYMmvL3MPajne8EVaUCnHKxX40aa8emYPGI6ssUQ
	3l4P4b+2Vt5RqVgPTaZjytTKrq1gzxW2qS173yEsMahU9j6cNIe4WnsVSxGUGIX9gLzZo6KR0mc
	gTNM1VgnR17jScvcfug2BVUp3PYzlJlnSB5yvBDAta/WpbojX4udKX7xHbfmfsWRfaF3fMgA=
X-Gm-Gg: AR+sD11N/DIyBN9su1EnbApVOgxtkFY4oYYt9G/UGTAx4fhaKu8owfGqGpBf+sE+5bI
	3boPY2Y9pMz6CH3CmcUIbFKpA0LV+7JUjFpwvLna0IyHsaYxPdLNANCMIIxUa0RKq4Nn/+ngxuM
	JNJgOye8+bGLhzZ1Kqv5ccVI45ktXacLgKMBl7Bu1mOKh488TrFQcgIXdfx4hWujeVjXvUZydvx
	BpRnGckGY3Vo0ybQacqSJ+BcpuVET1JNR47lZcWIGGqMp7m6SKMS5UzCAFpG1RyU/UNv4KBeSCh
	b4zZeKskw8XKdw2PxRx1B1NfRnOENMhTHfdBW+WnTXLL+cthe9PvWZeJCqxgTU4YTFwD5CE/TBG
	PB3zZlVJmYo2cr0+ECZHPqcdr0C7pdw==
X-Received: by 2002:a17:903:2305:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2d707b7faacmr76688205ad.11.1787730656074;
        Wed, 26 Aug 2026 00:50:56 -0700 (PDT)
X-Received: by 2002:a17:903:2305:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2d707b7faacmr76687195ad.11.1787730655464;
        Wed, 26 Aug 2026 00:50:55 -0700 (PDT)
Received: from [192.168.1.26] ([75.80.180.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d769d81sm6247033eec.13.2026.08.26.00.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:50:54 -0700 (PDT)
Message-ID: <0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:50:53 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
 <20260825094327.606072e9.michal.pecio@gmail.com>
 <25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8e9ae0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=agQD+r7xwyS+FYqxhQjztw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=K85ttj8os38tJnul55EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: -aA511D-amIGUQE_Vn8yv5y2gZsAaPY9
X-Proofpoint-ORIG-GUID: -aA511D-amIGUQE_Vn8yv5y2gZsAaPY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX3b0M122Fx2ag
 KnIZk47cX68996ItWpqp+eNbthQN/oSX+LRLuITt97A3vkxU+Sjgg5EvTdmMDrT4B/wPiJbFXCM
 6lKaBgG+vyr3bgdN4zigFM0HWQfEXyqYk/EYl0hmf5gPzTiScCUqfWpHYrxYsSY0RKI9kAdFPPu
 L9oJx2iK5YnQyaV/Veiw3ZYH/8L2rJAIGOYxXek2K0+XJgnz2jbGO6X+l35Z6Bc5QKKLJ9+V51F
 ql339SnQO+8okbcEyjKCyK1LZTa59Kd7hmznqf1zxLJuE/IIJ4rIfQt0sX/34duLj5jFRBkiSW8
 AMVImxO+pN6sv98KXWb8cWiOhyC94xDsf3/aN/8+ozG0i3lZx/ySwVvqP0CNyL8uicKbStxdYoV
 GquuM5wsV3jyXoUEzPhJQveo8+u3h4FZKBaZRkSDOzrleJHTzgWbZGF5n1cle+4jZBohhPZtQ76
 t6jheCkYGa726q7Am6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX2Uouuplz8ocC
 70D5R2tU8OoQ2E2jvMZiqBw6TGjXIoBJsrNHIqSvohuOrmec0Lj6PzjyJ+UbJFr3Ch/3P/qN+eq
 NUlgm3aHO5YA5tHYx4oZYh7EoQ+K7lE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 8/25/2026 12:08 PM, Wesley Cheng wrote:
> 
> 
> On 8/25/2026 12:43 AM, Michal Pecio wrote:
>> Hi,
>>
>> On Mon, 24 Aug 2026 19:06:54 -0700, Wesley Cheng wrote:
>>> On some environments, 16kB pages can be enabled from the Linux subsystem,
>>> which manages the IOMMU mappings for the audio DSP within the system.  In
>>> the current design, the following assumptions break when 16k pages are
>>> utilized:
>>>    1. xHCI ring size is equal to PAGE_SIZE
>>>    2. Ring addresses start at the beginning of a page
>>
>> FYI it's worse than you think - xhci_ring_to_sgtable() returns wrong
>> data and uses some allocation out of bounds on these systems. Quickly
>> scanning through the patch I haven't noticed any changes there.
>>
> 
> Hi Michal,
> 
> Thanks for the review.
> 
> I had a tidbit that I tested that addressed an OOB condition, but as it 
> currently stands, that API should be working properly, if TRB segment size 
> == page size.  Hence, why I left it out as a change.
> 
> The OOB condition I saw was that when 16k pages were used (w/o this 
> series), since specified rings can exist at a page offset, that offset 
> information is never populated, so we might be mapping the incorrect range.
> 
> Regardless, I'll introduce that change in the next revision, since that's 
> information that shouldn't be left out.
> 
>>> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
>>> set with a 16k granular, which is a problem, as several xHCI rings could
>>> exist on the same page.  This is because the rings are currently allocated
>>> from the segment_pool.  Hence, potentially mapping non USB audio related
>>> rings into the region accessible by the audio DSP.
>>
>> If that's a security or reliability concern, perhaps each sideband
>> instance should create its own DMA pool, as opposed to allocating every
>> ring segment on a separate page?
>>
> 
> This is an interesting suggestion.  Let me take a look at it more and get 
> back to you.
> 

Hi Michal,

Thanks for this suggestion.  I think it actually makes the overall design a 
lot better.  So now that the sideband driver has its own segment pool (per 
sideband instance), we expect that any page allocations done from this pool 
is technically owned by the audio DSP.  This allows us to still utilize 4k 
ring segments, while mapping the entire 16k page, so it helps 
conserve/optimize the memory allocations.  I will do a bit more testing and 
review before submitting a new revision w/ these changes.

BTW, I tried my best to see if I could re-use existing ring/segment alloc 
apis w/o modifying the arguments, but up to a certain point it was 
unavoidable.  However, I think code re-use is better than having a, more or 
less the same, sideband API variant.

Thanks
Wesley Cheng

> Thanks
> Wesley Cheng
> 
>> I suppose each 'xhci_ring' could keep a pointer to its segment pool and
>> things would work for everyone, with very few changes.
>>
>> Regards,
>> Michal
> 

