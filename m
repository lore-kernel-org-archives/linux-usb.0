Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1B93F9F39
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330174; cv=none; b=AiJiNno3JnxxS7I4KbB0rNGrswgs1QhCnqyDCI4ijVDl9mANkx5d8kPw/MEUCJN6ctDBG2L1UOwx8amcMGDuxN7T34KP/0vzCjj1DfgJs4tHXrF0oEvnjEgtxzisWwT7GGtgzdMW+saVObQq+0RaA6V51Oy1A6DM5gQxkRyFF78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330174; c=relaxed/simple;
	bh=9KU0+Qh3UhQzV4S/AeidafHAtgBcfgMjLpUHxSSz6u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1K1jItY/qncHePzrw7oHOVC0yXPO2UFRvjoPw6XJHDCO3hSQGoXxQlqMDJCwkFdefqFVba6swvy1hoUdXKUvpT5rvQyK2VNsTpNVH6uH9QsDjZZwPv2JEvCqJKNN6Ch0Hk6Y+YwB3P5B66Rtw5SbUHZWcasrCHdEIprlbEfp2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQXpdCcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAZm5w9j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQXpdCcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAZm5w9j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666946Om4172619
	for <linux-usb@vger.kernel.org>; Mon, 6 Jul 2026 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=; b=DQXpdCcOo89USyBt
	8XZNqqdIN6Uc7qJ/6IOlP74kJALJN6bjVoLmq0R+FZPKFKLPBFp8aiv6hBsZa+rz
	1IjheFNVRoS9AV4wfiswBidnQ7JoFfcs0ubVq+a+gJmtXb4vTRuQXq7cnhFHCUR9
	cvxdCe/GEfolG1RqOOFGLWV9wQ4/gyCPCESOXIHVWRfFoJl654MTB+A+F+jJhbcJ
	9xnTTASdXKR7DoVapAWlLnU4lKuAnVZbEh9H4Va+BV8pNg3h41oAXKQlebnu0Qdn
	Hh59yagpr9OJ47pNCBNt8Da48V1RYyeefgHHXOqYfPuzcL10xS4Q/UXQwiPsMR7w
	5/xdVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t888ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 09:29:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e7579ded2so41226285a.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330167; x=1783934967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=;
        b=aAZm5w9jOKMYMllCZPBgiCBwqrxxkXCTnWPXeWJ1DvVxZcqWbQr7B+o2o17KmnAEHZ
         g/i/DknjTPDGDIdx71GbvXL6awt3LqPd4E7QFlSGdbmSJkfuYs5jSotBdfREpmBlrRqV
         0mPJfoxz4DtJDZOEo6rRx7ZO7GmCyfLwQPa4RNMVpUPvPfEEEpBedkCsxPsWystYQ0sU
         OkNuIxP9wInGmKAsjsjmUPA1FS86a9+1F4J/vzdNVYH243xVIsW2piCpKCyhO3hfy8ZH
         DpsH3VGC01AbmM8DAVAKNkQUh5DIV43ceZ2a1aLp/1p67MXXTq42OdgMHLAv+Ueb2O3c
         +1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330167; x=1783934967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=;
        b=YO+BnbO2J++f40foBpsrAcm72iJgCN6h15Hbt7cDh45jAqSmCXD8wSfziZ8g+h6Y7x
         rB7+1fwkqD+Kp748NNZlkx2XqZZEfwsQL805TH/FE6Psl7y1UD7iDyMGdMiUfm+38bpL
         Edo+XqFL3BDORWQu+RVVQneVVSeXIajrY2WrO4tjxhB+Ou0tU75CmfjUW8A4PtcIG10U
         3W+TWR3jI75MVZTRl7urMtc2AX42PCem8f0DOKTRVvoZqDqzE1itGP8dy6bey+6oWVFH
         a34MNyZgh1bga7HEh3puBM9lN2rTIneRdC2YWBwYcrv9KTjfKnQCPTAJN8P5DhfKTNU/
         VGvg==
X-Forwarded-Encrypted: i=1; AHgh+RqcSlcEUTEOsURbxBY3TnKLCN+rM/B94C7ySUIOLSy5Kbh+wEy+Bo5cgw81U+yA89TvRZXSye1u+b0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGK9c1kcG4mwXiohjtCHBsec94nv28kdciWcuAykaMZKRyjJX
	0nfB6uwpW9jl7LEQdFJiCuInErOFfdZmLtr7tfjfSz70y9Hg9bazB0Ne0O4GVkn24fWkq952uQt
	lQYqyDkDLRqMn4uy9JT/T1kuEXnRSLCvA7icMcEmfI/bQeIEY93nnmxSlMbt2EOk=
X-Gm-Gg: AfdE7ckhZF8V9Rv1ZVWbAVq7AKcB/vTvMN7M5Lvr2Hyvfar1l0hdvirTTOc5E9Dwxtm
	b4pUh7W3iApENWoFnrlHkSzyookPMKXGyoc4RFnCyd4+tTuSljMI84FdYR7TFMedCntOpoXJHL0
	TpXWpEr0iP4dcA91l0wuf5aBT6nlV4NAqEWYGOv9+y7R+cSHo2HKCaYBhuPUYkXU5so3gmBUknl
	STsvn1q1EZknvIlU3Y1bgPk9kPBj+DSNHCqwBZQO1XaqREkhzCnN0oamJ+Ik5OvRPYSsBOAi3dI
	u0Ht2KwqU4Xx5gVgHl25VsXqdjMSQMOgosWTuHPBorQUxxv0tmUqfaN1zMtuhdqn0BRAqCvYe+3
	XeFKGVYIs4WoXgXdfdyj2EolsyD62KG//Tgo=
X-Received: by 2002:a05:622a:1aa8:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51c4bf1ead0mr86117491cf.10.1783330167400;
        Mon, 06 Jul 2026 02:29:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51c4bf1ead0mr86117341cf.10.1783330166902;
        Mon, 06 Jul 2026 02:29:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm3562261a12.12.2026.07.06.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:29:25 -0700 (PDT)
Message-ID: <8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:29:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX92wnR8b0InTd
 FOFOMFtLlRCF6rRxI9/J1a9YGGrxIpk2LzTvw3TXSFWF69nrdOksaGCvIS4RXK+Gic3sEDdQcjv
 FJNPAnz1nRWEJpDlotkcffDtb/LNx3Q=
X-Proofpoint-GUID: 7BDjZsEs7cb6zJWBw-0J8lQF4yjKkybY
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b7578 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=so6UWzPJPvBV26MIzc0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7BDjZsEs7cb6zJWBw-0J8lQF4yjKkybY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX0GTXFCpnxWwf
 GnLtaH3R1snxg5IsDpLqSQTK9ocNaA52PqqDuDQrYEeZGqtEukYuQcbdCsQiIluCopmb7m8JT7r
 o6YmX4YEoKpufeJRLzd4aWSnVrcnDA43HRqblrIR4AYImlvhncc3A2v0trWDrs4QH3fE9cMdCc+
 KWN3XjrmVys9JAjgEo4+l+KtzL+7xYL/3hYUcDKfjW3DdLa7WW8v4+otmCko8ULLb6AyXPNIRfL
 LA/qTo+7PEbyquUrk+hA32p2IrAamu7CIBsxVJZmqXCfAQzKjxJNE8kYESpm3Z6PIqHt/36CeGV
 I7sD8j3kKCTSYC+tQGbgP7lcmgYBzLsKUEIymdED9eOM3I0H51xieyd3YX2s1R2aJr/1j8Jb69D
 dHnujlBn6dPnevh0dr/2NKlS3yUA80iK18u9+2whh+kBSJPHfMqxroHDoyYTbxY4+C1n+wtkibq
 xAbPFDjqU/SKtUaZMkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060095

On 5/1/26 7:06 PM, Elson Serrao wrote:
> Note: This v4 revision introduces a design change compared to v3.
> Based on discussion and feedback, the binding adopts a child-node-based
> model while preserving the legacy top-level 'ports' property. The
> child-node approach is required because EUD needs a separate OF graph
> per UTMI path to accurately describe per-path role switching.
> 
> Link to the discussion leading to this decision:
> https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> 
> ---

FWIW I've been running a slightly modified version of this on Agatti
(modified just because it's one of the platforms that needs one more
register write to enable the thing) and faced no obvious issues.

I'll happily see this in the tree after we're done with the paths
discussion

Konrad
