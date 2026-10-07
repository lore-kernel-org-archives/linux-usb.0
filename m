Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73916475320
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369876; cv=none; b=F4MDuGsmhrvYCTXbjKPGFYYZPSwnw/lxw+2nRUiEFLQXp/MHNpVkV0fN0lRpz6kB6tNhFzzRQjEeW+FQO3ccOWCuydWAr/G0JXAehMRpj9XiH/cD8LP0T6zPcRjnI8XWW2jRL39t1uIZWOV7T/DYK1lWR9xgKAD7pqADqJ2JnkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369876; c=relaxed/simple;
	bh=eKox8evQuuqmlMoftMlCpCcWaOJ7gtEXdoiFAv7AlSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ExIffK3paw5pMEitN+y1rQn3OfYRuaC3gs0o7KMszvBX0dbRzSVRrdL/WpTklixT2/gjcHv5lY1NF8kPekb9vkWpvvHF15iyfwMPSBVmtuTM8AelrE4DXMFlpl3ZKurij6u131PCUpvjpKuitnjP5L695jDu6S8VTkwSRFTRAcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MF6cfFdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dC+5n22S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MF6cfFdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dC+5n22S"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWmJ2481340
	for <linux-usb@vger.kernel.org>; Wed, 7 Oct 2026 10:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=; b=MF6cfFdEdHHNKFgD
	ZgKaNuOLVTAYvrGxYag1R+N6qQLqVl9tIVLAL62OKRzZihLVXllR5K6S/sihyMDR
	eY9fq5KrM/7BA2RqFV+rs+8IMVnR2sl5q0MBNNGohRJOaJgQoFZU/MzHMRvr/b/Q
	Sli05XiINqSaMVynwvdzNNRMLfdD70wXxTI7u1YI2r2itP4bz88onwKVQ5SCdci1
	SAJRko4zuupUdd7mRRUFGJpcVuym/rld1Kb27MFnNZHEh5d5cgxLfSPPhaMGDFrq
	e3pLIgzobxuk1jVhQcjvExPbp5i0uVLNW+suDrKTLPF2bhTmieGNYdUILbQ7jM+3
	Th7VPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1q74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 10:44:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so3055260a91.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791369846; x=1791974646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=;
        b=dC+5n22Ski5TTlqbqhbZiriDgyBW5fLaHzqQ8FXUxmdxxuCs9PUTBKf+SIp0/MoTQa
         SuRpeqX029v0y2RW+ONO/136BOOtWyGvPCTVua1EZ3TlH5QYZizp248A5S7AKPCqJ9ni
         VrwCZ10nkfrTnLlSSD4Qlucyleq5pE8fiEK1b6iBdo/vKFXc84TN5nNa7gJiHw/twjYO
         QGmz2gp3jz7nvx5XOPPXhys5ZpECCf29dPvdnLtRiDVuNi5L1kr8CjpFDk1yALUYf5oG
         9Df2OdfX4WnAYjRtXWkj2FX5cdIk/nPy5ZVpOIFkuNtmOggKmmXid6cFnBy+8ocu2OPM
         76Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369846; x=1791974646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=;
        b=uRuNKDFnyAws+Dpx1q2o9VINV/E7+4XE0aZGlA9FnznlSLr1z6wvTHXwshWCbc2Xyv
         39Wn4RVNOhh6YYcS0SBRvBBfptKDbrghSgPBqpC8VDEmue/Lx5yc5ZgHZsy4Y92qNfIr
         nZoixvbVerU4JDg6LMOkhT3EeZm3uNjNuAxE52tyGUSP1PTRbsdJKuf77EF3p7+7I3xW
         1BKiOwtemms2iYgv4eNoZ+ShgkOywu/j7SsZKr3R4W18hBTt0E4SpCci9ViUWvygHXU+
         rzjWZSAv5vD+n7Hu6B56F9s4T1BfsxapX3WDVb5IhkfT+mxDixE/rmT3TyB6Anzdvmv5
         h1qg==
X-Forwarded-Encrypted: i=1; AKwUvBwK14yGtxg+1lqZURn19Y3M3TUsTYdox0jrriLCThcapCb7t1QTpHiY9fbA5MZmaipSTAasPsv1X2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh5nMtrhxeDY75VASWalhwj6WzIzaWV6G8ndhBPA+JG7pH2EhJ
	oM+bgQSFJDHDaRjwIIP1HjhNDVxY9NTLGikY4Xtay+ZHZpCkTkduX6r31XDvCFxZ90k3oz15VRU
	BsR/dCDrSMdD1kzWIVvUQWlm1szWTJDTIQVXBqXRJPbRi1W3RZh5np+eBSxoQJ7o=
X-Gm-Gg: AYBFou0tLCRboPItaNWKF0vuBoWV5vE46O5zg8Zu70SC2SqDy9Mfph4LqR9Pr9ERXhA
	1OZv4rjYw7Gl5twpYhNeIhz19tYT+LcK3Yn9SYRIusOYLMaL1Dyuq7ToaVXx5infi5dUMadkbVz
	auyLoNUitQW7YcDwpDbpJUg/lyEGja7v4GO2YfoCi6b5NXdb0pM752yNIwyiUmLeZ/lIjF4CszU
	AS+XB2TyrRxq8ngAadVrhxGm7kGplQ+TWXz3+Axa3qZENOVxY+X5P2c8PcLpMlPR7a2OHnpxzcy
	CWRKXx+yN3wuthjhs/AAYVCMmcbR/Ea8d5lCZxpoHAEz5JZHMYkiBCGFjZAb6/eGCfG9Qu8m3zJ
	IhFW5RE3q7P45PTPbsGsqKzJ2gd20yURP0+P4Eg3kXW2oxCRyynTaktqaL29dywd796m840Qx4w
	h+Mt1PB3ivL6Z4bA4dC0392u9fYNI=
X-Received: by 2002:a17:90b:4b08:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a8a19b1e33mr1567177a91.27.1791369846056;
        Wed, 07 Oct 2026 03:44:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a8a19b1e33mr1567149a91.27.1791369845562;
        Wed, 07 Oct 2026 03:44:05 -0700 (PDT)
Received: from [10.79.117.106] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66560sm9393796a91.6.2026.10.07.03.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:44:05 -0700 (PDT)
Message-ID: <4318b36a-8fee-4207-a232-0581e2b2c69b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:14:00 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfXyl2Pbg1ddi6M
 hWKy0CIPx2fIdJQDo9q3qunWlweDOcYTqSKx8MFRoCr3GIffa36mxg0+IoYIr+SGcwrhgdDqHXC
 4n7lutHNCNmS/KyNIaTb82fq9HAHHoc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfXwcLuxYvuQy6h
 2nViGru6Fyqt5xsDMerpyfrf+y4KxWlP3w7dLal3sYRQeODu/EH6DffXXP1XVeO6IsiZQ27L9hm
 56dS4KLqggiMquAMUy2yQF9lWcDKeyyyIDPdDhCOzjZZy8IgTW9Bw3Edz6jtDGgopRg6uHqbq5v
 z8/QGooA+Fmy9mT01OyjRFt+jN6R+ZafNtFAWhI5lj0uwrYi3TNd/yxkNjcUyTKm5X6AjuBFPXV
 hSIL/Mwc3Y2JYK7T/KMT6uCqNbqZ81soxldnP8UF/Ym/dSHdrr/22hOtLeiUGzx4AjGkGDrb5/1
 ZEbTCPYA+rH2ZgjPBoKQQawj21dts1XUumU80TjKlFZDfvu/3s4/WuMZ+4R8UrDkJsKMgJw6LK1
 XteevsDu5oGqTIbQEQc2sMV75tSgPBp6tCu0/gDM29QJntAGxA+tRP9g94hA/sJy43Exg/BUKYu
 hB6O87jA89YL3HXBXIQ==
X-Proofpoint-ORIG-GUID: aBubitFWrIV7T5YH9k56MvAIJiCVdF07
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac62276 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IB2eJBZJimwe791p62gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: aBubitFWrIV7T5YH9k56MvAIJiCVdF07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042



On 9/30/2026 3:05 AM, Elson Serrao wrote:
> The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
> provides debug and trace capabilities on Qualcomm platforms. The current
> EUD driver, however, lacks essential hardware resources such as PHY
> references and support for multi-port configurations. This series
> addresses those gaps and introduces the necessary device tree updates
> to enable testing and validation of the enhanced functionality.
> 
> Below is a high-level block diagram showing the EUD and its connections.
> 
> 
> 			              EUD Block
>   	                   +------------------------------+
> 			   |                              |
> [Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
> 			   |                              |
> [Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
> 			   |                              |
> 			   |      +------------------+    |
> 			   |      |  EUD Debug Hub   |    |
> 			   |      +------------------+    |
> 			   +------------------------------+
> 
> The series has been validated on the Qualcomm Dragonwing Q6 platform
> (RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> 
Tested patches 2-7 on Glymur-CRD, EUD port selection and role switching
work as expected. Patch 8 (Kodiak DT) not tested.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

