Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64D40EB90
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228539; cv=none; b=u/Bv0WwlRpBBr1xfSPW/qPr1jBhY3+j35eO7M98VfZn1/zNx4Ho7MHlzfGMFLKivGzBgfZIyyvIuyY/s/VIbX7/CtuJTBiqNnAI0lICnJeLgDS3KQ1p0+VkZ/9o1enR9tM6pGsL8tGXuGCEQpw0DCqynuRgiXKHq9qWt4YhqJyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228539; c=relaxed/simple;
	bh=tV8x4l7DRSbztf6LM/Lar0hUeYJIxLzO1L6pdskq9NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKjRTeohWIJHGHYSL5bl7mrRNy1kFEeDvERuCXgVyeFmPqgZDJOUq5umAN4wwtcenBhkcXjtq2oEwPMO5DXrQUG9zrj36vYRhCUECuF1M7RWormtZYSjFjOqd+qK5VKaBLyqkfWV86ARS6eY6JHahYxB6gmClIlFarZmX0WV+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuWDHyMO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grBdMxBj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuWDHyMO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grBdMxBj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82HQs2128873
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nJc486kpottCDKvr3SM9hJzfeiWW2rAuYb30hCrxAo=; b=fuWDHyMOS3CEfoJ7
	qtQzmWQIHLsyqNCetXvDCtl2QQFn5nZofaOkX9ZDgnFwGGePLtmGOQumYCg/+KkV
	0ZLlUv8k58th+EdtoZ6CYDlwg+AAaGKp7N8aZUmHUztCI4nQhH0AwSd46e/ihoGU
	EDB2JTVVSjMe4ZLHTzfhn8PsjnrpGGDbBRdZQRTiKIhAdcKdXqafmjQoOxC/QmWp
	buxCLpk4YOO1lzIL7INg3irtTNIJVcfGogcqCT9gszAuh5nqGnCPYr+0qHrpuZ1X
	PyETsT8FX3Vyrw/RngWSZK5I4ceWOcaLglKBBoBOZCSQJ7TAKncZIOLvD2z+uvSp
	V419+g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8ba0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:48:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so9363436d6.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228536; x=1785833336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nJc486kpottCDKvr3SM9hJzfeiWW2rAuYb30hCrxAo=;
        b=grBdMxBjtaWt58hqdjJ4km8tAYx4ua7ZkQ/CsAzeScwH0mmTlxdshPJzjWMPMmO9eQ
         aPKBTKDCEq9Icz+yViPG4wUvyZpbHyikz2k/4B8ZMMnQUu8OjNfUY4EGczCrhikv2Pv3
         b79IKd2f1zT4WWa9+2YlwJuWeanAm3qfA4UDRQI1eNPxN0SATbFIl8PI8My/F0MrrDU2
         UA8MCqTZ+4Zekso4f0/KzOoAraNOyIIx8ldgHycuN8TuqHTmZF3G8nqVy26QGc+y3DEV
         N0hrpDbYwmSASHBB/22qXgPEkFB8GcdkfnZu2n4kWsG9rf0kEvoY9OTEE4f0eiojb7XV
         YaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228536; x=1785833336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nJc486kpottCDKvr3SM9hJzfeiWW2rAuYb30hCrxAo=;
        b=QPPt0NoXSlNZ5ESOMj7zYPCHXavNbJXEx+oyyr2qDrGIz32i9od+Zw5dtg258KCv68
         nFjj96re1vU/1Ld13OU42E9R8JXpcZIqNs4nbZSxPYAw4yyFf3AqxWRfwDgiT/yJrQm8
         MVf39Eyusv2W3IHgjAXlHFEHaWMdZbv3HrWJq2jlCXQKg+fQ4NkYXByTIA7X/SpRIdfQ
         829dqAd/okj0vK21wDN/EKIN9J1TC0AmVLCIk5hhObnYK1YFBbfPaxFCak8Z0up49XyX
         3RL8n7xJOdK802fbhzMaGIUSatiE95rVzTB/HX8NOltKYMVvEkNBbU/gdqk/VdtzSrTu
         H+eQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXFLLEnkuNE+ALGLrgq/18LpEtCVwMSLDBLOgfAaivudZZJgQf4ERoMwO3cankWrrqTfOWgYJYPQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YygE1cztdcc4ZsdV+rcBG09uHd81FSIN1KHEJQy6fNC9zZ9UBiT
	3xQ4g/j/Uw1/RVFa0KS/19fBFt+Wo9KAdhKcagBZpjl1O5i66Yk0bUPBgG4fOYZkC4IGxumDY1K
	xcf/M9LnbPtqmKoHaqCRQtNImjOanvaHVcMXYqwWs5el7ky/5cqcrhr2NfpMj5FQ=
X-Gm-Gg: AR+sD11XACEQJwJhPw3KV5mQ7eyHfNDyGNc16hhQiyqXmDgZlc9He77u/uwNmkjzyd7
	gyGkwfw+tLXVzzLn09KLkz2NkqWwi0bnNac71k/LHTbjE+rx4F2YZ20w99M2E+COQZtZnXGRdEZ
	x2NXaTYE8T0LZMTHgjoP0drhf5FYwWiXwPY+AXtVAatv3rwxEAdARGvdDgfx0HGZy8uDV4wpsYU
	uQPHRJE+0o5XHuUFH3WJuheugGZj/BhtstZnoSks6wZBhV7T8t1bDOEkHIdy9+zxVgOV6xBlWnR
	S5vEBbZMo1mwdfIDYrN3uvuqIc2wM4qJSrBog+E25FfAwa9tF0PT2/lC9qbh9mQJH9GFdumwKNo
	tie48SLGVKP0trkuiIXDgOtec
X-Received: by 2002:a05:6214:5f10:b0:8f1:1359:2af9 with SMTP id 6a1803df08f44-9081756ac27mr12248336d6.10.1785228535809;
        Tue, 28 Jul 2026 01:48:55 -0700 (PDT)
X-Received: by 2002:a05:6214:5f10:b0:8f1:1359:2af9 with SMTP id 6a1803df08f44-9081756ac27mr12248166d6.10.1785228535349;
        Tue, 28 Jul 2026 01:48:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c9030dsm732517666b.36.2026.07.28.01.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:48:54 -0700 (PDT)
Message-ID: <7e66567b-ab0c-4d1e-af60-9ab024f47c6c@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:48:52 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] usb: dwc3: Notify XHCI core of tunneled status
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-4-026487a08119@oss.qualcomm.com>
 <amFK22a84gjloPKC@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <amFK22a84gjloPKC@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NSBTYWx0ZWRfXzVqTZ6sOfoMd
 xwYYIaR36R/D70HSFefqbQpnnaWgupFZDorySIlUpMkzMNRzSmYcKVS6asIQeG8ejkG+K2QNbo+
 XPJ2rCBZC3OZe5UQfwV+BJyn/Iph/KPXRb64WDl4ytupG2b7DMEBqzRJP7Eo6QqGRnoBW44NJbl
 r+lWY46OF5D6qpvGHg8ppx3FenrsooSJ6V+5Sa2KqdVeADLRLxEXGATCpMq7dVNCAv0N2ClALVZ
 amwiU6DgEpGfuB+gOdkhpz1XYdZ264Rurp3K2d7VQrv3VSRcCedQYqx+/PZrpexexQyG1gjmh2t
 YDUtn8NRhrS0Ol9DcgCr6uqLheaKGlCYAAwCgkhjGKm5MuR3IsJvzXZJ7sW6hQNTaroBgZ9webH
 gRX+YYjHd5SaiJBM93xS9EE+3UQrVCBemsV95WXYcX69YxKVVOQw7J35eZFAjReaH2ZGINf5J7V
 MoTqhUOu5HrCHOyR/8g==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a686cf8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=k3Ez1NyBZyIISVUJBm0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: HO9SbJ8s9bVMDv24W3cyJWwra6ol-3fs
X-Proofpoint-GUID: HO9SbJ8s9bVMDv24W3cyJWwra6ol-3fs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NSBTYWx0ZWRfX20UrP2r4/pdh
 sg5lX+op4xX5vTgyj3EVvllg+3MrG0UQLeZVniI9PVTdtRwrIkgzg0jNbtdXDlfydUtWV/RJlXc
 A/PNBiwV/EqJfBKvZiMSN2SBakZQj3M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280075

On 7/23/26 1:01 AM, Thinh Nguyen wrote:
> On Wed, Jul 15, 2026, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Thunderbolt framework relies on the USB core to create device links
>> for tunneled ports, so that the USB3 controller is only kept
>> runtime-resumed for the duration of the tunneling. This depends on
>> first knowing whether a connection is tunneled or native.
>>
>> Add the logic to handle that for DWC3 controllers.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c | 16 ++++++++++++++++
>>  drivers/usb/dwc3/core.h | 18 ++++++++++++++++++
>>  drivers/usb/dwc3/host.c | 12 ++++++++++++
>>  3 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index fd5c2cd36c59..6ee6fce4c927 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -162,6 +162,22 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>  }
>>  EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
>>  
>> +enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
>> +{
>> +	/* Prior versions had no CIO support */
>> +	if (!DWC3_VER_IS_WITHIN(DWC31, 191A, ANY))
>> +		return USB_LINK_NATIVE;
> 
> Refer on the feedback from the other patches, this should return
> USB_LINK_UNKNOWN instead.

My thinking here was that if there is physically no possibility of
the controller carrying a tunneled connection, it must logically be
native

>> +
>> +	/* Not all DWC3 instances have CIO HW, trust the platform firmware */
>> +	if (!device_property_present(dwc->dev, "usb4-host-interface"))
>> +		return USB_LINK_NATIVE;
> 
> Same here.

Here I can agree it's possible that the link may be either native or
tunneled, but it'd require the DT to be wrong (lacking the property)
on the XHCI side, while describing the USB4 router.

But on a second thought, the router may be internal to the SoC, but
present on a discoverable bus (e.g. PCIe), where it would appear so
long as the PCIe controller is enabled, not necessarily requiring its
own DT node. So I suppose UNKNOWN here really makes sense.

Konrad
