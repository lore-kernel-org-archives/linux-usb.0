Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5925218B6
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908763; cv=none; b=JZZnq19dTR2DyRolB2nDSfDcMn6FLZd2YGEUTcLbXZBdaf5NyzxwVclpExO5IoMK8osNscKGzfLwK1M4cZH02mozoi6vrb6W4++l05al3VIUuaGJdenmEChqVdMNwycniTmVJ46P96OBrzE5TfiP4lDiLt9vS61Zi3+K6W2buO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908763; c=relaxed/simple;
	bh=/LhdTHRISw3c+fMgpb6bY/t23rd/QPqJjlL0cArUNVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKPwk+coo/fEaM9ygLM5Y/IYKK77lOWDAs4bDJjyNJGrn01me2V8Q9lP+2aaIWjNaSVqP3t9Y3JVISGXm/yOSxbI92KIPASIHi/1jMj2l/0yOmyz7urSdPGTkJuq800d8JTjRD8ZdvwjKGCQL3rR3+E+MAKYTkS4MV+Y/am4d6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGqUDLIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKFE+HhY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGqUDLIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKFE+HhY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3tQt1460089
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 16:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOwomiv3iYjegKwc0HbneIrFbyqtKJ6r4RmiI2zRloQ=; b=VGqUDLItTOQ5LmFT
	BiWV4G+SMa8fjAnVYoJVbm5Iu0C41cAcPcYs46YMMgDc8Sf8kZjbIV7qTtxmeFsb
	1lGuhHmv4vzf4welmU1KlqOmGxIf2uRF3VK07BbqxvAwrmMDjYMbzwljATpdknYD
	/KOi5a8ZGvNPPk+oY6O8woVDEnOEdO4sHLwphr7HkkuIuwQTHaqo8Ak33kG3Aa3K
	4DzcPJHo3NUk0S7AMYRt9pXTn3esSP06E4becRzkQl2Rx+HjThaeGlEARG22c8fH
	7DpFTPYALEaK0LvrGcRVsOxWyGlAl/EErYW0bwzcAsskhXzZp+p4lFw14R/yc5yo
	CG456Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjswcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 16:25:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf3eeb42cso25662585a.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791908759; x=1792513559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOwomiv3iYjegKwc0HbneIrFbyqtKJ6r4RmiI2zRloQ=;
        b=SKFE+HhYFMgWAPBM5bjiy37OocwGFoftXDngqVM/RcnGEL3AQllLsralfVQfTyNoeE
         5IENS8a7akQZGWiyHWWf8hCBtbxV067g1zICtO4SDcnpb8b3FykgZ8vZt2L3jCPdwOef
         G+NTVHSrYy4DKyDwxAvVEnN9NLi9HFkt4NNwL6b/rhFI3kS+IeNiF1GiHq0i5cVzs/Ri
         HLo/lDdPQ7hRsytEgAXowz0s+fGY6GpRFGlv8co+3OAB3zbHIHzmz/sPdSd5m9ZeJA70
         hAxzz3834WBFn3QORoP4MxPw61YVM2IPLGGI3eLbE2m6TIr3w6KlPkQda2MbY6I5QMfB
         OWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908759; x=1792513559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOwomiv3iYjegKwc0HbneIrFbyqtKJ6r4RmiI2zRloQ=;
        b=cJnwcJAtK+uFSkcbau0U7pF0Ay8+Jf+ndKFJKrAvPbUrKE4pju9F1PiAzbB/EyL77V
         je55IbdqNG9rsNjhozAwMvH06QfL5O5/K3C9EP59s3tHPF/7LiFHgIysZvpGW0eTcT+1
         wDpxSIOBytTtWmCNKQ7mEy8kPS/WN/D9YL+XCndHcG8rAVsSN7VXI5xbZAqfXcY8yViJ
         S4G2EzLc4L37+DuChqTAPUe8rdYDYr/v+3n8ja9e2hxvaqKou3+G1wpFCfBLAkSOITVu
         XJR67Q8ZGA4yG10+/N4zQND9TZ6j1A97fBpxPcZVya+LD8M0DyvgC6HXDx5Q/sS+79h7
         +/9g==
X-Forwarded-Encrypted: i=1; AKwUvByzRrk/FLPVbihIhZf5LVzoDaiiees7FQun453V15jbBvYBEBfdnRDBkcF/xm+hVkPTVyza/KF80N4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6JuFIoogRgOFfiwjghZ7q3qsNgHlmJoi4rwZI3BMioji+x7bI
	jqgElkUVnTcC3dlyUPLZhD4Noy+TISwIgT0SpNwoNe9kszssV8jUsqWK8TPpkwa5UREKiEf7CYu
	JcQZZ3T2b8Uy+cYwPb1YxHvZ97z8YO8hGwkKBHVtyoBuHjQMIAUdg45ky73iNFN4=
X-Gm-Gg: AYBFou2FSsnHLPHK1vFR03UpudL1Yktt6lU982/cqvEYltmF6gW9o0oSw4mPXNXzG3h
	QZCMOEocS5ZyVwRf3oYreJhm4uz6VYO4zCdWKZeECJ/0d+/P4ObLdabZqah4S0EDazL9nk/pzvL
	o5dZ5KpQqxPH6HIpvPXto6Jn0XcQVAumh73Zin939DMFpzAnZz+zhu81h233B5wQ64hSTPD0No9
	zRDj4rrCgREuCg37uT5C33gknEFTIenT2QZ3zCnNN2V87k2zRIv/6PKwsL99h3eSooazpFVVke4
	+putkZj67z5+Hzk3KrQMZFHq4s6PZKCGLjJn50qaquiTBpnOjv9qECfem1lqqGD6K9vA0otb29t
	kFl4K6dcCBrv9CdRodjg3ug==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2469760485a.4.1791908758802;
        Tue, 13 Oct 2026 09:25:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2469752985a.4.1791908758193;
        Tue, 13 Oct 2026 09:25:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839503sm48797a12.8.2026.10.13.09.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 09:25:57 -0700 (PDT)
Message-ID: <96c4e044-151d-4fd3-9d7a-2eb2b4870a89@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:25:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] usb: xhci: Use update_device overrides for tunnel
 reporting
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>
References: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
 <20260929-topic-dwc3_tunneling_state-v4-3-63e296346d57@oss.qualcomm.com>
 <asBLzaNbnBmG3mdx@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <asBLzaNbnBmG3mdx@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfX0hdE8mkDf8tM
 +jPq3RmC/tTG/SrBoURap2R2MrksASTcjde3VPagbzu/XVHU8CGB6oY8ORhFGSVZ2c8kgfw/SqL
 NJz2eahvkT6GYg6mPek5u9dO2CMV0MA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfX0Yev3pnoX71D
 OzTH7/ZQQIkmZpDtDpu5h8KozIQaNGIRNn5JexTpzAayNDDnYQd6xFYd9mu0vSCsTmaBfrg0bZK
 k4bMiuKeGzEa5JYMmUkWcZZgcHk82+bidDyrEYu4GekX0Pi2qgbXkpR/rTUMddIek7YCQXkQqH/
 bHJ3+MNvAIe/cm5tGka3P+Lnix/oq6vmAznAwfLzCuYODcZBVmBEnIocULfg5HmwCrC2PzufAFo
 dvxrQrv2paFAMrK0b/qlrp8yLSYcmGMFrC/WPeqfzAk50A4l0dDeEvF8bKp6UDtGvCQ2eAH8f+T
 QW4wzhq93xOjuNjLIZxTnNs9hPwMGmRgo7uLXCsHJ4pw81NwWwZ06QvDcv4At5soT0FkDBTdVP7
 5poFE5WN6S1qViOCzKWF3cFF1wKpXkcSaKKB+7cYFykRCOX4QUN3tAj3lAcx0F082RI95d/C4/N
 LXHVjzR9Exll2ymwETA==
X-Proofpoint-ORIG-GUID: ubneS8M4xSCeqbRDXzFwh1sZ4qFaJswy
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace5b97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6DcD0Cm46KKLOwhum1cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ubneS8M4xSCeqbRDXzFwh1sZ4qFaJswy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130065

On 10/3/26 2:30 AM, Thinh Nguyen wrote:
> On Tue, Sep 29, 2026, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Thunderbolt framework relies on USB core device links for tunneled
>> ports, so it needs tunnel state when xHCI updates a device.
>>
>> Use the .update_device override for controller-specific tunnel
>> reporting.
>>
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>>  #define	XHCI_CFC_DELAY		10
>> @@ -1981,15 +1982,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
>>  int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
>>  int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
>>  struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
>> -enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>> -						struct xhci_port *port);
>>  void xhci_hc_died(struct xhci_hcd *xhci);
>>  
>>  #ifdef CONFIG_PM
>> +int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev);
> 
> Why are we putting this inside this PM guard?

It's like that in the original code, before moving xhci_update_device()
out of its current place

Konrad
