Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771995;
	b=YzkHuSw4m3jnU3BcqkJAynQeHgTSAzBZUTID6kyoK6Ri7KyDajs8KuPYpXlOO/gYxdKL
	 h+vUqyaONTC1eB240XB45Zp1gUXrH9HQB2yibdYvvT6nyUR6u02VmTShsN05Q1geoylim
	 4aFhyl5B/jzEc3EEh3jbnTgJfgbhvuQuQJhMjNLF3i+HbHEb0wRPUQa6W92z+HxLTgyNW
	 qcCh4I5Ta9adZAesM1xY7SgUzsSHwHcTTHGS2T8PmG9RsnV6VWv7fqIYEGnDHox2RnSE8
	 k5EuWbL5hnvEM7pC34VrmAX6bFRzaXX+t8rywtzr5Qu7gkgTFpHegXpdfCgyGKkGwrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nhpwz4SRhs59cnGd5Tl8xadcSjhoV1i4XB92wi1G84Y=;
	b=MEc6ZYwpQeyl3axHn181zhJy++zQcT8sA6n22DQw57umEpeeq5VuuxkpfeEgGkpPKNqA
	 A5I7zpNqJOOiOlgjFQhz16SYs/d4fIjaE0qTOzymRL7uic+zqbKroiDpxykGsm7hK5yGZ
	 sX7zjx6qcbUBbNQB0+56XVY1XLacgS60xGMlj5bCtXXgZCPbz34+Frxd+QP6ez/hgO4FG
	 cpwqR/e16htAWWAH36YXbeRkDfA9WAB1ydNyGMa4lFwz6wBsuszDbRtqcaqJa8lQ7iCS9
	 c3TJv7oKAfxSqtnalD1DF4QqpI44xEgOy2zaP7udzgnNVWizyOfqMzsU1skub0TxbJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cJ/odVWS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwL4geGK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A30606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 05:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A30606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJ/odVWS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwL4geGK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R7IL193435
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 05:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhpwz4SRhs59cnGd5Tl8xadcSjhoV1i4XB92wi1G84Y=; b=cJ/odVWSspNYKz4E
	5c0y/4l8UbXWu6qt8bIvVPkNMRl67TR253t0Ki60dRK/RDGXFS/q58Wh/ghw/ouP
	njdGVqjUoKEHTPv/8ajpcu62iB0nLUGfsFSLjODrnZt5ColbcduQ8SCDHgKr3FYu
	cQXF9VyaILC63iViHtkNTPFuLKxb0ttX0tJmcBdftylxAJf8RktfCvol4Mzf5125
	wkc92AzKpRPAB1Nc0Vg7Ppw/iQKS8mjM9t/eq6CFWf7ScKl59WN4bEk/+odHr6IK
	eAEHfMbDXfqn1IwEqgg06Vp8XNV9ZW2jZX8oC/FdvvMelhqPXJ50A0EuxrFUW8if
	0NnY0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nj728-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 05:59:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed00709df0so3498785ad.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 21:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793771993; x=1794376793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhpwz4SRhs59cnGd5Tl8xadcSjhoV1i4XB92wi1G84Y=;
        b=fwL4geGKpHLaMwiiMG8eOD+XPBfDUw6TCnNxWczTgHB6tz686Py57g69cnFhqe8MsW
         2l6F8qvTUtBzFxlSbbGhVF/npjfnDf6A300qDws/qvHmq8dv0kG52gDdj1ZNvSVXuuLM
         Sbwx6eCFRhEMTkANoZpnzRzbCbIvPRxdvD0DQgOjw7tzlZzwOpo8Fio4ici3ekNa4LTu
         ZzsrvCobKi74jCVdbr3FPm1vZ54u8UPXaEgyrQqCn21nGbEhKG3PGw6sgkVHxpVqk5/o
         LOE7umcc1pd3hBj1rMaQhqrZ7iegZyfVEJSyNy6WlWCxZmlRkbsr8VY3MX5J7h+yRA+F
         4aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771993; x=1794376793;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhpwz4SRhs59cnGd5Tl8xadcSjhoV1i4XB92wi1G84Y=;
        b=xWl+or8VObn9iO6Fqm2Nj1Pn15I8mX9sIKVZAC2JugtvmI+GlyhdBKoZ5xCz7IA3dD
         S478XuNnX5RuYRpXo3Z2SZczSSJBF4qg7rEFWRG8j1Ez4KF5tw3n/XoaG2ujSjuQEx/Y
         d7En05FpG8pks7mlcT1S48NgyMbXOa79sUR3PkXartOUo+ZpmmAF/rBhLXlZ27Vke9Dl
         Nyf7fi+CrRg7ph2pLz3R1uIW1caVkTqWJaRluht1NH2muRR0wwL9CS7uOyg7RUrivJMA
         yx+Hu5KmYV3SFo7ZPX6Z8T5EKZ174vySvtR8a5iXQ9NPz1Yb+sX68ZHQIBF4W2blsLRm
         YV6Q==
X-Gm-Message-State: APuU4Z+S8sClA7xRzoyC2FA1hy2d6/mKP1vbdxeT81S+T4QdKga5rd1U
	q88y/IBNXpYHhPjEmlVKzrBSww7FZf6XOK4OOPPnuqX7d+6wkn4tdwjBSN5zEchPwVJpS0OXYSA
	2+eYEUuNQahzchb7VwUS4TUTmwE6MLOZAftFPU4AzqYWelV4kgpSD0eTSfR6ao6c=
X-Gm-Gg: AYBFou1TcTj96hVVV8M6JZGpLjgmvvoj5OQOMQvy1w6II8WNhKPyn3M5TjoGFlWHVT4
	oJuOYfyab16jKAlfGBJ1RC29cbNbRmNxlxW1OfQm9IESmWG9285QacBQuuhZMDNWh2kMQA8g4S/
	VDQSfI1SvbhqquIxCMfV9josmmX/T/iuEnrFSQnrqd80E7D4hGkYv2stSeFsTCsm+ztVb2C49Jw
	ObLJP0LLtf/VEVa+Yy5G/IpeBLvtuhiN6h5JLPR4wkrXkrDzpGJ+TINxTE9hmAwXosWPNrKNR+s
	jgltVB/ilc+iRer3/JbeZtLgaJuenPZ2cF7rLET9bciH5FcCm2PQvFgPIZsaazi3zcB+JSSBloU
	QYfxdzk97w5CtQfofdwLJXTc1R9lTSMIEFA0oWUUoB3si2yQJCp9GHKl9Pc7l0Ih+ypwnsQX6Yt
	2v
X-Received: by 2002:a17:903:98d:b0:2ec:f757:23b with SMTP id d9443c01a7336-2ecf7570291mr29859645ad.40.1793771993347;
        Tue, 03 Nov 2026 21:59:53 -0800 (PST)
X-Received: by 2002:a17:903:98d:b0:2ec:f757:23b with SMTP id d9443c01a7336-2ecf7570291mr29859465ad.40.1793771992816;
        Tue, 03 Nov 2026 21:59:52 -0800 (PST)
Received: from [10.216.40.83] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd5aa7sm2781225ad.7.2026.11.03.21.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:59:52 -0800 (PST)
Message-ID: <1b06485e-d01c-4e86-9989-16b24f5ceb12@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:29:42 +0530
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
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
 <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
 <aufzsuS-hX5HTgLQ@hu-petche-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aufzsuS-hX5HTgLQ@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX3tcyiQS3S9yv
 fiTneNiqAfvJ6WNqdHlrIsQ9c8ToC8GKb9ZDMQFhfZi2XWnFw3/x4JgiDXPpimiBruA1HXd1gL0
 y0bI6wEE0bIGbHGUidO64SFmhNd0gufX/HAxbLT0p5r0/Hxv/3zb9s7yVAs7RQRRVrs1l4ZTBBi
 mPizyY3TV4hcX3cIioWvqK623AfuWdrcz40QoxP7CkCAUp5uWY4wO+eArR+dULv/vCZ85/GOH4m
 HeHZ1vqjx53GsGmG8xvfFRyI92/Ut8N7A4EL7NpelXVKqYHd8b8NzO+dw+IzZRGlwkY6VGXTu/J
 51L2pVh007GxKX/swfJA4JGEvMs/NpQeVxZqWks9E6pJbzZDBK4v29y2LrBQoz9/frTOsBfb/tH
 Gt6ND776bPmUZd9zoCFfUpuplN5+yumP5tViyMD5/y0c3cYwNIHKwMc3tGtI2yqaamVIIlr8fK5
 qEhiXCVHktNhfp1mOYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfXxxpj8yJpGkfu
 s5m4Fo1PWE4YfLaKOt/PhNDoqbHMtBkDG1FFSc8TTBFm4/4nDzq9Aqu0vcpXISsDs/sg2zmYEsA
 aMaO3AqDluNYc6zTYrMGlb01X0FCjxA=
X-Proofpoint-GUID: ZRCnEnX_Ws-59WabnwjsvDrECkWOjsVZ
X-Proofpoint-ORIG-GUID: ZRCnEnX_Ws-59WabnwjsvDrECkWOjsVZ
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeac9da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=36P6ODGhHdYnLHd9aFoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040023

On 02-11-2026 07:51 am, Peter Chen wrote:
> On 26-10-30 16:54:55, Faisal Hassan wrote:
>> On 30-10-2026 02:54 pm, Peter Chen wrote:
>>> On 26-10-29 00:29:31, Faisal Hassan wrote:
>>>> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
>>>> clocks. If clk_bulk_prepare_enable() fails, it returns with them
>>>> disabled.
>>>
>>> What's the relationship between clk_bulk_prepare_enable() fails and this patch?
>>>
>> Hi Peter,
>>
>> The wakeup interrupts were disarmed before the clock enable. If that
>> failed, is_suspended stayed set, the next suspend returned early, and
>> the next resume disarmed them again. disable_irq_nosync() and
>> disable_irq_wake() nest, so each failed resume left the disable depth
>> one level deeper. This is the rarer case, so I will reword the commit
>> message to lead with the runtime suspend case below.
>>
> 
> Okay, so here you may need another patch for error handling improvement.
> 
Ok, I will put the failed-resume handling (the wakeup interrupts staying 
disarmed, with arm/disarm kept balanced) in its own patch.

>>>>    }
>>>>    static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>>>> @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>>>>    	if (!qcom->is_suspended)
>>>>    		return 0;
>>>> -	if (dwc3_qcom_is_host(qcom) && wakeup)
>>>> -		dwc3_qcom_disable_interrupts(qcom);
>>>> +	/*
>>>> +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
>>>> +	 * even if wakeup is now disabled,
>>>
>>> How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
>>> hardware default value makes it enabled? If it is, we need to disable all
>>> wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.
>>>
>>> Peter
>>>
>>
>> They are not. They are requested with IRQF_NO_AUTOEN, so they stay
>> disabled until the first suspend and nothing needs disabling at probe.
>> The issue is that runtime suspend always calls
>> dwc3_qcom_suspend(qcom, true), which arms them in host mode regardless
>> of device_may_wakeup(). The old resume only disarmed them when wakeup
>> was enabled, so a system resume with device wakeup disabled left them
>> armed.
> 
> Get it.
> 
> At your second patch, it already knows the context between runtime
> and system suspend, you could disable wakeup enable if the device_may_wakeup
> return false, that could avoid introducing more judgements, and have this
> patch after your 2nd patch.
> 
Agreed. I will move the PM/runtime split first. Then, in the system 
suspend path, I will disarm the wakeup interrupts when 
device_may_wakeup() is false (including when the controller is already 
runtime suspended and they were armed earlier). The resume side then 
needs no extra check. The failed-resume handling goes in a separate 
patch after that.

Thanks,
Faisal

>> The comment read as if the interrupts trigger while disabled,
>> so I will reword it as:
>>
>>      /*
>>       * Runtime suspend arms the wakeup interrupts regardless of the
>>       * device wakeup setting, so always disarm them here. On failure
>>       * they stay disarmed, as a level-triggered wakeup line could
>>       * otherwise keep firing while the controller can't be resumed.
>>       */
>>
>> I will update the subject and commit message for v5 to cover this case.
> 

