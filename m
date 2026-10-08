Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB292BB17
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 00:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791417982; cv=none; b=iBSJ8WiF00tHPGEWB98QYd/VEjcvoP4GmqRK1s9dZCY6IRmmWMpANcR6FWplwXaePKVy5mKlk5Z/SdtS6blQDGUZqLFExshZ5bMN8j5u3KHoUTuNE1QFq9qKPdjxS0iOxuEZ4INIe8bh9qW95OwxUuwtWNdAvH5Wa3Zs1aDfAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791417982; c=relaxed/simple;
	bh=DrtkP/EDagrCAnx7kdKO3J0H5Jc/7HTMUHnMRinMpkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVpC+s0rHamUmhTF4PcfTiTHFRaOffSumFhWIHf4t61VZvfIqXbryq8hbNCGijg/UCTbtsk5KtFTUnYGLtL37vKGcIWUCVllrAonhgtE0M/HSz/7UrPoKbzsB096F06zvaTIp8lu9+G5VdqNYrLFOSuBbnsoMMgLO+te2F2JLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASlTytu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrucklLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASlTytu8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrucklLg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697LurTo853304
	for <linux-usb@vger.kernel.org>; Thu, 8 Oct 2026 00:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bU4cMr00O4p75b80sWk4BP8jsdrjwNx6YLTtrRbn8zo=; b=ASlTytu8WlkXf2of
	YgWAqcSCSbV1PuOb7N4hqNfzUMplLfR8y4H/jDnGTu3WzMsSVQaCgPVGpWzVB7aI
	1PIARi5dAyOOQCjHtDqtjFGaAqrhPqgJkVxuD9hqWtT96yyOtgitBBU75/+7U7nW
	cKc/X94VTNBKq1ZD1pNUQoYyXFwwmq5PtqYLGK/J0ghMPGrS71gcNt1bWk/mC/Ru
	QsLcGSwaK+y3LZXifqM8MfhziA6ztf6ESJuCTJoKxV4nyCZ27hDRDfN8acHMkRAE
	TOXKmVjZnEYOGTsqlAUsKQzXF+55H3RKSeXoyGNV93KseSTQqkPxgQAlg985MqWd
	wWaL5Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3gd0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 00:06:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-149e8e8ad71so1683135c88.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 17:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791417979; x=1792022779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bU4cMr00O4p75b80sWk4BP8jsdrjwNx6YLTtrRbn8zo=;
        b=VrucklLgGgQv+ZVHDCUg+B12B9Mf1pNBQlzYiJpoDXwB2Zkfk2NoK+JF1frAgevMBv
         kRuOEGzp/Ak3Me7rgxXPeqtpQJSMZrzWOLeOu0fmszC2gxLvyB6PdC2CBe2Bmbvn8wl7
         reNW7WLvXAJO0uqA4oS8PBgdqOlHjNrSWZrZJQo3cnN+qIkjnFAZw9iEKYqyOoABkw40
         0pU/GwQCGZMrMlEFRzz6zUnWntvgQ89d9kYm6X+3Vi84WumBkifm+a40oVES0Ogf+nzn
         7/BFBK3I2CxBdaBADCgxZMwWaUK6CCeM5uCOjyAQP2BaAjBUOUm4Q2zdDA2TjuzFkZe8
         zkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791417979; x=1792022779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU4cMr00O4p75b80sWk4BP8jsdrjwNx6YLTtrRbn8zo=;
        b=im49dgP+IwXPvK8b/5+tbzyfuFN2GQupK7J3zuXeqlreEHfISBh+DtbS62Oj7WNMao
         gSbT2QuY/qWRGa/+ExeBF6igynBNpWiLvLhKAemMsto7QB7rNCYZ8Lfi/s4UTBAjYD/0
         iml06mhgErouRrZR0e/t0Jd2FPeAFr9r35S4jUGetPp6WWjbNKeOuqZZbYIjrDGynYSr
         F8xyZZI1PF18zITBlgGUohnvgh6BL8R+kvOPFImvCIiO4Z0YSjbEs8G8gcwK1x36seya
         65q5TBXhKurorwAzkFkXbeIA5jbmkCkD5I1oLnXJ9srP4PxkFxX2kLIGFiN0iJ52D7AS
         vjxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8xclV15jQVu6tCdeWdIzdNojx4n0y+aIUeaO9JuU/vPxQY9wwy95sn2uxEIcUa0pwA3tqUZDsTTw=@vger.kernel.org
X-Gm-Message-State: AFuF++l3dE3KvG85RrrqiwnhtEdaYXWYlTGK16lgKU+IjaKhDbp7YNbh
	VbhXSa1wjozF/X2MgX89MN1omM54fbZK6r3k+ISd+n0hgpP5g9w0fjhMgFijY99y8z0SBbpeR7N
	agIg1uug4jeJYRX1xzr/MAxZlKHJfmcvuKSX3r6sh7w/bVuaIAuchcViniGPWq18=
X-Gm-Gg: AYBFou2pOII4dYu0tCKQv0LIKSneum+RBRa2cy6XQtSY84vneoHn2U8X3us4724eTwQ
	U9u1QaX196TjE+0M/tJTfnsUSdK6c7sw1mCB9bIlDIuRXDxaD7Tuds6jAitcKl+ewnpKpcWvdcw
	E2kOIGTXvvkSAgH9CDYtOOocB6fi4DcR4eM1XA+H6Mm3wP3paYH3IjJfGmkj4Q+nb6CHRkgkFaP
	xDjXIQkgL7HUYb7L9byBUE28FxEc8DC844ULraC5slndOLC073FUIhSkn37xjImBY+7haqThPtM
	5JYPlbMlazpNviCZ2RyXQLHSCgtoz3V89j2SRBic9U1T10m5xNlr7Z4jMrK7fWRKY1s22DYx/8o
	SdIKD2eLn/TRrzS/HeLJJw5U+bBElqA==
X-Received: by 2002:a05:7022:4381:b0:149:1feb:6da4 with SMTP id a92af1059eb24-16206f07244mr6679670c88.32.1791417978852;
        Wed, 07 Oct 2026 17:06:18 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:149:1feb:6da4 with SMTP id a92af1059eb24-16206f07244mr6679616c88.32.1791417978106;
        Wed, 07 Oct 2026 17:06:18 -0700 (PDT)
Received: from [192.168.1.133] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166216f39sm11898472c88.6.2026.10.07.17.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:06:16 -0700 (PDT)
Message-ID: <0f4b331a-0c5c-41ca-ba8c-d3a4cb89900b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:06:15 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] usb: dwc3: Clear SUSPHY before issuing core soft
 reset
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
 <20261002000741.450793-2-elson.serrao@oss.qualcomm.com>
 <ar7-H4Q9U3sNou0Q@vbox>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <ar7-H4Q9U3sNou0Q@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac6de7c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XizZcgsUtJyPTJarKMYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX9FrS5eS84CDR
 DJjfg82my18g2KoCavCjr+PxIVYNe5gFt/2Xoax/Gu/TGvs8ymVmZZsoys7IzBH/uQAWqkxq55s
 xhhd9ia4ieDFL9hTyD/qvpzqX0FJYts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX1Bt3hURvgpyh
 5g7PO62c2S1z9KYpB4DrHCsjn9JvOSchFproYsxcBvcZz+4q/JY0sCtz6UW5UBS4HVNBzkGVQ59
 VcC/YhGWt86L94DnC1go3wr2fHtIKsmlC2beHodkkXPMM7EjFF2rhgIRxvcZk7li7T1PQtyCGBT
 Qu7ids29pot9/8+NdaohAfMDqbRHpP2aMeM05ddXYEzvrRDbfTqfaoeC3lHpbBN7RrYpyToQfbg
 tsqloav3rAxZg4HqhqNBWjNg35+1vauVd0GytkSq/q7Bqt4xKGQg+JkVeof7qL60shO1FE14/bM
 ngOWcyPrhsvkTAKQcsDVy5LTcsKxvdgzUAn2J82UUasOataYM0GQI+VW9TbE0Lx4pg7Ij2v8S8V
 9DRk1pk7eLLr9sBfOsLrlXJdrd0LnH/QhtOat5V1MvRSOOzNLqxKHCw2guuwkJlrVWQi2M3Rhp0
 R5l6AQT8c7a1qWNQqVQ==
X-Proofpoint-ORIG-GUID: 3YXpPFPkLPUX-YpwbUJEHg0odR5YpgBs
X-Proofpoint-GUID: 3YXpPFPkLPUX-YpwbUJEHg0odR5YpgBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080000



On 10/1/2026 5:48 PM, Thinh Nguyen wrote:
> On Thu, Oct 01, 2026, Elson Serrao wrote:
>> The controller clears DCTL.CSFTRST only after all required logic has
>> been reset and all PHY clocks are active. If SUSPHY remains set, the PHY
>> may not be fully active during the reset sequence, causing the core soft
>> reset to fail to complete.
>>  
>> Clear SUSPHY before asserting DCTL.CSFTRST to ensure the PHY remains
>> active while the reset is in progress.
>>
>> Fixes: cc5bfc4e16fc ("usb: dwc3: Set SUSPENDENABLE soon after phy init")
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index fd5c2cd36c59..282a853c364e 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -332,6 +332,13 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
>>  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST)
>>  		return 0;
>>  
>> +	/*
>> +	 * The core clears DCTL.CSFTRST only after all necessary logic is
>> +	 * reset and all PHY clocks are active/running. Clear SUSPHY before
>> +	 * issuing the reset so that the PHY is active.
>> +	 */
>> +	dwc3_enable_susphy(dwc, false);
>> +
>>  	reg = dwc3_readl(dwc, DWC3_DCTL);
>>  	reg |= DWC3_DCTL_CSFTRST;
>>  	reg &= ~DWC3_DCTL_RUN_STOP;
>> -- 
>> 2.34.1
>>
> 
> Most platforms require SUSPHY to be set before soft reset. Can you
> handle this via a pre_soft_reset() glue_ops for the affected platform
> instead?
> 
Hi Thinh,
 
Thank you for the feedback and suggestion. I will explore that
approach further and evaluate whether a pre_soft_reset() glue_ops
hook can be used.
 
One point I'm still trying to understand is that the programming guide
states that DCTL.CSFTRST is cleared only after all PHY clocks are
active/running. Based on that description, suspending the PHY during
the core soft reset sequence seems somewhat counterintuitive, as reset
completion appears to depend on an active PHY clock.
 
Am I missing something in how SUSPHY is expected to interact with the
PHY clocking requirements during core soft reset?
 
Thanks,
Elson

