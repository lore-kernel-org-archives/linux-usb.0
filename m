Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489311;
	b=jUxyS7DMl25V3vJNXKEBBG6PChrLdbrrsAyDscExscpqUh2AjO69u8l7DK2Ud7Omq55G
	 CZHFcHH3YDbht8YspZoADRR5JnKYQZqb9BR9pHMBI7adAlXsXnV5UPUQmraPUa6KYa/FH
	 MpgZ5l4tvTh6CkgzrSp+QhoY8dv8LtTiJlPHGfxOWEX6gdJG2YUTOPCK+Q5BPXZN4OL5J
	 cnOzGl8td8CuRSxIVZMmHr/m/x6on1dL2vvk0i5L16/UjmVKfqBc2nDjjavUxWvXbcmx9
	 wvkfWU/ucdAVcBruy5HhEc5tiNVtdK0n1CEvi9gsVW+qPHkzDNUc44/n1DnTd02ABdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
	b=G1HL+48P3yBzggsvyG9BDLj0iUDd9z6m1FyGp3x4EMF9FaOUczsd8zpQI7vKchwO7UU0
	 l5xjVJ9g3oNvAGjQNnz91050WfoiydDipR1qrP3yOYk88aX1/VqfxtlP6zh48Z2JZvfvw
	 8scTTL1d2ESlA+IbKT7BE8Inu+LzsFhdSCYP/UI7Rs6RVPGcFtiKU/xwgY7oEnwk2rmdh
	 Q5od50x8yfHLx5QduSJ59Co2DEnhRXN6FFxlfFonG5uTxSp3kkANH5elqqQicWUe9lK5R
	 8ifqDj3CgN/BaLTpNpC/F40JtuEYH0iT0Y3sbUHIZIyRSf/I19r+qfFFVX/1IwFDl1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UHvxTIF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDenmzFz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EE5606A321
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EE5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UHvxTIF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDenmzFz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kNTW2209250
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=; b=UHvxTIF6tq86T9CZ
	vPUfeezi9q52Mm9ZAiqA1HoB8DQBmvf8A1qYlcRLE6U6Z/3kwMeTg8oOVvdakrnP
	6WOYyorBnwZUcIKLVKj7tm5bIjyepFWbISHwMHoO0vBdsI9/5H0H3a54bbzf6U7E
	wak7+9TWY1q6FlxC9V6sjtIPDQ8tyPeb7WdPIZsAqT+ujuHndmrFLdRgSgz3b5j3
	seP7dDPvMxeaQ8NAtZl109N75+XhPj3/33cU6Tj3S5yrdalBsLx6ZAwxd0yn2rc5
	gaIp3TPH/k1JKK5Fn0Z66AaxW/r4QeXqEThamLzoQF+8YboG2l2VlMkWnVxmwPs8
	uJyzVg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy10eyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 03:01:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so2235906eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489309; x=1796094109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
        b=EDenmzFzucGOU7JuePw9rfv1vUqbSvPf05vg1EjiNZZormuPOdoj8gBzNyxLOEH0jv
         DkeetPmrW6kJlPEKz8JEijJyZzXvZCI8l/swzi86yAvSaT+CqgK5y6SOWovIrklkk8ZE
         zXczc8krVU5Jyzh1fRg6wSffq+Wqrve3K+bsozmXZJjB8p8xDCDWwqVvXS18DZ4LO+qC
         0K1WM/r9sjp8ch3cjp8/b79+taLFGbNjKEkqJ34esXyxgCaMT4PqzcbeECBpePOTW6yt
         vXFIHnlg1PQy7u+fGxcLahcYSbNTmzOirmoSkDjzzB7js4JAQpQtCDTRB1fWiu44a2md
         BP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489309; x=1796094109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
        b=ZWdVxY1Du9dGRdnaaE2fsiaoyw4cEHgTj/4jElJyzdsBprdp9wILyMpclOvWBh1Ecc
         YhvSZ+1LqwFLmSmvxnHvg2C5sHb/mEowzd/RzMu+5nxXnkoNewcdkmKfdZwcjc9F/u9j
         +VdHglsPXflwPVphoHbyxycJJcytHnTREqHbOgIdz2pNqJo+NilLRpcyUWDUpohE+5ff
         nEOZ66zdW6/ekLSb54VIvxmno0jz4w029/cwpKQmYNsyo4knrc8fp05tiSrDxkNw7AaL
         G1iXTodrXV0kBmqKAWXRlLtVJZ7qA8hYkaeg6nmANCzalwqFrNu4N0ke9Nuw2znZyLpJ
         eDfg==
X-Gm-Message-State: APuU4Z8vE6DB2s/PEJjAxhS4jG/0Ow0i+j9R5j+zUjErviW73M/eBlJ+
	g4f+oXV6HvtxvVWlH5KKQWfti0t+xmy8c3Lvh2/YyL3RchPLymJdZnfqQu56VMdnQr6/l4ZtHK6
	2EA2CSYDUOlcrzfIeiUeHHxfZreWV3ZG4AXPcUbOZzP7PBVoKbuOqNUOYa/SyZ6Q=
X-Gm-Gg: AZFdTZe4/KA3RaBdXFCVeqZFTfSbXsZs07peMfI/5XegTYbUPcoST+1+cpM3UT51cpj
	82dfFUVVqfYZP+4ncP8IzU7PPlv4PSLNOe0OPv2Z35P2aPe1WBnM36Gio85p5l6nrJVedOxGgnX
	VuiDEfbzpyY7frQJ8A33HjSW9em9x0ih4RL27h5AS+lUNBuemIpGl3fDQ6REPdeuCjXOv3Fbyw/
	oDtjLunXnDowmMDnXtlDwvc0l6jMn8PhBIeBeFle82C7u9DYORPZc+yXKhWCkN6XbLqW56QEZGJ
	kKCEZPhEigroS3NR5wSTAufw1VSU8R9NV+0qHsy1nur5nuPNjA15L65T5++BebSqpwyngRml2tO
	njrCC4jRz7FIZ+67JlRw0JXBOg9g9cX2112cV9zoKN2jRY9JHuTaOJK5A46zppAGRnF+3SYyDkJ
	GBPoz6OzSNRX1BjwsfkKrC
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr5028549eec.26.1795489308677;
        Mon, 23 Nov 2026 19:01:48 -0800 (PST)
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr5028508eec.26.1795489307870;
        Mon, 23 Nov 2026 19:01:47 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm43491619eec.14.2026.11.23.19.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:01:47 -0800 (PST)
Message-ID: <6c3c9468-af47-47e9-941e-49619c35a5fe@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 19:01:46 -0800
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
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
 <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
 <82a57df7-a3c5-4986-a724-44f00b22a532@oss.qualcomm.com>
 <026c4fd4-cae7-41e6-88e7-be8387031eb7@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <026c4fd4-cae7-41e6-88e7-be8387031eb7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aWuJHaB62LTjn-PYd-0bgpOo-_OqFP8d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX/tyKyPiO9Rxu
 n5Xrfx/moF+uCzooAebJRz/MFRuZLpeam1lTIkTCkhRxRQL1hOKOVkzNMgnfeOIGKKCHY/T87BZ
 gEmVmEbtXfFrlR9VXh5i9v9WCuXnr8g=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b04fe1d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=cJ9xjPLimF7whQLiEp8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX/znZEHUclsKD
 XCrv/9hkEJj9dsSt5YTPil4YOo6ZHZiRRge8+kK6YM/WA83TpIke/ku/Ap8VcalstfTy6XSXWcf
 9Q4YcmJXrIdDDZN+gPJySbcu8fOCTnifWeDYZVgQeHSf13Txx0GAVjpbiULI7KV6vc7uJqJf6Ry
 bD5ut8thwWSXrtCXJdppl+YS28+y+XZ7WvfAGgBq1cyS7Jl1T+acqy2zgAt5ZWmtrtxyndeT9ZF
 KRGGpnkf7z8Duq6zSQGt/Y2WoiUXTrbN/v1sZ1SoXAcKxjlKsknV4RIl3ozB8UGCib0/Dy0pshG
 ExquGAGejW7AK3/5yczTQ6smOoFea3hsiEYYiAj3i+9TRNeo2d0Mkw6ZfW5WfISMZ0dArHkkrgk
 /8XImtjeQyCWGHWrRxVmvbrsoO6ACD4z8LV8gSiO4V5cT/3Ibtz4cwGGMd7mOvI4g15XaYeA6Fy
 TfrWJUEjRaoYFF5qqug==
X-Proofpoint-GUID: aWuJHaB62LTjn-PYd-0bgpOo-_OqFP8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011



On 11/19/2026 7:26 AM, Mathias Nyman wrote:
> On 11/19/26 00:30, Wesley Cheng wrote:
>>
>>
>> On 11/17/2026 1:59 AM, Mathias Nyman wrote:
>>> Hi
>>>
>>>>>
>>>>
>>>> Hi Mathias,
>>>>
>>>> Was wondering if this design looked a bit more acceptable?  Was able to 
>>>> figure out a way to achieve what you had suggested earlier mitigating 
>>>> the dma free problem I mentioned in my previous email.  If there are 
>>>> any issues w/ this please let me know.
>>>>
>>>> Thanks
>>>> Wesley Cheng
>>>
>>> Big picture looks good
>>> I got stuck on the "no_pool_rings[EP_CTX_PER_DEV]" solution in [PATCH v6 
>>> 2/4].
>>>
>>> It reveals and reminds me of how poorly designed existing 
>>> xhci_free_dev() is.
>>>
>>> I tried to quickly fix that fist by 'unlinking' vdev from xhci->devs[]
>>> inside the lock, preventing it from being dereferenced based on slot_id
>>> somewhere else, and then free it without the lock.
>>>
>>> I ended up with a huge mess that rewrites vdev free/allocation,
>>> slot enable/disable, xhci_discover_or_reset_device() and xhci_resume().
>>>
>>> Seems like best solution for now is to add "no_pool_rings[]" to support the
>>> larger page size, and then later rework the vdev allocation/free and
>>> slot enabling/disabling. I'll take a look at the details of the series.
>>>
>>> I also have another sideband change attempting to fix the use-after-free
>>> stale vdev pointer in sideband. It basically swaps vdev to udev.
>>> I'll post it on the list. Let me know your thoughts on it.
>>>
>> Sure, I assume you're talking about:
>> https://lore.kernel.org/all/20261118125109.1429538-1- 
>> mathias.nyman@linux.intel.com/
>>
>> If so, let me look it over, pull it into my branch and test it out if it 
>> looks good.  I wasn't able to reliably reproduce the issue that Lianqin 
>> initially reported, so I'll see if I can figure out a way to exercise 
>> that call path.
>>
> 
> Yes, but sashiko found one missing sideband_to_vdev(sb) check that would be 
> good to fix.
> Rest of warnings were expected.
> 
> I'll fix it, and clean up some other minor things, and send a v2
> 

I'll end up needing to rebase this series on top of that submission.  Let 
me know if you have any other feedback.  I'll followup with the rebase 
submission next week.

Thanks
Wesley Cheng

