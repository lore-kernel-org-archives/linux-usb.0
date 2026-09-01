Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4474342E8CB
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276295; cv=none; b=BhU7BM6rW2cehWQOGH6b3ZuW85m8mSIru0lF7J2kojAyuKqN76IQJMMcLkoJIluCyY+PWN81NE0DEtRXxGQouiTlaUrSJTeumO3rVxmvmRnZwztgyXH18eC9GGZgsoq5GyCpv+mNeLlstng0zvvjw1nsY9dRmXXzNbiSeRpxv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276295; c=relaxed/simple;
	bh=pPhJgHfrcROjobsHow5Oxnu2biZuSv+iISwhseA3TaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjwWu42vVxEofdAISinHCN2l3YkFouD7ZFLHg2YYZKDrMFrN24XwJOv361Tmn96+66OeSS9a5k7qTmfAiXXLAJngAK+zTLgzKXJ02ewaT3bTYz7kf0ISUQl6hd6XIghLJ0jspxNafLF9rUpgRtrw5+ly15ClRYSGu3FNMkImQro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muVxvYW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QctJEbvY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muVxvYW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QctJEbvY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8XON2145830
	for <linux-usb@vger.kernel.org>; Tue, 1 Sep 2026 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=; b=muVxvYW2xOTh1Qh8
	0IdDOqxK6W9136XN64vhff6g/0bs3E5WZ9lhTvPtqZ9BimoTidDmlRD/NvyGoT3S
	1qcPEAIXiXhGOKfe7XvbARI/3pkEtQWTSSl15fBgK3eUFBAhy/FO43/KBuq65bEQ
	h0ma+KnYAykT7tgVNmHsAaFibQEW+Tz8y6RbaVtg3Enj9wUjiPId7Eo7aXGjBEmu
	V2ofuDssdH5LrFC1Na/Pc3DnVfQIH4SQDEb8/QxgohVkKIrRcxFIKfhG+PSwX40T
	oOelfBnKB1wT4yJCJKARkfXCWMiIjxPWSDbAWQaI9RAgW4CsuOkyLRQ6pr3VseK9
	Bdm8+g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8udv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 15:24:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c65904ade8so1418e0c.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276292; x=1788881092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=;
        b=QctJEbvY81cOCnJ/Rf40Peetm5QAQmsYq+lqzVxjjlT6fnZfdiqbEVdc9xUbHy+l7A
         Rt/Kb01T7s+y++wN4lC+QtH4Yx7hqPc9475KWDeTWZp7HhQ97PrJaTsjn9mA6YRlQBPI
         Frtd5IaUNpwy0O69mtN/ZYOLYK5UILy37gKUSFhre7OVayvd3pWvZYk7pCsbnO3t+ST3
         pW+OqWsAPFp6ZKmMxmvtPnXQq0s+B7gub8LiKtzwn9U++wvc+WgZ8tgdFlTwajH1VUK3
         YXzSy2id86OySDDNUrUa+IFolA+SzV42HDYS9u8uNGK3JuKC2mThrysZh23CtGqRyPCY
         b3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276292; x=1788881092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=;
        b=RblMfcoBrM/pzKZxULTEeOFdp5vsLGN/boPBpRNgNszvr7vvooL7nh5ecHp8ADyUH5
         uV8y82WwaG5OY0QRBDvp7u3PA/S4OxapLnAfozmkEsIWvNZf6KfNMbyIsXkpVl1JBnBS
         KC5T285gCQW/ULPrUScxNUYmMyTeI1P+eDURRZYZ+c3zax9tkIDlditTRs0GpUGU6lbA
         rqqXBmiufKPIi+HcfgBP7tQnzgWp11a8sZET/1ME4Ph+CQPYZ1M4O/On3Y18BDI+V90i
         DgknT9rkawcNAtahewI13KMqaeXwJgJz5kTy1Pl10saB/Qrmyf9agv+ffx1J62yhZlK/
         mpaw==
X-Forwarded-Encrypted: i=1; AHgh+RobMsM7Ot4IGOeS+bGJ4GcVP8NoWW7vOrFV73vlVMW2RQDXHLnsfBbnIYoP4X4cK0clgznf45M7aNY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYAjGEV5ixvldgQ3/97TBfG22tCQ/I6zB4tXDtfLl0A59F3eIC
	vDTgPT3v7nzLIIV5eWjFF8js5admhQaQx6TfaX+//w27R62MhYES4sY9v9oZKq+58bNtmXAmcXS
	2M3rfKmHag8HKBFXklfAsYXUmOlk1eIvcdMNEI3qi5lZhm/dYY+NoZQGjXo1Z3EY=
X-Gm-Gg: AR+sD13mZsdIw1k3gmSz4Y/fb77sc4NdsKD+x138mvFQxt2KEhDUZ5t5S2K1dftuT1K
	9yBOxb2AJqxqQ6lvygszjgiPqNi/7kN8PMfVp30IoESSCSpb3i+pxhltrPjOjqc6X0NXJH61LAq
	4w06X/mQz/UjBubKycqofeE7DS9XHepftiEvArgcN0DFa0XGLObUbZ7ITvBgi1wY59NHwBLxTMU
	SdSByNInSPRwifF8kmQcvL2WWgLwObMEEhkCz/XE+FWwl9HuDZHM2nDOOSTITdDGV36hG88Ba1I
	01jEvrMkJUIEX8cMNIM1G/586481bkZFOG3AX0xr/r9hwTES9Td5ITaQXlNedv2LzMC3IlCyE6w
	ISf1Oe/sC/xA2pNqN5pMu/A==
X-Received: by 2002:a05:6102:c16:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78774cc2e65mr3308966137.1.1788276292407;
        Tue, 01 Sep 2026 08:24:52 -0700 (PDT)
X-Received: by 2002:a05:6102:c16:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78774cc2e65mr3308951137.1.1788276291866;
        Tue, 01 Sep 2026 08:24:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8f03fasm294011fa.9.2026.09.01.08.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:24:50 -0700 (PDT)
Message-ID: <4d96c593-ff1b-48f7-9e33-ded415056f99@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:24:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: ipq6018: Flatten usb controller
 nodes
To: George Moussalem <george.moussalem@outlook.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
 <bfb0d840-fc9c-41a2-9b05-959f2222a298@oss.qualcomm.com>
 <SN7PR19MB67361579E71DBC197E21F44E9DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB67361579E71DBC197E21F44E9DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96ee45 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=TRAoSw-b2ojpbG_mUrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX3tGLNdYtXbXD
 CItrPnZw5y+u90lqHM7Z8xSRcN8r38BWicQpMTGaw5CFQS+R6PnzTFOL8Nsv7wYUfW8lAEjzHKz
 bgYvfHJuVojwgLQPzpA5uKmGoljdv+I+7TqVqyiRvJdCIQMc7kWZsKN6u2Ghl8iFF/gUFlDnFYF
 qAoF3FQFGxDwq2+57B95qNxIIf25bAZLhUhRw0f0dISkexYPIXRvDWM4ltMZoaqJyaCv5za1xqt
 P07beUh0RPW6uNdL141t2k3SxlJ226jvzt13GXPj++/9ouPAS2QWQ0U/zrdvGw0caSoY3JH/o4B
 SJk/js4qKZIbSygBEIt4O0usyvpxDb+C9zFHBGpq7IrQWlsHXjZZZTaErTALIw2770moxyP0MBV
 4uB/uzmXi7rskhfejps9c5QXysVYdjXepOgFyHRhYvhSGK7588kQsQO9O4CoDVP1NFMcTO0JGVa
 wJHvZa/TD4ounFxSs8g==
X-Proofpoint-ORIG-GUID: 5gZmFQ6Y0QTGBYc4vrJCpnQE9yRKlWI2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX5cNhTXnFk+D0
 23YM0QPE3ZGT3bewNVlTKhHlxTwx73+yxwx/edNEy1ZF2pE5GRi3bdEVvqcRJ5J//aw7GVqWw5o
 wL2IMFpW106InzoDxKnYkEE6m9oiLec=
X-Proofpoint-GUID: 5gZmFQ6Y0QTGBYc4vrJCpnQE9yRKlWI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010136

On 8/30/26 5:12 AM, George Moussalem wrote:
> On 8/29/26 20:48, Krishna Kurapati wrote:
>>
>>
>> On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Flatten usb controller nodes and update to using latest bindings and
>>> flattened driver approach.

[...]

>>> +            tx-fifo-resize;
>>> +            snps,parkmode-disable-ss-quirk;
>>> +            snps,is-utmi-l1-suspend;
>>> +            snps,hird-threshold = /bits/ 8 <0x0>;
>>> +            snps,dis_u2_susphy_quirk;
>>> +            snps,dis_u3_susphy_quirk;
>>> +            dr_mode = "host";
>>
>> This controller is DRD capable. Please move this dr_mode property to DTS
>> file.
> 
> dr_mode was already there. Removing may break existing implementations
> and should require a separate patch.

"Yes" and "yes, please"

Konrad
