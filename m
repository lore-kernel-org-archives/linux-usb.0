Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232624;
	b=GFRYW78hkS/R/prmxZfAk7LBkBL1WaZsfM+r2ZGqaIqdgTC1FC7wKDyjYji8zFuVZQ01
	 gaV+UJ7EgizDPTxuZTqAb8GvXjhj/L43+yUG+MKCeFrczq/hpx0X7iz+7AfpzSGZCY2il
	 KCmgZMzarjdFj0h1V+i/fpwcNJ5Ed1ispUKYZzh4PNpUD5t1WrEdJH85J6lK8RY9TMRmn
	 v3E/YvoUnz8jMR153snFRU9dyzRVN9KZfRoZtck+JmkJ2EB49cnF/UnC0OXpBSTFlJVo4
	 8J7N6BbIjxlu/3+62Zve2KqGTqAH0kYo1caU77k8DnSl4f88lWkSoxFYIPig5Te8Njw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
	b=y23Iy07GjFFyKC9YZoIPQOy+Z/6QtT2FFiUiSWvmxdxIQ0VX3b7VqjGCCwoiqt4rsJ0D
	 jg8+UkhXPoOSrddfJ8YJvtsynwy0eXHbPVWXJ/5o0RoXRWxhr7NvLifittJ30ktYjN4wN
	 uHv8vdgJmm67dq1Gxsr5jm4Z/L7BCjI4chr8K02K+iDjq4XxUjxZMUOsRuw0QaISTqE0X
	 o7KJq3pjSLwFtKrbacVASW3engO21w4UCkF0UcTlPEuePXJuiXixfWmh9l3Q7NOVs09an
	 z9y/vdL9Bhp8be/0iYS4kTB2E8lyyVhDJjTLJcOEGGqCRvtTSzps+0AMNarfHIR5n1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ssm+gfrs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N3Z6FVc9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA070606A322
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 13:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA070606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ssm+gfrs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N3Z6FVc9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEvXg309699
	for <linux-usb@vger.kernel.org>; Mon, 9 Nov 2026 13:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=; b=Ssm+gfrsD1ev3JpT
	ihtLKigOBpwpsIOlBx5QTmYQY4VnX+AKrqPHUInLe30mSrde2HDxKnO3Z2Ns+Ze2
	EO7t5nkRA8o/ot4Z5RFQY53LFNoD0MZPJz7Zw3eTD1KT++R8kiF6N35V2typEA8D
	1Q/lnBh4L1GI0dUIS70i1+q4CCAE6fnkUuezvDVKiCMtXyCBTZ1PB5hoGSCYdSNE
	Douzjg+4uMqPnS/EIRy0czCrtzxmGaPWxIJVpg0UPPcSCVMOUpo2WCgKEMgL7YQS
	psBSFB80skxe5u8NrdFkT8OmYY+tbvZFk7rlmTQBDxbpU0WA0GQ9Z2fAWrrYLzz7
	kvBCKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8p5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 13:57:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943fffbc5dbso20678785a.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232621; x=1794837421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
        b=N3Z6FVc9NjRtxPtIpyopph5Ez5wtPf5mfXqnwsjPN+w2a6qPUkNZ2aX4srzVW038Fc
         4AVkpPSIzOfZO+q877R/5oY9buYy4q/UimePBYP2i88sNGlebvOh9MF9z1RmT0MfjZ0S
         +3aIfqz6evsPjsdBoodDlpJDz84/hqpLPYjDu1PJucTPK4WxHYUuOopI9ClKRnxN5EqS
         VSKQliZAITbBfV0lO1pM4Cmgd7cuXFjqpmDvuMDgmkCv5H7taZw8e7+MoBkUQG1w+prq
         o8pwAq6en//8MYBbfdv+9FXS43ojdepyTgMg8DtKruHrMphNRZRuWqEDhONyf9/1Ua9Z
         shFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232621; x=1794837421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
        b=VAyaRQBwOBAbsnoxVIEFFq4xr70iMZ5JEzSkkr1R6X/oRe91orxO47E+RTsNgR7v4W
         5aGlxmPFpq7cRxUhbLmoOUBIjXlX+hhVAY94GsBgYGIbeMq/mhmqWIOiMtb3Z5XhW5cb
         5zMYPCzEA4hwVOfxOtyN8V4KK6lnmuZW9R2ZDddVrCEbSfbF5lE+NriXrY/FgNb9DFhN
         i/2uUSgfj7GFgbAu2HNGC9M43/QilQ093fFNkHQADEt46b7n8dqrbp051aqf5x1s+l7x
         KL9U0QqYdN3qLNsi3vPGJJDLOsIqoD6YB4zWkjuRGvQGNSpk+r4KnRJl1ciYWQZCUw4F
         nVrw==
X-Forwarded-Encrypted: i=1; AL+hErHOHwZPNo53HvZZ2esVXKFLIR+nngPa6rugI758UkiUDkYXN9EaSDELmgvWNVuusXALb7rICcJQL2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lPoyVraPtCAJyFqnVWAYqEQc/jYNBHuji7wbZy1EceABTJtCh
	L9RiaRQCp7Pe4I6UouVWVgr7+F/J31J99KY+6LSQQk8df3zbNfTzlrcoHDBvv2x6nQk/GsUo85E
	72VrH/GA5MkviwLMNsw8Tc9iwbGlAix/uuZhUd07l51g6Sx4f+40aotksTu9/2Cw=
X-Gm-Gg: AYBFou2BD8O8dY5nqBeqljPiVsJkt8Qh5d81bVyfrdL21hiavCLK6V7X3YsBFLoK8tn
	ftVwnUmIfldxO08LDZ8NIquiCqO5bFeLO9qyJDM1jOoPrKZhBZm7ASwigr2v2O5CmVteRWjXxlp
	G1q9fkV6kEld6MTGFXbj1zK2C/uHdyNGcdjgZJh0RBmSBOMt32hLtEZzcUbAKxX12UalAetWD9u
	dseEJuKCjZqK2pGyYLcFt7PQlLPE6exDPr/T0OZolsfrXSk0QeR+ISOwcChkekgEWNbIWW3ZJkU
	eUEoJF9Idr8lCv4EsfdJTXK522eer0wZZBtyqH30C4/bl2gPGRI4NODHLqCCJZAOdjsE33lthiN
	mg8y6UhcNrN7PNAjzEiEPtEAYBU+nyluFIGn91gq9xHHO+gri4Pk0h1Hub322PWD73Atztg==
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr595078785a.6.1794232621061;
        Mon, 09 Nov 2026 05:57:01 -0800 (PST)
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr595073985a.6.1794232620528;
        Mon, 09 Nov 2026 05:57:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4aeccasm178463066b.56.2026.11.09.05.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:56:59 -0800 (PST)
Message-ID: <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:56:57 +0100
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
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
To: Sven Peter <sven@kernel.org>, Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
 <179407827117.165429.11777170722243752189.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179407827117.165429.11777170722243752189.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX1k7FNAI4UIlJ
 enOFydRsA7CrjDVdZQ02n7n78sn2wBxrPFHJ5ydJRLPEo9pMGiyQXfBLltTGHbbRvi6duHVQLmE
 HviJtnJPNQ8szrvO3ysTMp/aKtdKDHLogMaXpkPAoaihF/LiSwpccXMHF0lPYLDscR6R9MbD7lj
 LYocayXrANh/Ubf7MmGpF9hmzOjCwakC0PcgsE2uk/boWnFv6sjqhT5NjSmBsKWpPPjuqS1yonT
 E0ZtRLM071vlYKcPhT4noDoayRoOFnUjGPHZT90yougp1KGilbXhEydh0cwxG60JxU15eOBwzNB
 kJqgipyw+UFrvChpZuYV8f+ecMCsMzOQQsxVLfSievvE0k/RHnXXLBfwdXHr3G3vILicyEq9dOs
 +VOCiauyPx8fPr34vltWyxq071vpstUfKFh8sum0JdIz1geAyWLplLBJ3+kBRM388qknC13/o4J
 WzmIUULyIRQ6sCyGFZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX83fl1j0ZpZIg
 kPHm1FmtKxpu3yPFcJHsEv6H5dDiFTGwTQbB5GrMgZf6ZfMqDTvPwWUqZ97sA1xh0GF+U7WlcFL
 qR1CHOiJyh0AshXQ1asbdXOIycuEy1s=
X-Proofpoint-ORIG-GUID: tsScfftGXs-BTK0wKN_ulzdWcGtsUFzp
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1d12e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=mpaa-ttXAAAA:8 a=KjD6htFGCqKMDmwFDkwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tsScfftGXs-BTK0wKN_ulzdWcGtsUFzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

On 11/7/26 8:04 PM, Sven Peter wrote:
>> Add a new file plat.c to register platform NHI driver for MediaTek
>> mt8901/mt8992 SoCs.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>
> 
> [...]
> 
>> +
>> +static void nhi_plat_shutdown(struct platform_device *pdev)
>> +{
>> +	nhi_plat_do_remove(pdev, true);
>> +}
>> +
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id nhi_plat_of_match[] = {
>> +	{ .compatible = "thunderbolt-platform" },
> 
> Do you already have hardware that probes via device tree? You'll have to
> write bindings and get them reviewed before adding any compatible here.
> Generic ones like you used here aren't usually allowed.
> 
> If you don't have a dts based platform I'd probably drop this, not much of
> this code here is e.g. re-usable for Apple since they like to think very
> different, see my series in [1] that I can pick up again now that we
> made progress on how to represent connections between the NHI and the
> protocol adapters.
> 
> Not sure about qualcom since I haven't seen a series for the NHI yet but
> I'm sure Konrad can comment there. I kinda expect that it won't have
> much shared code either.

We're in the same boat regarding thinking different. This driver is
for implementations where the underlying hardware is abstracted away
(be it through architecture or intermediate firmware) and the TBT
layer writes are enough to e.g. power sequence the connected buses,
just like on Intel.

For the OF compatible, we definitely do need bindings and I too would
like to know if this is actually exercised - if not, we should cut it
out and trivially bring it back when/if the need comes around.

> Take a look at e.g. more recent drivers in drivers/usb/dwc3: They
> usually add a dwc3-$vendor.c file that takes care of all the
> vendor-specific quirks and that ends up being nicer than a single
> platform.c file with tons of quirks and separate code paths for each and
> every vendor.

Yeah, this is a nice parallel. Adding to it, there not only exist
dwc3-$vendor drivers that take care of the additional registers and
whatnot, but also everything around the USB subsystem - PHYs, perhaps
some NoC drivers, and all the infra that feeds into there, and it
compounds back into the size of some of those dwc3 glue drivers..


That being said, the makers of the spec probably wanted/expected the
hardware to have exactly this neat level of abstraction and I
wouldn't be surprised if more designs end up being compatible. Or if
the platform firmware makes it appear so.

Konrad
