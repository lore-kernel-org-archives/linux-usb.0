Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D37F449B3A
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047037; cv=none; b=CBMu9N9gbhP92fN1XiCaqdCLR7Z59acUwuY9wFRQ/qxHrqaTDhX+XgQAMnNxVrGA8J1EKSBTVQlPG0aG1wqC/cxEi8P7M5IJkuuE7jdSAZfBffEXIeFJjc58SXXn9apZXgYMI0dy2TqhOFL36InQef+DI7XDScVEhX4swgVDWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047037; c=relaxed/simple;
	bh=9L3FrRvXQdWYs531pX5xZozuFPeO/mTA8z2sqTPlZo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzTW7St6Dej9CoYvNU3FMj/RjEyF6AnoQVxbYPtWrKM9mQ1E93CQiFPqze97GmRGehENtzA3wBa3hTsNzlR4N5QwuQv0kgGX54zOC19f7Fv3O9QtmnPa5v906/74c3f458FBmdURwLpaW/ltrKSvHmiidv8Ue2XXXOglAU1gX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fm30JKro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmtAQkfD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fm30JKro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmtAQkfD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BIS0243036
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=; b=fm30JKro9bJpSYu+
	sGJN1fKuNHUGn82cvjkrCwrQXLZZJV4BQ7Nu1eUWoFvpmZbWIAIbEgKWEVki2J1Q
	BHTaqzeCvqUjiXGX1nY1HKL1sDf4t0dAAdPrhfvtiX/Mtp8ILSrckoJ3QdS/7cEy
	jbUwIdHRPCjCDXJvXBYsS+oJk+/p285+QtE3fbXF1xpA6EAkseAbTEXvdHLOVVcv
	EXryEvbgLy41sJiw0VxMb4djKd7ZL/dXGMdsF0yIyY++/3CvlnEt7w/Z4KbqjL8U
	oATpYVeOUTlJUqzRRT191gtTsXBIva4VZBVX5zJMcgvHOwJ7GWMLQcXUojrcLgo1
	IIF6UQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hw54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:57:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso12823291cf.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047033; x=1787651833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=;
        b=OmtAQkfDbEkMkJ5UoFUBhsDQM2HVpeMVUhtpl59E00arTQ4nomYCI079uDEd3NpeRI
         e4/SlbCQHs/q0Vx9Eiq//urZdrYkTMCf+vajIv04r+8OqwwPDxOTZp74FRlZwnDwCDAz
         yTLBQy9wB45vSn0rsSIqkza6vdFOrWbMsmD93aeqxZg+74X2RTitxwA6/EqAtr1Uuu6s
         9RKAlcb+3XMTnDGT9OGFCnXgUREaLNh2FftwZHPo23GAw8LNKIL0sJ24bvXiD1YEsQl5
         o/BtsIURM18EgVoMu42IeZbTwC6/e7AU9juLpDFtbP8Lm5Gc2nBZOvN5uhSEKiTJAm1N
         g6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047033; x=1787651833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StVit9BC+22sE9IEMOGQ8OH6qcU6UJJMBrq8fRn7njg=;
        b=SxLorgBZzmMrEg89F0G179udz9jLK5leHtNfb5ToZuLwGOgPsCxd3eojuBbyqzREgp
         RvjQhf4ST3zvLzeKFxTpC3zpZis/UUfGKVXsxVOJO7CfQ9l/VydZUgFk8vVzkAq3kK1T
         7AaTsZOdxSfH4gM29rVkuNJX+Q7DJePh0lHABHe8diMZX++3klw3fGD8mrS2Asi1ylxR
         uIudZgLrTAV9q7UkcovTc0uf4PQRaPzaaPAy2KefwI9aO3XRVzNcvLdlolXJ9jLdBa1y
         x1tay+HeQUqbLbQYlBqTksMUPifsMSdhcCYSqu8izbKCc1k3VdT759Mg4L4Zme6ubylZ
         AkVw==
X-Forwarded-Encrypted: i=1; AHgh+RqmMsfRxN+PPVfWZLeNXxU9OvhtIWJR498twkwaviUInwWwP/7p9mhvTUvCz4b6Vq3GPyE6vPnjfbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYhg89Hk/L9S1cIToLr/xO9YWQw9jeCUJRdWAp0nrQ0Lnytin
	Vj/bxnrO4oasGPCB69JT8SSz6HgaGP7KbpLsSYCS42Ny39Y60Jn1Fy/PuHqukChnUckroQEeEhV
	cEn2VrZIbJfSpVfzYKPYe7g8ZdHuFe387oroZG3uyqDb00KTawbNl8dnTR8kYAsY=
X-Gm-Gg: AR+sD13ByQCj2xsmO+UE90HQg1mz3xMLee+f0vCfoQHTeXaB1P/qK1UfmSnsc3zfdNN
	bXO0OYwrhd1yNdJXreypmWAH1QfM28oJjwRGq0GpqhUMrkfQEQagqjKUE7wQkkQ/gy9MU2tKTb8
	Q9UDKZ3IRtwzmNWRGfTZ9aeshQ000zLbjfsABIVM2z8N8e5mg5DmN32IrhxSmSlPAPTtMF4bEfG
	Q3Jz8k7GTP6wmJnBMZGqlU+eV4jTZP7one0YbP5OfVQ+DmlPWf74eXtKWLg7P6b8Qyj8oKxURMM
	n8mrF2rZKUueK+r4aouO0yuViMtuh9ItNcCLUJdbxZxYleqwvvROLln3aGgadDGJdtMgj+1mqdn
	qpOSBP5NorIiQKd2waO38GtBq
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr228656241cf.1.1787047032615;
        Tue, 18 Aug 2026 02:57:12 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr228655901cf.1.1787047032035;
        Tue, 18 Aug 2026 02:57:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bab858sm129104866b.53.2026.08.18.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:57:11 -0700 (PDT)
Message-ID: <398f2270-9d7f-4e23-bf4f-ef02186a2be7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] phy: qcom-usb-hsic: engage HSIC mode from
 phy_calibrate()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX0V7ylvDpt7VZ
 FC1web6WXuuQ7cj12pfiCDIOObnw+21F1e9rn7VSS4s9ljr+DqVZqc2z0f6r6RGJWhgdJAA63XK
 L8IBorhTyh/OPpki67xXUhbKaO1Z38QgSjgNd61XIw2bbtK1EkDLXkl5BMwo5xqKpPdNiVxn//x
 xMI9fw2lbbaMsOa2SzAg+5pAROm7Z3IkWteahqssksJPklysbKi0ASP8Ed5rAsUElidUa2pv/pB
 +LZh6LlqNIYnJndakvqN3nmzlOuC9Z1U0EIQSXLyIwx4JiknxwwUaZybqSfAN9wCZU/CfyrDa9A
 a27YV0Pz/EQtg4a7UcB/tMJaLNSZcx100LryeTp+joE6Mrcs3y+Ifm5aCJHlKI2v89/5kbnsi0s
 TD4bo6IKMJtfcjYgFftf35CvAlM1b163JE/q5IxEPdk/KALvighUddfTrKIsD/MaT6JWiJT9YsM
 DT/VlUrLoUw1KtaYyWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX1t9yJwx0aq9D
 USsSoF/r4IdeqtJykkkrQAOq9iSOf+9Ku14wQnIZtprRtdYhx4kzOGZLdiGY9ae/ngcGICJJRUz
 zpkDp1DgaOD50cajWAF1IAvGVWsDq9M=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a842c79 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pCBiGHpxg2lVr5E8ZqwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: q59Lu99GKpHuWM-lqmueY2Txmu-m_6-r
X-Proofpoint-GUID: q59Lu99GKpHuWM-lqmueY2Txmu-m_6-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The PHY power-on sequence ends by engaging HSIC mode. With chipidea,
> power-on runs before the host is started, and the HSIC connect of an
> already-present device is latched at the moment HSIC mode is engaged:
> performed before the host runs (and before an onboard hub is taken out
> of reset), the connect is lost and the device is never seen. This is
> why the APQ8074 dragonboard USB4604 hub never enumerated on mainline
> while the vendor kernel - which performs the whole PHY sequence after
> usb_add_hcd() - sees it on every boot.
> 
> Keep the calibration setup and the pad mux in power-on, and move the
> HSIC mode enable (and the auto-resume disable) into the calibrate op,
> which the chipidea host now invokes after the host is up and the
> onboard device reset has been released.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
