Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714362;
	b=EplPlRWno4AJ5ss03jEloo/tW22rfzuIR/5+2Hj13o82xg9jlAsCoPEM/i9RckkgDSls
	 IbJ63JJHWqlmDsMELg1ufj70kXf826s249ZCN1eO7BHRx8BTkHRGsvZf+dUP41KQr3HP1
	 fBREiF/AwFzIy0unS61a3OJb37NWCWuOdIgIvD63g1qoXmp94DLmaTZRwk1rRkC1WAZq+
	 e+PZ5lPWKXAiAHMnPLhxosCqCA5uQB3ennebP8XAspSAvtCEjvb6YuMSNEycXgDo+iGBa
	 JlT14wRrSAPwiSkuX3wX5K0VCso7WnjGvKBaMCoHXxdNfbbNJYS6BIzapAsHkkywKBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
	b=dFhffB7eJLl4WRJUhoBlQx47rDULuI/xwPJAcRfmy4hfUSxicRInXUVvBNT0eSOcapwT
	 kq9VZ+bxY8sL/00PvElC2tKi8NgvAuZh5qaxLbCUzSlB4EFT8fzOrHrtr9n1czKq+f3Zs
	 U/p+/UDWoFVNUy9h437KjUkCcr5xu8AxuhUod9Ekh5QE0HQcAmbB2gtMzdG69zOkdU1fO
	 QBfGUYfrwVauopBnaWlOfPpGWcly1VGeiSyxafeTWF5Wv05bYAF0p8DVcV2p4cyvCwGAI
	 PUAhMSDLNusmD7CYcgDx0rOtRSFc4GGTCd01RKkJX7Lrmjz/vvcpEH7/eJkZPlx15iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldwzgPvB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz83se3p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B08606A326
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldwzgPvB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz83se3p
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu1384048520
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=; b=ldwzgPvBGBcqnftN
	Xv8RY/jQgo8lMmw/5jLTZ+/bVcLP32F9M6jjF9LdRKDrJb6uzqkmNWaHvupCMJsH
	JmhftRmaAsNWOnzfz1ZKUlqP9g/Qe+ad270462y8rRxR+zesePSW2hSroXTNfCOT
	li4Q1ErkLIwM8i4pxc/NgMV1P/5ijGastp8S+UB32IBh5qosjSRTXoSNg3Cg09EM
	Tfz+hsOKRVWb88LsAf+zAZ0l2fk8YlV/3ql+A2mJH5tdwnyqXgQcI3QiB9A+iHes
	9f8xpI+R/NzLJhALop5oIr4BD37HuDJAVwLIx+8ttNGvK9falD9/gzStjnzA7ZRt
	y0I7bw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rje4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:32:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f040c6e0ceso67676315ad.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714361; x=1796319161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
        b=Tz83se3p38C1v0D89CwewiTgagEy0CFroaeyOzdVtjWd9kUHUCFODHhFnD6liO09Bj
         xdSZ+1+WBFpu38kYr+5/v5BoTJvQtZbzT46kKM9qDRPvXrm/hJe5UddeQrqexcWbDgUs
         UanBdtWuygWMxaCT8xca8v35mMw4MPHwPl9xTdWYXpg0HgVJWEnXhQDW7NE4cuYHEmdq
         SGXzEO0/UI7kp8JtBHoJJ5tzgcLYaPZ5c6a84zmIL1anOTPomay8oHQrZiqA6MulRWYo
         prAAVJy6SE/+BcvCYT3hTjCa1Ew5SqB331gl5+3I4vtEHeYT/o1T2VZuEMFN0001GwGJ
         XF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714361; x=1796319161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
        b=HFEQhqHeu1D1F/aLDcrtffCbhJbrkswgiXOc0uijH/J+O46MBDB4MphvX0pdxW54/f
         nXLtKiHzNS44ie+ojTsVJZA2w+iY8HUj80myaBYXzWQKqNVrkMMa6+TUMMBk+DmUlBGN
         D3PmNoNUP+W7zxfOmndpzqMnst7qLv8nnQad8935VJA+fS114p2JGutaO5tsPLBP285x
         9cJsBEIVKrwcu0LP93z4F9jmauuQmqL/51MftZ12oJWK3EMXIFjYLwJVQ1JztW0i08MS
         FaIBxYZp47NgB7GmuKLRwiYB1rTYH/srC07qYi7J4X38BCrgyv7WFFJiEnqG8vVwNtbK
         BokA==
X-Gm-Message-State: APuU4Z86TCzIPJ/VOvAKu8uzKSYOGNfycXOW1fREbMhyy+aDekMO7zb2
	Fzto0NSk490eIj9RCGAA7qxaFUHiLmwfS0WwiLJOIeoxkYijzDB3vEVjb1fNF9Qd9SL/hjdS1h6
	c1wJNu0S5+kVFgkk850MZpSRdBVBxLOIZGmFTuo8W4o9sggz7xSsjZdfo4S5fVYY=
X-Gm-Gg: AZFdTZeLxgf2h3NiXxvKhx/MNx7TKRRFTPfowCgPa0Gh38NGWiX3O7MBVybs+myzXD5
	1HZDeh74Aei+2M1AW+5b8cKqhWtOiX+VJIuh0LSgNP9JyvDfzmTIqlTf64kmCGu2bf6XyDf6V++
	WiYQX6KM4Xesz3dK+VhAW5eoMIX9loyT4yD/zEHDBbB6M7fxPS0zsmCOl5zM+sVyJwjqkdMiyYM
	P27HnnoA9xCgdRC0qoJblt+7XNggCOyhQoVeF+ArkZFRq7Md6z92oyfYXRxSkTs40H718P0Cvbl
	mtiIa8O8g/5Bad6v8O98bLOLyGJMiozbRLRtgG6yDkxntTIvQe9Apyj5IToYvGg73Q6cVTsBc4X
	aTv89cZFcf9FkM+0M8w3cWGXcoxf19IAgAlbwMSMAcVAZ19hEUSCygexeQRs0KFVT44Ty4WJO9L
	QIqiMJoDCKBDSoX17m1jVEJcfJpKc5N0wf8YNK95H2
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr213757955ad.73.1795714361070;
        Thu, 26 Nov 2026 09:32:41 -0800 (PST)
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr213757755ad.73.1795714360588;
        Thu, 26 Nov 2026 09:32:40 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b8a43768sm49779685ad.31.2026.11.26.09.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:32:39 -0800 (PST)
Message-ID: <e01e6db6-9581-4003-b874-bb0a49bc9b8e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:02:34 +0530
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
Subject: Re: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after
 system resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX1m/uT5mceHEa
 VK1p/9eRoxCets7aqxNoql/K0rMVOa7WXydpL4xX5Qm2MftHqxqZ2Myyp5gUSIrIL6aW2Usgpdb
 PelGaJYwNh8JDyxbb3FJNGQXzTPKPOizY3KLopkFthw5r0XxWnZKabIYxcjmvF9zcti5HeQMytL
 riWTYl2kpS7gECnrDubXqPWbqYPJPrCnw0gTVX9nV8PqOC6GqnpskFI4Ty5fGm2nSob6bM+6UHm
 IXIEmaMSfhr/mQ6zLItUONQi2a5zfBDhlj7iS0RYiLf9WR4e0vq5UK+qc9kaSQnznMklYK25hPO
 7WACqPDwiJt/V8BN0JYBq8g43/4rYQdPqbOhnwt3DuFOyckJqvceTq2dy8Vw/6R9zrgLhUNrIEE
 LJVtnWhQ0Zz3NroDzc5swF0ZYFUOMio+rHs7AJB3OlJDw6pMztfrpsnLn1w7l1GCLRIUC2ugplc
 j+4G6tVLhPO1wRjoZ1A==
X-Proofpoint-GUID: 0lL5IzCWr8KwNa-1HqT51FJEazX052p7
X-Proofpoint-ORIG-GUID: 0lL5IzCWr8KwNa-1HqT51FJEazX052p7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX5OWzQiHd2gUp
 N+ZPmAA9o03M8flsknK4QLoDWbaCnxPm2AlhNg8O7bQY6I7IcBsb4NvnJ3+qgwl4Sa4eXG7/tWa
 T+UFSlqCQnbnmkTNooPWEb8P1eg+hNk=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b086d39 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JdB8cOfk_NMNDU_cp-YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> The controller reset on system resume returns the Qscratch registers to
> their power-on defaults, which clears the VBUS valid override that was
> set up for device mode. Without it the PHY does not see VBUS and the
> gadget fails to enumerate after resume.
> 
> Re-enable the override after resume when the controller is not in host
> mode.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8e8d7e59c6d5..50fca06c83d4 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>   	}
>   
> +	/*
> +	 * The reset above returned Qscratch to its power-on defaults, so
> +	 * restore the VBUS valid override set up for device mode.
> +	 */
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
> +	    !dwc3_qcom_is_host(qcom))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>   	qcom->is_suspended = false;
>   
>   	return 0;

