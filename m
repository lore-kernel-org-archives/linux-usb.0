Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614073C09F9
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 19:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787684902; cv=none; b=B00+zUKsOr2zAXqcRIRJHnWBTzAkInreGtpFN8B10m6gBpmb2XEGfsLGpbXv6RFfuNyxahaqVUP3fEKQMgOzGkQAVDW27z2SefwqxSQt1RDdHJcB8Ye8/w92FhbXJ9n1XUEeLCIStVBWLa5sV31/blCHnR+3Je7At9pYvmj4Kb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787684902; c=relaxed/simple;
	bh=SVIp1/ypegL3NavvfNvnqOgLYfPj8K94lMWHpRsBqDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYy1PqsTbFu+xvM3Dk5c6+I1x8DIGfYzTZzmSD8PC/NaiBuAa0CQijhq51lIYzCV+TOK1MggiIA4Yb/hQjXw+7mExa0tN4CQtYgN8gOdo6jURLRR6k8sVHWc7jNeb4gTkyzk0P3irgEb9Q/+YtdoOqUSiAxxBtnVJsHqTV0njPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfnL5Evg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZArpJHQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfnL5Evg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZArpJHQQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdGAT1572710
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 19:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+VZQz1EO95LVa82uLNBtP4B0GN+MmEpuJbHIDvbjX8=; b=dfnL5EvgWT2qv0+0
	ntW3UQ7JqG5kOQXYGz+0IXUdJ0QlyUWHxYkv9ZWNLF/xCuci+6X8Rp7Q4tpZkWEY
	vYSexF366dt2sa/x1Y8WP+Jw9o4XuHPMJdAp2cDRWdNGZDahy70r5GfF1uWFgRp1
	KRJBpWQVRqVkdg0qrrxx0VFXv05gHd5Vh4RCuZ8YoQ6yxy80hBFNJEpEu8U4+uL7
	z1+KIIA/EdpyGhuyu0frHQF0Oib8m6FgKSsCQNJaLNjv42I+zBL6t6imY9Db78d2
	8d+n5VeRfWZppCcwvyaXtw+vNFo2cH7blEHBMd9MqBw3raP0Tkyx0RXeksgNm/wU
	uu09gA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgr8ccy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 19:08:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6ae2a942dso3329265ad.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787684895; x=1788289695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+VZQz1EO95LVa82uLNBtP4B0GN+MmEpuJbHIDvbjX8=;
        b=ZArpJHQQ51qQ85Sr0ONAFf6K8ON2Z/2wpMJay4DsQAXnr38qVSZorZ2btROZVbZPFi
         GS4mLYpMOm85ulWKieGhlJcZf+Vp+R/aiGpwxlFawShKvSPv+FBck74XkSLlsO+icj9I
         mwXVjBmQQ3Fek7202rZVF+Zel3OMueC9D4GIcV2TI6+5PAPu23CIcHESRvqOIlm7PmPf
         nc0Zw0zEHROFGf1HLoJi458EOdGCU8hs4KDLTSp4G4n8FrKuY84ch0+KpwCtJCdh6XUI
         kSDQKZXObub19lcnhpbDoVWRrAgdT2Z8ESKgEPktjONhuebuXD4erdFxLiT0826MDWHs
         Wwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787684895; x=1788289695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+VZQz1EO95LVa82uLNBtP4B0GN+MmEpuJbHIDvbjX8=;
        b=L6QV8Ka7QdHEL137wT7CXHLQzfSA8TAjCAzUmxpYuo6ZCXOY9E/8wSk1HrCUTA+/xf
         hOi5OoE1yrixN9FO4vscih9fYW335r2y8bhpmfauVK7YMVxZKWXqQZLWsZfMXeANA/pJ
         gUE4OUf9578mLAxWYCJjsELVwzeXctE4gVvs3J28m2TJmPiCDpRvuMtkm6KTeDXG1xpH
         NSlmLYeeBtSzgMuALd2715zsnOHQM0a60P1cnDYWIkL2YvYl6cBnE5T7LXwcB2kWzYwn
         YOlxwjz4q0heFLImgoouBlmzh3d+2qpnnfn7nj9tWreTR0/an9hRCOphOnZQ1HfjV6zE
         Q3WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rocf7HosI52Nv+tOcRx6Ixx3hzglJqvdcTejcqU6Cea9J98K+wLzdz0n9WHyA57f09AxT0LcUAMgf0=@vger.kernel.org
X-Gm-Message-State: AFuF++lV5p8zroD5MklGz9bfcUePaapluk2h+QgqaSV2G1o1ycwlh0P5
	JjhLY8HHVywqFbhtKuD/qBS041ljegQbsgwXtWUHlEFaYs57HCWTAi/4oXcyoYw/cRc6rnepFHe
	x2TQ8bDASbJ2gr7DAkOUWGpxusRX5Sfn/vLZAVsHDZ8Oxk/bnhyBiZ6dbCmytOtQ=
X-Gm-Gg: AR+sD11J/98AuJvYphyAKNqPiBVpQ6l5iuAzwJVkEhQyOhglqSYFMLP90wrAzD4o35l
	5S2DNtDtr+y3VXACK5jwTpEr1ZneoJ1C4EWnc8fUXxyGfhSEvKHu756i8uDN1Z7Er80X8rpQC8+
	DVmuAIU24JWx7v5xvhww46K0sw9Rsx4yirTdGZH2O51qzxGjxqzss4UGUU0w5I16wKZszo57BR0
	sfnVwzl/tTg2SFvh0k3AP1uceV4hQfi3+xoRuQdP/AjaaQtLEI7WYt/zS5cujPoIh0tWm1A9Cx/
	78UqtmvgRfKymGymHB+yiNOBQjy0MhxcpRE0HE58/k6szJmbmq1Qa9mH8qMou3lxVHXcxGvpXAa
	iIUpYVwQyeoahd7dxqacxcB4wS4j/TT9OQRtKIUEOJ0NdBeM=
X-Received: by 2002:a17:903:40c6:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d707b9ad9amr6997645ad.12.1787684893854;
        Tue, 25 Aug 2026 12:08:13 -0700 (PDT)
X-Received: by 2002:a17:903:40c6:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d707b9ad9amr6994405ad.12.1787684892301;
        Tue, 25 Aug 2026 12:08:12 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d7303a2sm1029362eec.10.2026.08.25.12.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 12:08:11 -0700 (PDT)
Message-ID: <25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:08:10 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
 <20260825094327.606072e9.michal.pecio@gmail.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20260825094327.606072e9.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QsI2bhJItP7a1X6_ZA60pyQczI-LmkWN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX1pmsRjqUT6bR
 GzDqCbn9ph75p68Ul9eJoc9G4XYI3fwOZRK+Xw3jeeP4Apv3HP1SHlJxyHp1SLxhMUSBPiq26iC
 /b7DGiDaGcjPCIIVONK0dBqX7D0IsLodugneOoMd8Mz+nlPVXBk2VydWDCHlATsWaPI3spOK7Ja
 vcCl6bbELl2DvRvVVK3CgmQWHNvAzL6ve71lml4bNyZtGJDew6BinyHUnSZGXH0fWOAvx7eEk93
 FI7keNzLPg1mrp8FQDg+qayGnanaKM7O+7+3Tp5wxMaARu/7WXwqTPe76jgigYH7ME5+zojrtSk
 hbW6LJU0XBYakPgkpTJZGZK0Adzr51ZAq7JSe72L6GoCKgqBazK0jiw6mmj28Vg6aJqgph0xRGw
 c8mOlgr5MJe+xJzBaWjC3gtsAiVx/lEVoojLZzQaZcT7DS9yneZUHMEUDCkzFJKCYxMigc5MsZD
 BXJISpA2wUN/zqPt+yw==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8de824 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=0ebt7_R2-KkC6wfP1x8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: QsI2bhJItP7a1X6_ZA60pyQczI-LmkWN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX0rMx9kc74gEn
 zKCIjCYoKiIxpzlE1vmIhOtCRx4xIia6mBeihUEOSvBi/egd54BLO8Ne9AfhraRrFQczNXgH2L1
 yMWlfmK3IYbJ0mamwFmoJmI5J5rNYSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250163



On 8/25/2026 12:43 AM, Michal Pecio wrote:
> Hi,
> 
> On Mon, 24 Aug 2026 19:06:54 -0700, Wesley Cheng wrote:
>> On some environments, 16kB pages can be enabled from the Linux subsystem,
>> which manages the IOMMU mappings for the audio DSP within the system.  In
>> the current design, the following assumptions break when 16k pages are
>> utilized:
>>    1. xHCI ring size is equal to PAGE_SIZE
>>    2. Ring addresses start at the beginning of a page
> 
> FYI it's worse than you think - xhci_ring_to_sgtable() returns wrong
> data and uses some allocation out of bounds on these systems. Quickly
> scanning through the patch I haven't noticed any changes there.
> 

Hi Michal,

Thanks for the review.

I had a tidbit that I tested that addressed an OOB condition, but as it 
currently stands, that API should be working properly, if TRB segment size 
== page size.  Hence, why I left it out as a change.

The OOB condition I saw was that when 16k pages were used (w/o this 
series), since specified rings can exist at a page offset, that offset 
information is never populated, so we might be mapping the incorrect range.

Regardless, I'll introduce that change in the next revision, since that's 
information that shouldn't be left out.

>> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
>> set with a 16k granular, which is a problem, as several xHCI rings could
>> exist on the same page.  This is because the rings are currently allocated
>> from the segment_pool.  Hence, potentially mapping non USB audio related
>> rings into the region accessible by the audio DSP.
> 
> If that's a security or reliability concern, perhaps each sideband
> instance should create its own DMA pool, as opposed to allocating every
> ring segment on a separate page?
> 

This is an interesting suggestion.  Let me take a look at it more and get 
back to you.

Thanks
Wesley Cheng

> I suppose each 'xhci_ring' could keep a pointer to its segment pool and
> things would work for everyone, with very few changes.
> 
> Regards,
> Michal

