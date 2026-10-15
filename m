Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A4305057
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075386; cv=none; b=D/RRMRUSKUHPucUjZG3wF2B0BQmHFbPWp/NPg5ktgQhEVvN/4pno5JXu53zcRd17A3Bn1+Cclu8eYiZtWxxLJBslwiUmS2Cjjvp+ovRI4eHk1bPKNmdnzlY5qcA8LeTblJGGsK1Vos4uXgtWkv5QZrJVff9HDLOqBBHFuaLx39U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075386; c=relaxed/simple;
	bh=tLbfeLUBRz9kckFa/m+pJGTBBECpJriJUZabU7HaqE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7srDpzM3kHmBgv4i88o39+6PIhzJs8ecIk5iaG3kHCoVVcQeHrgTU9TbrNwZ2xXSgTV37h+ABZDxDnKGhkkSKzepaFjbtFrndYqXL0RaPag39+xFlMnfAhuNLY0ey/4T2JbcMkZQI4nPIgTA+bsDIwjqQk+xAIwWc7lPIc9krQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9lFjmry; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcjR+uWI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9lFjmry";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcjR+uWI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPuNc1596369
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 14:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=; b=V9lFjmryGDIEEMKP
	vvEjKem2E+mBiIQd6HfqM2z+NkWa8HGtwJXTXUwtdMXaS/FOSEfqTL0UFBueok4P
	DQFAd2uATooAw1dujFnWWtanKvRy6h8utBlCmCVR7u/V+rjimWTFZo0gASV1T2m/
	44wfIoehgwOv5feAWEp3X21obQdoCUDGZL/mhi5cjeavCGfDxSlG/I7/Bj71KQuN
	n4d1My6BRqlBxOWNgv59keu/hKBVWGaLOb1W7jQxSpSkmItpgx8HTap+5LjOv6Li
	udkS+BkPof84ppA1LIhO31yCAkgVwddsW6djJyChwCoC5n10s9xA4Uo/ND0U97hn
	xqV6tQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v90rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 14:43:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso80331385a.3
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075383; x=1792680183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=;
        b=CcjR+uWI6PxgvkXAqNRKa/M2S9ZB7Z0zgZ2mYLmhvaAtRPN1jhussYdkkHRC5NlmJh
         aGEchQvmXM0qkEdA1AsNgtSWQvwPuHH/GQ52eVoOREzKIuuixDnyQrbqRxGHyYeCvsrG
         9YYnpaHsI9n2ZcPhIxRGHND6SXKj/okErf6Dk8sQpciCbWVLsy3hu5EKwVcLJBuEVZIk
         Ya98ilEVRH43YDGqcnNUr4ajwPugT5jFOTmRLQkBs8PsWTN/stDSm8QR5FYvSaG55Zsb
         lnrfwbQypPPFWrikktkktXSOkxDI6Qo3FPAMmsFgZ4ZrFDRNBr0DIG6lxVrqHRwHJ4pc
         gCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075383; x=1792680183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80tjiWpoCbbPBE3onl4nOGkJVFrI+dWTU+A+MkoKPJA=;
        b=RJAlDdq7NYIVV7lHfLxMzFUe4C9+GXv10Qe26bZTSwiQ/OYP6wG8Yf2GsqDeEKzpXZ
         ij4IZ0hKptsOgax9OMmLIaBItu/m7wOeE0OWaL4kF8LvN20+XYaIfL6ZqvIc+0E9rqhM
         9LhRUgBhdKOTIxA87aUrnKbr2RjsQj93T+fXdd4PlUpYv31agu8WIJSllApuBVOCG6Ps
         CCJPUofiLs9t6Ej88eSKlfurYG2+ZTTaKmzsEPpwEN1zEosmiegwB96PpbZuTihmYfpB
         29I/F5ItWguEhxi86LMXNmxN3OAufMyjm8yeRRtSudkTKmvY9wBJEknJhsByMtJ2CmgD
         KhgQ==
X-Forwarded-Encrypted: i=1; AKwUvByKj1XygJ5Qs9A31xFd9+1JFfzfeHlGSHCSFy+FtVVMi1yryFIm3QZC5xBVzGXer9m62FvQBQgSw1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt2J0KVeYFjY6BkgaKTuOz6x23xw9J/fOvL7WkYBnKoKMU2LBq
	OoL2Lz5dMjtzIKUeWJGAE0LJF91ttdMf0k7S3JSlbYweTrngMiwL59PUdLXDbV/zod08QRxjiKC
	8wk0Wef+qHfNJ82iydJG7YT0FyotDsDhpexE/NmjRbUdh7etqBv4dVXIn34BgNzs=
X-Gm-Gg: AYBFou203eqaDTKCFL+9M4gT/CqWvUZGT1q9EoPOekFBqzh8TuA/UXBlGEjUcl14GuG
	YAdIEYcbcfHNdgKGROuM9rie+G3pTRRsozfHFPYwdRBqOt6AEzpeSTvGJKz+HIfRR9Doz/uN/p2
	S5hYCc2dkuue+xNpqCA3m+f8MCkTG50m5v3NUJQSVznvZgMZIscLKxsDKUZiUfudijJQ0hdkTQd
	ZHJAeL1Tr9bS3SY8dXl9gc3Q8kLTALPcC6JQ9l7osZbBg2oBbF2Kid0w4tnJk3DOBm5DfmXD+rk
	owzpfJ7AR+HhQHc5evpoXCu8feG9CvCgOqvkhA86/l8IGRCPJ/JJ71DGUbI7Q7BJ8xXk3AnatI9
	yz8ebaPWhxHO1SrqqobpHDQ==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3533923385a.4.1792075382639;
        Thu, 15 Oct 2026 07:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3533917985a.4.1792075382099;
        Thu, 15 Oct 2026 07:43:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9f3deb1sm134751566b.45.2026.10.15.07.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:43:01 -0700 (PDT)
Message-ID: <aa0aa4e3-6541-4cfb-b947-388c62fd4b72@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXyxy64vHX0SRA
 xmJkrjr3GLaW+l4U5pKqYJ2fwrmFRVSH5lnIiF93oE8ueSuGdbqw22xwHj3YZXGz277fipk5H/+
 4uK3vZ+kp4utFhgLyeuqYfOxsK6TGDMePiqXSOh4tF0zE8V2950Ho6jVX5Q+Gti+L1p6BkKMMyM
 /9uGSu4caFuTKxPcYRcnoTHtdluXZn8/vTPE8vkg1zwNdRB9S0LezkEppKhRNuwc9JFnOG6DEtA
 9bHiHw/hugGlbcrvjtG7wNXwMeq/pTXJCOYvzHBvhTxRR5K5Z91sbaXx+LHWAuB6qjWyBkflrS3
 mpPDhRt1gh9g1MXFpr4lnl/r5DootcxNrAtRKcahB5DKJ0O6/gqPbyeVa0OSq1XKZ1YYzZTVIEK
 IxhcJSaHzGv2VXbd5ahjcUYxxWC9LL2IhSiIHe7qTYCOPGkdJjLAO2zz2hcWAwRohewkIlrKo6u
 AWNUgWKxBWts8EYwY+g==
X-Proofpoint-ORIG-GUID: Z5Dqz4ow4n1CU4YPccLyWuZgauFGyIkW
X-Proofpoint-GUID: Z5Dqz4ow4n1CU4YPccLyWuZgauFGyIkW
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0e677 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=foisExlbF95jOuBURZEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX8hSEXhD1KLJu
 04s8i+JwE5Bdd7vhXDLxDT/6RHWmbnslYHcLi50xS1hfSf9vuA27nJ7fonYbh6dx7WvRTyBgFjh
 Ylh+tsw3SZmGc87htqb7vWRLTUN5LV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +	path->np = of_node_get(np);

This changed because the binding now supports both bindings with
eud-path@ children and without them. In the latter case, this np
ends up being the `ports` node

Konrad
