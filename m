Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772722;
	b=OB44K7G/yVBuI0YHDPnpMBh3SLVDlQGkJbpUhaQxyj5mW31TPn1YVKFs+yrgmTRrKsSr
	 b5551gEzlgy9ZnBkngd3vvbNsiFaeRMnTvsWPlDXOodIB7l33jieINQYFNUuiex8vFKev
	 uRaYKlVEUp6INxrmZ/2EfD6RRRbtwRUBJ73/sN4QSWMYG+Qn+v6xIbGCJv64/ixaW5jYI
	 CKEMop8/V1e/AsanlKtFQVWO081B2e0cT+g6NMVJ6MOhkzg7lCuVQaq6W1OL7f0L9aGX+
	 loDV8zNZPquyI6nGAO7BCHqQ0x6Ah+hfJ5MkSd9TwcTVydKsTOCki6Kc3sEAuSPK/zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772722;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2rWL/C7LmPFzRIy3jqvsgEDQQv3vMaerdjzG8BHe0QI=;
	b=md4ezZy0dR/FKW37WIvqwWEA10cSPoDtxaMeEyR58DoqzZXKpJ/22t6VDZ4SC6O2btgO
	 Tab33CWYLdQQK1JhTWUBiR/fdeUb7ZMj1USaxEj/xIcumNwcflfkmWf3RLwbwxTp85aT7
	 7CqTfiTLVGDb7eEGHP1SkYUZ3KVD8rtaF6Oi1TWak7dPxWJm4XvBvlV9uq8gSWyFUyj3E
	 nLll/F51igOeXJWcGTscCOR0DzI5VvaEShDhLLpdnjfEAhv8gi2XZiPQFWp2DJphWpe32
	 nfQMaI77lBYQw26Xc1ZLCE96oSXvTSQD/cX3dISAzmNDWm5WK62cL1az+bPizw4PzLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+nXXV3G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BntgYjq4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176D606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 06:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2176D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+nXXV3G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BntgYjq4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R7vL193439
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 06:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rWL/C7LmPFzRIy3jqvsgEDQQv3vMaerdjzG8BHe0QI=; b=n+nXXV3GlQtT/i4y
	quPXl2Pke4TQ97C+eyjpjqQb+wn1NpaccJwz/KJrzBGAyGe2uzBpk/3FO3LMw9hc
	VsrRmJPWPSdw0n6ydqB7weaqMRRtM3dExE9lJQJQZiS22/sxrt+NwWUusHh2J5fR
	n4ASZUnis7YHF9kr64dau3guQrxoKl+MGN7EMq7uLU5jlOq6w5a//q/8qLN6Q+lq
	kMNA7pykdYkA+GHY+daR6s4TPZB1QMc1PgQdZ92E7utIdgXjPQVSmoNLsVDRIo2n
	htFJrSwnw81w5sf40o9NVxsbfSkR8rECrSEk3MK26aF7mgOnRSuKWBigsgwgm7lw
	iYGTrQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nj9dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 06:12:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88c768886a6so359970b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 22:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793772720; x=1794377520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rWL/C7LmPFzRIy3jqvsgEDQQv3vMaerdjzG8BHe0QI=;
        b=BntgYjq4pBCpm1en3yYebp6RA0iQgZw7lcR/SN/EbmGJzWB+6Pi8Z3EwbLy1xwNwne
         s4/jxGSWaVpv6uAICpDG7nwDh8R0QiDqXiT9gYSS6tBiO08Nlsw3yYTZ9Yb8e/EoalAK
         sqxBIjDBGMyktV+zW9n38tpuc6f6M6mJktnd4Dynz2JnBt18OsZQQMyP4ST8oWLnk8QT
         pIAN6zDLqxQwbAVsp3cR/xg+IGKUdCZBcVRrE1JPKJphLCvVBYLddlXS3X1U15SWA8Cj
         w8nMg2eoLIeQvMzHGLfQBeJg5Q/NakwbOgibNs7KKudGawmvnLjhbcWAaf4YVs9lDHai
         dUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772720; x=1794377520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rWL/C7LmPFzRIy3jqvsgEDQQv3vMaerdjzG8BHe0QI=;
        b=GA4XZ9Fqqo0JKMXHghZ/Y3nGWADRmOd5feXc7dfdd2yWQCZ/V4PfzbUgULe3OFsR/n
         K+VWG6dQ80cPH2pPTosYErflRI0NNNd0NcJjxmHI/HG36uver9gGc7rHrkvCM0i1PrX2
         lrbCef7DQT/ImDcwW+wmZEDT8J0ufUoxrI1o7qPR22HABGSuEZIehNulxIIvKLjMZeoW
         tHjJGgvY9F3LoMzmn7lBzpp/N+DWuhAMP8AOs+e5tQLLAPgfIEv87wAwIAlLhinO3JPx
         177g4Lpr6icfXqw+buFe2yQlLP7i8fHxQIllCfdDjhrq/phLRfrooVNC8uKdCmLfysjO
         zHAg==
X-Forwarded-Encrypted: i=1; AKwUvByfgVvn3vscJUeehJX3TsBsaKI2A65VYg3zSquuTC3rFBDAqlUuDc4Gv+3z7SlAHcGlgHzLSQCas6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z93poB3xcqJWnKJrK+93uomA2wUdnimMvn+BfygpzXZlPJLBY4h
	kbEjTOX0UD8qogDdoGPLniUg6lMHDSLZ8/K6gkQH9nCAAkTba/aUod9aW4Icr/XmbKUrCZxlP7K
	US0P1eXiswSdwe2Ltc6sbXYlsRwvxhg8469oad5E9RvM+wKXyhZ5oZLhjJCniDgU=
X-Gm-Gg: AYBFou1cIqF9Yt+MFbM8rccDVtDpkK3qnw8zOpaMRC0xdrWHYwLcvOZcB868nGlB6r8
	5YD5RgSE4mrRF4MDGaMAaSNcoLnfgFFp3FZSHnces24PMjo5xerV0189UIWtSveZhNV3IIY6e6p
	/vxN4rEHPWr3wqKUO5e2JcShi94bZWjXDSHgdpDImo+4PWhT/9B7rbGJwDbeXWYXkAzeY378qqs
	f2l4wKI1f8d7I0I0VJtcJb/WATHLFLNH42KuD+4vXh7SAMyKBfKvUB9vFdmIRFyAx2FnJTxEIFu
	Hk4TRrNzHtERwAZQD3fj1Fc8TpWRwgtAnXef/KtAu+kNtJd7cBEdmr9gI74hKbFqVmhcd1s5zeh
	jXP1/0XvoIBl2L1pUW9EzGsM1Mx1xX84WubU+/XU/an9+cB2KqwnAbDQVH05d0BookjwnPYF2py
	sl
X-Received: by 2002:a05:6a00:18a7:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8a9bfaf8f64mr12038986b3a.57.1793772720482;
        Tue, 03 Nov 2026 22:12:00 -0800 (PST)
X-Received: by 2002:a05:6a00:18a7:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8a9bfaf8f64mr12038972b3a.57.1793772720003;
        Tue, 03 Nov 2026 22:12:00 -0800 (PST)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc40bbcsm439892b3a.51.2026.11.03.22.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 22:11:59 -0800 (PST)
Message-ID: <5df54e91-8898-4fbf-9aa6-e2202a67823e@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:41:56 +0530
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
Subject: Re: [PATCH] usb: dwc3: Use the correct PHY mode for USB3 PHY
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261012093704.2762263-1-prashanth.k@oss.qualcomm.com>
 <aup282PqM5c7ks4J@vbox>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <aup282PqM5c7ks4J@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNCBTYWx0ZWRfXwwlEFVm/6zmm
 RQVAd9ueHo4HU/lhqyW3iTQmpYXSCzt2RQGjs2nSbCsDWP6sDDCWPUK7R0DmLJ9PF88ha/hn5rX
 pjaYLteUwlzwo4OgW3kZ96yakrd0JOj6o2U8tgOifZO+FvCAOUYGcRlsk1IDbr7D/TILDIyStpd
 y/9dJqji0C1JdnFX77G0r2Z028JY3oDcMNd1Akk6Kxgu17YWbPzoji3WeYhb2ln+WVVdy9qAZvH
 jz8l+e/v08FLLujP1TqI6OFYYHglmMUHcbHUZsXqMkqV8fap/gAH1T92d5e3FiM+YXVG4jI648S
 3kyQa3Xi68J6iXacYU/YDTi8RuzYeLVHNtPEpnF0amgq9RaitcRBG+qLNmlPGACao4bEYPgOOKQ
 +b9KgYpdXXcMel9klpV0TZJKIyEK0iesgKn7WFxdaCfhGuol7FVkDGCEBFjCL5G7HPFXKs+Z4Cp
 JkdkPiqLkCkX+qdAs1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNCBTYWx0ZWRfX/tO74OuINtr9
 e/gbtTNBewBHtXfJ3WRoxlbVl1lN1pfGwWdmlkmyaSGDBBJSiPE0JPlQd27d+0vFwr3zaAfIXhw
 rrf5NRN+wqVwhU0KipuM0EjLiB5KS5g=
X-Proofpoint-GUID: D4ANPnO9hy8Kvesh8obGo2l7ZCqa_nY9
X-Proofpoint-ORIG-GUID: D4ANPnO9hy8Kvesh8obGo2l7ZCqa_nY9
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeaccb1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tbF0VEVlScR4vGo-Y0UA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040024



On 11/4/2026 5:42 AM, Thinh Nguyen wrote:
> Hi,
> 
> On Mon, Oct 12, 2026, Prashanth K wrote:
>> DWC3 currently configures USB3 PHYs with PHY_MODE_USB_HOST when
>> switching the controller to host mode. Even though usb_add_hcd()
>> sets the flag corrrectly, it gets overwritten in DWC3 layer.
>>
>> Some PHY drivers distinguish between USB2 and SS host modes and
>> expect USB3 PHYs to be configured with PHY_MODE_USB_HOST_SS. Using
>> PHY_MODE_USB_HOST may result in incorrect PHY programming. Fix this
>> by using PHY_MODE_USB_HOST_SS for USB3 PHYs.
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index fd5c2cd36c59..1bb87a370725 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -251,7 +251,7 @@ static void __dwc3_set_mode(struct work_struct *work)
>>  			for (i = 0; i < dwc->num_usb2_ports; i++)
>>  				phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
>>  			for (i = 0; i < dwc->num_usb3_ports; i++)
>> -				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
>> +				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);
>>  
>>  			if (dwc->dis_split_quirk) {
>>  				reg = dwc3_readl(dwc, DWC3_GUCTL3);
>> @@ -1643,7 +1643,7 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
>>  		for (i = 0; i < dwc->num_usb2_ports; i++)
>>  			phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
>>  		for (i = 0; i < dwc->num_usb3_ports; i++)
>> -			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
>> +			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);
>>  
>>  		ret = dwc3_host_init(dwc);
>>  		if (ret)
>> -- 
>> 2.34.1
>>
> 
> Can you take a look at Sashiko's review comments? I think the points
> raised there are valid and should be addressed:
> 
> https://lore.kernel.org/linux-usb/sashiko-outbox-167906@kernel.org/

Yes, I was thinking to add a vendor hook for qcom and modify it from
there, so that other phy drivers wont be affected, will come up with a V2.

Thanks,
Prashanth K
