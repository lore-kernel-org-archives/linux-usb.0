Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742474;
	b=YIkMnSKHZYsyfgh+JcvUO/0XJb/2NJI7uXO9R3bW2OENeERARqWkB4MVc325SDyC8Mao
	 Ioe+xp3pvEDNn9WVRExJrojaZZSLmPwEH1kS7bANFLlMJya7v2gdH/V2U4aL9OjRohuz2
	 nIL185YOZUMe9YOlqb+n6g2YNeK/luSqflCZxg41nnpeb/dCX33rEzRMD5XCPGpkiWdVZ
	 R2UGWhW2mjqXNY7zzEj9jOA2g4vvVi9d1Hc9IOYBo6lonGHlxqjBQsAm7yG/6+Z43/fhw
	 78Tug9xGSLiequu2SOKtTBklego1oVT5kjm6N4GPurujzHoSwvenmFSULFdV51zNYeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
	b=yQ84bvF57M566mF3g1lgwYf4sn2wUQ/lTCrhF+4wBMuOfpb5cTEpuQuBddDCVkrCi6S5
	 WQeTFaQLG94zjjZZo6rSNfAZgciXtYfzbwHpjplP+fpaIt2It0dIVSz/HCx3fg+yVazwQ
	 MlbHigXGc0mof/17pfaPipOR2/PGseSsaF5E2TK8d2m3ISKdv87wJQKpUMnF6jbq9z0Fx
	 SNQEXI012LuBlRwIdGCWDltAnM6sdVV+wv4KHG3UmDdTNySn8pEpSJjssFgNxVnUCKz4t
	 cxvdoBAeT5in3UdXeFpDSTchLB/vGgLKUnWsHbF5omUV/XAo6TLU1O/SCXrEZ5gQpaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYsAMdE6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOZERwUK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB0606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 08:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEB0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYsAMdE6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOZERwUK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDFY1767186
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 08:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=; b=QYsAMdE6mHAddRfH
	xBhiPupQif2snOY8TOWxIixUNAbk5JBRYUm2DGhNc75MbkVDT9vItva3t7UkgWIu
	JGzBL8+hXvL0M1rMy7dIQMAMO0xWKIAu83QSpGTnuW92XpWv0PxxnXRybEdGKOh+
	pTjeox8AAfWNSHDwiaRe5a432MHMYgOyoi0UNmR4Ywtdshghl9XA9fAKUz4zVeGp
	YrP0gLuOwhKlpFY0/u7g6nLgKjzBd2kW9SJNFnQzIpclx99PIVwWcTxQI6F69Jrd
	mC8PLp7yRI8mHqsnD3mBFcOrsjbTM836GGRDYXqDYXMFYk+Dh2QYPvNoz3SHi56L
	Ub1Exw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu27b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 08:01:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc781089b9so8959137.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742471; x=1793347271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
        b=XOZERwUK1syMHRqTsdbDhSPSNLwtjsmMKCpiyuQ22rV394dfShCp66AQbT3X2oPAES
         vnA8Vbo8yc4Aig3M0/eVR1ajV3oBj5lwyLW3Mu65REHUufgOAJelRvxa1wIY41n2gZdk
         GiZArAzZwloML5xoKWwYrvDzN2p0rS0CBafluBWwWECIGWMmQ3gF/pgvvaltqlJF/b8M
         VPV3hRP2xBysmmSq9UYdIpZFOJ+V7H0hfgSI1QGo9AJ2i0MeyINpQcjPUGnKAeUlZ2U0
         sSUmPQe4sOsjmun+ThSPOYfCiYW2OilLS4s8ATHsBGk7B8mRuNALqXje3LqcNLvSqqst
         B62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742471; x=1793347271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cN3k4wF6cr4qpY9bR3UfdZgQwjnA2qGOVu9nt6JWhU=;
        b=VkcVD9kPSOAp12T2VC8pEyv66HSrNCwy8HxHLe7ywh/f1HYSaXnHzIAmSNK1hmVRG8
         4UnnuJH9GESbvgBC6Ecm9GPyKGcZilfrnJs/NBpJdPHcepr/kOvpvu2KqmlmBE+lGqGM
         Yx7T9OWuKreEvQ7IZGyfh1wDzBF6gDybib3ukXTuDEAe/BTK/QElGaOJmyiB4nmPN+/y
         Xa/YfL0UHVj11Z1D3Lj2EVdIHxrO+8az0pTHTUjNH5iD/oReOGCMjyKkMhr7NYag+3jE
         rQ5t1g3sibs7YtKk0G5zBOpXPwNKq5C+AyCnsDR7pMEKjX/lEoiMIrzaM8KeAGDj/HbK
         oHdg==
X-Forwarded-Encrypted: i=1; AKwUvBx+JVFGDTkskEgxsnuE5D47KfxCGsuAHzpV79cG6dIoRP96CW8KUBWU/BFs1OK06/xRwzXNIClwKB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwMu7jgefbGk5vmd6Arr0jJpfAaRmcjULWrcDLJ+AFTa7ryAHV
	Ra1W+1SyaQXOwibK/7XCIm/zGrmap7nTZjNx9wU0RBwq69Mkrle9KrFaliD/hdzhCti+P27zpyx
	d5mXiy8ODJEunhxELXX7PPBHcJO4pm7YJJuv8PcMFrkLsGsxVR3wizRP8/obuIxg=
X-Gm-Gg: AYBFou12kncdiBy1K9bE8JU/JXVURlDh5su8CyJDuECUOfUEi5QWj9f3/xUys7KmXc4
	zyjSBZANi5qbQ7DTpVKtOqG4WSr1PAm1P1g9sbZH1V/+PHUB9rY+atw1kyJq2HyUAw4zPUp/pZh
	rR7ntbxVNm9Bat7apqMP31sZEZAV9eI7Dk4R46hGWgo96Gji8mDR5ao+xaAyFKn9R8QD/VFah+T
	fT8Jh/JPCE+9s9kKtDFSgZYeZy1i5okzNU+keVNceAEu/0S33yFH0hPnY9RfEHkxtOLMShIIfI/
	6yt8b1hPIiBUyY02ZZb3s4FUsutuFOMcsHsqkJ+c7ktrzdu57sfhpMd7QSyLlqemxJA/gQvj3iZ
	y5cTzipy9B+K4/tx1zvr9iQ==
X-Received: by 2002:a05:6102:6497:20b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7ccc3089a4dmr522690137.1.1792742471606;
        Fri, 23 Oct 2026 01:01:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6497:20b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7ccc3089a4dmr522661137.1.1792742471072;
        Fri, 23 Oct 2026 01:01:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c848c3sm71563466b.38.2026.10.23.01.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:01:09 -0700 (PDT)
Message-ID: <5422680d-e642-4a85-9119-6a5ac5443d50@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:01:07 +0200
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
Subject: Re: [PATCH] usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in
 DP-only modes
To: Joonhoe Kim <26rote@gmail.com>, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022165143.1327-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022165143.1327-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfXxEnJfiMtyjQK
 FhA1xbbduGtKzfGmnGXPVbPkBE5WMub+gLd4IMfvqpTy5q07BuLxdUX1EV1QuA5JRdmd5II+iba
 PEA8d+U+UUGVndWDL3ETvTyMS+t9+90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX4EW5SSs6LoPw
 +TDRYtfD4SDHpQCVwAONz5agz5Zwitg3YBPlR8y56ns255vYOsqu5FhBsrcqBN+wLZXIqXwYCdD
 r3gUtJvZ6r5EY8zkVWewzv6oxAj44ilWIf1yp8Y5657xKDXF4bXab46Yfc9Lf7yTLGgisybgyc1
 3v7Gn36r8KQHnGX/AZh4S1UBzCRDyBC6LE2mvdkC6o6fuAeOcz56+/totoynHzaLQNJyelzsKjA
 RaHzRSi4A0+Yc/ZykHE1sFAQinWwXgSzMm8p8oVvnI0PEiKZ6JIm0C2xS0DbJ4i5P8hwnlBzARb
 26DmCaqiHi3MfvLjdD/c56LLfS35TJX0jqxY3v15CPGL4BnBQHRiQ7FIeyfAWAD4JHgzdVbRDVd
 prWoeMsveF83rSd6fi6UDyH8qIhxJorB0iYdMX5YLDwcjakA8TTj3U5EO8H50TdwSCr3CI4gPM0
 LFfIrtHp0JSWlfbyZ4g==
X-Proofpoint-GUID: uWZ_j5NicO4fVL5yClJ2kL-7OO5TjApf
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb1448 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=JsmhxD-A5SsRL_Tr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PfqxLEJM1DhM-lXbwakA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: uWZ_j5NicO4fVL5yClJ2kL-7OO5TjApf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230031

On 10/22/26 6:51 PM, Joonhoe Kim wrote:
> DisplayPort pin assignments C and E give all four SuperSpeed lanes to
> DisplayPort, but the USB 2.0 D+/D- pair is not part of the pin
> assignment and stays available. The FSA4480 sits on that pair, and in
> these modes the driver turns its USB switch off, so a USB 2.0 hub or
> device behind a DisplayPort sink is disconnected as soon as the
> DisplayPort mode is set.
> 
> Configure the USB switch the same way in all DisplayPort modes.
> 
> Fixes: c7054c31c1c9 ("usb: typec: fsa4480: rework mux & switch setup to handle more states")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
