Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B8325483
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268680; cv=none; b=FD5ftxk50e9gIvDkSCIgWi805YQi2b8bzkbZFTocSgIzBQ1ZWBAFa20ZIcy0yTlb0BGeoJx7NGhRXEJiPxNjexhDT8Q17fJTLDkiw7ZrtTio5G+Vkb2HKvgvr69oo5w083kuiCwSzIahVXKEx4tmM7zjLB2GL1a0la4+INWFeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268680; c=relaxed/simple;
	bh=vaanBrWBtt/K9qjvJi2FisIQaJGmMcAWPsrvdyQ2gEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyYRBM6sIH15eT4zxfJjlhPA6FwyGm0mTKuSzumra2lSbLznMxa6SILcP5jHFLdUDdyZ39EHa2HB2uy+9nLi/xzqhwDFYuFB0rhiujMJ4K12q6ZqAZkz0Qi7kPs96lj50YEUQgHjJ0U8dJfmuhoyaEIZCXiepJGFiBVG+Ov7HOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc1AAPkC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfcBaIQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc1AAPkC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfcBaIQD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJwP1136749
	for <linux-usb@vger.kernel.org>; Tue, 1 Sep 2026 13:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=; b=Uc1AAPkCq8yaPHNb
	K1v5peehXwLRGrA91Ar2dWf73/ZrMNfIqgFj04Cvkzo+qj7RAbUoGXUiYuQb+CD4
	Fm2OxH9BmijnVtpvFkMq2FH0i8v3K7c+Dy93rnZGxUQ9+3u5pcKSq6+ykSWt1kMZ
	3JGcj8C8tmt4+r1lRDeqOm0DHNfraXlQeSqPXmAdzZA5Y8xpIT0nZx5dWtsVjbVy
	dsLzsHJhdJ7br9l6Q3a8q1loCUuaYlRFwk04pSiUCQYmFS8SbH6RT1NmFs9E+LiN
	HYnH3v09g4IJiwaLgwOkVMPZTWTB47AhXEgFxgw5LIXZ3J7iQgCKKRlBz2fxkj21
	RsqITw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsj0v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 13:17:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso105751137.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268676; x=1788873476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=;
        b=PfcBaIQDRMz4463xfzKr+VmNR0WNvf/U+y0O/t05NmmWL1OIrShtMBqtcZr171K4Ho
         Vs83QWcCVbJX4n6R1QTPGf2eOXeO3gx1RzlJTiKe6fJBUesuonfPKsk3sRnCrI2Q9TJU
         tJG/1qpGzRsrm2lsXDik0mNgzY5n0Msp+iy7ybhZybVq24CURHsdt339ABgwXcxgx7WA
         ojAsvgQh2eqKX9G1AZmKtrYwGJxBSv34cKHgc26OvzjqKgC9VlKETzadrl3qdfYzJ0rm
         SLRhzdS35SuRAGnXePo6vNh1KZ6vTrTHmpCeGaq0rFKchiOP2n+6ox1sWporJqeV4ELp
         6NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268676; x=1788873476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=;
        b=fse2zK/WUhb72z/vHXBfD6Gid24rHUH9YGIO5ylxG/CoukUfYrpMn29jKZnOEgghLs
         LrzLEnRyhZQ3dw9LXnAKVNOZYkNKRbLvVQ+2VBGMXcfUSDBYFwXOxi+/BX/I4kRizHpC
         xGqz3Ay5keoK7Yo20jf5Qr3SjkuZvw8HxSWoARJ3x11XqRxe3u1jzoFxDsFkr/WbM96J
         hPvSfa1DyY4CPBHrwqspgfvdXYTuZAAWZcahcY7QbI3VLH4E6Jq5AUAVlB1hHJHv9I1H
         pQHoNWqRgm6nuyoNY55yXFTkCoJljJ7xbbQQM8BXnI8PQ/4ZPgE/IPb7co2CohOmrTex
         wvPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNLl24imyWCzDtNtpfGWD2I1lYV8kZPuZQB8EvfgbQXIkMfs5OwQafid/4LTij6T2ld88BJfO2G+4=@vger.kernel.org
X-Gm-Message-State: AFuF++lxb9U/hVlazYzYgm33p24DZfVY+Fd/2D42nDC/jXcEJHT81Msy
	KC5GbYJPb8QgC7Zaxcnx8EW+zIedfGGbQErocp9a8KSrLtHuMbQV88BRtPw5HQQUUKk5r+xF0h3
	YBE+uLwnvfDOaO+6slU676zLQZkHM0HffDtYLmdbIKju1/drzo5+bc6XYpaNjNvU=
X-Gm-Gg: AR+sD106xKyfN4SLqfGu0zLpl6qjHXz2As6v2rOVJ3e2jBhrDoTnJ/f0vNz5NGOYfX3
	sLU+/Cwxc9hXqu7rGrurayIh95nW3TvpeSbQqTht4oPLca1ynB8Cr5/JKew0O2BjK3tnOAK0zi5
	Y8gyvFRLFZnj/JzD5p+W0EJhgHp9nZupxxNZpC+ncVpkZkQpstQvdbktrp6rxuoHJgqOKGlPouV
	exd4xeMrgpaZ0P+hImoT2ySWm9htCjmFq6T+IphN2y5645gwYXhwLgIy+Wk/pCxguiksNvjvjsE
	c+7FH/yNYylJTCfZZBM7LtfOSAUR0+q1Cc/TilARuLjohZV4YobCt5o6OqeJqOMzBlENLAQWkY8
	oN6C7PjScalnFms8f5sHvNg==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4422339137.0.1788268676414;
        Tue, 01 Sep 2026 06:17:56 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4422313137.0.1788268675877;
        Tue, 01 Sep 2026 06:17:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89d3e06sm2866547e87.26.2026.09.01.06.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:17:54 -0700 (PDT)
Message-ID: <5e7cc36d-73d6-4040-b62f-88fe2819ab1d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:17:52 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Improve error handling in power_on
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXxC5TOTcm1J4p
 D9uFJT2/gaW/FFFBwX7cmkVbIenNcWpnaCBxWlhQ3ubBqNuLW2nUQaWYtgy0Z3LNqVzvmqahk3I
 jOduHjkUfyiF8uKkpqxCXQVNuuSDkg8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXxWznJgE8whxO
 xMXwIznYHf/X50YgsJmFOZsg0VeVjDa5Kmta12CFDKkoXOPhr4i1XGZ5zl0YmSCP1krR4pas30c
 kK/DNH9uU/T0cYR7ZocOVqvY82TVbf1lmazCrteR9suwSDHW6KZiXS3Ap3Ktw/5NhsklnwnK+Tv
 aG5XQgn5zr3jqvS3vGHnNF5fCDeTeIkZVPXwMiiG7WKldVwJ4pBz1yeIA9Z7bwygejBmVspDUD1
 N7pLvVBZ3SvsOLkkAxBs/jBaLrT6LOMxU+bd/dSkbjVoYDSP+gLLjRNCFqJF5IrBy9mBcj2sizK
 8clgvf/UcP0RiMixVkjPwtJrIYvFuIrZF5+u6O2jZdwmH/2NBmnVID5P76HeRVohmX4uJe1W9TC
 NdYqxLaCwOZaAObJRv8ZNVLvNwiKpPhkROu0HD7CioTOCkOUIik8pCNKTC8FgNmIkaa/yx3Mkw5
 izBnjZc5F+yEI9mRMLQ==
X-Proofpoint-GUID: cMT_Bdaj1R-5TMvIPcy-8qJlPSYNhWjt
X-Proofpoint-ORIG-GUID: cMT_Bdaj1R-5TMvIPcy-8qJlPSYNhWjt
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96d085 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=xCqKcKfuVhzOl_WxAlwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> When the PHY fails the enable clocks, it leaves the PHY out of reset.
> Fix this by asserting the reset before returning the error.
> 
> In addition, language correct the error messages.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

>  	ret = clk_bulk_prepare_enable(phy->num_clks, phy->clks);
>  	if (ret) {
> -		dev_err(phy->dev, "clk prepare and enable failed %d\n", ret);
> -		return ret;
> +		dev_err(phy->dev, "failed to enable clocks: %d\n", ret);
> +		goto err_assert_resets;

This is a single-use goto for a single line, just inline it here

Konrad
