Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC11B4779BC
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708891; cv=none; b=lE6nfw8SmiyfCI5BO8XgG7x6DMz7uPc3UoMBS0w3HQFtP+yIGavZ1QQ+u7ddxR0M2jRe8sN0C5JLwkfsX12P1GrJZ+5wKg59k3E5PaxG/zubdXPiyCwYuzdiA2Y46nY8qulJJfLbjxa21Hm3zdc/9IP+h/wcKjdbyCjxyIx52PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708891; c=relaxed/simple;
	bh=TkK8+LPz3NLYgchZpLtTgVE409WX1AzhZy1O6ggVhyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXr4whC8j9ECQ7lZNY2G1VzV9IiD7mOfcfrMj7xe87xYEGprMFpOuybJYqKkjRWz7YXozcPoa855sI83WR0jZkAEVcTea0L5XxErx509OU2jpIO21JHJ8p9uK6R9VpLmyd2WIYNYrQT7xdiD8rTI5XLrO8r/17bdwCShUkPEJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkhDpZ4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuFeEGAg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkhDpZ4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuFeEGAg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M7CBPt131213
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 08:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIsymjFuprG4so7Q98HuwxLOIzy0qsmeHV37HSxMH4Q=; b=TkhDpZ4tS7+g6FSu
	V7hA31jvtXYwG8KYuedqPWY2GzKy10BPTSi76qlCpspHrBvRIpDD6sZjr8tRdJyD
	5SgMYd+5tUtvFIDkcPUR89Kej60q2/cRRhTMCmLCdTGmXacX8Skz6H3KSqYwF02E
	KuQS5Tw5yjxdY3+IWY3rCoYvAyp+VLz4uO6svqk8oRV7umNEedPcP4tytvgAQ/D6
	2L7ulhngw4C6rA7P4W1zZzCJSAOhIa+TEDiJ/ZJ1zEQZoXZfCdMyndzNnV5CGCcy
	GjBKW7wLRhJIDe4XFZThZM03+utPhHYrJrUFW5giJBeoVJdGpBvbwVvGmPqzednG
	3SExMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928abv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 08:28:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4ecd1ae4so185721685a.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708882; x=1785313682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIsymjFuprG4so7Q98HuwxLOIzy0qsmeHV37HSxMH4Q=;
        b=KuFeEGAgvF+vZl5wdpo+I3s3KtYfiXzcl1ww7ofB4rGIEgf1f4lKntUwH8+Qodz/38
         iZ5+iwh6+7VbQ8XPb5uL/L7hDYXCFszuGXUP+UwYcxygBKByO9F+Tp3jWNuiR/FrnGSO
         EgGWaCUOA4NUqqjnbERY4WysIH1tNTvrb3DePTQtHBoyQN1D20jFU9RwRrjzgxMHeS8U
         /wk6z9pcd/oY0fR7jhHmM68Es5TWt1h5SBUthFkp99/bixn2+ng4Jc2LAUW3RmNuFPSY
         Rl+MprY+5WFtKYMvg5KEXjmh5wcClNCrvBNp/uoJBCwx4M7d0erpjZx85N97yHecmvtR
         Zg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708882; x=1785313682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIsymjFuprG4so7Q98HuwxLOIzy0qsmeHV37HSxMH4Q=;
        b=Ddiw9m7U6lVwverZOgHRG9C8OR+mwe82x18QSVsuhYL9NAeGyI0Hu6d3eTXNEa0l66
         uxGDnD7SmppBFanEfCTj8nomovwq1w/ezG/O3jXqVXNfY9y6VDjy66u+uwjBJfC8bK5B
         /0HHSajBWhdyOZR9yM5w8pZyLYCMFDGJXE0/CTB9Wz93U2XOvZWTfQGW74I7xM6M4oCF
         Yw6ubFPfk4C7dqEOGSof0ugw4QsE3B9593RP77Y5SbL0Oziig+9J9xWePDbzSFiSmr/Q
         qnpybZ/0AQiSq9wkcMswCaFER9QzHzemD7G7xW0pOd7zQX1x+/6nZbHEWWUqESDhXR/b
         LnzA==
X-Forwarded-Encrypted: i=1; AHgh+RqUCvtbEfXXcndFo9ienAivnY8TUlbGOIf57QyU7avpjhgoU6ZZ5XgyBLBX3ZEbotyL/42YuwnfD58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQfwJ3de1LltfL+5zdbJb66hPqGUogduas4x6qpn730k5Wm34Z
	afBD61TzFf8CL8AJnM6z+S90YHHtgtZ848I0zrLT3Pc3S+Nlz2+Oud5j/sVQBme89pvXg4K/F3c
	lGSj5aq7BkH47HmejCiYDdZoa/ImC1S8J8QWdydDz5gmEBBLLLOfR1SzMz7z6fMI=
X-Gm-Gg: AR+sD12YgX54YZhMAKTBiws8mVd4FsF5Lb88osztymGLnvqYx/m1CcA6JXcyL5J5k7l
	nJNl0U1GmssE5Nb+5/MaJvPIWal0GMyTz59Rw+0Z5By8/Wsdds8T4slf7fBe5xhT3FrzJOVtC9S
	nTRGKElVbmu4QrCg8ZVKlp10hmWqB4Bk+To38VPecm/PQ/fM+N9jZ8W5LIm7hNEnEUkOhYWJik4
	94xR7IpDI8iKuoMPmnQQ3kIaToX40FHHx04UT2gMZBLMDszYzv3/GUYI/Xk+fcqXd5Pb8uwbfZX
	2GwJ9t95Q5wZwgGi1qgdSJ5Vzo4BPCOGRBTspzeIN5yukfvXedL8w+6XTqOPaHm8fxLSZ5xOb7/
	i4Fucdk9QS4Ycl9XutTZYRozA
X-Received: by 2002:a05:620a:1709:b0:92e:705f:1626 with SMTP id af79cd13be357-930f458fd0emr196447085a.6.1784708882439;
        Wed, 22 Jul 2026 01:28:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1709:b0:92e:705f:1626 with SMTP id af79cd13be357-930f458fd0emr196445785a.6.1784708882047;
        Wed, 22 Jul 2026 01:28:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34ba67f0sm621763a12.12.2026.07.22.01.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:28:00 -0700 (PDT)
Message-ID: <f54271f1-477e-433f-9839-e1111898088f@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:27:57 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] usb: typec: ps883x: fixes for older Thunderbolt 4 /
 USB4 docks
To: Sebastian Reichel <sre@kernel.org>,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: jens.glathe@oldschoolsolutions.biz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <al6-IyyWYRnEW4VC@venus> <al-dJjzorP-I4Yff@gallifrey>
 <al_0LjwmfW-cECnY@venus>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <al_0LjwmfW-cECnY@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX879EtcQWnx/T
 lYI3uOl49SCs427YmODvl6kHasBiVdvhzPREQ20YMG4adK33pEbtByRYthCr/YrT1yGlgvhHo6w
 7VdHeyvtCL3mwt5LeAiSIprxNOwxFG0=
X-Proofpoint-ORIG-GUID: F1XouDcyEyhhVtZRUZLEoh0Nk3o4m4cV
X-Proofpoint-GUID: F1XouDcyEyhhVtZRUZLEoh0Nk3o4m4cV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX44rnK9UONOZA
 DX3vks/cR3ZU3gS3QUoaW7wpOVKfthILhb4aYJpXYpHjwxKA7JOsXZ1Tv9ILeM3LogGXwfg504i
 fT1yE6Ly/cQvQoqzrOde1CiCv/tKlFMNwb6kk5QybyaBlwNuxGpNBeUlYTqIoicO6R4HIFpmYtg
 PlKilkyO+f5EbrMSvzVpWMIVsXDP6Fwp39vJE4T3Me1HWqI7E/BCIU8lPZrZlHbOBwe3tvhkQMm
 byR3B0Lt+sm0qeBhKRRNWkUqPjbb7ULwUA4L0qHCENO4nyF4Akoskkb5PR+NO6lSLlYwebfavkE
 fyjmxuln6+Hxu7CLyaVcrANLB+e8cn6OjkUIRIjB2LKk1iaNQk71BR6wuO+ZPimzCYMcWAjVO4P
 rEbFLmH2DdhaLTvFPPn+R0G5Z8bi+jWCCzbi3wcapoHvzC3pGT6GvUiBpJbqjwjhnc0zJkLcK3t
 gTSV/bMB8wzduQaKN4A==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a607f13 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=B0dxQpQml5LPzYmAcjoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=lhd_8Stf4_Oa5sg58ivl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220078

On 7/22/26 1:34 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Jul 21, 2026 at 04:24:06PM +0000, Dr. David Alan Gilbert wrote:
>> * Sebastian Reichel (sre@kernel.org) wrote:
>>> On Sat, Jul 18, 2026 at 07:06:28PM +0200, Jens Glathe via B4 Relay wrote:
>>>> On Qualcomm X1E80100 platforms (e.g. Lenovo ThinkPad T14s Gen 6)
>>>> using the Parade PS883x retimer, connecting USB4-capable docks such
>>>> as the Lenovo 40B0 via a regular Type-C cable (which forces the dock
>>>> into Type-C fallback mode) often results in working USB but no
>>>> DisplayPort output.

[...]

> AFAIK only Qcom and Apple M series support it. A quick search
> suggsts Apple used an Intel retimer in the past and a custom one
> nowadays. From the looks of it the x86 world cannot use this driver
> either and probably handles retimers transparently in ACPI, so it's
> effectively Qcom specific until other vendors start adding USB4
> support. The only thing announced potentially running into this
> would be the Nvidia RTX Spark, which first needs to be released,
> then find a bunch of people motivated to implement upstream support.
> Nothing with USB4 capabilities has been announced from Mediatek or
> Rockchip. So I wouldn't hold my breath for another user and still
> suggested adding the machine check instead of simply disabling USB4
> for everyone ;)

The PS883x is used on x86 machines too. Apart from I2C, it also
""speaks thunderbolt"" - the bus has a way for retimers to enumerate
and communicate with the routers (controllers) through a sideband
UART-like interface. But for that, it still probably needs the
platform firmware to program it into the right mode over I2C,
which Linux is unaware of (as it effectively should be).

FWIW, we do the same on X2. An MCU takes care of setting it up.

Konrad
