Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADC71FCFFC
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 01:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792199769; cv=none; b=NEVWcaKjvwa+qYN7Z2ErONVPF7Vx8v2EjHZQQ9tah6vWA1rFVhOcI7LBVCyWNxtEnzx3FN6yclU0I1fEiLjMGbubJ9sBZ/163KfSYSeLAl/doAGrXrEVzoc8FJvQ96lLzO5clPyVjDW68Ir6X/A4sx9OWydYHA4YwvH7vWfevl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792199769; c=relaxed/simple;
	bh=N1UX1ePJTEvGDwKfCxkM5pQz3wXgY0ArFM7AyF8x7EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJZE78RyjGOCCTL/R5ye6P6eopa6YgLin58+iu19PxMkJwcRIPSNYqhgCr6CbHxokdqyOt4eS6lpzdEyvNcaIuvx1Rj5QZhDpiuSuSRRl8vajXcu699ja5CxmWwqnL69wsb7KFogfbAkZfaKi8droZbfrjPUOpfpAZP9wu4UxOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHFrDeCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIzcYpfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHFrDeCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIzcYpfr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H0JqeF3611112
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 01:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=; b=AHFrDeCMOkINo1kC
	/0JQUdQs7UnjSYAc7H2oufk8bzQUzPq8rNnFcymWR2LRp+4MfDb3lnwT8NeQNV6B
	NoMql0m20iygtC/kjWNGO4Am6F8uKBw+TQhGnldWSHBYQ6v08DeZulCVGy33UUce
	ZXR+5QCLhhwHPFwcQ5s7sbAadAZDIhoyZB+HN4+QH5dPZMX0x8BfdXSIICCukCSr
	RG0v+0MtLOPzDAG+lo42l3N/piOUNNUW6fi9GB5cudhLBQZdEUNuk9f/KS9olaPU
	xj4B3p9kAoyw/tQ2rTDc+4SSesky/Nu1g8OjGt8YzH2pIhve0XEEMTDhIP715Q7v
	vXzlCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnr3fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 01:16:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1138920eec.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792199765; x=1792804565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=;
        b=gIzcYpfrX8ROvWcjHZ4kA9r1sIMlekqnCOHhijxs1s1mXbalErW7jGahp0PwL9PNKg
         JxIcnTjsn7eEeDk+RTgXRthk1/Oxr+Pchs798Awsq4fTX69q2cbolBh/AtIeH7c0sWMa
         QwQF3F/OmN7KvUmRK1Inh2sjVesXXrsWMBO5JFQsenLqisXolK8ELxzbaGMcCngknLkp
         1qVYdTsolPaKLO9VEgTyf65Kex98Cs1TwfD3uaLzOVN97ttJyQuzJq0cmJBCPpzt78hH
         Sd3LpQmOYrGZZcXoz8HfaOPOAUeH/Vn3RpvQGN9ZsUWsx/gKdBVXjS5BC81YXR/IJWbA
         +qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792199765; x=1792804565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=;
        b=h+EjGVDPhh/iol9P5UEfGzkfqqoNW57USw4PrGdGPVR5N7PTg6SZqrJrAfRd82CyTl
         ZVKYI/RmUbyQt0urxxIsCsOGso9RxbENvqvooDmdUDQAFJe4eEiJ0uJxiX9vaxFozx/J
         JXtqmy9fwKNHHS49/zhsfn/KrVGD+uL+hftoV4iQH0cQTXubPPhY31Mhqa1KYhRbtlgR
         BPLueRe76oWNojfRFJohFbXFypMs2/WjB8rza3t1DVIbHeex+YysJcDZMHu7bgNzQP7T
         grKD1X30XI+zSFTFHFIs7tt401rIS2R2g6OVapdYorxqTEWWnyYkRYMnycOnv9Dpxro2
         T9jw==
X-Forwarded-Encrypted: i=1; AKwUvBxZcUkULD2bYXkwXzoXWD/q9cLKYJ8Hf1F4xPRFtXHnPqCUaW+oRK/kb06JeHow4OY9PrAyFuybgt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7QN2Ea092ZBn5yh3Ls2RWHs8KU1ojWE+uTzLXMmMj6qNvL2bv
	Kos5nieIT9tGqQTv6JukQNaz1xYCPcTU64d8vb8YHwMKQo+xK39vcX9clZMvkL3a2Zg5Yqk49sw
	GdBGj+x5FGF9ojCqWO4OUojSwkzjLfpczs+joOyzLkS+AM0SH8UyM9FoW1O4DOeY=
X-Gm-Gg: AYBFou0OLKFSTdJR72x08uCPQ51q8qefnIod9jevagbu85nMQs+iTDaJV3QflWzsQ7S
	B4ZBftlTw7pKHV/u0myod7A7jbxnO8iBlNZh7w1xPPs2JgXctgaztPegDYG3EUrDH9JXZ7hbiuj
	YDiFE0ZHIYhnh7q6/qv6jbylFxdKF7h3XIfbkdcLqQR78ILn4etBbtKkG38bAKJ+lFURNpxD8jL
	FOWWFsPNNQlHKcAjHqqONBzFmj8E7F79kxB1O2X6FVozg7dSVy3AjbfWEQ6FDyAxZxUpFgu+TG4
	OR0DhO8KPZ11NJ1ro+rMJQiMC/llv+Jpbeabb20oxDJVWrbyotLcSXxzlXKFgTW0gbyXGMcTNTS
	gofJAFGFJatiM9hY1uPesfcu0Yi7wWw==
X-Received: by 2002:a05:701a:c90a:b0:167:4198:2cb3 with SMTP id a92af1059eb24-18512c384cemr2002767c88.18.1792199764907;
        Fri, 16 Oct 2026 18:16:04 -0700 (PDT)
X-Received: by 2002:a05:701a:c90a:b0:167:4198:2cb3 with SMTP id a92af1059eb24-18512c384cemr2002728c88.18.1792199764314;
        Fri, 16 Oct 2026 18:16:04 -0700 (PDT)
Received: from [192.168.1.133] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ca95700sm8902773c88.23.2026.10.16.18.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 18:16:03 -0700 (PDT)
Message-ID: <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:16:02 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad2cc56 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nSKOGGwR5b_Qa3AChTEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 95SZq9W2TD-OKUnLecvHD2zlhPsp9l3j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX20/zHvIki9yI
 cCG17TmfNi4cA7Ok5E+7AU5y/IdiUiHs9A/75Qm2n7YBhsme+vLr65w3RD2+mCghn8PxdhYjmIs
 BRC4xNR/1gIYlMfwFu9daonbPN0oIxg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX5bl+lGx+FSRB
 UpK3hLZUOhNnG2w90aryLGZvN18dV7sc7bevS5+sAG+wnLeOi3GmmnC7Enaw+OhWoBtNu0gTHbm
 DQdMS2Bgw7GPvryp7d95MXfg58A19qZ4nWGJf12rzHsifLrQKVJpgPTDKVNzFgq/SNpqDRwJ+Bk
 HgzNUVfvTpAsEmYEHHatGU1fsS57U03WVHga+oJ1GJiJVci3LILGxTHXLEn6TkrdrWOba0v/5K8
 eA9bD5t2ovQzAJVtYFAKQTwy2f8c9iVvBSt602bw5KAv3p/Bu+QAyBWfy3w49TUYV/8WwyI0b9f
 Wvz3dc6mQ8ZEMN9A70+dJ3Ciqn4bfqXJsk4FrKojyjOhvMdh1I/qe6vvjxrjswUAYk83FjB6z/h
 zPnc1/ECmet8B5lA/xaUre6zNkEyDj6yHmbzBsd7aowTCEO5Mr1uCmZU0y71BE5yATO7PaM4MvY
 zX5ubZVn93VntcPoLpQ==
X-Proofpoint-ORIG-GUID: 95SZq9W2TD-OKUnLecvHD2zlhPsp9l3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170004



On 10/15/2026 7:43 AM, Konrad Dybcio wrote:
> On 9/29/26 11:35 PM, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single
>> chip-level role switch, which cannot properly handle multi-path
>> configurations where each path needs independent role management. Since
>> EUD is physically present between the USB connector and the controller,
>> it should also relay the role change requests from the connector.
>>
>> Restructure the driver to support per-path role switches and remove the
>> chip-level role switch. Additionally, as EUD need not modify the USB
>> role upon enabling, remove the unnecessary role switch call from
>> enable_eud().
>>
>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
> 
> 
> [...]
> 
>> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>> +	if (!sw) {
>> +		of_node_put(controller_node);
>> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
>> +				     "Failed to get controller role switch for path %d\n",
>> +				     path_num);
>> +	}
> 
> This will always probe defer on a fixed-role controller, we should patch
> dwc3 to always register a roleswitch
> 
You mean for fixed-role controllers where an explicit `dr_mode` is not
provided in DT and the fixed mode is derived from the HW capabilities?
For explicit `dr_mode=host/peripheral` cases we bail out earlier and
never reach this path.

The EUD databook does not explicitly mention fixed-role controllers,
so I was assuming all DWC3 controllers relevant to EUD are DR-capable
and register a role switch.

I can see how a no-op role switch would address this case. Would it be
reasonable to handle that as a follow-up improvement for controllers
that resolve to a fixed role at runtime, rather than as part of this
series?

Thanks
Elson
