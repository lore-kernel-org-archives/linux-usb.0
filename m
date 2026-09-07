Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E29A37BE93
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785916; cv=none; b=ESgH2wt+IMZjwbiNQYhWLGT3T64Aj4JBiqr5OqGT7e43IUBqOS59u3LdnSQG/0dBgGBAWrQ83MfRK8CEeBzsZewV9cc2FxtWQiB91d/MjP3U8bfPN5OOsjZIEdUCp6xp4LYwdkxzYdON4JlQgZDojAVEuSqiG/+HogeXS/OdwI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785916; c=relaxed/simple;
	bh=DCoJBl7amgy1yhvT0dMKEv17zLSUXval2AKvsyCluU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYnj9JpuRGkOQHDW3KLDWGAAaOto7znMUHA7NRbZ38NI1xQN2SlK30fpKEF6LekGcLuJwUvQZhfC7COyro1bf2MyR9PqTMskGUPI2v7NtKlVKSUO8sdazMU0U601bUJ1LLQaIgjkTe6j7mulMS+nsPl1OFM6+WkXkEQIC598Lps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtiU6jt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRgnxsma; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtiU6jt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRgnxsma"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnYMv004483
	for <linux-usb@vger.kernel.org>; Mon, 7 Sep 2026 12:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=; b=XtiU6jt+gVsasIn0
	H1tOky+lowiW6CAOXCYyJ2hXrpaBAVdk674w6O4GTlX2+WEUnmzYId94+TMokEz9
	KMVBsRnHXeheFBoKwFC+yGGYRiBv3Up4az5HYr0H0lZ4SSPaZIIiS+Bou/4UMFqf
	Q0SWc+dKPRD5XzWpRKIG64YJbhhgKsQGfBdgX1H11gdhqVd8P1l6pnTgwvKbWFek
	kip1kiiTtK4C/2QPzEy9KnNGFgcuqc9rvu8FmFxpig90+NVnWoIu0JFVie1fVBIY
	i7wI6V/g1SW5aRwYrT5Nqq1IamDxwkCSCiAqJGQu90HoyIR91+Tlq2F3Dcx8QYWV
	Jkqjyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg1303-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 12:58:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so64754685a.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785905; x=1789390705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=BRgnxsmacdrwU6yZoitIXk2hkaW4CIgEBX2XhrNqqYNZNs5H5cJaKerEPUwFUShlcT
         jya5kS6SQTX1sgmaW1kk45M369DI9xmHMPON4PaxVprDhAQAE9HXNl7W1ClgJZJQbLjP
         ZVueCy9ZcLCvmUyCtQEOTOelI7EX1f3V7jfEPr8/eU83Dl8BkqVQrg7hw8ceQIdCIFgD
         3NG81Q1bilmTvJI2aYzxte9RzhmwcJz7DHkO2s1HBkkq7vA8tWrBAH52ymkU/yUHyWTR
         9VYayPCBSZuCCTwT+I3/GTHKmbT9stvjuYxeuHyhAmBQSy5FePhRBY55TLUFxxcKFvLU
         WjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785905; x=1789390705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=VEJ3eSGN9j4s9tEauzb1EdKEsO1gA9APr53XCCTepYcLf650r3SIV6Maq5sZ9/oCDJ
         N4alPB5kxuASD0Cg3wUdFXP905QH6zjTbmAXca74HZ7UHKbcIPvCqV0kCt6Br9FcNy+K
         j21ly9q7AHnyHgEaSFdr7vQDIFCDeN/CukzXGH5vIzUlttczxWcXvB0fYWiVkCtSxA2c
         ERDNmdmeA9d1+e/OVS1gl8zuBi3/GY2TtK4GqsUMPMad2inCzovgyclEnFkv1LkXY3Qi
         UfG8EE7y0UiP28F3uq/XE1SnOaEoLYxhGEcuxhVHcnYb/FJyZqEiQUwjcmwF9Yp213JB
         3GJw==
X-Forwarded-Encrypted: i=1; AKwUvBwjJhenCmCHB8FwsvLZ3h94ZnG2nrvOMN39g3Y7mc3KhOg7Ng6o3MgRJd97KIiZ3JUy8yndseFRnmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nhEzZzLAjGPU04IApYm17MQbApLDz/K0qLG6eQ8a7lxk3NU5Lh
	6UKWl94aRAaPQvJPa9URVnMsFLBos6PurrN87dnIsq5cBCbTjYIWE+BQ5h2K1cVg1pQmykgQweL
	u3whBb0+ppMfR1eHgD0q4TALILsCwVOcV4R+N+2GEu7JLP4W4Z06o5ehKlsvLLs8=
X-Gm-Gg: AYBFou3TbNtyGyNrnfs/KJPQw+rFg2bK8MKzKHxNwtJVkG6iTRj4OmjVUQWzcakXtAI
	Ld2bcYjUuteCXgWY1rCIcvusWkpXVNkGojJUFXn3D5ivLfYdkz+u79Mx5qpCohMeIGLkhCt0xTt
	So8SHvK9wEJ8C0RGCTwpD9J+GG+C7BkFEs/9+yT0ogTzvag3oc/vwMn3EVH0EdUvgMMhoiklV5C
	XcqkW6bsyaVgMy4/u3XVrfrmvw1w+KZ/F5oxtIWCwKE7Ueb3q+0G8hzN5DY2beEAlBDBzWCgnkz
	xuWCVV98ln9+f9MpEwzxDVoZ5eGTOB4hZ14fIcETlXIMGacIp28CL0xQJHMXvATwj1sv3aqpnex
	5R0TmNTVfdNIt9OWyueTj+A==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1787126085a.1.1788785904704;
        Mon, 07 Sep 2026 05:58:24 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1787121285a.1.1788785904186;
        Mon, 07 Sep 2026 05:58:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm408829066b.4.2026.09.07.05.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:58:23 -0700 (PDT)
Message-ID: <1c955b6e-6f79-4ddd-90b5-c667b68ce947@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:58:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] arm64: dts: qcom: ipq5424: Flatten usb
 controller nodes
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-5-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-5-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX6mACVRHO5Or0
 pWlbxs+CFC2kynY+3pbmlfFHyVpkE4ogLMB0pRJWa6/D7a84TR+2+LSN6RfCiucFhI3lBJsV98x
 kRVGCrLFukn5DvglmqQ0eptYAqmKd1ihJXWDcp9jzOu5XBHAeL5MAwMgemRQH8ZWLtWTnWWI3+H
 3d0NBHwzC1Qd1M9cz5i0c6/yLA7EMe4Wn20Y8R72jJv07pIb2IelQngfRibgXy59jfNx6jvnZ2q
 ZsItk1nGorS01Ki3OxoGuKvTqlROZjPyypo1T4hJSu2gV/KrpQ6yEYO9t5pHvTUZW0kGGPD1xhg
 Pp5168EiDSAecHx298LsvPTKia/BOy5xZ+3+1/a44W+27GcRqVbbvs+yf+ojPV+hbXy0EMR5X5O
 zaWCpLMIvRUSYcqTJzu5lLfu8uwDQhlYLYE1k3igqauVTcKBbJBTVcXLKaje8rhdyUna0WJqUze
 6T9GYAt5j2kRNsDutaQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb4f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dsJbdQ2hf5wMQDNUeOcXGuTV0WznvOY4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX7IHJpOq3Kx6f
 Tvu5MqoRlXrN2Dvpg4JlkQ1cGgoSCxL5CsWQjHzoZgBX75060PT1Sv0bDorKcPNkMz/YQ1uXnYj
 awaMvoseQ7GY91c3zBijlnkeh76PtR0=
X-Proofpoint-GUID: dsJbdQ2hf5wMQDNUeOcXGuTV0WznvOY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
