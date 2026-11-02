Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609368;
	b=K4ZbMSaf+ivkZYzSasODMmUda6MqmiovKT0xPXvR7y60coVlRmqQrezUhoX+B5Ed00zp
	 lOJEl7OpcgZT8yms5wJVOqAKvV3wrGdYu6CwNRcaPsy4tVDCO4JfzawjMu8vYzxd89wU9
	 fcTWUBuYkBsL52hr+ON8EST7HV1nbCjxSRNbD4hV4M6etXFde2bWmdDxoeQDPQpD2JU/e
	 nIgM24Lx2T5g1U/CQ0wgPgPlIW95yioApsWcNPKA3/2/X0/Q2ksqfpjiJINtjDQmz/+gS
	 oOpIC5MQo28XZi/SwmzDMO1poA+TIskWrjHgXQwLZmesUm7yrZ2EJYAxw5VReKyghlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UKzYiHfmhtz+sSVGMf8ZyZ/bAUVFt7vjvsKxoc/5OK4=;
	b=bFzLiizUFeRcrLsK3qu5QBZhyis1VOHkEAj0uCZ7goWcuhR+MAOvCyhwtpA+Ilovn3K6
	 46eUEUZR+HfhKa/F019xKlq8PI1iRRGhPNtWF52n8saDWcEBkRff2NmrQvG5v2IbuAqPV
	 hYnQ9s/Ba52xxkRoYzhSkBXo0UNuZE7HpOPjU/fR8uDBpWGYh3Scun0dw2rPtCjoMyEkk
	 Y8u1hmmvSOQQkQe8Bw6Yhtx+ZsSRNzW+x5HWOS+SE0KuLlD0wrAwC9ynHmbRLLD0+iSvd
	 Dy9obxXGRvb1wHV46/i0U4jPpg/BroA8WM/lX8wQO6QCjEvm9GP+N1qgAlaMZCsPTaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmyCEO9L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkCeuaW6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB20606A324
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 08:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB20606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmyCEO9L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkCeuaW6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23v2gN2752649
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 08:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKzYiHfmhtz+sSVGMf8ZyZ/bAUVFt7vjvsKxoc/5OK4=; b=SmyCEO9LfONwvSRt
	StLn2azwSGrIlW1gdqNpXc4w2ltHWG6BFIVQS09xcrvLfLuX0g/U5V658MkpJtDR
	FBMNWIj3slwsmU4vLr9i607nIuWj50MMpB7oB5nqGTU5pLozF5zX4UMysIbrfeLk
	0rrxpsBYnmLdxVbnhuVZCCfG0oFNZ+aqt0nTuEQxFmnwL5MrWzrOH0ch4X5AeEg0
	JLspSwCoRT1RfQ2xHMLitDk64Cci6JVldDH7uxf5h2as34gXY8BfmTE7w1v8Geer
	35uqHn3GLBLMxVlZyxqtjXaL0wGN2dBSdw9yhzUTbWGt6dxUW29hT8tHvyTxa2I8
	u9Pxqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201fs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 08:49:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so6503461cf.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 00:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609366; x=1794214166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKzYiHfmhtz+sSVGMf8ZyZ/bAUVFt7vjvsKxoc/5OK4=;
        b=PkCeuaW6dncemdAGyaqXh8lvbsDOrzQZJuYPL0G8y4d1UotW2U5bDdgnHwUr1bOJ8w
         jzGDY+7BqZZ49cLe5pEwlsEqwE58/9P2qeIgpAeduThy+6FwLnD46UqhmQQO89jo/PjF
         uvA/U0pqA5N808/8IIqfKUTGgTaeH2NiZYugffgMWAUn8gnrf1bnaXqzmDfDxRyEtryq
         JOsrG2an0RBXxdV7v4RnZPkbyT8JEWLD//kxcS0qTVkqCYs7DVHcF8X27wjOv2+b8u9u
         SCgKP9AvpCLmKwvdFe3MScQ+Fs8ecugCs1F49El/7HENWaEN/29HFVJfweec5y4Nvjp9
         v0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609366; x=1794214166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKzYiHfmhtz+sSVGMf8ZyZ/bAUVFt7vjvsKxoc/5OK4=;
        b=tLwaOvq+z7Mb9yB3Y+S9iwVOVjPDgTRZpxHN0afDEirHTgwz+8WOoVu54R500bKyty
         bOPsT5aaSXdTANItc5FKwaJaT1s320USg31IywXwpCW7foN8skvg3n+Kzn2YBtiQFJV0
         Ckx7RYEmsbDTmOOoGjciumQv17HuJtrhqIOn/sF+LM/jNW63QcYco5eMiAqb5t5KMCwq
         +cN+iS9ovy0SlW9Yr5ukmSbfvXOWC7opFCAWNOlJOKdIdK9Ehkhj5vC/MBR1JOCXocPl
         0v/O6r3spg+nb/43mI6eCrObWdgdUDBUNhlRyi0C/N9SIfJblZ7XUKWGng7BRlpBdrK0
         7MTg==
X-Forwarded-Encrypted: i=1; AKwUvBxdgeLajXVL0fifRXAHhK/Ckyb09NC3D9LqAs4ThZZCKxW3Jb6B4FdMG6RJaUVR0GC5VMFM2vl/xHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkqIG0OlDdK/R2Zzek6AX/uSRiOL9lz5EVhO1codnJvYQSwGu1
	V/Hes/28PM4IQCDpRZ9ED6FT/jPeqVHY1OX9SLDhogKGW8bhad3IXi7u1YySv8RuQ48PiVp08yD
	9bUmVgICyQ6053HKUbpCa2GFU+ygmwk7tZiEtI8kLS4YfTcmwE3EVlNHm5Q73ln0=
X-Gm-Gg: AYBFou0J7UpUDcnK5VB1MomzNAw/dMSGdVvtaDnd5UuJIc3ujlnpjfHzx8Rh7z0HXoD
	L0HlO1TX1Kiv8c22DCeh0qek1z7cFeEzcHZrx6fwbbp5lcJBGe1fbTBEJRN2jzYeAHPeu+14FDT
	HDK5TAJVMbXS/unzfVPV9Gue1mc4dOrbF4R/WvFXynllz+0nB5B41XxYAI0QXWt48qLjxSCHebo
	y2ljWM6rrRn2vzb3YZko5jKhrP2OQy4TSIqUlkXrV4kzQuHfnT/9t3i9/rIpdsp69yyfVmRnS9r
	SIBjEnKvmKPqHIOI3kldK4gwBnc06ndgH7tU/PlMtiNJL09MVP72fmSCy2/e3GWbcdTHu3hjEH/
	ByRFs4HdZvidDOJYK03CGJK4KE+N8vmDcw2Edq2omvGWSISX0cksM1SXsj67UkaBN4vFgKSA=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1689166885a.0.1793609366190;
        Mon, 02 Nov 2026 00:49:26 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1689164985a.0.1793609365758;
        Mon, 02 Nov 2026 00:49:25 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabec09fcsm355582466b.71.2026.11.02.00.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:49:24 -0800 (PST)
Message-ID: <b1443310-fe55-4a26-b12e-6ff4aa64078f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:49:23 +0100
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
Subject: Re: [PATCH] usb: typec: ucsi: Fix printing of a fwnode with %pOFn
To: Asdlerto Korry <korryasdlerto@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102003508.341309-1-korryasdlerto@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102003508.341309-1-korryasdlerto@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rbBZX-Km5ojCn3RGEt0x8l-ryjrtm1X-
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae84e96 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=V9RLX921IsFKZjcHrcIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: rbBZX-Km5ojCn3RGEt0x8l-ryjrtm1X-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX2+TLiTin7moo
 DnmoRkS7XBaSrR+hFhsfOAJqIyWWJBkb/KckNeWD+f52StJgXqMx+MHJyMmN894hV5k2GjHiB0H
 PMGvWADN7ec8ydSrayTuZnEjq8I50LwklBQJQJCSKu3aQrHJayAjZKpJoA4W0gn7p2JhIRbhi8e
 tZoHdTg910229OO8zhqyNMb3dtEh7Sj8m6Pe8nEVk9ijhF7pcBHsg7d5MlXEgZKc4kwG0z/z0bk
 7UjLX4jLoUGUUhDizi1aPoZIAYbueBjJUZ8/mZBLg6pl6qdlzQhl5PVQvEyXR+vY4KINoaoUw/Q
 rx4+Q1LBP2IbRjoQy2cGBVNlcZxKbXzoD3qB6lWR1qAqDFqMMCB+Iev24Z324TmP+CwEKV8Dl0e
 Gqb+/hdClwiTFfOf6QTRggBe2M6dTFmMg6ggsXihYZDNwWYF3oJ6jj2dv1+9Hf7amhCLPOCuHV0
 98hGLi1Q4WZeeNUfciQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX3vu6JLGbCvm4
 oNNLXIlYBYBAk49/WQwVUQB/c+kngEMyNPnjFztqANdFwkvRgJGk+zVyHAgAS00Tbsl2Jc+y9HZ
 lEkip4hA1W53SkXk6ZxIiGFX4kYO014=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020034

On 11/2/26 1:35 AM, Asdlerto Korry wrote:
> ucsi_glink and ucsi_huawei_gaokun walk the connector nodes with
> device_for_each_child_node(), which yields a struct fwnode_handle, but
> print it with %pOFn, which expects a struct device_node. vsprintf then
> treats the fwnode_handle as a device_node and calls fwnode_get_name()
> on a pointer into the middle of it, so the "missing reg property" error
> path oopses instead of printing the message (seen with the same code in
> pmic_glink_altmode on a Samsung Galaxy M52 5G).
> 
> Use %pfwP, the specifier for the name of a fwnode.
> 
> Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
