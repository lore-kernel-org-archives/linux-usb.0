Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C63793BB
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 20:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785098186; cv=none; b=WMBAqXnztS/TKti5ckpFbyJoivV0ji+6p+apWrhgoTzhJvty/Z8W5LO2IzFNZxSUCDZ1pPbmGvdOzUd9bptbIWP0UofslltR6H4zpxLLRbkQilqWzN71Ax7q3o3ivkn1QjCX4Oa5Tk5VRUjZR9b3PJ5dY4cRKfPkpWhYIVHB8pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785098186; c=relaxed/simple;
	bh=7rv6R5YJcatIW2SWDqFSRa3NtOGxg+0Vw7PYaTlA61o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChwyxeL+pq5iUy10wXM1ZPDMR/fWVrI+Lr1hJO+Uxo2yCdxl+WHCMYPkxSLonuqdSN/wylC15Bs43fq+UA+Jwa8aLvPZgtLny8QFFoiAsfuX4Q+37Swtr125didF3h//8c3+uGdrejX2zHqsgkhoY3BeKtguS0EJr9oJ4vYRwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9ptAdUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDd7heKB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9ptAdUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDd7heKB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJvHoh1536908
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 20:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SqkFlTAif5bgt5ylvluZMohK
	o/S/Ct196CfCN2FqXGM=; b=R9ptAdUxCT12Agi9X7rhDpAzfW15zvVnvGLyC3dG
	rO9wfllvlgyoUm82DAU2xUdM9q4xOy9mjkeZBw1IRgWj9ouHq7WbcEE2oE5qbPE4
	6KoQNY6cXiFWsHDhphiJzB8lwIJnqlKWUg29/MPttIxxm/RyGYS+XNiNqMb9U/1J
	Ce2O26fnvAgpXjp9sCn6UBnXgDu7v/QIl+7dvaz07hOmRNGRj+HdAryouiwOi4Lc
	pMHA60BKR2oMimNwsxoudByvlzfrDYhpuC2/yq4Nhhh9ed9A/8j+puvi3DHWED3a
	SDIUC6Sp1PucNgZlisLEfg99bv3TNN463cCd6VAmgDjeXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn41ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 20:36:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso20196001cf.2
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 13:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785098183; x=1785702983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SqkFlTAif5bgt5ylvluZMohKo/S/Ct196CfCN2FqXGM=;
        b=TDd7heKB4IODYGkMhckKAsm4mYLJNUeY0lsuGCW6DSapNdAGz6xr42JCetAR9kTzjT
         DuBWoHqYv2aZ1i3O+oHIfQKEcPZJMzeNSG6PXM4pnFCTshhjP7i2d3ZSzkc7YXbgLWNW
         ajXv01JdNUYOVOmP53vHcdTFugJyxgvaW37skprpyIR/HrH1ep1+WgVMrylN4leetXWr
         8gFlCUuefKK/NwlWLQMW2T76JTC8Tk7YpveJoKhV7brF4CVe37wDmwLioJ4NCqEnOLJE
         KSfRrfcZ1QYaDSIfuoRXiSpb0cVAKSrCjjW1m4oKd97AQYvEpcXT2VpQlfYHTeHiFcd7
         snhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785098183; x=1785702983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqkFlTAif5bgt5ylvluZMohKo/S/Ct196CfCN2FqXGM=;
        b=VIUjk49VKKC0FBkzosYVq/JhecuGMZQB12qcg4JiLLKfGV+gPtWY+WWQJ+P4FG2QDH
         u81HJpGwoHHhPHhg+5pdWzo8PcWNOoFrLJcaWTFin2pVRprDSaGzkbd3Ql8DmCbrsyyS
         W64tugvvkUbMAshWIsRyTTglIXmJzxUxmq/Ssii5xB2+5fGzmTZT7Ia2Vr2dEhMnLO1E
         ZP/bCVfHHjJJVByyNLbq+ngqvDX33rObG5eee+y4+BN3x/EoXL5KzQwQjF3vPkWyJnWT
         rjMt16MptSgD20vAfFsNOAIykgEDur8FAKSuoVmYlWdsBKpjpyIdKNAXAdWUPcaFG2tJ
         GFkg==
X-Forwarded-Encrypted: i=1; AHgh+RpoDzf72tYgaB7tkaspxdUrWpIcvbdjF9lFD/yvrNhpu5WnLtvxYFw3tuEW2p3efhBQbc763c9L/yc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn7BaInp2hRiFNkoDH+SLR/azra1F+AM9DKcvN/7++nIlmPWIb
	AYlSOIkcMCnK956QX9pPuxGnfnf9ZCfWkc7Zl6IvE6yxIXOL4r5SBHCkubQKc0ZEblcqHKzLULd
	ajPiaA4kN38NBBbT496WCUyghcOnmyq/27y791YRHOyfm0j04E06s02pGl7kdTME=
X-Gm-Gg: AR+sD11bD0F6CVXl7SaiP85GbEMVaGH3O6e9Kq/areYpVvEisMwfgCcLHdsfUPbP8py
	l7H9sElktMruTmkdszAlNMe9jWGvfktQ82q8U97c5oIo5Z2WmztwXX+ZqpfoVF+kN68o9w+w4kj
	hAHbzFjVJNwjrEDzfXzK3HYoKSC0Zw5MqddmfcUahMCvxNdTq/57btl0wUG1vy9rQ0kQ409HBTH
	ddsqt2znCwoU4sUk3YprxXgQUUxHIHxwE1Lq8/+YJ+c7oSb7Hb1ZxVqvNKAgKiR2n7PWD7I7ydz
	QZCeNpF9ZlXz7eLgA6xfEA5M1ba9rzP7wIrOio3WHMCHkK8Qo+ga+/WRpsOgbkhK0fDso+hu32D
	DYcTN473pQAQYygsdgVGWIrqmfN9BL1QFnLMDdtR0XFe0LKpOyh6ZD3ohSr1NKf1TYf6j65sNsh
	rFXV0Qk2ZtDdlajg==
X-Received: by 2002:a05:622a:1aa0:b0:51c:25da:903f with SMTP id d75a77b69052e-529a8712686mr69276971cf.59.1785098183164;
        Sun, 26 Jul 2026 13:36:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:51c:25da:903f with SMTP id d75a77b69052e-529a8712686mr69276851cf.59.1785098182768;
        Sun, 26 Jul 2026 13:36:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f221873c9sm9690911fa.11.2026.07.26.13.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:36:20 -0700 (PDT)
Date: Sun, 26 Jul 2026 23:36:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Message-ID: <5zgabwyhxu65hacpr53cwktwe4npu2ndzgvt3uulja5lejnmi4@bj4uxp5wlb7l>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-2-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-2-f32ea6c1a318@oss.qualcomm.com>
X-Proofpoint-GUID: o4z9cQPiR-YkbAOjZJAl9SRbfXF2Af9Z
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a666fc7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6jJYoImRxmWk4JxjxYMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX0yhjmob+5sBX
 QcemmGt3qGVnCrJOyL042EGekVjOr9Wl7TYSl+7SeLSgIRSLa+JJlaow/0xm7UWJiFB0Qn8Xfq/
 wZkONmO5059u/TzH147Njzt21ollNmRcRm4J081DILe17pkpll+b5GlfJMjaVVUWDSvknemYKkG
 e3erE222P9xbszPnekUTqSaqiumWMzCbsE2NnYntpVXP89iC2fTet4QbyIkOhhd+RALMUvU/Fo5
 3k4f7AYK7AAc6+V4cEhgICNIhH0IU1NZNDHOILEELOOrwis9b5i6OiFRu78V+niXn2Gdts+XmhG
 XynWtj76qGglz+0ZhJ+EQFaiCna7NCKDyaApwDbGPT/HnumGFlhjPLRjSuixim+JbhRwwSu5EK2
 v73qb83XpwiZm04Nir+5hCixVNVDSY35vwyzGFOjNqQLL3bESFAslEs706h7rqAoSZGc7vb3os3
 SK6cjWronkNb/lL+WwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX5+ih9n38QlSJ
 1tnjNUp/3ozcPN7NVZ10nS4eRR4bSNjmVWbNYhmwOolwhfjbUYXGnvQk9WkkFhjghOIlnKaa9wY
 /fICC79khU+ssHquSuEwFokCCsoFcEs=
X-Proofpoint-ORIG-GUID: o4z9cQPiR-YkbAOjZJAl9SRbfXF2Af9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260209

On Thu, Jul 23, 2026 at 04:09:05PM +0530, Krishna Kurapati wrote:
> In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
> required to know the type of phy (rather than the operating mode).

Why?

> Add
> support to cache the PHY_TYPE and add the following helpers:
> 
> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

PHY type is usually coveyed through the PHY cells in DT. Why do you need
to set it from the driver?

> 
> - phy_get_type() for the consumers (like USB controllers) to query the
> type of phy connected to them.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

-- 
With best wishes
Dmitry
