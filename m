Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768279;
	b=bDNtf7322zlAW98zRnbrNDWbeQAPeDQ7QJKyV5WvbAU6ksxKskVMCfK2/+DBvRp9KIN4
	 2iG+3ECls9kzg0TidCojDzxrKi6xoQcrP99jMPkxvPMgS/WYZSUfOKFybC2TJd9OaTWSF
	 EOVjShjqzLQ/h36D632sqmTKInVhlDY21GMYCO3Z0XHf9NGu1C3rm4JnYoXKW40Sh4VTG
	 MobS7/aId4Gyj630AynziW0PJumSN/6HjLxTQuahwSLbtCNu5Wa6r5RqTE22JOn/FQS4O
	 8CGbwvLZ1VbXgB6azOs6ef2OdSDRoi/22bNmdMm0dCTzJ6zdTmq24dNXv+qsBKzEymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
	b=MMj21hsuhOrrJSIlUAYLUwmEHPh0+qJBLa7XDXyyok5gqX7giEzXvGvX4vu20Aon75Xp
	 cgja64z5nkFYhEwE/nqp4R+notpxlJHHJa/f+7uRamOMxclgcah6OAeLxWoFiwMh4Vddr
	 CiiNmIWBVlctT+Rp16bOc/nH4/a0i0SJtA8sNJNpBpPNOVIZ35gIBicSGEPjyuIGBuSxI
	 nWoaKwiCLlX0W6WJwdHQkJcTI6ROqiRswidlnHqztibLogoxqj64QiOD3r1bsxrDzm8Zc
	 4CwHsseacsBEwXcs4Hdk/FzQKcIO/g6b6T/g5uiLV9k3jId/wGgTtJd3hZi4QyZ2N5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EL/6lRr7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+Z7kZz4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944B0606A331
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 08:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944B0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EL/6lRr7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+Z7kZz4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gdji3983910
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 08:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=; b=EL/6lRr7BG4YS8+U
	bSliQzZbFY+qb8YC02tlw1DEaQiYcqMX+lgVH7cwk2lFe1tP0+zZnguMED4BJVl4
	BxAh/0+xye/+TB8GprjYVETz5pJuDClV3a/nO2s0K4XaOs4Qh04w2Kpqvg2n8zRW
	pu6a6zY1RiVtZJhQUR3g1+LAo5Ui8YrHRw1H7H/ZuClflVyKMTMDrSrJmDgPwbs4
	uBHDYlbxlwQBCmD1C8MeTwC9TnxXg5zutAvZ9l9VSQjXQJla2beE1rOjisPQFOL+
	BSHZv/BVaVCcVEU5M9DbOHcZYX1Fs6gapdPcyQ0DbgQ1gvzd28ZkqJr3UOtWeIR/
	6uNVwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a22t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 08:31:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso86223285a.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 00:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768277; x=1796373077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
        b=H+Z7kZz4gxGStlfDXhL9Tu6VfX9ZGTVNrhBhNg/AxJKCTMaIKMUj2FQ68kBftHfSev
         SUp2uJNt956FWAhV2xyPhU+6g7OcELaekzpH9GUlI1xZwpC+R+WKUVxWvdUWf3vTh3+i
         XAGJMz84YOhvEJhPjIWCY5+fk7pEQy3WB2yPKZoY/QHPR4hoNsedzX4OlwcjPIs+vdev
         RyEvT9djX0b2OOTWAbQ6W9pCPB0gFrQ+JupqPTqJngjrWduQZFDXxkNqPQuozplSrZc1
         R4ycuWA2aknHJv3luKcoUXi8ikjWBsyCn3WO6sVuscg0sspvcamy9Pc42NiL2q4h7cHc
         BfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768277; x=1796373077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Eevaf7n6N6k8xB2plTgEkQDmf0Hy0f8uudkH9gmaLw=;
        b=rLlFPQgqYgOS/eM6M9TLMY9LPioaVbFV5OBCjLGF7yShSibTe8rNUVCpf7entoV4GM
         gYxvwR3k3c+gogOtqLdsi4t+sXXneYjHTQb/Z2Ni/TceXcFpCQls+1aXIsvbuZjWOTdB
         AbqfQlLJwiEdIayLY9TQJFFZw07650qxEreqeqqKMA+BQxB0EIcSYsuEN3rtlEtIVUv3
         Umwv3w3DUQ3E/fCs6zp+tJyUrB350fV27pOR1F46mtjOny7MDKwC6LWuvwQ9OcPLiGkw
         XgxBrkP831PaGnXE9HKcCrug48Q80yGOkUYrJ6xYo/iTP64aG0VmvNMb6LwLneJHfFEV
         kezQ==
X-Forwarded-Encrypted: i=1; AL+hErEaBpI/Yfde9cD1bes9uU4fR2ib1C3BZD11+w0lRf1S5pwl9OUbyQ+lWGnKfKPiEJSXW0OUv84euwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m8iUUl1KGiFi8kzRXqwHV8GTxiSRhtAgK8m9aZwVQHH07luwZ
	01KphLUyu/i90lqWjc88OhcMlVxBlYmZ2zDtHH/dHWoVul2zGHK7swjW86whwKp41MmzxIe2SkR
	14r6bWyv+CPVeI8oMOl2rCdX/Jjiqj/TfOSgHvgs1JOB5aCvq9CxBvbtDvra8B8c=
X-Gm-Gg: AZFdTZfRG1V3Qqbvy/MO0U/6a2OCr4WoHOupjdlEpgLCxJtWQKeBqWpXYEfPAw6Mvd/
	NLSRg/AcQsWT6+eq/1gslFBCIVSuA25C7ArD9eNTWoiu/AFVlW10GDDEgoQ1uOGV/+R07385lF4
	ZdMqwxRDfQVUNtfXyJB1V3wBb4SNNV1TbPQbNvUYSlPer5pszfLtC4+6wstKrW3PlqIbp5hl5UT
	dfoTEHEOUovkW+vda70j2u/OTzAN1cEv3OYOjQBf92hhwedubGKgJ78CbNZPffQBgM0w3RvzFyG
	aNyIDWfJNJd3+rrEcPFckl0OCp9ulOL16Kjv3pjMiSt3346tmvFn0N/3r4yPHrX58lHIrJWH9to
	gBhCnI7zllRpL1C15EGh1oK2aP8Mhy3gIVq6Nnts4FIAurAbZM5XZrBxbdGhLSKuxHJ6cpuM=
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3989677885a.1.1795768276760;
        Fri, 27 Nov 2026 00:31:16 -0800 (PST)
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3989674685a.1.1795768276324;
        Fri, 27 Nov 2026 00:31:16 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm10890394a12.28.2026.11.27.00.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:31:14 -0800 (PST)
Message-ID: <e6821ce4-054d-488d-99cd-86853dffaba7@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:31:11 +0100
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
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: eliza-evk: Enable DisplayPort
 over USB Type-C
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
 <20261127-eliza_evk_display-v2-1-e4223634aa2c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_evk_display-v2-1-e4223634aa2c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RbQXyCHkD57yAJaIWQrDRNIBa5hrUCq-
X-Proofpoint-ORIG-GUID: RbQXyCHkD57yAJaIWQrDRNIBa5hrUCq-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX0r2Ytg/bK9si
 n2CMGI4lpjQp66Tct5yQPtO9DgnYpeOA++Y+a/iEfE/BUJ+fp4d4S+3pfubLful18QoIA6YFQPr
 H3mvH3Mf5cQlAMEKCpIi+kjRT2oLo6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfXwMilMiOEj1AU
 CBd7kRxi45cNBa97VH2/AZV4TN1Ih0r65NeBjGiEzOdhCmifQ4N2wFL6gwLonNzbotMyuwOwOZl
 uJDJP+uMqdQf2BPiTuESgkiIMW7tMbj8Uf4356krF2XY0oRGm9VcgzT4D/QX3yTmqTRut1ji/CE
 ZgSyN3IvjXsexFveSFuwcx4nYCHWF19GrqOK66UM+LqC/mQ2U6XnbXN9f0O1voEWNB8qFIYsOTH
 RMu+e5hcWEFZtHM92ekeNOFgcO52z+tWATG2/O+XyPOkwWcbD8stMSk5DrlyUz87uIWJH+fBraI
 7dldbUFnXcLkYMNflgCF9KfdloPOSHKXErw46w3oud2PhZshnCwxggx9T5BP4U/jsHpYvcrsqAB
 FSzK7yJqIcYWYOa3lyPu7WlLBcYGRAB4EfOcdSN5Tp+c4fR8CKiUNdHc7sl5596qqqF2YOBFA0N
 KAdtbHbyR/wAHSYhxqA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b093fd5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=TshjLMacr8HRhQhMfUAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270033

On 11/27/26 6:23 AM, Vishnu Saini wrote:
> The EVK routes DP0 to a USB Type-C connector driven by pmic_glink.
> Enable MDSS and DP0, and describe the SBU path needed for DP alt mode.
> 
> An onsemi FSUSB43L10X on the EVK board routes the DP AUX pair to the
> connector. Model it as a gpio-sbu-mux, with enable on TLMM 177, select
> on TLMM 178, and L17B as its supply.

[...]

> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
>  };
> 

Please keep the label references sorted 


Konrad
