Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAC03EA979
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974418; cv=none; b=D4hYYv4u973L1PhV85JQnjyPIFERoJnaEN6L1HbUczZkJ/1v7JR3u82JSkZSe3NVkwakHN8CKrucJS4aVhPnN7yPLODc64ll3Uwf6LGJcue+YUSrpv/nzgGOqtrQBdFTWcZrU0Alf/ezGvVHGuGLSqv/6qp9yhxUKRSSlGPe5VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974418; c=relaxed/simple;
	bh=zbF87ZtV7rgz0O3uxpZ06xBFJvzJFT83u98UE1z21ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7zJga7Sa6P61hyi91SqUV/kXSvj17yPL/ZoAfOKzlS8xvrUcII76l/F/cvxoWmXBv7H8QbGNJtyUrNod3sKfWkh3wy9y0rfVeTjtIDd75+RpGHHQ+9A/dw1RenAqPfb3sjqV3Leckc3zz/Z4Jag+TS+eLB7xpkTr8BM+eR8jB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPXBzSCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRLtYzbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPXBzSCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRLtYzbE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6CqK1193709
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 13:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=; b=gPXBzSCMdklHUR/j
	P/l22k1ivbFZIoKX1COxhQUxMhWP9kjrYPYBo1rEoppXuUWKBH2/dZxzW9wJoaKs
	e7ZkkndIlh8UiMyOKdvTlpOxvTTicl/pAsXLmKDKv6jOGl53xx4PnJMeyLbnAVnX
	W4OZGB5yuaGncliC5bTWxfom5Uc4fTMA5MSN0wFoocFxA8x0D6XjS2WbxTsgFNY5
	87G7nh/FrJSR4FmSUZ4WGnydMnQV/ZGFPi7Fmk6R0YtXXqUzm3GhcRJTkIf2hPBa
	oc4Znwd6TFoFlgfXhIPzJ7yypzyWo809LuXQ5mMT3xTgjCMuSW8xDhpsIoppyHbw
	nNeMGw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1hrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 13:46:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7530aaa7212so89024137.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786974410; x=1787579210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=;
        b=kRLtYzbEq6MbtQuTI7LmW3UQ2AITj8KxDzOUD99Vg2TNZ8G/SfGP9jo6rx218mO2W1
         DQRrrPigO8iLhgnx0uZ+uDa/XHHmXpULwC+FnLItyUib6kFrD71ZGhqmPtewVU4c2aRb
         8poQjz0sOXEdIK0UaBBsNyL3WwupZi2Sc7zXHU+OKCIgb2ZjRj8OPBGkLapezFAk6CKu
         qDO2CJ8CEV1h3GzF6wnSnK7lo0Uwu9grnDZ8VRWWY6pm8zepmunvEwEHmB7djnzvw0Rr
         s4wf7W/9Uuj5vl3XJVVfEs7APeMcYZ4intUtVMsBrHOD2y0sagCx5fjahWnOiQi61oP4
         mc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974410; x=1787579210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=;
        b=oClBE5fsQusCB2RjDTUbU1oBSVBdMUVz9zc9onCjc+pU4gnHBMeqFtRLIGs/DmlKML
         rI0qpVb/bbnGAS46PBWhj+8eEk8+FSnETX+PPcgW41RuJfU9ryp7WdC+oReNMYpzmQIq
         weYUmCx45kMm8FFJtRIVTpRe2h7xSkwTelSKT22qb1AE9c/gcF7IO2L6PtBLPVllnvps
         8m+P6D5oQZ4IbSaAhZDd6mDNXHQBkHzXyCZVGk7JIWExOz5Oja9SDBLxgCCCQXcrjW/K
         s0KKiSfbf62KtKF1/mr4Nnq3w7W0bRAKsyFlGFIMAhkDaUFgpNvbZnLIK4aZNkWmHnG+
         E5mg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5kLC4PwHJw9hVpVUWPR7gAxY6d9ad06vus/f7aPm5DzH5EX50quPs71nTSN5z7vfbz43oxkPcCXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrnnBN4Trk1uxrnV3NaGvv4uSWQrRiA25vYeOGkIbUr3Cbgt2W
	cp5Qgkn06bSrSBO9HT1X8w3RDkg57mGPHOOmrLXe1s8/12MT8vjrV7W2fnc2kM0PE/9jz3h3ZuH
	eNMSNaCXuoOv4tM+MnmaQEvmM7QHuF+DxiZhvvx4hqSuo7skLaqZU1xiWw05YS3I=
X-Gm-Gg: AR+sD12m1+qDMSkXnfWZNV+l65FxYhaFKNmhIIjpW8KL/x7jo87OXf//aiW6e2/pecI
	PBonqtvlcpvs7ax35g5G7wzuk5rNeeUOc3KzBCW6O5xIvo3q4X+HSmDiQIP72RvcuXF+esrazHq
	XmVrVT1mgURBc5F+hAU6yZwpzN8jnn8N36sG41XaBgrfEXMA33XwifRLkMrS+dDu1pch93txEwk
	JKFTArG+9muTHyUt957+r645x5XSGqNYd7BzxQ0QtQ8vsc7YJYcCCpmlLK0+XN6qm5JtjrB0lEh
	e+fM5A0wkaaANEWYiv2Mwj/ivc7RI9PQgiN4RbemR5sxAcGyQNbA15/HxfJ7fBHjC84aSKhYJF/
	Zme9OKFVjs+iFqpu/8jvddcSb
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1526705137.2.1786974410339;
        Mon, 17 Aug 2026 06:46:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1526686137.2.1786974409935;
        Mon, 17 Aug 2026 06:46:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b74059sm33753866b.38.2026.08.17.06.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:46:49 -0700 (PDT)
Message-ID: <ff8874b2-6851-4c8b-b9bf-476b807bf91e@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:46:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
 <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
 <f13b0be6-bc1f-4024-9881-59f522566f64@oss.qualcomm.com>
 <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX2gELvZ96aTFM
 MK62ubbt3sMKgGQ88T80jjrEvA8QAgsOvPUNuFhE2oXAmvuto1divt1GXyeaLmu0EPjPtt+IWWI
 M0XOj02PjuTp9KjHtQBEgdUkKKe1K3R3+RlFaxJkwf5wQukt2rdM5zZ8YWbX9N3LEK2X1fCKfiH
 wSAkNZkKVt2mxWnDEzXgt+gwT5Qg70W44xrWzVa6Gl4DtdFYkZB3KyIYZcEIDI5ntK658A/ISfl
 VJVU3QM+x05gvhRJr51enmigaa99pboBRkuglxeoAxyGz+XSg98e2nfoUxxNf46gIqzotjN03eS
 o1VC7ST++5QziV8p43pjAROrCF4bmMwKUVQZhWnagUTPCixdF0W5hSNzyd8waaAJlPl/IKoz6UK
 kaqZe24cQ4JfaG8exthKUrXjouR0w6zpAykJ9eSzNqTBQKadQJrg3KiO3HpJlncH3vGNy8MIrRf
 ra8LPx4PtsKw0sKSVkw==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a8310ca cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Jmm3y0j5io58rGE2ST8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: tDiThbzi5gufR05_FDUvr4kcfboDreL_
X-Proofpoint-GUID: tDiThbzi5gufR05_FDUvr4kcfboDreL_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX2c04o78529dN
 XundAeMcEe2RwKo3EWpOww9G5TnW6+J3JX3VI5DkahB3y7pqslqW8wRxtx/QgAWGB1jK8RseHhE
 oNHjaOWOR9rVcwAj0d7fChijebUv/VM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170105

On 8/17/26 2:45 PM, George Moussalem wrote:
> On 8/17/26 16:38, Konrad Dybcio wrote:
>> On 8/17/26 2:37 PM, Konrad Dybcio wrote:
>>> On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
>>>> On 13/08/2026 12:28, George Moussalem wrote:

[...]

>> so the implementation, matching prior art for similar cases should be:
>>
>> - phy node with #phy-cells = <1>
>> - consumer takes a reference through phys = <&phy FOO_PCIE> or FOO_USB3
>> - new driver in drivers/phy/qualcomm to coordinate the two modes
> 
> Thanks for confirming it's one device. I'm already working on a new
> version using phy-cells and having the consumer select the phy type.
> 
> However: I'm adjusting the existing phy-qcom-uniphy-pcie-28lp.c as
> that's the driver currently used for PCIe only in both IPQ5018 and IPQ5332.
> So I'm adjusting it to register 2 PHYs and provide both PCIe and USB
> functionality. Any objections/concerns?

"UNIPHY" is a bit of a loose definition, I also see that name in relation
to DSI and ethernet, but I don't have a better suggestion

Konrad
