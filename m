Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626B32B11A
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604877; cv=none; b=Y4izD8qIlGetbFmxu97kLW6SMSrcGuHlXBAY21rbcngEgneVn3J+WLkeKUeEOJ1Yd9LJUoA7DJVyO6ty4lLYAHq3Zo37Hmvp0S38g35pCCzdnRk0XvTxV8TSOVYTz3GgAvdRusS+ZXXRnHQ6HiypPxccw6a/nMeqnx+ccYYIZ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604877; c=relaxed/simple;
	bh=66kDW3XPA/IVL7H/7ZZz5fJbIr+LgzIbNasoSYOmMx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDXIvR/57EqJjhy7aZz4ybRH2b/GmlEffk/ZILDIIso1wi2f9vz8n533z2n0642NqdOOALuMirWWz7Go979PZQrUMGmFh04/RlK/VSruIFQkZCWYynnUZSkm2zT9qBLsyg/cOnLofWXyTtVQJrvxBUW8I4sACDkj0ges75kpAYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgAAYXhp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzoZCyyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgAAYXhp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzoZCyyR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNB3h1715982
	for <linux-usb@vger.kernel.org>; Thu, 9 Jul 2026 13:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eAxguwIfoyTw9d/WwpSbWgUQ
	k1tijeexcOmhi9TjxW0=; b=PgAAYXhpNxfiw17Kyy6OT6sEMBHOhNVqJ/+fWh3H
	hpM5ZDa+um3yLqJPms9GsX0aygTGP0cSTugFThNn5gd+bRgjftUCZEXDzspgoAFH
	Wm94ZqJ9MVsYYkQkPbZitLlZIGey/knGLrwLxZtqdQ7bME5w7niIk6zK98TVFo4p
	6c5imvbl1FeI56EvwtQmkc6Rps62je9MoF9KIFqteBJESi89Lx6O7btWtK3pd6U6
	xydcylUittTloDi63SkEH88VllozGr18MDIrmH5CLOFck7eibvq4ZhNBA3SFlpcJ
	9vu4s8Za6J7Y9Kp8h/9APGAO/2X4N0zkVH330+43x3myBg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vv5gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 13:47:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73850dfc198so224919137.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604874; x=1784209674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAxguwIfoyTw9d/WwpSbWgUQk1tijeexcOmhi9TjxW0=;
        b=GzoZCyyRr4Jj5/Fm9PyxVVQuVorqSquTjYTuXwGBV1/3uSQDrsEOIx5o8YaDpGbvZ9
         7Z17fQpvQjQmeng3yIyPWuY7aZS1NCRLU8Li4vaa2dCr/vT8nVRrfc8ly67O0rFT1vxz
         c958GrDyTvyHytmZDTteGIFU+V8xtxY+ml4ehmkDhi01QJh+KxHizhv6URhdUhpIRfrr
         WDjkrW/uoZUhRvtAUAvD1p9epzrK3Gnr3DeqoufTkwpbA4Bvzkxu0rF1qZrUmSYVZ5eH
         IlF54QYkwoP5V6r6jJ+15yMpvWwufLxPAFhEZrZMAl4WA+PlF8mFDDLJlUwVXtUSwW9/
         hQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604874; x=1784209674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAxguwIfoyTw9d/WwpSbWgUQk1tijeexcOmhi9TjxW0=;
        b=JaDb83iz8XX90bXaxEhw0vi1WXB1FV+xex16HLVCVa2Wy79Dr2cTOn9i4+6rQZKJx3
         l+ZHnYVFwqPD9pqG57rnKnIhC/20zvy3JtZSe1NLz6YhDJfet+7alek4WU1XBR1FZPUN
         I7r1ixXs/i6w8Xi57N/Buyou6UlUlEEePoz/PMsIrdU/fjQTWXfp2/jA7EmiVMtDIPJN
         6IPEKC2jAwImkRPOLbo31sOpUjQcC1twR0SE/q4OeTJXrdUtTHoQaY5YjNFgusyaDmQB
         +oJZb0chgCUhk4bYtjEAHK51GJyIO0quy5NeZ5s+Y7AJNxBXV4rQxbSs29p3rxabcmCA
         oKcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeVifsKTP3bX1m2Bolx6DUKIaK0P2GG+MCx+I3OtqQe4kTYUa8kD/phnwfg5tAAp+S1dzTdXbOxvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJjSY63XDErEMt0Jo3Kg6eptLHN9VojWpDScR7Vue4hjS6n6b
	r90vzSUW3E7krwzKf4e/2NcrOOwDWH3oSAaz0dPSS7oRf3QOHuirWw+yRYJ3n1xWD6XKka1IDT+
	kwCiNw7LW9Tj7RfPzpjDdKtSHrBtEPf43Cdit8n8jnRIS2YNcHpRCF7E11Sx2QPQ=
X-Gm-Gg: AfdE7ckR325oqVcQSy5kfnt6gx8bI462VU8hXcRh0NPWF+CK+T4LHQN8KGVzOxcKK8D
	VqBb2zKGpFbcIhIbl33HiNJdLaidUJBU5mlQ9hx2swTwGl3wY/vqtWOKnV77D629tpFpVd4fU4j
	bv9AlYDrqWDOI2A73+Ug7PB0CJem8Fc4pUZc5zQtJBF/5vs1wiVzCpe+t2QwrbTH06lZjgVzfux
	F2FhIfiuz65A8wGTRynrNuyhdA2eWEDnQTi4RO3X141LCe0EV7s4sjSMMb6uzaybewo65VR16Rq
	c/7Hw15GmYPitYn1Wz3wuezDQiL1rk/J4w0b2pOskO30TVo5UBnR1N+bPHwwcvhRkjbI9TiVbei
	0w+V46h+dryrOrpn71dU0VgIyUmeJoH8lNbik4WW7yVAhKIRTGSXF0NCowG1EHGjk3NZm4mjr91
	Tn/WaGH2JniBE57hzaWrUAlxFl
X-Received: by 2002:a05:6102:4489:b0:73d:23c3:3e25 with SMTP id ada2fe7eead31-744dff69b7dmr3980050137.27.1783604873640;
        Thu, 09 Jul 2026 06:47:53 -0700 (PDT)
X-Received: by 2002:a05:6102:4489:b0:73d:23c3:3e25 with SMTP id ada2fe7eead31-744dff69b7dmr3980030137.27.1783604873071;
        Thu, 09 Jul 2026 06:47:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701easm5330961e87.16.2026.07.09.06.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:47:52 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:47:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
X-Proofpoint-GUID: rgjrLnLDyFYDjtT6UsiY7UsG7cv8YVgv
X-Proofpoint-ORIG-GUID: rgjrLnLDyFYDjtT6UsiY7UsG7cv8YVgv
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4fa68a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=HXgzhWCI9UixiBSUE-AA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNiBTYWx0ZWRfX1PMDevf2qdmW
 eDF6+oyv4O7Xwb5+zWZKy/cvbeETQn13FZ+5bsJB6bEQiBEcY/GChC+64pwNzx4vt7wgzvxEWAY
 i9RQocTxi0vzt+Jk1kh2hmVzSp+2Ai/2FruUfIKYZL07SS+BZYjx/PD3eTO2KiMx7/npX/VXlrg
 HvIqIXKn7AVFEf1eAp7Kv82yCqkfXqPXKxpDHAaS5MFU008V80UPt0Df8cnaDoP6Mq081bX4Jc0
 oX0P9TGypHKyjptPALGraT0dM3N30RTIzmsOHvijWcdfyvGRM2hbCUNTRqa5uKQJQfmVc5x9LeC
 mvkBSWC2KBRgWl0ZS2yVJxpeBhI9aWiyHyqHUISUSpCZ4sAsiiotElF3jfchHOOl35Ij4I7MpKc
 7TvleydXrFkZ9CXMiyAq1nHd6tN57Yg4BIWWBpBfLM0zMH9wyMnDfWLVD4nIIwQPg61dHo5T4n6
 wQpGq4LpuI/7+DgGjgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNiBTYWx0ZWRfXwLUOjnpxpb8z
 1u+qvPfu0JXVNAM0ZENOaEWFM/9I7PZ9IgD1plyhEOS5f1VOCVr0CvjMm/X2PbdizJ8lVv/FijS
 3wVGLoJMzQ3PUzKC9olJ7iRteNgPrFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090136

On Thu, Jul 09, 2026 at 02:22:36PM +0530, Krishna Kurapati wrote:
> Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
> or not. This is used to modify dp/dm interrupts during host mode suspend.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 8201656b41ed..0c6a839be82f 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -152,6 +152,13 @@ properties:
>        HS/FS/LS modes are supported.
>      type: boolean
>  
> +  qcom,has-eusb2-phy:
> +    description:
> +      If present, it indicates that the controller is working with eUSB2
> +      phy. This property is used to modify dp/dm interrupt configurations
> +      while entering suspend.
> +    type: boolean

I still have exactly the same concern. This information is already
present in the DT.

> +
>    wakeup-source: true
>  
>  required:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
