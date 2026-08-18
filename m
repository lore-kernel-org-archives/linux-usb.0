Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B10377EAF
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047345; cv=none; b=MPEzmghQ5AH9hAJbb/jytquTG1bYzSfWpPhgA52pMBnV4ks08NakoCY0b8uFkj89cP0n/ZxdR8S60v3SxXx9XtdTNHrtPazHfv4iWeE48A0PxrFcLLrs4zLbyGw6oJkSIB3j2sdMA/bh8roJ8q7GU12sBiAI1DcrxEHz1eMSZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047345; c=relaxed/simple;
	bh=BZqcWaqu+rq5FB9tqXK3e4Bntj8NSh8srxUuMqjzxEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6XOEOI+SMflCnBQ3sSRKDR2Oc7qqX3YZPD2xu2OlzBswwkPUVxD6kBSraJW4JH3ggghic/F6ycOBo3WqM0stQwdbFLLfpMAAfupPiHS94sarsmSddIupXMc2n82NbaBveA7G5w6p94wmRXDwF6eRTWZZ1keXnJRk4hcQZn+nYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBJigU4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h57GfnhO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBJigU4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h57GfnhO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BSXB748045
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=; b=mBJigU4sVcEo/i0B
	jSrWWvtdyhApq8UdbdXXExhZr5FQF8dPZULE0kY2hrihDqkDTI+sfFKSLs8eIlhN
	ouACxr9VBTgsIb1cWuziMGllA/Aai8zjDNQEcDllYglxezMNQFRUqLeI2CQZJF7z
	MvhRXssijPE2Ow3uhvLVfgWnTLB73T4U9gFJq7lbjSglMuJwst8a1Eiwex8QsiD3
	+Dy25i+R2fXUBUNnHaBSdK81HiKhdBoGqwVMsxQzG0WOryPeZQLNrMwMUwGgGiWC
	PgvA4cu2xjoZnvI7s+EDZPNVbmlkkVh3QWh+XkDySGsPm7sG70NhfQ2ayOnYuqom
	OshV9w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0u3yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:02:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7530aaa7212so12474137.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047341; x=1787652141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=;
        b=h57GfnhO16f2OkrQU+Yp2ZabOI/zzXD2UhiA/IZNIVTZBLJE/UMlYOZv/UVKvw+3uF
         2I+hBdyD9JidASgdwtR09ASuUVeBJmfGWDPZ+gnMUjCstk0SQKzRocMRsg71qsosDnIJ
         QTRj/lTar9M+Z6GP5rY0ONuM6isTlmo4ThjxXDdbvHbmovNqPezp9LwME9l8bTZVy0Wp
         e/VxRE5IK/eYRhhBEVT3GydXXu/LE/1RBL6RZlszAeUJHd4Q1aLMyWxwbfkKG/ZH5Dmi
         HEv0ugDwwGZGQievBYzW6IXrePPqKJrbwQlFX2rW1MT5y4u7ofJMelvUyc1PDWINmOY0
         pE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047341; x=1787652141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=;
        b=l4s20iArMOLfNONNtWuVG8J7s+L7byAz78AAumCd8D9nFByj+b+sGQfhjMdzcIA03U
         WWPFcDi5lA0yrCAknPv7utkyugcWH37cUhZIROnvWragjckMivamRm3en6H+aGcPNoeR
         +9ZudCdI7bmopap2G/XCTCsSmCDgwh1+ekDkNpBEO/vaamDcfZHtUl1AVC0B6aFk8Xy2
         g5nZAJ/DxpD/i9lb73k/JBV5Uxk9HPSTjfFxjm0JkTRbdy71Oq8rPCUbUEzZlpDAZN8x
         WvOKsCs9CPn3J93tIffG7Xvsfwpmuk1b+CuM/aIAneAE+ZT/M3w+5q1cPq/eOPnX4O0a
         6KoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGTbGxJadPx8dgepyKYVedx/RUlbwEWL9JRxsNl6bBJBFz/n7CtYUWu2/cpQ5/MP3RJiPm/bxgroI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyariDyJ6mlINeMhNy560zwLeqgui/lSrsCDMrOKDrNQMpt0eir
	+1UwtLZwS4viOBMonOVpjtvBB44hT+rZ+I50LXdKe2C5GqO5qvtbaPq+tRHGpaz9b/MSzXXbKiY
	ZfpTabl8mDJCNWIfEQpzjkNjj4z9/o4PfXS4R945ij/OIyaxwkT8Bzy7g4rz3a+U=
X-Gm-Gg: AR+sD12ftSGaPibM2CnpBjqG6TbP5WLeD5snTKhUuOz9jjAdk97W2onfsyO9Wmlvn95
	ZjHWbyIWuESiCmDgc4xNpevnmEe0QpqHzk5dMjzuqresc9sK1ghnu0XJtFiBYmIONewcs27/TIH
	fFAaTDNtfxYj9sptk5WCpOpJfxns9fmPTsjmmXo+JN/8eONNhy6KrnPT9LjBuDE7qDe/nXMOrHU
	sda8ciZIjR2/SCBlpJCsTZzKvrYV5rJRQuviJZFW8dlRy2LD9n8MCKEA+x4zwk/MjAWtrYDzK3p
	MQPmLydHDNaA2cxpbHfKKqQTtztPgumrUgMnBxfaAo3rRK2aVRZcNFY7oigyjE1AyeAiIk8ImG8
	B2iCZ7oodg9Ne/zJokhw0olH3
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2244161137.2.1787047341161;
        Tue, 18 Aug 2026 03:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2244135137.2.1787047340715;
        Tue, 18 Aug 2026 03:02:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm1517213a12.22.2026.08.18.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:02:19 -0700 (PDT)
Message-ID: <c72378dd-edde-49c9-833f-d107f6573989@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:02:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] usb: chipidea: msm: keep the glue device
 runtime-active
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
 <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX4eVQ1UkRQBo1
 wxoqaTqsLu73llXJm8LEsQ4j7awxLPeei+Q8IMIcK57lQCPIx9lF/9jNDYJOk0rC5X4ig3shSa1
 Pd3o6+JS8mupHXmztqmlb4YqTbsuyzs=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a842dad cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GzGGmIZ6zSJ6oW9ANs4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: _Z2EJqhCbFbFxp95eQXSnKyHk5Q7RuYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX5/jfLunVxH17
 DXeC8mKLskbRc1EJ91Wjz9UKVRRbCMX18UO1fJfmnvteFyJes/A5vVOALtiAcuAh/uwHWCllYJO
 DD/+2NaVJ8innTN2igL6jGXzjaeDjvPbqSyhHOl8hO3MdXXWYpksWYdzsK/Z5x9IkcjzcvWO5gY
 +00x8HcfQ/qPk4lfuvn4wUyY/ENqwZgMOGkXH/NkWg3zsLXV6oC8fcxjLt7WteVUE3JHhM8dp+I
 KIWklttQSsrlRLT+26Q9dsF4hE4RY7gUMD1Kv9Ikyzq6eruYGbak9ApICugw3GxaP2qIitDFD4T
 QiYrq7k2L1CkYXYckzyh6dpOuBgWjBxk/YBkg5YsuYLW1tWESV4TSWSaJQEqwgF4p+QxJT3FPib
 rNzVIvEFxLuP+Xz24+K0u+Dgrzx8rvUw43vE3t5aPRyHrIQ5c2CsjONA061GFxbeVhh0VwpE2Pa
 XQtka7yaUZC3+f/SNCw==
X-Proofpoint-ORIG-GUID: _Z2EJqhCbFbFxp95eQXSnKyHk5Q7RuYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The msm chipidea glue enables runtime PM with pm_runtime_no_callbacks()
> and nothing pinning it active. Right after a successful probe the
> driver core's pm_request_idle() runtime-suspends the glue (the ci core
> child has runtime PM disabled, so it does not hold its parent), and
> when the glue sits in a power domain - the HSIC instances live in the
> USB_HS_HSIC GDSC on msm8974 - genpd then powers the domain off
> underneath the running controller. The EHCI register file reads back
> zeroes, an onboard hub's connect is never seen, and subsequent bus
> accesses into the unpowered block wedge the interconnect, eventually
> taking the whole SoC down.
> 
> Pin the glue runtime-active so the domain stays powered for the
> lifetime of the controller. Proper low-power handling can later be
> built on the child's runtime PM together with the HSIC wakeup
> interrupt.
> 
> Fixes: 2d0cdcc5a0e4 ("USB: gadget: Implement runtime PM for MSM bus glue driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

FWIW downstream seems to implement "real" runpm, so perhaps your
agent can have some fun with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
