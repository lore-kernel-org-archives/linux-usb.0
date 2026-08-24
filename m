Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47923EEAD8
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561983; cv=none; b=nFiQYQey7Rj/qit1iNA6I54hUwk6ovmINxq05cQLh/cHBmmKEVHGl1wY4H9uXTnm0td8liyVJDm+fdLRUrTLZoYhQ+qt+oTaaRFeBkL19+PBvlgnngCCvvhdKHULcezXEwUvRwvMrXmhsIVTAjwSbOBLIRrOwjFaixvHiykHUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561983; c=relaxed/simple;
	bh=9Yeg4pEJAq2y1vfd7BWO5GQQThMFfvnhf4s5AWl9EVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZi8A4IHPG/tDOac8lZLStn515COGswkykeGJ+alX01xkeQRFB9bGRM5lmN6ZIIXy7/UTH82M99KzpbEvPM2WM6OnvlH/iAKeLY0/8F3k6cQNfpr5wmJaO/NgoIUP2F50uViuXbYYr0Sn/2rbxR7lsjep6f0wnnL3Oc7dUCQ+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyOIpsfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBQ0XDGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyOIpsfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBQ0XDGm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCq33066897
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=; b=JyOIpsfupR88VhDZ
	JoxXevbOuacWGU1AB84hVVd/etDDKXD7slDEZ9mdh4JxcIaVrGmf60m9a3PlMdoi
	Eo0Bh5a19QkpNJglfjPifGUWAPEjchlVXNtIDsLB97t+NYDNhp9YhE1IZvbCtKKn
	ALYMZh5wCTlUrMsyD6WWcpUP1u1k01KCt/A7mw4qiQpjyKhW+qiUZs/N3SKhbO/D
	pDsLQCWdM2UXH65cM60UmwpW9D8/+BlloDGok+TG93DrI/6e+/S4w1//DU2wm8kr
	aG57QrMH1mUhU6tbcERPvmcM2LO/AN2HzfiG+rvnEk0sVtG5TGZpuqC04WnkN8ai
	XmaHNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpht3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:59:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7ef17031so5437591cf.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 01:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561977; x=1788166777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=FBQ0XDGmHAlSgBvo4UKH2UhyLveRHw9lc0rknS27OWINVBytyEKv7DBrTBiBGmWMGi
         MXfFTTd76TCXsrmyHgj9K5dDw10XHu7EZkDoTYE0t1qrfS3AFKI3iWc9UPqVGW5hrNSt
         sZ0YaerRi1hibzHHlL2yzffudX+CRzgak15y3BF0EFhsUFZRqnPl26jnMnZYsieOy3Q5
         98h8jb3TafkL6QA6eTkb6XcdRsbvEHYoylBGn4BfeQnBfpfTsO1ODfiTuco6xJkf09EA
         PfVil21guKF4LEAg3BWKscWXp2g5UqCNQ8u9HAov6IUEQX23ArYJBtzR9pwDFKtKrcdZ
         ONBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561977; x=1788166777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=QWnQk01Sqsl39rTK9vEsi03JNhZBgkntvus2ZPq+ga1Ezql7A27WP7y0jHPQQzndyx
         ORjEWyG+G19cVjmyoQcnm28q2nxP+9XT4yr3J0xfapJqPSrKqBt5L445X/3piRknpA6i
         3lX6ds2huLK+3y5tP560NPDn/WlnSNXPtbwSwcleXdILHIOzLS34HjKW0Ryb14euKAsz
         PFGG73aYmfE5T85Xw+hpA0Ze4v5/uj9s+I8uCeF9VlnQ05o2zALkyiq3p6E9bODjS2H3
         t8znzDslAJ+UV2TFggmparDa5JiZqPe9MaqPTTfeQ7nsG0eN90OfCCDct5IM7zQJzFe6
         b5jA==
X-Forwarded-Encrypted: i=1; AHgh+RoxYJ5gZYWpRGma6uUBcMo8DXYdBPYG6T8fLYPzFxsk6LKPEL19AU8E9pFozwjJfa6b6woSRWBOQLo=@vger.kernel.org
X-Gm-Message-State: AFuF++nNP/9Mr6QcCGtXXOYyb1Ef9TL5GWz7OVzC5A7cj5997sibaRby
	AQu94OR06TtcAOrNjlCIa2PcFgBF43XeFCzcH7hss+XbBL9GK9VsxRGqnfnNAgDEzXkCfzun/gD
	h5b0BjbId8tMLGlhMbr+tCee7h3RFeCPFyhU8TG6xHFncHcfHhL0sMZGHNQ+fr2g=
X-Gm-Gg: AR+sD12NPy9IbXy+qkAwWoarG7pJ+l/WZPefwtmqJbmxGECM3qw5fYUufgL3HEEonbf
	w/5GJP5HBPQSjeF2ZiCfQhzmU/AuXZ2dzkTDWUVg543clhmW5II29C03JtUtIgG/x3VkHbgmo8N
	Nw/llCxm4kIxrGbQnGVVRYe4ozxXOAg9kx/kCrI3PCQwitFaLm1yJKJKfMpLi8BfYtWdw1Do49n
	qnQORleeShcZJ7K/uOir2tMdWK4iTXPBYBaqINRLOPTpaTyHT4MyoQa1x0HZHv5KHlivofADFNp
	Bq6NrE8F9kwuE3DiM+wAe+aLpWLnaJL64dd5Rca/Canty6FiOcu0DBbnq5vLZs9tO+aP73Hhp2L
	6mQUFFyuwzcFMfqSr+NuelHN/
X-Received: by 2002:ac8:5fc9:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52df56ad290mr183183301cf.2.1787561976966;
        Mon, 24 Aug 2026 01:59:36 -0700 (PDT)
X-Received: by 2002:ac8:5fc9:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52df56ad290mr183182981cf.2.1787561976582;
        Mon, 24 Aug 2026 01:59:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1095582766b.2.2026.08.24.01.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:59:35 -0700 (PDT)
Message-ID: <8e175474-1275-4287-9101-1c54afdfcd09@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:59:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] arm64: dts: qcom: ipq5018: Flatten usb
 controller node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX3wT/NhYhopGr
 SBP6FU8vai5sLzQVPnQXCqOtdTBU1QNv94O0x3DTrKKxj932NLHLGFTEEQfClVbAAW1Ym0OMyIZ
 LbLhmbdcdH7ZkPQ91f9oklDGq8B+I8nfZMb/sVxJlUGSyaateYnSMhJoO0foZxy8T4uh/9cetD1
 ZcBzVStJ3HU0ztD4YYgmZmwQpndIOL9HykA+TqFU47MLUW9OlebwKYjZDyIBLKMEqxuCtAj14mD
 0nnuXOuX/ITVWGyH2Ukr264CU3XzMBn0BM/Q3zT9XltDqkKNHAY3BDhGuHn/DXTKBqIkZyqWHDH
 DPpvtjLu9twjal57aEcLK+JadFcbq9tI64WRkrv00uMp/lpFweYclzjwzboh/AfHTCgjLFTaeRy
 y2bgdfl0M4NyxGtQ/PMzXL+jo8BttOAUQ3M5mU7Df8C0YIiT/4xnnjcvpiGvz+JQvr6vRJ5M9uL
 cdslUiLBjBtWTntOZYg==
X-Proofpoint-GUID: HCXOmw2PqMxeHYeoBUZwBH3sGOI6zWqy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfXzoKoxE00IGLX
 QW/TY5/Raegt/w1Y3TJSg4DFsWy0R5xvnSkS95b0U1esnAHMn1OdYXYIXnxU7lS/MCnIgIZrJ83
 MWU1RluWeBjjIbte4/CZLBtPmTvOVCM=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c07f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: HCXOmw2PqMxeHYeoBUZwBH3sGOI6zWqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240078

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
