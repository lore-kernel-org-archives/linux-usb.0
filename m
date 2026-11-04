Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771931;
	b=TtVrA5SUkxOhonl6/akuscac7HUBF548b6g4no44BqEe2/nn5ZX0SUPkRsLBwWh+RyHg
	 UKMyfOpMiiGM/qONqaYNWBiLsjbp2ABcCw76LOTDsGEkNJDkLRGk8quGxlowHjQ7T9hGx
	 oe0/JwK0qi09hebylp20ouZN8b9+uA/GDQqLswbgwvTMogLa1Pfl/vg4tfbEN8iJgCYNL
	 aWSffnC6tMbKqXNKcrAT9lwj38ynL5whq1tve+eFgWjzGxsqs0OXM/JIValJgrFpmAN72
	 E/JBHEQjaLJ0iEjFZRWC9XmqJcY8QReWrrcmYvZIh5nizVqWb8QUcAqzgs2LIwwdj4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
	b=ipEvXKEVn+CsAxLBovSf6eFE5NSCfGh5WxMrlwk2iyqye8OjBQWu4UqH7N2X5i7B1oUM
	 5Gqqkw0ODHS25Dz7Pxn//MZgs2B1lCteTClzG67M/jn/V8GxGsFqjRhlHEiqJHP6SumHw
	 qXc45RSAuk/x2Oym+qo9jjx6cI7Rno3oWRzLF5xlciEoR/g/icwJaZhzKhaaudddzOXbG
	 O7qPpJ5sxC8+ousuhRnhEc9u92VnEy5CHYG43wJ1ofkp5ZMc56QG4dKRE3HDnrPj5VUsp
	 mF4/tWn9x16qVrdenDiN59ot3SNiIkWRp3vBM+n2xpC1RHuq721ZzA56eW61UuiNtwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ew+EDxDL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfzkbx8z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F5606A338
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 05:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98F5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ew+EDxDL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfzkbx8z
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R0iI3458454
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 05:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=; b=Ew+EDxDLSs8kDC0E
	FvrugefWxrjX8yDUUL65XV9mRHQ0diHUk9CZHfya/zYWk1EF7B6QnLOnsUxihepa
	4YehPZuY3lsSt+UKY3IvqeGtm33HZhKfBa/aZYwjmfitQi30ia2zS0TlqZ4yLdIg
	7/6rkaoUo30T7X/DvZOMGQ4yldP2i9b2KYv8hYPWUD4PEZfTY7pvyA3cEzRpIFir
	sCZK8c9x1eZSDJx3tWMbR/Q1L2DYbJ991vHMTGOofOC7ps/q/7688WHGlzTIYKIq
	yVSsvBSmnFw2zXEmtiSd+iriesWL64soXRs86KHy4JZYNip3/lGHxWiCHwHoYBVx
	eG1QHA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bugyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 05:58:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so1302816eec.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 21:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793771929; x=1794376729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
        b=hfzkbx8zgVOT5plQBFrLAlDlJDvcPZ1KuG7TYd971IKg7eXEq+h0h4AH1A4NDT1E5J
         FSnsy19nzZnELcXpr8UTEFPkoG1NvDXcssPbs0Mubi+OKSfuiHm4r1T4SihqZ/2imeWl
         bF7yO2ZfE8vHbE+U0hV9HW+2EcmPpAp/P6HEZV8KmZuPxoZ39XfLXjtS4/28r43FWIk7
         mlBQiNDtunWf8e9OdOMBjrFGVcgKuKvduWrVsisr6cW9fuLZmB4jhs2KiKNksRGnpm9p
         XbRfIAfMeB6moJVoZ1XO/IcaVi2rwGGcs6ON0jhd4XqzjZQvOMctnS5L5pJWzt5VnB4B
         fGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771929; x=1794376729;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
        b=gaT6spBH13RcT1apRxsMGRK5lt/dZ8XbjTjUP8X+pdhYSPq+TvPZpP3/6MOm4ysNeh
         d5Chw64/jd9bgRp+6qXgKrpX3YWvNkXMKrQHvb+nz81tE2xzz2A2W07Hz2OEFwiIt1Wq
         5tZSPU4Ls4IGs0va+ws1nieEGnT+71sqQE/HYeIJkGXoT6c4YCa7O8FhQCDIV2cNpWiC
         2XVvNirmwTkV1SIeQCyUeDOPRROhst5Jz5vE/btEgdu/CCFW0UrzVVqKa77gy5CtpDfJ
         ctFg5NMWp3UJFQQcTzrvBIiQXOILRqHWR694FVzna15DqR0XIAbryHUVcgIeNQzM2gAR
         6Pzw==
X-Gm-Message-State: APuU4Z+RtLVEzlxMq1G70RW4CzTdQ4aLqv8hkEn9SmKPeYKhITdrwJa7
	k3D5cP9hTGG1/pI+xe/GrrIAdH6Eaz1eW5e0FlXJg0jUJ/coKRWLP12PrpqujoVBv+QmLqCt5JV
	xRH2+/PXssUJJ1QlIzusg22IAtIT0ibfmqLZcO/rL6YE7nhsGIZKxTLtwIgrG+Rw=
X-Gm-Gg: AYBFou2wIpr0RVNHyCZhdeo4hJpFeq6Y//H4yjP+DkIMSX1jpL2O+9gSn/bYr8vtJrm
	nfBCp/D7eGUAbeoeeNl4o3TAyPSv0ADzbhZpN3LV6eSFCZ5dZARGtKwdPFF+/eOc7ONbv9zw0yD
	qg0+UyixMlw0yeIspQdo4em0bL+86WHJBKnFwHijDdyjKqfcZDmx2JAouo6CiM8Za5yp9HQwcmN
	nztUMgjq5ZypLSRpKIC1MxWoY1DXoKt3aG/YY43CEnMZzbcIG2sBKEs9VQwOhZdQf5uGsoskTqT
	3JtfOI5Zj/VG+WrWMr+jX+IO+BAG4v4SedX5JEsH+gWIg3wHlJ+V6Plg3qCCo69DmN3bHcYfD02
	rlAs7lU7WvM3byPmBCDSWczRUOGWpDgyjmciXEquGVViyTrYKVWeL6JiChGKSskTOKkuuC98JYb
	s9
X-Received: by 2002:a05:693c:4084:b0:36c:9c64:c547 with SMTP id 5a478bee46e88-36c9c64d2ffmr5341851eec.26.1793771929208;
        Tue, 03 Nov 2026 21:58:49 -0800 (PST)
X-Received: by 2002:a05:693c:4084:b0:36c:9c64:c547 with SMTP id 5a478bee46e88-36c9c64d2ffmr5341810eec.26.1793771928636;
        Tue, 03 Nov 2026 21:58:48 -0800 (PST)
Received: from [10.216.40.83] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm6269224eec.11.2026.11.03.21.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:58:48 -0800 (PST)
Message-ID: <f8327c0e-ff47-4e67-a37c-9b636758f83b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:28:40 +0530
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
Subject: Re: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe for
 default peripheral role
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfXxSUTrvhFczfP
 kSrMoMUjQ+3wxjTVwlLe8q6OWkEcdJY1Ji9Bw5se0MEnmV1qPmBeDtBrmBXAqDJ9r82GdQgva4U
 sVKaplW8OzxkSu+zP9tBs9YoMsq5DwM=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aeac999 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VcVH6SLggcOI8xUk3fAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: tnaqd9Dl7jpa8UEy0QrAxINYW7aurHNt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX5mW7vlMJOzSA
 FWN9j46V5gUgaB+sv1BHbbuZHUI+UiwKNJWtwzDQuDSpjpzkUmOkK7fn1DZXr+kZ+C0Tqj4Y8ug
 iNCATscdvCXELayUkXo4lTNN90CLCFRfEH+37ygX5UFmFgw99LChVFWs6o4HArXyg1H0jGna17m
 dpsqiduLd8a6RJI35bretBFX1qkQPnxinGHxC8KcsSLHf0PC+pdgiAgheWO2BpENXgmyz9RoXLt
 S0/JOTpusP7Dc6/ztVNG1id2w8GuYAVyaHj9zhWqCNKDTrQ6cSP7g4/HLRz20BxNpyiDxcMkcib
 rLnfWBIm9isH+gOSW4DP0kzdN7ZFF75U+v55oDkLUc5ABpEDXZuw9EIoaYAPCdHUARmErtgOnSD
 x9WdqjDoh0wm5wKSNAreljoC3Cyru4erlMjg4v/67W+/GEILY8EKmc1kLFoA45gJ5NeElRIiV2H
 T9WypE1n91qgLgsFSow==
X-Proofpoint-GUID: tnaqd9Dl7jpa8UEy0QrAxINYW7aurHNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040023

On 02-11-2026 12:06 pm, Peter Chen wrote:
> On 26-10-29 00:29:37, Faisal Hassan wrote:
>> When the controller is in OTG mode with usb-role-switch and
>> role-switch-default-mode set to peripheral, the role notifier never sees
>> a transition at probe, so the QSCRATCH VBUS override is not programmed
>> and the device never gets a session-valid indication.
>>
>> Enable the VBUS override at probe whenever the initial role is
>> USB_ROLE_DEVICE.
>>
>> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
>> suspend/resume iterations completed with no failures.
>>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 0896a323bdda..92f1223f7b21 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   		dwc3_qcom_vbus_override_enable(qcom, true);
> 
> ....
> 
>>   	} else {
>>   		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>> -		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
>> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
>>   			qcom->current_role = USB_ROLE_HOST;
>> -		else
>> +		} else {
>>   			qcom->current_role = USB_ROLE_DEVICE;
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
>> +		}

Hi Peter,

Thanks for the review.
> 
> How about move it and above [....] under device role, let above code purely determine current_role:
> 	if (qcom->current_role == USB_ROLE_DEVICE)
> 		dwc3_qcom_vbus_override_enable(qcom, true);
> 
> Peter
> 

Ok, I will make the mode and role-switch code only determine 
current_role, and enable the VBUS override once afterwards when 
current_role is USB_ROLE_DEVICE.

Thanks,
Faisal
