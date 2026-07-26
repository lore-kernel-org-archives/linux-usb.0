Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343BF3C060E
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785085736; cv=none; b=Kebz2heTbILBIyNXVF133WfTGKsMhKSy6q2viKKewT9OALqDmv72aOfUVYAFdKjccJguYFEiHoIY7ytgcMU2Ku7DcHXsAdPr6CT/rELtPXjOfjJlSm/qR+NxGocfxyr17ryEwgktdmFWKPfWBd/ebAszQztuTWt5wITn/o4vSUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785085736; c=relaxed/simple;
	bh=3fweRvX7MMmIfm6fBBdLurF+STbGvyfWftLxuHCdRxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLbmfjaw+t1PEYdnozE6YKEf6/6vnQApXU81lq6smLN6lh+1jlztCD/nQ2k5P6Xd3VtDTjCe0wr5qqAPN6S0nS0t15DueK7dxFNEXyhvhel15UCOxRwkskFM1YvQUKIbjPqhbrw94TsF3QyBoMEdWVa1oDAmdeA96UuMJTBgkHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lq8foyBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bhj1id4P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lq8foyBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bhj1id4P"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7IT0721716
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 17:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=; b=lq8foyBX9L6drq12
	ZuDookkAaOfZkS5kKuhL3iugpv12GkKl2Y23VadUuboRqfqaEKH2v37Eo5PZBQnV
	szKo0Q1EAJeNWGr2yidPbBQD1y/kb2LUMd4ZAIYKujKQ9Hd8cD15OAlTfzV1qZPm
	BNBi1bfByifqcABh7vBKw+2rWVs1HXfKd6dhyuYX0PuO2tTrrWUxrOwp7rRB/NtK
	36aPa7UJpvqsKTMiW5Tm77HAmMtt7TIklU68meS+kSG9Z1kGJAMTbF1PxTkdCj0T
	tBNH9KM5C9Lfss2DpBR7iE6kLtOE5jCCgqNc4iifXuxtmfk6pp8yRGq/p5jDJrIo
	tm/7eg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajk6bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 17:08:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so27273205ad.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 10:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785085734; x=1785690534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=;
        b=Bhj1id4PbksnD7yv99r0Ny7CkeWPpGaNMw4/jtbne/0I+Ww0r7Ssvs7fQWLE8SR4kx
         8Mm+VeDqoX0qy2M4+DiohSSjv0s8pxX0R34NQy/J7jm+Um3TEP/+UXDvavKC3RALbvnL
         22qFwVJtnMQ0OtEQ7qVhHgXFYqzHbj8H35FnXVGODyzaH/g1CSf8CdY/PiFOJaNNh2LY
         R2zC9Gpx2XUEQ/JWx7yzh8oNpasfFWyU79sqZHpN768XiDaTKjcXzUi7JEjU1QPBpYfD
         H5vaIxqXfqmLJnBNk1hM2R8OWHWujIo4YlD0v3/hoRIi2NAGMLIKwooRCQ8j2M0lwVT8
         TGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785085734; x=1785690534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wf5PgZtlT70Em21ycU9Ff2GtlKLobB73OXMoqmEXkMc=;
        b=jlckY733Xc8UU8XpRN7s1GmLB48IMKjZCP9jhBJBR15UX1ym9SocK91BtV4PT3mIi2
         FXUFDXxA1W/SXlvqW8/IdH01SIQuuPTr03IkKk5SmtUXAuwRNMzWBuIXm1aa2vYij+ig
         26RrBlD6zY+dj9kvAcWYS0+CUB/O7376AbwV1eKraYVck9eP0SK70PxzTdGbexmXEu+/
         NbT0SWA+L5fW/wEuS+QBW4nJYiQtkAL3WsBIifrZohmr/laCQqmGUR1bYQMlV8DKbDJR
         Vi+s0YZgvRpq15MG/AxCnIYBaGC5aKX9NQisRMVSrc8oGgqgeG5L5BXd79R6tesg6JKF
         YjWw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0NdYfbT5TxEMtKfol3ta9Bvk2cJo/obiDCCk1gAFzRdb0YWNuKHRshmfqYL0mMYEmR/B+NkrEM5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3hfOyKgeC/UIeZ4N1XEKquYT2at0y1afqjPoDmLwWYpLAfF5Z
	Ce1Rbn/++wSuyXGSDkf5PS5hE8Sr/ewjr81feOstmpNCNrW58EaDwbSQibuDSJeA1Nl/gn05HfN
	5apV4G1AIpLtHp0VeOA/f6TizXTkmw6lRDs50hcCfL1m7yRy7NPhufbj6SxHXKes=
X-Gm-Gg: AR+sD103KC/WxYeE+ydlRHqaJe2cslg4o7J1enUhN63JjLriZ9vzgy9T9fLbq1JTtRp
	b/GQqJ8wxqRmHxv2UPhmZBZG+rzm3sIOaiuw/++vmQSmTydqP6PyTkavLGu1hv2vTkRW5rdd1Q8
	X0b/HeGdeGCJZQla7AC5v2JHfPDC1PHVq205NfsQZH9YiGwxMclP1LmabpwAFQHtpRK7OMBRO6H
	FY5hZJFHaCBQJa8lt/mozy9AB8GiZMosOiU4oOC2Dh1Yl/vrulmxqaZZbFcCYmWgqnuqaRpCV66
	yEKP86yZPxOAdNWj+Lmhpi0hVtegnoMIROBEWpnKoqxp6lbpGUrNml3vhZN65GjVsHDMcaEmSRB
	jrDcoCmq7DEASwx7Yp+nADJdsujEWQrJgna7SX9g5vDnk+P2Kln+btW2gsTKL+R9bTpKm
X-Received: by 2002:a17:902:ce83:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cfde795576mr52293935ad.13.1785085733542;
        Sun, 26 Jul 2026 10:08:53 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cfde795576mr52293705ad.13.1785085733122;
        Sun, 26 Jul 2026 10:08:53 -0700 (PDT)
Received: from [192.168.1.9] ([122.177.243.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f442bsm21570895ad.65.2026.07.26.10.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 10:08:51 -0700 (PDT)
Message-ID: <49d0e412-4561-4f4f-b00b-b77dc9cf143b@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 22:38:43 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
 <amPdeL2GWkNhPoal@venus>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <amPdeL2GWkNhPoal@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TkFNI6bIEkjx3927O_F2L5N6_2zPbQ98
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a663f26 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=SscvhSW7bbCibxPycpFs8Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gCZJ6Er7C-9YbjHnqbwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: TkFNI6bIEkjx3927O_F2L5N6_2zPbQ98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3NCBTYWx0ZWRfX2JCD2TnXc2m/
 VsuZcG828Xw0bfIhL7UqzXFm+CxRqD2x7H5OsVHaaci4rNO9OsSXQtFU7sXCo+hbMEikr1Je0Oe
 jnqecx2tKbb9IwX7zOsqNRntQLI+wKGdcE1sNlYnyYjhHHsQFD0V7vVTyRS7FVA4OPDk5FQMM4h
 B00MkwugC7et0D81S3Sqc9E4y+8N5mS3wPL0OZYom8wTeOCAdMogvY+5TqGBiZpseGI0f3rqZBq
 BYOf1i3HvxGGyEm4D5PPwSO2wxv2PTrmcPbxnx1SN87HK2dPD8rYETb507O9fskX4k85T6Z4kiq
 ppj4za3doi6A7xS/NmJP4jNUe9HkycdgswOHfFSQ9NmD6G5pBDeH/fUXC90RBvsXQXJDogSNfd8
 Iif4/oGV8fP7lVHGtpVs1i2EZZiEDLZyF7Fwu/oN861la/VJj140MAK7COMZ++npL1r0KHUj7+a
 j+t/R2beojB1X8Kj6wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3NCBTYWx0ZWRfXxx+wBLw7i2Y5
 udk7PIz7D1eQkUZ2NKTHv63XhvrlyCS2guPK7c/ypCUwbd7/KiqpdcZkbULv5BkAff6JqH/9UKO
 F9/PYmK+UtMkqiMzZtOAN2y31Ie+QuE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260174



On 7/25/2026 3:21 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Jul 23, 2026 at 04:09:06PM +0530, Krishna Kurapati wrote:
>> USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
>> connected to it. Set the phy type to EUSB2 to let the controller know
>> the phy type when queried during its probe.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/phy/phy-snps-eusb2.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index f90bf7e95463..e139b17bcda5 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -13,6 +13,8 @@
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/reset.h>
>>   
>> +#include <dt-bindings/phy/phy.h>
>> +
>>   #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
>>   #define USB_PHY_RST_MASK		GENMASK(1, 0)
>>   #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
>> @@ -597,6 +599,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>   		return PTR_ERR(generic_phy);
>>   	}
>>   
>> +	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
> 
> Isn't there a potential race condition if it's handled in this way?
> 
> 1. phy-snps-eusb2 probe: PHY is registered
> 2. dwc3 probes
> 3. phy-snps-eusb2 probe: PHY type is set
> 

How about we do this get_type call after dwc3_probe call during 
dwc3_qcom_probe. That way we can ensure phy is up for sure since core 
init has to happen as part of dwc3_probe.

Regards,
Krishna,

> Greetings,
> 
> -- Sebastian
> 
>> +
>>   	dev_set_drvdata(dev, phy);
>>   	phy_set_drvdata(generic_phy, phy);
>>   
>>
>> -- 
>> 2.34.1
>>
>>

