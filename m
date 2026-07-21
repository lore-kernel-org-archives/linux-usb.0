Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227BB46EF80
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656652; cv=none; b=aKN/wOldnWNnq2eZJ9Va00jsI2D6vdBkh9vMtMmNpF47grHx3Bh0K79Bh5CLyfanDn4oiSqyfOk6LVdDTbr8TgViVUwDZDPVjTNM6zZfBk8jSjVyOCWDM686rQgt6lVjJREJY/MJXj6i/ht1CSrzrTImPI9sQSlnknlPwmg3+nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656652; c=relaxed/simple;
	bh=ojDG5A3aFReUmVTmFESylooTByZGHDf4YEWxXzujdgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlwjZp0S4ZbUfaFLcS7MhBElSemxSWXVo9QJ1sMjWvqWeNFOvLz282pNITUUrtzlm6EhxWxYkv9tRIYm2aCYybC2HjGuCABPxzMRTX1JApH5juR1ML09/GBo17T7iW2JxodEfaCeSUVcgkZ55I+TbADCQjpe1C9gl1V5OVmMISk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drAymWl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+zI38V0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drAymWl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+zI38V0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2cX42186836
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 17:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WLI8exdLgFmHsc6o2HEnEZMx
	prx403KO+VO00Ykrbc8=; b=drAymWl4tn8n2kngCUXL90iJ7B498h39PAKLInd3
	59Jl43XGg9gsbGefPmV30T+FSFo6KfaUf6tuMzf4qaO6Ud7A9i1pAWHNlecGru58
	XDM4CW2Futwj56tecdqgrtwuzkl/P1rIpy12cjuEflFTdHLBHgnw6LNm9mYKixqx
	73x/IYH+rxEYHBiRxE2adhNJpF2e6d1FeahSUyfhKXD2V8Dcv6Ty4EZDrVsydPyR
	jF+u5pS3HZVoGwDGrJGUhRmecdXoqcQbvEKeqdPNVfBaNb1OiOd/Ue+KpUAXPlpA
	Db0ZSvQJLzlPpzSKwHBGKPPnLuaPoPU/xMtVU5B6pV19jA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae9h3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 17:57:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744c204396cso8829996137.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784656649; x=1785261449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLI8exdLgFmHsc6o2HEnEZMxprx403KO+VO00Ykrbc8=;
        b=B+zI38V0vE4pMAFz/qSEWSaGVw8SDTcGHcO/0JAaiLvVgWERJC2MR8sF8dk8NomlCn
         31Z40xqvOauU7LoHYS3q926hQbAgIWDgdLUTiSE/EkdSarqxPctolXQU2Jg650RQzi6X
         5kO1rB9eimloJcT65VjE4eT0QdbPjm67NcA59UeNGZNFb5hb4IV/asDZIUtnHcxlmDnX
         cqdjWzEUPfuCntLuVgK5xQQalDZbe7Jvx02mC7i9ZQn8f5cYW6yiBmSLb2PZic2T50CD
         9ERjQlG+O4Ec18KPSfwqTImg1t94FjKxCr9r2+Erv1TN5De3zZYruPOc642TUKUexQP6
         1RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656649; x=1785261449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLI8exdLgFmHsc6o2HEnEZMxprx403KO+VO00Ykrbc8=;
        b=XTnDpYshuM8oIdCkf4Pnd4BariQ/e21eHSoBevOvR+hdDo6GcqRYiUVh3NHlbBs3m3
         Bn1kQmJ6IXERhl3Zy0kQAkLZCx5CVACOLz6CK6D+I2BcY52KvCc/MoiW9KG4kqSGLPw8
         a8ZXntnWoKuvyPM68y79iwGAtxWwnbnlLUbBxxM6aAWRu4Pi4xWNsPeo6VSh2E8GLAoj
         xWpgIM5SIvkOUaIqO5BDLX6XBdEJlpY/YYgcc8CAAiyqSSNoEJPnUn/lGcGvQ7tIHZPp
         /reSA+bIeu9+rW4XVpu4gjaJiaXq3UMBM8EghnjuNs3dWZoQmMUIK4cBlES1e0D3qylN
         yMfw==
X-Forwarded-Encrypted: i=1; AHgh+RpG1bcKLsJDuAvUqF7HdB2yn3XblDPVy0r7S7NN4LmPifD28scHCom9/YvKnBRzVTtmajmCOINX0i0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWE2mFltu7GQFxbxejAg3uoA2jPuxkjf1P596yApgaAtUeV/U8
	jbQBvXGxpebL/UNk4yjV+IbdM9az2sY6dX7mVvo0Y2OZ55ez8QG2kzbULy8E6pyjItVglpOUuIc
	d0Q7pKGQ5yX3FIdoJsRqxE8sw/wYDuRuJIhFEyumnmAW5rqrxPVH4GunTJ5kXrZs=
X-Gm-Gg: AR+sD10SqdhkAiuBXleSj6Q5SmQuiuSF8ta/7AxyQoODSEgVyVaEuQddOU/DER4I0LK
	LxlV6FV/aCoufjrobHObr28m4ClYOdQpuMy1VQOQjRWneOJ9uapxEAwpwgaVzYogbkK+sPGWcMr
	MsCDIJEWnsxTZcBGqFlP/3Zm1xbQnGQjiigrUMtA0OzbXIN6Nfxfkkl3xhTcHArjLmoDCh881mb
	RTOB2GKrby4oCLZ6baSmbfcB2NuQDLlKGxbh1ql2c3B7XGJYpBe18q9YiYUDs3E7TwNd9GqEYBv
	IsDVsKViI+tIsDhYlTf3b6Fuv6U3h12HUJScEUuh4Wev32l6ZLmmSOX0CThmkuBr6K4Ad7Q6YQe
	P8k6JbKZFheTfaWAlnMuQMWi5AW0kFE8sGkxS98LECkdEe6Thkn5FVjUQ/oDLvhjdSYjL/aRTtF
	lNOKEu7AL+myrm5w==
X-Received: by 2002:a05:6102:5e83:b0:722:826e:1423 with SMTP id ada2fe7eead31-747536fa410mr6545674137.20.1784656649233;
        Tue, 21 Jul 2026 10:57:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5e83:b0:722:826e:1423 with SMTP id ada2fe7eead31-747536fa410mr6545666137.20.1784656648869;
        Tue, 21 Jul 2026 10:57:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c5e37esm526821fa.28.2026.07.21.10.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:57:26 -0700 (PDT)
Date: Tue, 21 Jul 2026 20:57:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 2/5] usb: typec: ps883x: Return -EOPNOTSUPP for USB4 when
 parade,disable-usb4 is set
Message-ID: <6vg2kezxu6jguqassp2l6rsx3cg7ja3rxffitzmzhtbc765pnt@m4lalzge22td>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-2-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-2-cec86d0b909e@oldschoolsolutions.biz>
X-Proofpoint-ORIG-GUID: 1cPpZT4zycnRhi4rtf1JdYgr_Df3m8GO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4OSBTYWx0ZWRfX4y8HpSCRToBO
 9Y2h48KcQE1PWTfJJ1hO20aK5OatXs2qU8EXYj6HEn51E3L2V1rmVM4v+KvNjEoqo78bDyaWq2J
 I2+y0mqvLokDfHYDWlm3AXVmWyj91ow=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4OSBTYWx0ZWRfX5EHMRopJ7s8F
 A1kyo0LNiiWhNbFFcqDIkWpPYB/pzkANn/00p7G+4u0YADz/2beRbhe8FvANoKV4PSNkQ+hwf22
 MmW8uXqsRk2eg49o3PxgQu+VQJJ3gSJHPt/DpmEHv5pq7ryzmobMic7bs/hFr0C40URJaHHOHTQ
 2BjuC6JokZRzx8/4F/nW/TLBFJNy0r6B9JlTCKR3KpoKpUz7Pi+ZZnpM2mjl6UEHCNV+Cd4xsBn
 kb19w9Ryjpk9gxfYX2rs96FijEBvCGzCyNXlklqMSrlzsjOl6Xyp9uKVuNWiGfsJLRSeIOWkTm8
 BYRN44q7bHelhEs1QrnTAXxU83Zu9/eVIW5SsGIjB9OvUECqK+nBEIIghSwIi+xqGPe0LFgAwjh
 VxdxwLdrFySBrokJl0lxNmWf7ZJ6qsx3Y23PBJB7tAOfgrbZ45oaFLmA6Yt7lR/6jFjkLG8scPa
 EyXG/Gevye/dRxu17Dg==
X-Proofpoint-GUID: 1cPpZT4zycnRhi4rtf1JdYgr_Df3m8GO
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fb309 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gxl3bz0cAAAA:8
 a=0lkDo64xaFGs7FDVTQYA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210189

On Sat, Jul 18, 2026 at 07:06:30PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> On Qualcomm X1E80100 platforms using the Parade PS883x retimer (like
> Lenovo ThinkPad T14s Gen6), hotplugging USB4-capable docks such as the
> Lenovo 40B0 results in working USB but no DisplayPort output on the
> dock's HDMI/DP ports.
> 
> When the dock negotiates USB4, the retimer receives TYPEC_MODE_USB4
> and forwards it via typec_mux_set(). The qmp_combo PHY then selects
> QMPPHY_MODE_USB3_ONLY because no classic DP altmode SVID is present in
> the state, leaving the DP transmitter and AUX channel disabled.

Would it be enough to make QMP combo PHY to treat USB4 as USB3+DP for
the sake of this issue?

> 
> Add a DT property "parade,disable-usb4" that, when present, makes the
> PS883x driver reject USB4 modes as not supported. DP altmode
> configuration is still applied if negotiated, so both USB and
> DisplayPort continue to work.
> 
> This is a temporary workaround until proper USB4 DP tunneling support
> is available in the X1E USB4 controller and qmp_combo PHY stack.
> 

-- 
With best wishes
Dmitry
