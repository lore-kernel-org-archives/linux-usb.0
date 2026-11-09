Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237135;
	b=nXoTyIstQd3gy7KCtmGLnJEfcE25sGGHZaXgIiJ0GMyiA7qXwa7TKwpjKISnkrmry3Yi
	 c1kSQDyuFiqiUaC8wSqCp7VjRxyPf9KDPWif9FdaN7rFD8Cz/QEvtAqSnCcvD7OKyi3kU
	 bpA8S0n1yYN4gaTnREI0jr2m4+LfC0sN8VYpiaH6XPBKfMHt0tjNwC1mjO3vr8YbdFkPC
	 /56IU1dOLMtKOxXjsq3TblJSjcfqWU2xnnh/tJVz5X6PLw1vmi2s3RDfmgYjUg4KGQvjP
	 7pER8A/hrIeXGAQzmwh6HgIiwpLbo5T2maxJcIR2SH2NtEdquHnz9BbNIglHb9IhPrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
	b=vjGeO34eJlxbfz41QEVGmwa84A0BAqurwWVlTMiiUjl8HsVz/S5Iv8YAwBrvnqBTu4LS
	 +nF9+tQLtD+C8/Yw0JQ/EfFZebzbFMaGXTeD9QOgR1vPknnW88/4HpKRMpu/0jsksjv+p
	 oIgqfp9sAtVb7YkOWO5UJmIn7Qb/f1Kwql4bc+UzvRDyqipGvvzm7IfnnJFjSZIzS2m23
	 AelkBw+AjiknWEtZeDs1obYMbqS54mjlYd6zUtXEU3hzzjzgvGikvfPWrW9vvd0rCkOPR
	 Lra+7BbkVFM5PD2cTcm90VbTYaUCP1fxWghfrfFgZUALpJUzK/8Wwl8E2PwW+7lXOcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIrSQFS5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63322606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 15:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63322606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIrSQFS5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDHa4025852
	for <linux-usb@vger.kernel.org>; Mon, 9 Nov 2026 15:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=; b=JVHA+WmS28WTu51A
	alo4QMvr0WoiXI1XjKsBEXyVuK1q94o60sR1tEhkiY2tviOamIxSXbW2e4SvWI0B
	FTkucu81+2EXGVGJ5suaNaLkGLtqVzxKWtq5ruWvOOwNBDZI8/88FOsPRUA5JBHv
	JACpPjvZIITH3FJcqZnm9Bm/J0R+cyiE6IYGLJFK8oO7l309Hp1OjCX0HhYMm7Po
	btMjZ1ALCHvtYmQq86wiBt9nEtv5ydZzL5OQA1dARTOb2/BpGIxuc2TxWsSA0U8s
	SRIa4+tiSHSiIPRLKDBLsxrgw25FmtzCpVrDJlCpin4RqaRpkTqQZu+KTy5h/1ec
	MSZ0kw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua589gwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 15:12:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc0ae52207so18548137.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237133; x=1794841933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=bIrSQFS54jIdF4P6guxFfiAzGIywaL3HcI2CYKiZk5KShXVQ6LHaUI2qAuwOyPWpRw
         xzfuvK2o0r67SnIflhrl9zw16CC67EqRne8OQFuU5E3F2mnYa7/4IlAf3C5Ho221FobL
         MUwgyGtBjh4n6LF/d9m/JQ357ZnuHtLaD7Cq1EMyjDyZfTd5B+EhzTgX+uPhK5gG6Ftk
         iKdSSKA+NDnD/Ck74XrYb7w0tldFtDH471GRhN14JPzJrq4cg6ae6XdIVK8uI9S1qoOh
         fa2WzJoIQKQpdigRZRTw7drea02PGQV8R/jN/nPrkpNaYuTnO5sCoXD++Xie7/gJLWME
         g4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237133; x=1794841933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=qREToWYnH2QzMgS8JnwCpBw+pjk8pK5H6vaxxvz6TaPruPEb2oy9yLA3gCOWUdwLo/
         SDB+OCpJ9xQ6L4UxO+TbCcPoSRxMUmxX7jMYwsj1PnGs0/7OJbVgKDYTuaSLGfUJXJqC
         BPPFApqYZ4XinT+LGKkvq0UN5FOspMdGBNSQATjJ8sGNbCAKnBPeMTIpG3iDli0EWnIa
         7bN7M+tMbIXIL/MP7X/1m468e2JswuYCWdRDRee+Z7iVLKnqrjqFbAsxT8Euk/gG4uTj
         eZLSGgoXLHsMNwJjw49aswxDmyW/X2UtS1z0OnGl4IUH5F0IwnW0jR3ZE4lniKo0rSJu
         Fx9w==
X-Forwarded-Encrypted: i=1; AL+hErEXUUWaeyq/jutOoftQRV3pO3GG3/TLgdjD25slblvZwptMMBNK5v2vMPzFKh483ygdEG1y5QIGKzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SxMc4edOTkhJuMw+ho9qMmMwKyjEwoU+47db/SJ4D4E66MpBN
	d8zjGI6ZzUHIn8iljqjrS6Pe7ZCyH4YQ3zFLV1ob17++Qyt4ieutci+NZYdUMc293y72d9f7mvm
	bkv6zm4/k2WvkYkOSHH+F4ANxZBaukCL9UAyYwRjQ0foJOKaTrURQ3yqsh8j75FA=
X-Gm-Gg: AYBFou1ScMJ3k4qdNRnmTW77SdOqlN5uR6ZHS0fFZI99Bs8IL/kxSSR0B9HYgtFwSAw
	+4IzTCbqlqPZEtPOtT+TK2+RdZw8tskv4wNMQwRKjiWbreoyI+j+Rfqb+YC/b82E/6ag3Rr7NpZ
	tirRXIu8etJe1w4BYym6CoCW4Yz4f3bQQPgAPJH67qtleQ+fV3D+wqW8ktxgmFdUb/AKYDuAxRf
	H7WdmvGNvIH1Qei39xFO4pPXx8n3L7ka1TqNcb1ckYDLrRYoV6qm49orT/XvO+hZuOT2fQgD0SX
	rf4qrt9+drMqOFZCtLzRI8zuoC9pW5u7WhNoFIoRWYzYHVZJA3KiWv/bI1geISoFipawrDHoN3R
	pLRn4M8TNKcwzljyHy+VlOjbNBvXGYDyvUClrVzOZF1rHUXyeaVPxHeCWZcw/ZmvMlsDv0w==
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229139137.0.1794237132548;
        Mon, 09 Nov 2026 07:12:12 -0800 (PST)
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229073137.0.1794237131982;
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1765456a12.26.2026.11.09.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Message-ID: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:12:05 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX4sCLChs4FqP+
 9IkHSbMJqdgk/GcgNlCoBIkp12gsWNaDURxhb5tfuEFeLoJBZwWftAi5yc41MD8fQNZXPYlfp4h
 r5JkqqACoDDO8UsfuEssrVuEEGLWrPTaXZyDY2POW3FefzUvG+LmYukotaUflGAceAkvsDe58xB
 BluOnrldLrH35U6vh0NcEL/ynRJoR5Zj2kH0p8LYNDEWK8l4yx2rd3b8SELwnJN0qFMW0dC2vDC
 cmoPrSU++hCvhh7/MWPjXE4De4CVdrGk2r/OVk8M3M7CHco6mOhepehGPmINIy7qXthjPBl89O+
 JsTF34lbqjApka3cd/bfKQWtIvMljFUUkIwlHJl37wUWg1tDft/C3vsHFAx5ShLb3CoIUyp2zk9
 d6dOG5R7t94S8v2x/vi5hK11LMwBA/anmQj0hT3kaOcH5eqUPb9PS/t4CyCiBaKcgA5ZQ4FlSz1
 GnqKFTR0HeiPeYamM7w==
X-Proofpoint-ORIG-GUID: Vvazif-S_6KRaMUW3RrOdVkB1oCgNu1A
X-Proofpoint-GUID: Vvazif-S_6KRaMUW3RrOdVkB1oCgNu1A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX2GRM5Xouuy5D
 dnuxs6RZ1nvyHGSIYt288wAERY519NKWNT+Wrh5Qke0G9zPdqHTJ7sPHPyRnjxDJq21f9dnDp1y
 c+ZMK9t0nGryG0R/8GTaBgoDteyRRcE=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1e2cd cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=Xzw-RmQiYhs1fFvV6_MA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]


> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;

Is there no superspeed / dp altmode in hardware?

Konrad
