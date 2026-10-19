Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BA8495539
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400835; cv=none; b=hL/wal1wxP9nQRLJRwiDMnMkTPZ/jAGkEgh0JBxLfjjX3jyVRC+7JVAaoR+6KFwsMOqgzf4VnNUDRnwHLbVvkCkX3q9vUlDOLUKa3lc/tlG3Qkd9F4j9RhCXY0g1ZFBic3OHitRNt/BXsQpTHuXkRSj0CHjkQKZBnLWNY99upF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400835; c=relaxed/simple;
	bh=QiTiJjMnJoygnfwW3obAIo67pZvKlE4o8Z9bHfK8l2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBeUT4yGWXxdm2+F06IvdJW5qoSGARWdYBAmMh1MkPci+clsRrVT+DfYI7o4tuOazq/W7GbzeMOMTdQBzpLRz3+vQx4EoMEpeJibXkqfJ6F5oVibBdp5LCM0vqqJomqXxHTmtqkh3aJA8cENt6D2vP47T84M42t3BadQ3BoVrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1qdvTS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW8kBTsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1qdvTS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW8kBTsA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P1BW2041961
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=; b=H1qdvTS1gEMHnE9e
	7cn+ABxl4BSGpqY0Pp1SDKiTznKs2paoLAYfPus3JWuF33vg7uXnBl0fOxfPG+7x
	Uc+CUNpGw2L05vgcun8IllXs0Jjbi7DHcRcXbrHuYoqGRuEQYez9y1N5/mXokMHr
	IVy8qfUP6C1UxBB85PHX87sty6GWV8qw0Jg435FJ/pcQojn8rx2lXCfSPff/7SPP
	HGA9nGO8GSF+nF2lDHqu9N/3VN1ZIeGBtdpHgjXl5xWHA/YcLbiqRtLhI/h+wcOQ
	xMhQuAkqeU0CDiveH9oESKYbp4WARLPRlku/HN7ubEj5uNz//ZmZRCAPDye74Qcp
	6SunjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur1xvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:07:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so32498285a.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400833; x=1793005633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=;
        b=AW8kBTsA4qwPojRoYWPy/Jhnmhv6df+DP58s7vBPY9BJvvBC0m34cb8Ec+4TmtFLR2
         a5yBmdJ28sJgCB5p52uv2LWUPKzUOVTwhhXtf6SL5k19RXJVv7LATq0/+OFKehbXgLwY
         TGix9lP4fh8h3zNChNAA4eBDa7BPrLi3KhG1wm9PBDjiuL1gfIx6GCMAhi72y0/ZWXJT
         dYanR2vbCY+ThV6IcvcVyMaO1nvs17LPBmhm7ol/WpqIZr6ujlvF1aAeX5yYhkj43+23
         baQuj1v4wbOgnxKzfiPgSp3rjXSQDh30+pdx0D6+JouLwVZRnxDlPceKFEAEBottkeQ6
         nBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400833; x=1793005633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbtKVob68BJTKeYL/uFMdxIGZINaQR1gA6bOavXivEI=;
        b=Ki5OJfxEP3JG9/Klr7+22Fb4FCzDNLwtUCkydOk2CHG8MJ+clyT082sztp/01eDiF+
         64aqM4ald0GhOf054y3lBJDV/r5Fq3/b7lMcGe83EjrjOg7Ga4CLPim1gH1WuS8b8wpw
         4pjaQnrQrj++Fqe80iDnEbqjKJdPeLz7U43dW7h8y6BZTBQWwpH4TDrlUUaIk4DGLwDm
         7rx5Yqkaq+IniB/xiM4r2cZY88qjBViTZB8E3z2kd3reMdeC+DizttETpMeAGP7EvX+D
         G+8bWk7tWHTTpTaTrUSqr3MPi4gMRBHkZdXckqsN7p7wU8SSqPZMGAYduJvXPFa8shQZ
         B9sA==
X-Forwarded-Encrypted: i=1; AKwUvBzeeRa8EGrQ7N1TBrBh0GZlHMYgS0zHLSOE2G9BnkVsjjtPCKa0iCfiZmEcqjBz0/MfJ7syOKbr+uk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpMDDpA+zfG/GTL7wvYVe9auYwfKe4L4B5N9FAkenZlU7MRFa+
	mjRnKevq/h2n/G3y6LSoDHqb/kkvfseom5AFWpExcbzquYFvhscP2RgE/YoP3u9poq1MGjyXGTm
	wjWM7m3+Uqg/CLViZjoXzb840S8Nyi64bWCL6GgV+HyCdmT8AaPjz9vfPILfLWeg=
X-Gm-Gg: AYBFou3K69gG9GFVacTYEabjlKf9Ve2brg9oWu3f1QqbzdB1kQjXS8lQLCgIOWH+LqC
	tpQE3XS8XIfGLMvS8LNTiOnAe5COYB7aNI+gpchnQ6aLG0Mn12Owg7M85BWDCslSm46h4gLkGzS
	zRTQ7jhFwB/cWcfRxRzqrHgz0/bsnVUeNuYm62MaAvMNrsGP15X0V3SelGzBZ/MopDivY4spp4j
	/n8F0GjZlO6ppoM8BZ7rCG7t80LYM0j4a1W0O1XDOGZP2oWSK0xUGMavBeLuXBlY9K5K38fS/yc
	AVtQYydMo2ifteyaaGW7Ir5voybwwds0UrmqAFE9eOFFomLuWcyVKjfDo/xWLT/3sIrj3yx9USV
	T4LfKbW4qpcPxS83A+nzE/A==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1378750585a.4.1792400832701;
        Mon, 19 Oct 2026 02:07:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1378746585a.4.1792400832262;
        Mon, 19 Oct 2026 02:07:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d66d6sm3577256a12.23.2026.10.19.02.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:07:10 -0700 (PDT)
Message-ID: <5fb55e28-b04c-4e18-a80c-2f2bb90f13c3@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXycYDuYb+/Zwa
 CGHw+nLBY+FmD8vPYboWhr2Lh4UNBFg5CM82TS/E3oGEtVNFkuYbCZMvDwbAhvsiZKgOAT+n8zQ
 g7THQ6OWHJfQ3q8zgcw9uF2WXSjFyWc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXws9HqFxcM/8Y
 IbhXh+b28WmgVETw8Ji/sa0qwamuF+kRWCaIxy110mltVT0mdEjNXYlV4uvCuYbLZlbjw35+Qg/
 EbIdGTn7UmD8M8ns03Jbrwj2C9uNHWJLSvIZiAowIWxkZZACgeTSuB2RGLOPZ2QnD6oR+tser16
 GTc4gq8+3H/7IfDF0FoH08fbTwlNLW5Z0UmcGf5zBkaPVAJu/Ac4o2qtawTV/JcMT5fw2TAkXnw
 44LSgjLlXNdvwwM1jzqSIKsL5UiKyBA7AGcTgIUCs4t/eLCnBerbHkK6v1pxplNBXwRK8POoPgw
 yENr7JeINlL3gNazrp/oe3iS9qyzlEtNz5N9Zcj8GQYZoIH9TN+tNlonZgiys/ysBLqTrVQdi07
 kvgtld5UsO6flW/QTDNzNcV7Z/TIYZSBdaKKji3+bexqVOmjD9/cKYG6EWH+n3mztlC+e5hZO7m
 nFJcQn+l0wLHY/4AVAg==
X-Proofpoint-ORIG-GUID: jyLAQQH-YNBW0erBG1Jdq2ch0rVD_8nz
X-Proofpoint-GUID: jyLAQQH-YNBW0erBG1Jdq2ch0rVD_8nz
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5ddc1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bd4qqj497OEF_3r0wXwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
