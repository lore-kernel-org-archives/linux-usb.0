Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D80E3C09F9
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740072; cv=none; b=LQZMBDyP0bOX9MFebdJb7K37K8/4dtNhVKPUlLBd/Dt/WJaIIr455oN1QxnMVzaV3Im9iMvZwmJwPyo6+OvYiXBcE1Z9w96Twtmv0yIoEhVljohF8X3XrF0SWQ4XhLiZEKqGqE7qTeSy138ajsTV1wa1ie5ZXEQDyD1645zOBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740072; c=relaxed/simple;
	bh=H1w6ib4N5WVcEbt9hnxQ/5MqYUkoe9WcxDP9NV8U358=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPPeCAuSYIduNCvdX8Wz02fK+3ugMGdvNXoXThthlbX9RKAQ936tg5EJK+PjSk2TS+A0IX6AojXDs4PYboVgh/1gJ81nmGy9AYcHEcak1Laik1NJqChjC+XY9VIa2ISNZhcNu0ORplEZyRSTC41YSJqc//3hR4nvm67+Y8r5ve8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7GUY8Bq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7X5diDD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7GUY8Bq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7X5diDD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGUTm1658503
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wUg1xMEaok3wJWSSSSZC805QIcAEN7ZtkZdvxnv7mw=; b=g7GUY8BqGs1fZflj
	wxLT1uE8K0A3X+mSdTpELNWvYc8uxssNNr5ZL+UwtsY9Dn0jjL8+5YhphKWqMW4i
	uTb+q6pgIDCXd1cfpLJ9mW/zSTbDODRMYJcau1RQHMEUjPxP9XQC4odOwRg2JZvM
	JvxMOqhLKadWHoAnEEeWcIAWIiUXF2OTQgC+VpPjSHTRnkaw8GXrDc5gljTVd5aM
	Oyt4IIPaS9LpqWakOPdF3ox8Vl19vb7BLrkPtSdg9WyeD5SksbAgQupU0JiT5EYv
	gtH5XvjcmA95w87ZV+xAdUOMh0bhFT+QAF/mV0d4gYJpSLwO/8OUN3ZSBLMwiOJr
	wInhdg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1rs0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:27:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso803556a12.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740064; x=1788344864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wUg1xMEaok3wJWSSSSZC805QIcAEN7ZtkZdvxnv7mw=;
        b=Z7X5diDDTeUBdl22vq6aoANiU3f8rgj+WWMoX8z/SoBFsNVP+zGxEDbiRtH0MCiWVv
         6C2nahwkHlUlTFg81CoAgRuvI//bURGQys0Wrheum8ucUK8QZSzO46HW/qxLpxjB3iu3
         5eRVi/C9NrxEor7PnQzXvXhumnxYr3j6AOrLxICyJnQ3BnN+5qEx9qc9hVIf8S61x0xZ
         nQINzW4Aj5ZrZ01JtYo9TdYp2SyG+mmWy52NqJLl2wFseXauDa8I8tueKQL5ZhA3/ZnF
         Bvmvz38SKyVRypLN9H9gEZXK2nRlS+UqDgJBOyGsIVU0E93m2mmPOyjlYFn3ZUJZnLXP
         c9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740064; x=1788344864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wUg1xMEaok3wJWSSSSZC805QIcAEN7ZtkZdvxnv7mw=;
        b=gSRZeyYiUfbV3qiJ2B0QNjiqxwfXLZajf3isOzeNeg65tOW8aR2XtnPo5xKRaKWfx6
         N+9B8JcoD/SzuHQNHLG/lDKjtXD+knAZC1fzj6FDFuvSugWSPtp5lfFV4kvFvoPlt1uW
         woGMatK5KComBH6lGQNdGbxQEWsKKJyCIjzzmm7FA49KIH+NCD+CQqK7CCjBTpuoIVXb
         jUwA1fDBA2dwWFcCApfAkafcINusK9ELeFP+49UVGrdsj78BhccFdlwLoZMb9f9WpRbz
         F6mR0RLr4KHvEYJ1z67P/qOn9Cd8WxVVGt/OFTe5VOS2+a0C1IoHm/0P02G0kjZyBzAH
         CUUA==
X-Forwarded-Encrypted: i=1; AHgh+RpKT16XTYpI7tOwpMwbyXTuVTTRALausZHMhWLezzX2+k74YVtQ4fmMeaFPb4gXpWAM8moGXf43ffA=@vger.kernel.org
X-Gm-Message-State: AFuF++lHq72y8zWc/JuE5ywzbWQopkhsi0CodWFn7C8HOmcdS7K7QEKB
	cpTCIgGdOTCureJMxd0xMrFYz+o12dL25zmvKqrJomCyE1TrUDH3sNMwWpiFcv69uxcFlQKPpFA
	nBwT3XBzYkbNoUkjjRZquPUYQoFFDhPH9jtUyItzXDFAGGqaFf2LmYLsgjr8iN7c=
X-Gm-Gg: AR+sD11QGHzpWvxMT5KqonLehECqhyTSUUDcQWiV+hTXNPgQBO4LQcnzQS2VVrHdpZ/
	CH6fhPoP72O/qYen950c057/Dva+sExUnpZONoU/V4oM5DyNKPGPrEYQYMAt2grq5L+uIliHIko
	ptyHkFVg09LOn8tQspKhvaYuoVTwTWwQxfNJ4rM9jF/I9V0xa4lsjBxZTcTgeMpmk60SFFSenNr
	AP/9PIyABekI144OXvyCv96Ps83OmwWVob45J75C3qCd8lrYY4uqhYb/pnFGUxKD4J63eBDo7y4
	Sp4sQAJEtuO9IEshk62Jj3rV3lmItZMTXxdyInHuE7sVXgT7sdf2ossEmOVILCsEyPu2p+fZWI5
	3KlDk5hLD9sUjRATC23hQw0MAvh56q0sQtxTsmiuE2VAXaaArUiMpHxWMIvN5AXOWTw==
X-Received: by 2002:a17:90a:1081:b0:396:65b3:c05e with SMTP id 98e67ed59e1d1-39665b3c8bfmr7605134a91.9.1787740064101;
        Wed, 26 Aug 2026 03:27:44 -0700 (PDT)
X-Received: by 2002:a17:90a:1081:b0:396:65b3:c05e with SMTP id 98e67ed59e1d1-39665b3c8bfmr7605085a91.9.1787740063653;
        Wed, 26 Aug 2026 03:27:43 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905b959sm6780040c88.13.2026.08.26.03.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:27:42 -0700 (PDT)
Message-ID: <1100f494-4543-4393-b914-707927a968ca@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:57:36 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI as
 reference clock
To: George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
 <28002a60-9a40-42d8-9583-947194da23fb@oss.qualcomm.com>
 <SN7PR19MB6736ED851811D9C91DE7BD529DAE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736ED851811D9C91DE7BD529DAE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M8ZWLz-U62SlIPsLQ_1OGedqNMQ6sYdD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX5V//KgGvifl7
 OIdGB8xwpmsQJWOSbC5XSI9Z39H2AQK2uGdzPpeAiHYrxinVHkQEGkXeEKeyzpvOeTZxZ3+Bod4
 rGw7hQIYNb5QixGNjM76QYqhBEiLVITiso+/wIR/qEltkHef+ZHEjqkeCYZbEKwST+vLp2OQaLU
 bCb2h0+c0c59Rx14qlS1L9+xvzJSb0DG4togCu4sQqPquZ0y/gIzGSkSES1ERttfUyPnnqoa4C1
 ekwxl+XBGFvPHd4Z+k1DzeOO+ibGGpg6DgO55wDWL3lOeqCqDfQpFs5FWfHgw/HeGFPJzE0hrAw
 q116d0RjNXKlSyHKQgnWAqbH76SnCRLCKo6oS9CJt78iU3kRtLvmjJQ3zN41v48c0cTtDD5ycLp
 f8JpxqFnPGROl+6COSmNAynx0UNUqwlDWZCTT6vPsZFtavJTxc9q9DlUItxijdKso+5AjpTL3H0
 gIkiHjGbKlBRYW/D5Sw==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ebfa0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=XZ_fnJzQxPvT1jPH8EgA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: M8ZWLz-U62SlIPsLQ_1OGedqNMQ6sYdD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX8GAK9M8LyFov
 FsnJ16h7tj23SEC9TISB+yiYLdv9kjJx05zZFsAkTz8KqtAgtstmV1UAdS7zMK/kC9k6xjr7yKm
 je4BP8ranotq350Wp/XLH6EOMAdbOpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087



On 8/26/2026 3:07 PM, George Moussalem wrote:
> On 8/26/26 13:18, Konrad Dybcio wrote:
>> On 8/25/26 12:42 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
>>> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
>>> flattened snps-dwc3 model, it is no longer possible to pass the
>>> reference clock to the dwc3 core driver.
>>>
>>> The clock rate is used by dwc3 core to derive the reference clock period
>>> and frame length adjusment. This is needed when the reference clock
>>> deviates from the hardware default (typically 19.2MHz). Above mentioned
>>> SoCs use different rates and, as such, the core initializes with the
>>> wrong values which leads to non-functional USB operation.
>>>
>>> Read the "qcom,select-utmi-as-ref-clk" property to determine if the UTMI
>>> clock should be used as the reference clock. If so, set it as the
>>> reference clock in the dwc3_probe_data structure.
>>> The dwc3 core driver will then use this clock to derive the clock rate.
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>
>> There's a shorter patch in flight:
>>
>> https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/
> 
> I'm aware and have discussed that with Varada. My concerns are that
> directly setting qcom->dwc->ref_clk from the glue layer is a layering
> violation. This patch passes it to the DWC3 core via the probe_data struct.
> 
> In addition, if ignore_clocks_and_resets is set in the glue layer (which
> is the case for qcom's and others), setting the dwc->ref_clk makes it
> become managed by the core which is the opposite of what the
> ignore_clocks_and_resets property is there for.
> 
I believe doing it from here is better. In [1], refclk is being added as 
a new clock, but I checked with Varada offline and he said that he 
wanted to pass mock_utmi as ref_clk. IMO This patch is better as it 
reuses mock_utmi instead of adding another new clock.

[1]: 
https://lore.kernel.org/all/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

Regards,
Krishna,
