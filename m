Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9D63CE4B6
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565215; cv=none; b=lMv5Bh1S5lnGWqsfWaI2XknSr3+WiE4FX9l2O8R1iugEW4mn5eDFiyCeQtsW4YHBbtSg36ZUAPx7/45l4kut7c3RRQTM27do5CN4eVIgECTOk7GaP2ZrD1vsZBH8NGPZQLb0CHxbUo2mCo46ra+o4PzL04SOmOujlVx7hC5fkq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565215; c=relaxed/simple;
	bh=/SFRWd4s6/zDXRWcNQtbzjimLl77s3aTX/GJXWKcwpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozxpyZ8zIppef0OO4HZEOliLBUrbwOxoAuvI2Xj/xFJDU/UV+PBrH8NYGWdot7Qca3Ph9fsQAaRHEnia6OrMpAda0AwjsqBgx1BDBu9qbWWoxsVPKHcu7s7WQ+Vq2QugvZ05cAwnJE7K71dclrnOUQHoFSczOzmTper52KCEbZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRdR7Sx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7LTIbh9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRdR7Sx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7LTIbh9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GbMrS2343935
	for <linux-usb@vger.kernel.org>; Fri, 9 Oct 2026 17:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=; b=DRdR7Sx94OAR5rKQ
	GpSjlI3Et0TCCMsP/se5dpCAJnMz9quWray0E0ed0GMKSPyH3sdiMHPw52vGvrNN
	K2idutEA4pSTiUDjOw4gJlrfu085cjCzHZnKUqWy/L9M15fF0yMEBf3SPuHb69Tb
	/qRchcrGQowVYP2AaGPRakqGMveRXEE3t9MBxOMMwZl90VVVyE9eNBdAdQk7zsoM
	gye+n5p9+877nlqHwNnj4HuxkjzfyF1lHXPZZ+KvcMymLvdhPf8h0HbhCrnE5N+k
	v1RIVU+CUW9hUA6Wcfmi/Szea7zLZuKc9MWZCKV8mIrRpudOx1AhNGrJqHjWUgk8
	d6KvIQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6yk7h824-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 17:00:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so7310936a12.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 10:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791565206; x=1792170006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=;
        b=C7LTIbh9NcWFZM++BzubNLI2ADh056fbzz/50GUbzXZ/5rjXWIzHjdgD+goZBd37r7
         fJWRzexN6436P3ydHli/+abk3tjArm6BZnJU89FWqAIBIj61M8aP4r4n1bVzL0YGmXNF
         THfE6zK6sc/bIr2IvXQBAoitXSUYI7BMwnxMWEO/GCafP7o6RDzr7a14LGyKxPC/QRNM
         tR0j0pYZFHtVCLvaz1B7YTdq6MdTpwm/ZeAbxZUpDfx1lfJ+JZA/kWNGf5jS+3cL91Oh
         Mo57wHsxIy0yXCUI9nL+RW/WidEWlC9Mptf/G7GB2+QDKIjN7+13GZiVUgqxJNW/r8h0
         2IyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565206; x=1792170006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=;
        b=Vlr2pFzRkGXDjke9cSrhKr31qBdIVwcv2bwdnZYVbFKc5aO+fR+RoEW3i+QehIMe11
         +gPl/6+G8fFH2i28BIevBiki13IomrAUpTuVBkIhzwogljSYHZLLRibD+5D8RWyWJb7s
         2zOLT3+hE+yYCELdhtYPqkEPIEsCYGbEkm9IMgdX3gmMHUxT2Tu84zwhbvFEtxUKLmay
         qoaOfc+6JSxywAE915/Ty3xEldYyF/12G8Oofsccs+8u06PjRCxlQyXOr1OgZdpRJVuz
         YY3r/x7M+s6yj9xwUuAmliuUwziKQhCg7X1mO49EjoECdLafSEI+2jsN8+WB3wjEXEk3
         iG0A==
X-Forwarded-Encrypted: i=1; AKwUvByHaSIanfQKEsqSH2+AM9Hq/lnx2Dws8zbFVZckwHJiCIopsT9t6IVJove6DBoQtWS/zij+lQ3ZIZk=@vger.kernel.org
X-Gm-Message-State: AFuF++lJk9JLyRc355i0hTgpJQk1WqFOXmab2rGEb+ex5aY8rVQmUvkg
	RjHEKeVZtAoNzJQrXvfVC8OiBtJvgt5vSs95G3vSIn8b1Dhy14t0fso5vtFnFPDapxS6tsMZHjB
	0HZjocfcghaYKtWsb3OhtCVX6iV6Hckb4hNfv4c0fpqDDZ9C0GCLPH6lKFiqi0nZ9lOYzxOM=
X-Gm-Gg: AYBFou3qOcVI0V+503gdWdn4PLA088ynU7ofwDdM3CGpU/2ic7mp2976R5UnpKOnidq
	whihwkhhwIU/BEN6CpL0L1YE2dav5ZNG8LBMYVaRrZLh9v8TLwRvTvD6xQCj3JlaGA7evB8VWzK
	fIovxhY/xAwUix+2waYss1OiY5U0szchv57fyNXUKJmHoIGwRD9SQLDjDlLHew/yuCoFGNwwxL8
	0lNJz2lK/amE8nr4LsdfP4StLXmmGsDTgG5BOlDEYW8EL+ZUgwMIQhO4HI5px+nOE1G38eyiidZ
	v4CYuamUOE4ZhfxaJUgs2n7wV8mVJdXwDQ36t/Ij0Q558Y+BhjU5Fj60fT5jmTCpEhSiYhaJUMH
	xslS6BeRCCnr6iZYHCy3vaEfmzcU698kJft0zSg85LsSWW5l15jWYr0FXQXOiirV+9Nu+
X-Received: by 2002:a05:6a20:3d06:b0:3e0:b9ec:7c64 with SMTP id adf61e73a8af0-3e16bd85989mr2590054637.18.1791565205666;
        Fri, 09 Oct 2026 10:00:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d06:b0:3e0:b9ec:7c64 with SMTP id adf61e73a8af0-3e16bd85989mr2589960637.18.1791565203736;
        Fri, 09 Oct 2026 10:00:03 -0700 (PDT)
Received: from [192.168.0.106] ([49.205.100.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm1395220a12.31.2026.10.09.09.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 10:00:03 -0700 (PDT)
Message-ID: <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 22:29:56 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <asNji2_GUda8x245@parshuram>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <asNji2_GUda8x245@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6ac91d96 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=jBUYxde0W5cEf5DRjetLAw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=a43HgpfhDiYDw8gHJIcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: -aF92c1i8foeYojtfnPPtm8k3yY6BTqV
X-Proofpoint-ORIG-GUID: -aF92c1i8foeYojtfnPPtm8k3yY6BTqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX94wbEB60J/DC
 aBUs27K/b79bisVVOdDdKUKmqE8yR+KcXwpLJMCPaJQR8rt06k3MPXCLi4fwB/v3dRNSjoZTQAU
 yqABBpT2b8us5eMcmV5MibG1ZUcYSXNf2EiuEGDO5cid1zICD3OF+oJEILWod1n4/bmPG4jqtRu
 V9Kl47VNLTu98fgmQ6UodSxFlW0wZIun72Iw6EEUGMadx9/Rc1JOBEhGdZo15Bs0aDR4XKYy104
 cv/JcwiBK1D1mki+0jG0tAyNJhbtaWj/954eYSKdGYXpvjaVS86SQeLEsNeZlRiNB7b2mqlmbm3
 dfbK1lr2ryL9r1dtMYDxD2W3RwRDZHGDwVib/1kfyMslG4lJJFUdIRHxmNXBPdM8bBsXUG6JN/9
 ATgKWzmRi4WPpmEo3SmBkUJeQIcL6JEis3jBXV1LswOc16oS2TzZ2VVSDQOeHZJOn/+Yn9cG3cX
 h+XmUr1Y6SmItCgwKdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX7pyGSMy+3V/J
 iXpMKPpx2YiByht0A+Zhk+h/LTmzd6rKyQ+DJ1vqlPVMjnWtWaphT0x6vVYrgmJtyMYjm0JXF2F
 IRSKj9bLOB0ew4moIwzUDwox0dW1Zpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090067



On 10/5/2026 2:14 PM, Vinod Koul wrote:
> On 13-09-26, 20:10, Krishna Kurapati wrote:
>> In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
>> required to know the type of phy (rather than the operating mode) because
>> DP and DM interrupt lines need to be configured differently for each of
>> them.
> 
> Does the controller care? In preceding patch you defined the EUSB2 in dt
> type, so this describes the hardware. So phy knows it is usb or eusb...
>>

Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now 
its type, but it needs to communicate the same to controller.

>> Add support to cache the PHY_TYPE and add the following helpers:
>>
>> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
>> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
>>
>> - phy_get_type() for the consumers (like USB controllers) to query the
>> type of phy connected to them.
> 
> I am not convinced that this is the way to go... Driver already knows
> the type and should use it...
> we alreayd have mode, i am inclined to not say yes to adding type here
> 

"Mode" attribute describes the current operating scenario of the phy 
(device mode, host mode, high speed, super speed etc.,). But it doesn't 
describe the type of hardware and hence a new attribute.

Regards,
Krishna,

>>
>> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>> index ea47975e288a..038c2b58bbe1 100644
>> --- a/include/linux/phy/phy.h
>> +++ b/include/linux/phy/phy.h
>> @@ -21,6 +21,8 @@
>>   #include <linux/phy/phy-lvds.h>
>>   #include <linux/phy/phy-mipi-dphy.h>
>>   
>> +#include <dt-bindings/phy/phy.h>
>> +
>>   struct phy;
>>   
>>   enum phy_mode {
>> @@ -152,11 +154,13 @@ struct phy_ops {
>>    * @bus_width: Data path width implemented by PHY
>>    * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
>>    * @mode: PHY mode
>> + * @type: PHY type
>>    */
>>   struct phy_attrs {
>>   	u32			bus_width;
>>   	u32			max_link_rate;
>>   	enum phy_mode		mode;
>> +	int			type;
>>   };
>>   
>>   /**
>> @@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
>>   {
>>   	return phy->attrs.mode;
>>   }
>> +
>> +static inline int phy_get_type(struct phy *phy)
>> +{
>> +	if (phy)
>> +		return phy->attrs.type;
>> +
>> +	return PHY_NONE;
>> +}
>> +
>> +static inline void phy_set_type(struct phy *phy, int type)
>> +{
>> +	phy->attrs.type = type;
>> +}
>> +
>>   int phy_reset(struct phy *phy);
>>   int phy_calibrate(struct phy *phy);
>>   int phy_notify_connect(struct phy *phy, int port);
>> @@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
>>   	return PHY_MODE_INVALID;
>>   }
>>   
>> +static inline int phy_get_type(struct phy *phy)
>> +{
>> +	return PHY_NONE;
>> +}
>> +
>> +static inline void phy_set_type(struct phy *phy, int type)
>> +{
>> +}
>> +
>>   static inline int phy_reset(struct phy *phy)
>>   {
>>   	if (!phy)
>>
>> -- 
>> 2.34.1
> 

