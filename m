Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041007;
	b=x+UEY8Mj/w6efPFV5cYtDcYYQw+Ipviyt9xuwYR8FYMFVIIOs4Ug1R6UUhykCr5ZChqv
	 s4WAdJN3bRHPoCZTnvfX2IYJWNUq1Q2RXkARC3j9nNGsXHz923cIUpCRpbKI6QMCndUHs
	 Ef4hAwuwjkDXli3duErxrSgdrg3LxT6bBvhZ/28qPUiHEw5KXAkEn74sYlxAZ4SzXNTnA
	 BqsJBY6/ltpglrmdyePicLo7qfZ8hM3zgGBCd4p4k3VZBKwmS40yqPy/4EDAgdL/AOKPb
	 VG2bvwr0RNN74HykusML6WpwvTAje3ooAkHHVXFYiAQe4BQwNaUKCM5Hx4vdUCxoYXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
	b=Q8n/dfse8z5aheh5/3Vo6+GUQpulsHeuTorcVwMxV8T52+FOQ75pa59yZxbhHUa+R2nr
	 Hm/Jhd1+pV9oz+PTNWsHGfSuLFoqMFLvMGPOIJs21CPPlD2wRrBSSyUtJynu1c1SpRkt0
	 563eBSuGHuX65h04rM01rnU1+Lvn/BPCLDjeccV1uuiu3AuZ068BC3BPr3UUvopdgSyA4
	 X3KTzOicjVpXrEAsXACqt3+SvGPEw3FLc3iLZpCtCb9HDF/uZEk9zCz+y3zbkijjMjgux
	 IcxCnTl3N/oZ7wrNjnOODriXR8PnZQBSmR4WP/QtPiEKXRAhKSOJhmz8ltcxXJRpiYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfyK9ayF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etK5QvD2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E6D606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 22:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfyK9ayF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etK5QvD2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDoRa702781
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 22:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=; b=MfyK9ayFDB4tVk9F
	9aV70tTVs37YAqlLn/b9MWH2GPEFsbk4uPIlcM85RxFQbMSiUvlZsYwLdQNOOJ+C
	ZAhUie0BZqi8vFwgX6Aw/fsMNGCTI1DC5ZVN6j/mjIRX7fymvHXpwgqjfMwHkZOf
	r1OovTlzgZ/lnULD9RV3JFEAePu+RLOHUfYg4EJ8KpL81nLoI5aMDRj1vkMYjckH
	XENBMAATbeST5eu+UkvxoGTh8ow8zjYJDp6POjaFLMfzxNQNK+BeQXXbw6XjG9mp
	1H9d6+O8KyRZwvirndwIZJSrghHR6aKsRaeFFyD+XZ9QDd9Xr0Zrhdmldaq77ZCD
	LgtOLQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcs22r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 22:30:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1728062eec.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 14:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795041005; x=1795645805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
        b=etK5QvD2ikQUkhNM9NX8Z3CtQ1MDWiTNqoo7Ht9+F5s2IW+SPIOWWabXXOilmhtD1l
         62SI1oWUldMWLVg3k9CFybeeRrjeoLa71rJX7Zp7LKvVwquSRzz7b0Whjw7bBs/lLZTi
         decTLdBzzQmxvwtFhgyOugVjmvol1LkWKNM4tXQTEIFvXnJZPQGl0Pa2gjidRKMSP69K
         2c+BHdNWmQyk6s/Wtik4rtV5E4cG/hnyZHcqxhWqNhlkWs4OrpBEZyk3RofUB5n9RpoQ
         Knuqbut0f0ISR2vQku4Fz1DOzII8vnkaBmzqsIjL2buaUhZK2pPxIAxLf4vdT06y8+sc
         2ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041005; x=1795645805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwG2VB2Wght2+kRDBqQxxN0X/372ypCy9eDDgyMvCTo=;
        b=LYpjdPIHhVIq5dIFEZQcgIArP8QOiLs3gzHa0vgQ3idQgaBDBlHTJojfFUvKX2Mtqm
         F7etZ1FL/4rVAqqFEiV9vWah8eUBdKv9QjgO9/v0lRJfdq51WtD5oJq6LqUDiQ35bjWl
         DsMBvRWkkoguDd9i3wUtGAPNKjlPTN1pI2b6PbfbAigfoJy6h2vHv72JLb5w0iai2r3d
         a36kFErihML9O1Yn3usld1oYqpaa0vxfblNM2HgsUsz3Lf9YIAxowJeVJsaD2Nfrc2Z/
         q+cVoGTTW4ZsEauCaR867RGIiGE6UdI6FVi8JABg4rb6PqnfL/9yw++UIahACWkZOiue
         p40Q==
X-Gm-Message-State: APuU4Z9vjpgbMLDc2apNHzYy6ePAKb3QuoRGIPjgrqfuNIh+Mye8RqE4
	yVZN25BphjlTeR73DDYLSnDo939tUZzIWdU+erW8vT5dJNaRmBIlxXhuRp14V+x6ulZawuy8rwH
	LrEEl3RoWszg82/aXUU3qGJqqZwIyfVnTKRntrd49/dl0ePz6x/sijpU6ZLF0v0WTNFwQe1c=
X-Gm-Gg: AZFdTZcfig1lAU4t32pF9n3UQzHLm89TfXXn1Jt4ufZ+OnntzYyaOxB885TIQF+Fe02
	Zv99MDA/AZCPi3baUPnczAzRGDbdnr694o4uIN7p9UA0YIchWqEqUu0KBAy5nkuvlzX5+l40oD4
	vRpmhcg1aEB/OpDsBlCB2he3UHeayk0DaGsIN/XesvkVB6DwYQ2CmZ4i/vYRGb7y+JYic4vGuau
	Y/+RpAwOq/4ArZgEaVMm1+qIpC2ApYzhoRwDu21/PLNGrxQIuWBSnF340oGNciHKkifzV3RiIWy
	M5cRJBZWFWNatLedg22a6/7pr69asBAPHgo3FADdT7Y+l0P7bkR96MEOizmB9sBY6xQqs+1iM5I
	VPYuiLRLFjqgABX61Ut11zj2XYhPlZZmwgbXmQ8kbs+rqOtoGjtBx1w46zcyJvuJxVPnqvYoS4I
	9DaLbbY/u4sAbaGGx/O3w/
X-Received: by 2002:a05:7300:824a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3827da13cdemr3842404eec.4.1795041005017;
        Wed, 18 Nov 2026 14:30:05 -0800 (PST)
X-Received: by 2002:a05:7300:824a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3827da13cdemr3842374eec.4.1795041004286;
        Wed, 18 Nov 2026 14:30:04 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm11315249eec.28.2026.11.18.14.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:30:03 -0800 (PST)
Message-ID: <82a57df7-a3c5-4986-a724-44f00b22a532@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 14:30:03 -0800
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
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afe26ed cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=smeftMHU5e7__JqdOnoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 368j2EWlglKO5sPdASJTCBCRJPUvo0Jo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4MiBTYWx0ZWRfX1Uy9Ra0H+BPo
 il+rYW6nSO01YdjsdaV0+mkMbsjxIyyaIZK7vAhODNKSjHPwOok9wWSyFAzyYPKm1kbfggLLxqH
 K9YK2oFT/wOqnqupP2KjjcRjwYEGzZsTDYW9jevNyZmX9NJusdlnugEvASoUSfacZ525Cy/5T3I
 uCwC1cOUTKT8DCBa8oeDHLvou8yYaCgbnm78EIm3O9R27nTdA3+lJkFdxga6T9zqKXrMp7Ht/xB
 QkznpylwN/QyrzRKYeNNtUxTynA/jBSUFyL1kQ+wjbsH7+wKXJeg1f0otlTIUzpvY/jxvE1XmW1
 797MOyM6ZoPXLFWmndrU6fUAdbrSIRfuGIp8083ahoI0CpolFe9ZtWBEgQT0s6LO8D2JlKfP87T
 noDh1vd83UqvyDlPtzBW2aORgWnl1IR1lUdUDJ/GMVgbgjViripVMi1t9dlDrLjauGhxg0ZCONv
 91dSjPlNZkEXLe/FeRg==
X-Proofpoint-GUID: 368j2EWlglKO5sPdASJTCBCRJPUvo0Jo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4MiBTYWx0ZWRfXw3yqinNI6dlx
 WUvn8eWTNH7crbhEuyuyf/oR2t7czLLbgICL7v17Rl/W5xZZedmIg/WYQLu1yq36thxhcp5LQ4g
 XSjKrjGkVEzRJ14yj/YoYMY0mlER5Nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180082



On 11/17/2026 1:59 AM, Mathias Nyman wrote:
> Hi
> 
>>>
>>
>> Hi Mathias,
>>
>> Was wondering if this design looked a bit more acceptable?  Was able to 
>> figure out a way to achieve what you had suggested earlier mitigating the 
>> dma free problem I mentioned in my previous email.  If there are any 
>> issues w/ this please let me know.
>>
>> Thanks
>> Wesley Cheng
> 
> Big picture looks good
> I got stuck on the "no_pool_rings[EP_CTX_PER_DEV]" solution in [PATCH v6 2/4].
> 
> It reveals and reminds me of how poorly designed existing xhci_free_dev() is.
> 
> I tried to quickly fix that fist by 'unlinking' vdev from xhci->devs[]
> inside the lock, preventing it from being dereferenced based on slot_id
> somewhere else, and then free it without the lock.
> 
> I ended up with a huge mess that rewrites vdev free/allocation,
> slot enable/disable, xhci_discover_or_reset_device() and xhci_resume().
> 
> Seems like best solution for now is to add "no_pool_rings[]" to support the
> larger page size, and then later rework the vdev allocation/free and
> slot enabling/disabling. I'll take a look at the details of the series.
> 
> I also have another sideband change attempting to fix the use-after-free
> stale vdev pointer in sideband. It basically swaps vdev to udev.
> I'll post it on the list. Let me know your thoughts on it.
> 
Sure, I assume you're talking about:
https://lore.kernel.org/all/20261118125109.1429538-1-mathias.nyman@linux.intel.com/

If so, let me look it over, pull it into my branch and test it out if it 
looks good.  I wasn't able to reliably reproduce the issue that Lianqin 
initially reported, so I'll see if I can figure out a way to exercise that 
call path.

Thanks
Wesley Cheng
