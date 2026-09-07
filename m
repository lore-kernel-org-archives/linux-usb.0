Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB24CB8D4
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786095; cv=none; b=I58QOeElHIZQpUrPCnYgwx/8t6113TKAEL7eFDFr9UjC5qxj8m/IZdHyx5I2gGM2T16MiCq8dml0T4K3GUHRKm0VlL8li7Vk3VJvgrCqTBTmn5V/TZPZ/iBF+I0xxpE4ub/vikrhofx6GN+BlMdsTtPwUrS1yTWXQQsWUQO5upg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786095; c=relaxed/simple;
	bh=yzcBe8CWx8CuKM6PhuNC+5srTyX+HIdMDmFUULGmUx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKCK9y802QNuqYjSPD+wi5vXeJkPCurFKuSMcZh1C5nujc+TegaQ+aNqRCuvax2hTEWITSo9rPlEG5kb3AB9fw8Z5Uef0gQyHd5dcCfiXinN8H8Ob6puY/pwc728Qu+Y8WyBLbzvZ/4ATyFJlDqCHhRSNYxa1akvLV7EbPWP1Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYNkjYRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCcgDn93; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYNkjYRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCcgDn93"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Ammjj2651969
	for <linux-usb@vger.kernel.org>; Mon, 7 Sep 2026 13:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=; b=LYNkjYRbHTev5ej0
	8iVNfShq93wGtCm+CPnKZ1T8naeU6UCiM8db30+Du8vbocb6VR05AI44IZ/GtHHH
	YiK63bcbMI0MHAuyFXqiFcOyK2ap147FvNB64sGi2aFTHcSylc1HpfQBT9Wm6wRS
	RgtEdiy80Jck9TB4+QbCkJcv9B/r2Cno7ArZniWE4JK4CWOB0kDBO9ieKhMWN7A6
	CiHjHTttfUZdEpCDd6nYFrtIvE8Hka5212z8H6Q/hI/A8lLr1Cw63iMvWLnFc73W
	zxJMOxzke5SpMrxzMxxJ1skbunf0Hghxp4835v+lidPHYIZKtRyjmTAeUDIB5j2b
	womCWg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0qj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 13:01:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc3934574deso606131a12.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786071; x=1789390871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=;
        b=fCcgDn93EIMMltkfBM8gBwBzsfbQAeWzJRm/FfFQEPkIwroX8zwUvkzsNb4xgBWppT
         CEG2XawGHdfTZrHNXx4zSBfO4ZuVKmDlAP+Dnc+j6iqos9y4a7FYymNZQGxfY61sidg6
         +nnt8iIfvxWQ5bkVO5bc1NCNMrPRLHs56sc5aqixC1mX67a3IISBp3Y9O4OBvD5QDk8n
         lMrDEIMvpyo7qBe2OjaY2/lwOuoYKz0ivzGG4FzCTZopaheAC26R/yf5jJPE8EMpo/X6
         hurebN6G3IIEttjfKZILeTXdhmkXgXk6T7FNJ+g4iKnV6H8WqNfLEmWjvVEX0YQxOxtC
         d85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786071; x=1789390871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=;
        b=Io1hrUrSDYq3h66pWx/Yo+wCln+nqHNZsvcrD+JBy4C8zKQ+DwmOVahwjfYfFfi2J1
         T3K6kgX2WoVLpBEwi7DFya3dxme9YRxrE2MOC14Cwd3HDyibTQ6xafo7RFxx6HlmFZSE
         0SShC1DmOmDEgu6FN+GJrAj3N9+loMOelUXzgjGD9idvBPxsdvfE/BMUJqGWap5nJubR
         9oO8yvnQpp6H8mzamo8SncIAJeV4dydpnRolgNhf6kzCwX1y/gqp8T/+kztjmjDcJx5h
         KjLFo7/S+SctAlPSW9azwOFVGBXXmeDXPQonIZDCUsY+tbRafcngp92jw76kG2qzxZh6
         /Ccw==
X-Forwarded-Encrypted: i=1; AKwUvBzPbDAqswCwQMcZPvO1N4xds8qQcWEWYrWe+zbEPCUB6AO2pPeA1gplrJvbaMIy4nVVsmYrs0kKJjk=@vger.kernel.org
X-Gm-Message-State: AFuF++ken+mT3jNNmXNC5I970H6klK6BE47yb///wRGjkS/lsJkTHM0O
	Y8C67s3RUqDkJUn60EUmKNUBf02Xh9N6M7EhdDJ7Fw6ljaan2cuwtSH9u4lrMI7Cx1v26H3jE4C
	bgkKMS3sPGNztOcURgp91O5DiIMeHGGdnsQdw/s73cMHsI6fKSqvrvOdXAyDcGtc=
X-Gm-Gg: AYBFou0ySY+ya8bYRGSBUC+kOQYYksWenG8iLVysjJR+sYZeUI64tIBWSYtyDf6WkCd
	lROGZyONlY9h+0fpIx6HupvCHh/5F892J4/KxlyQlqT9aYCBxAi1lptia4iKtVmhjYA8QQt0Kyz
	+0H0OlrOgmltNVF/iMItFUDb8pdmyNgMicquNqXacOyS6BBsycnumqCUqt7JK+TimIyBfR8z3Nh
	WLNU0qY9eRKE1IKcdEaxAtcGLkTmxdACID+l1eIn85J2m5TzUSvTapVGCvuSpPoZE857LwtC13q
	DOE7n8EyuFUnJ0eVOiQmcCqlqNaeGQMflv+784rNtwUnKB020SCqU9FUdiZxK7UrfnYjcERBMMi
	CglNge+OuUCICYjNrnLjCrw==
X-Received: by 2002:a17:902:d4c9:b0:2d8:d29b:c1e5 with SMTP id d9443c01a7336-2db273b0f96mr137016155ad.0.1788786067921;
        Mon, 07 Sep 2026 06:01:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr1133602985a.0.1788786048213;
        Mon, 07 Sep 2026 06:00:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036652sm477639966b.2.2026.09.07.06.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:00:46 -0700 (PDT)
Message-ID: <4740e69f-23b7-4b3e-8d75-d7127dd6b140@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: ipq8074: Flatten usb
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
 <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9eb598 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=BCToOkYIF-vvb__y--MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: cN8EHQpzO6vri-jM-qD3eFLfflVCJtXE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX+NPT8AioHPOp
 M1oTsta5bUHdtLg/FbB5Lry56++zYAth3zf6kboOokncY49O/LoPPY0s3FEIib3IWRFN02YgEUR
 f2zsXD8jo/+8aY27uTj/wBlFTfGlr1Y=
X-Proofpoint-GUID: cN8EHQpzO6vri-jM-qD3eFLfflVCJtXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX9KUbS0dpbCa8
 tYYiZKGXu2ofU1BNQyoG9Im0wvbGtNniWQa0TpHX3HlB9GpGFP4cMDLAhaIZuFtYRD7KAMyDx74
 ZIrCMIX7F7XXIPL4k+Pr8jqi6F4iMT6gYiHmmLW61PK9+ppI/CvRmiGITA0wERk3u9IuW1O86iq
 wboNJ8gQbOKxekPZrCZ7/WF7KhSGVoWm8H4TlWH4nnIC/Pl+dbS/qPWUaERwjAK2CTHswIn6n0X
 gkGFHsPbbUGgaDTgaWookBb1fKcxUGijubOM47ee9YtDjJEab9CCbTHKClaAJwPZABnvqNxo49/
 LSvbreJYWGCuoRTRUdvlBZWDGP8hScgqMn00R+zXPWpKhRR22dQ1VbqXwBPdD8hU5v9itiV+v3t
 I2SiPCrB6++g0b1HELu0Cm49e2aR+NSKyQGE1rQC2vu1/SwvkKQQOONZhguUj8zLgvo1i+GFNWh
 ZdH2yetdlKwNB57nY/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070144

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, fix indentation of properties in both nodes.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
