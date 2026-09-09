Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF9270575
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788923271; cv=none; b=IY90FhhxjrjbZHC8ATRzLsev9U3iizrSZWPVtZHpJ/QcTNgihRJpPBZG8tcT7Gco9KEeCVEPdBm+DsNRa6B9lV6aMgLI6nRB7InI0ws2pHnWfU75zD81oe8vlAzWog7nTlKk2+M/1oz5VVT/yWhFEj02o1LLzz8gA+n474BWB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788923271; c=relaxed/simple;
	bh=7tSvt6nwUb7l4EOQl7mknaeKX1Rd4B8AUvBTftBoL18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmT5/aL4vQBWkbrUHG+ORE7E4VKskNqIAm3Bt0S8l9i0XYSMzhhy7UOHkKNQupqd/FSfs6fIqIY3dPK3uEPzlpGYTFjjrJcGHn64Cs5voJO/j0nCsqWuBq2xpk1eyl3m+lbB1PMjqIgsCTMfGjezLZNF8j+sDhYlmdNfnav4Vhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRN+39zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djsEqN5z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRN+39zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djsEqN5z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Mgtfm131192
	for <linux-usb@vger.kernel.org>; Wed, 9 Sep 2026 03:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=; b=nRN+39zrtG3WJJ7t
	ECf4XAKuBvGiEWq1Eh+95SXKjDg4InmKcNO7zh6hfLugvhmn53ralwRI3m2OVo/a
	YBgPezcGw8auKHr1hghgKKbglJoJUXh3GdEhvL/6J+a48X+a8u4em7Z3Tk/dJJoT
	JSMZzqMpEOSeUM/RmldR1RIbYCyTiB1fCvBj4DJLoNk9rOsz5GqUPfeO93ZbTjpd
	MhsBuUydiywBzpQcZPWLvDh9noQsSQpPhpbZOvcwbebOEOHPATQAtgrHnpxer5lK
	KVnbcWITjbr9k7M0VvrzpcJAP/+quBjGx0jGqhtcHUW3bK5FARsT682NJJg5AanD
	X/eBUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpjct9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 03:07:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso2383528a91.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 20:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788923264; x=1789528064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=;
        b=djsEqN5zSUZjsImo1mvo3EfayV1jdV7cF5+C8HWRtO3HeHgNKJsDbr7L6Ooj/y+OmI
         USiuxHI+xnZNenS92YQiqtIwV/vv4mN2ArvblzvN/RKbEMZHA+ik6Yke0+/uVNGu/L7J
         B5cMuBbvJ4c6lJS5+hM1zs2k+cky7rpXfqNi1mXyJy3ftRbkGPAO0slqUdhAaKxVmiHR
         lYa5ZO1nq5uRQrwZh2Mz1QrkfqQz9mgx1i23yaCLJt2HP3/uAz/dl7bbzIP9XxgY5NWM
         5aZ6vKDGxbTPTblcDKOwm2vfnvoFIZq+tx/IWMBYbEXLUkJIi1nlUOIvhU5l6kPr2tEd
         gzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788923264; x=1789528064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=;
        b=a/RaCVBMiX/N1NYURABfm55vZ1H2vvm01wqG9+HboB7z4pdAkVL+naiTN8q0mzOcjR
         /yVXg8ndRdM+HuL4mE3lVpu7elF6w7CD8boJm8egn+rNaVtAuXf1tD4iNjpbGtWhtXgA
         4tFYGm0Dja5o5S1nve9OD7BXmuVCuGz7543VZpmqB1C2T37oH86s39Hv9j5mvpN9jChJ
         BjK2XAvuk+T2NFG3dkcDYUsEa+mFe09qv76X7sGzDmFeeFRUvAGeVFdIbs8+UYRii3Er
         ShfQAAks9wX+gzZTJf/gck+BgXjT5iZ6M6vhmYoVpukXD+virsvpPOzeIlNF4JFV3ImW
         K8SA==
X-Forwarded-Encrypted: i=1; AKwUvBwUCyuJAATV9wvdaMx0X91LtgySmqzP/55YKLflEtTddQ00lFdpKEgGfy7+Fr4uyhdKocvc+yghK7I=@vger.kernel.org
X-Gm-Message-State: AFuF++nZm1EueUr7+s6w+/f4aXOdSUD0/qF8OLVi8fSkoz+nVPnK5Q5S
	M5oKaMHH4sck0g7quvVI6jNCWObFRbzyqhKajqsJFJQO9UTZd0QA+wSBLBuZl5sGEvpSKbHiqMB
	4vZO2TQveavSr7xSdhdy0aA/sag5v6KB3NE2jsFLr48t57iGBwECAZJSDg2j/EP8=
X-Gm-Gg: AYBFou0oW9YTx53411RIL62ejx3lO00Tj240tBiswr8RveZnjXBW/601kvPEgqBypaB
	n2VFCKkglQ8HeSOEcC0K/McK1x/uhTwdwCIZGYHNyn5HaVHNOv9nvUqZxu6nt5kDNgiWp8yv9Sl
	thK+lL675pV/J2IoU6risbVt31H2V/rZ4t6WRH1EBh8DSgIXj2UFzD8WDVaBFQMZXxDBwOs3ZnL
	pBq8/SPjs+q7biMUe38m3yNFSvFHdgtKOb2I6hl+O/4fYyzJMgusafxIwkmN5c/VrV8O3K+S6i4
	+RNqaFV9X/9MJNduTG4t8fW12/VtS3H3PS/Fe17/zZ8vAawH5uf/ZHQBgSYAzxw+x8siRicgoPH
	81B/qDobCUSP9Uj/eSIWR8SK1pfE1cQZthIXNzY15ep6sLa/Q3EqqUqIMYlACQs631geE
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr51053641a91.0.1788923263909;
        Tue, 08 Sep 2026 20:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr51053567a91.0.1788923263255;
        Tue, 08 Sep 2026 20:07:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.240.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm28937505a91.10.2026.09.08.20.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 20:07:42 -0700 (PDT)
Message-ID: <188ac6eb-764e-4805-b17d-e46a362adcfc@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 08:37:38 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Val Packett <val@packett.cool>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
 <cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool>
 <f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool> <aqC5oyqKj6A3y8WK@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aqC5oyqKj6A3y8WK@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAzMiBTYWx0ZWRfX1c9Zo/gSOMLI
 U3xt0MH4D9cVSHXyEP+2g2AmfB2WgieQOM4j0rKZ7sZoyan5FQhpAfFMsd+W7cp+XHv9VUW0mlf
 gFf9wZikeGaPIeQV1p2FdUV/2CCTaStjdrb/QTyHZAE8AAop5B/DU7Xcwa6BJB294m8vGj3qQXY
 zcb3pf3gCkUkIBRa8zTRhzNlO7wlZLB2bJfGfCLyPOoD1w00He8CdYpnbw0cykdzVkY+3So4UrQ
 xqq0EoAliGII7wPGcOkEWd/iSDR07yrzvfUn4q6ird9YYqTjrrXL3jSvGlPvIo/yJ0iL8AP91qx
 1EWyo1YO8pOITi1kI5YWf2q/hFzH7zmYk5JuxC+n+7/nWnqZ8aOoctA8d++r/g3DnO+cFRjCES4
 LkGSYUsPTE6yRWfg8Z5RiE3S2hO+1u4Dhr1ivp2IS6H6vjbC6SfAz776RwXnrOyrfZw0WrX3SGh
 Xljch6x5UYq/5vzuVgA==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0cd81 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=k/HPyTtL2bl9pZtdyDiZRg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=eanv7jwH1jcZw_mpfL4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 5LAQM5_No1llCYyBh5kXkUj8l1Pt7Jtw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAzMiBTYWx0ZWRfX51DKr2c9H16H
 IImFyA/1xZo2fzVTxl6+wbj5nnVG6JswEQS6B5gULWwr3n1OC1NBreOP8sQkTPV8jlsTqRNK62+
 0apCsk1COX2xq3mMm1BE+p+0Kd4MIkc=
X-Proofpoint-GUID: 5LAQM5_No1llCYyBh5kXkUj8l1Pt7Jtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090032



On 9/9/2026 7:16 AM, Thinh Nguyen wrote:
> On Tue, Sep 08, 2026, Val Packett wrote:
>>
>> On 9/8/26 7:33 PM, Val Packett wrote:
>>>
>>> On 7/23/26 7:54 AM, Krishna Kurapati wrote:
>>>> DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
>>>> If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
>>>> exit is done only when roothub is being destroyed. Due to this, during
>>>> system suspend in host mode, although phy_exit is done by DWC3 core, the
>>>> init_count on phy is never down to zero since HCD core also did an init.
>>>> consequently causing phy's exit routine to not be called. Hence, add
>>>> support to skip phy management by USB core.
>>>>
>>>> Some Exynos platforms still do rely on USB core for phy_calibrate calls,
>>>> hence disable USB core management for Qualcomm platforms only.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> ---
>>>> Link to PHY calibrate handling for Exynos platforms:
>>>> https://urldefense.com/v3/__https://lore.kernel.org/all/20190829053028.32438-1-m.szyprowski@samsung.com/__;!!A4F2R9G_pg!aoY0pB27Tlxo3u1RzNzwPHpGsjuAgJWtPeKMvDrL___6gEQb28ew8Rg-O1877xBHB92Zv2fY3_Zbb2aoEQY$
>>>>
>>>
>>> Hi,
>>>
>>> this was merged into -next a few days ago, and I'm seeing warnings on
>>> boot now:
>>>
>>> [    0.613188] sysfs: cannot create duplicate filename
>>> '/devices/platform/soc@0/a800000.usb/software_node'
>>> [    0.613195] CPU: 10 UID: 0 PID: 93 Comm: kworker/u49:0 Tainted: G
>>>      W           7.3.0-rc2-next-20260907-uwu+ #143 PREEMPT(full)
>>> [    0.613197] Tainted: [W]=WARN
>>> [    0.613198] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS
>>> 2.13.0 09/19/2025
>>> [    0.613199] Workqueue: events_unbound deferred_probe_work_func
>>> [    0.613206] Call trace:
>>> [..]
>>> [    0.613226]  device_create_managed_software_node+0xe8/0x108
>>> [    0.613227]  dwc3_qcom_probe+0x5a4/0x7b0
>>>
>>> There is indeed already a software node being created in the shared dwc3
>>> core code.
>>>
>>> Could there be any other consequences than a duplicate sysfs path?
>>>
>> Answering my own question: even worse messages when the controller switches
>> to gadget mode (which happens even with chargers when DRD is enabled)
>>
> 
> 
> Thanks for the report Val.
> 
> Hi Krishna,
> 
> Can you help send a revert patch until a proper change is in available?
> 
Sure, will send a revert patch.

Regards,
Krishna,
