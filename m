Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF934052D3
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020381; cv=none; b=q9M/303uE4srOmBx5E9HQNTaoJSsz/tZFbGr1EZWEXPqpN9VnBmU6Jk2/cjQBI3tonvZUCrg446zj1yXvzfqY/mhS43zPUrKwSzyX2VaqNGcjnzxRUHg4SOreeM6nK0Nca+1J0YobvkGOi0A94ZvPFgUiTUKzSOpIe7xyLvL8vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020381; c=relaxed/simple;
	bh=9UlldyNWYOhvwGQWlGOcYCfrx71AurAvRd95Y/8YG5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUveYQlyJoot0SUNCoeOsVd9k+jdVLX9d0N0ICbDMmpkXqSts/C3E4LkC0oxz24DdBd4yIXM8E3FT1aKKUCw5AXPHSpeyyu/XXMbIU5JgpV83FMovl2qSOn0UmfbROWHG5VDyW8RMvt3C7+LdEvZ5Uubsd1yGpOjeer+v8gpOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACHs0bwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjM3G9aK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACHs0bwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjM3G9aK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TE26Bn1495302
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=; b=ACHs0bwlUchPj/G7
	NbQtDzX3srWCZ4FuxB3/Sg58RAj37S3qp54Jb98BzhGR7rZmOC3XTc9+H0Iv5Hqx
	IKBGzth63axI+tElBM2OsfDfFXXgYFQjU+4uwApuiqCKt+Ohk8sEr4CmFg0lrl1J
	YeVTzRLD1l2sVqslbGoKMhZVHfUZr/OGEcGa57IpblLIk1of8C2fdHZBuDXp5D6T
	U2tE4yvvnw99I+1iat40LIohoZCLbvZ3fxmvWnQbL9n0kFAPaTzwdAA0Slt5MoR/
	FEPg+jXBBu8CyRol/TCR1Ma41IY9eM5sGdeIPeLbUlGLcC7itD1LHJ+138JVrTrd
	uC7WAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6ds7qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:19:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso2640826a12.0
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788020367; x=1788625167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=;
        b=YjM3G9aKidFx80o/tBIKaV8Ep45eeaLVUppmkJMCRWdBVP9O1x0iyDGmvuciZn9Hlm
         c1F3zzC80Yuy7A8Rg9MNqJrasJOwkWLIXdhQoXHSHk7glaOkggXO6ksZSXMUhzu3doEf
         21UkxQjWA8zli4VorJGKZHFz5eUuOrZlE7PwHVKgOdj7Uch9WN6woxiOATQI6RMx9qoa
         KHeyRM1SslzQ6pzZWxcynw/4DaX3+dztUDw+8h5BOx6v+rRiaeHuJWRSMhzRhAx8ychD
         sjiaCazLXzGf3m7O+zy3CbBkPkIR3sp3THTCJ8GfiI8jQHHKgQi4CbA6Yv8IT1k0F133
         gfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020367; x=1788625167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRa4eiF0jOBt+z+yd1SxFPDbNFX363osG4c75Cuyzho=;
        b=OSXYrPDsPYpYa9whwuQ5Ld3QCGvwj4RVBJTubGpXWyYpjmvoMpLEzFF3McY4yS7ThQ
         H0WRYRNlvh2RxiSsOI8dhIZYFbC3wDY3cgKEB709pUqR+TsvL+12vHFWJwPldf5SYvvi
         U8JPzmqzBmDpWsMKFRi31D2IRpyWW/tAX6+IMekWsa2UFXLQOG28dTGL+SK/1wP5sErf
         S/1Med2LJ0vg7NGMPwvqdsJikrPBvlfpUlyJQoXlx0hC3bL+5kWMbB6EwW2Kb2sjTJO2
         e9OAXkjO1kacWTCLM4zYgiWF7SnQvaBxqlmSrYOM9IpiJ7JBnEpKN/WFQ/NZn+SKeTH/
         O7UA==
X-Forwarded-Encrypted: i=1; AHgh+Rpk/nXtno+4y/clOiUF0XGL/IbPqwnHuVkBmjHuqcKc6FmhTBaSNwlUALxLX4H2uwimyIh6L995Fe4=@vger.kernel.org
X-Gm-Message-State: AFuF++moIKbvLGmqhaAMX1g0vUqQPQQ1SxWA7/Xtqcj0SokkfitlvkY5
	Stvf75PWP0A/RO53YbWxC7Dvo/v7RTWwWynuim7DLUxoaJk+owMBIr71HZkCknZwnQBbGlCOhEk
	g/1LCmLx49eLAfrjayKgF7H79/zbFWrQK8SIw7qgQatcfe7tjwu8HlzxPb1/5ezg=
X-Gm-Gg: AR+sD13sYbd36CRzle9jucVLzmWSz4YF6VIvyvG6o+BzuOgDOX3+fyjUpn2N9ry+Tsd
	3jcNA3L4AU5U2wsTrpaswKYsWD0K3l8Afoo4wOAP1CvHed4DeeRE+2swm9sm4w44W9qlrpp/PBY
	KUjeREXOMNzOBfRs6pMg09O0/BMWYYsv/0r/PC59Joy2BB4XK9WPKaBYe+ch2A7q1EILB0b2KVk
	InmMhIqCyP0lQymEmNjJikJxzvwee4HJ6m/nc7bBkPjvEvy/KFZ9J5jvDPWy7nmQqfPp5Y8b1gq
	14B4fyzZM5XAbnBrXvD+f2m9jLHEXNrI9/HzloLX1IMuiseGv+7gZZdoBG9GTLLQ0UUeqFZ6MJL
	7uK1WVqNowiVr+eWaPDKEBQbs5wJK4WhCCXFK9YGKIBbWFKhUFrWQP/w45WYtAfomLv0=
X-Received: by 2002:a05:6a20:72a4:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3d3ae4056c9mr10116770637.24.1788020367525;
        Sat, 29 Aug 2026 09:19:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a4:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3d3ae4056c9mr10116726637.24.1788020367068;
        Sat, 29 Aug 2026 09:19:27 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.241.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f85fsm1839168a12.9.2026.08.29.09.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:19:26 -0700 (PDT)
Message-ID: <d801ecb2-587f-480a-878e-8426239b7690@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:49:18 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Thanh Quan <thanh.quan.xn@renesas.com>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260828184212.395082-1-marek.vasut+renesas@mailbox.org>
 <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0MSBTYWx0ZWRfXwSSRhG3TvPOj
 KW996C9cgNo7vpX+T7/siXsILY8cTWvyoGAOUz03UYwCEpESS+HVpf8s/5xH3Dqo4Z13o0HsETL
 jLz1MOTlWIRjoH+fRW3mVaLS2ZFgugnnZcK7Bg8sHzlLekSqiTv+CkCScldD2sp3OdVVAHDBTcQ
 Ey8A5Pj0LGliVpQUko+i7ExijU5IhE22QN+9i+NLKx2gAGTtZv75JxZwDnwSovy8l+kTLFC/Od4
 QdZrGcDLgrRkO0d8+a+x93/MwM0YGElFRE65ZkD7srNHNdoHs4pnqg0UBWsYhZr2PW/xqL/u2qR
 WPQpeME/7yuw2CFaNortTpe7DUBLo8iwdYljpcpLS0Js/Sd4ACI0h96eAj+EDhJDRV3x9/0HjL+
 Mh8qam2L/NYD+tbHyFBNHCqMOkf1KBE/bG1pruj2aTKV364FX+xxu5xqdmvj8WwM5c8A1FfzStH
 FknVaMMcr2Durwv6o3Q==
X-Proofpoint-GUID: EY-iFpxZt22DVlPZ-scVnQjc0V8z6f6o
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a930690 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=PZ14JaS8AzYbITig/tPzRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=yC-0_ovQAAAA:8 a=b3CbU_ItAAAA:8 a=9smufsHQ1aYfdmuKAZkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0MSBTYWx0ZWRfXzqhpqlRtA1ge
 edhSjc32E3IZ64Q5iBL90E3Xwa3IUecwNVuXxPwFLt7433P1NEytAamBT7Okszdl40hgNSt4Vh1
 Q7hntPugLbSf1d+R34IW5JwKSNHr3Jo=
X-Proofpoint-ORIG-GUID: EY-iFpxZt22DVlPZ-scVnQjc0V8z6f6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290141



On 8/29/2026 12:11 AM, Marek Vasut wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> controller with glue logic wrapper around them. Extend the generic
> DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

[...]

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07ce..e8586c40d5006 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -71,6 +71,55 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
>   	return 0;
>   }
>   
> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev = dwc3g->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	enum usb_device_speed speed = usb_get_maximum_speed(dev);
> +	bool usb2only = false;
> +	void __iomem *glue;
> +
> +	/* Wireless USB is not supported */
> +	if (speed == USB_SPEED_WIRELESS)
> +		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
> +
> +	/* No USB 3 PHY in DT means this is surely USB 2 controller */
> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
> +		usb2only = true;
> +

Why not just set the maximum-speed property to "high-speed" instead of 
checking for "usb3-phy". That would be more clean.

> +	if (speed >= USB_SPEED_LOW && speed <= USB_SPEED_HIGH)
> +		usb2only = true;

And this check can be removed as well if we use "maximum-speed" property 
in DT.

> +
> +	glue = devm_platform_ioremap_resource_byname(pdev, "glue");
> +	if (IS_ERR(glue))
> +		return PTR_ERR(glue);
> +
> +	/*
> +	 * The datasheet describes initialization procedure without full
> +	 * information about the registers. Therefore, the source code is
> +	 * based on the bare metal code shared by the board team.
> +	 */
> +	writew(0x211, glue + 0x26);
> +
> +	/* USB2 does need additional register programming. */
> +	if (!usb2only)
> +		return 0;
> +
> +	writew(0x11, glue + 0x81c);
> +	writew(0x0, glue + 0x81a);
> +	writew(0x1, glue + 0x802);
> +
> +	usleep_range(10000, 20000);
> +
> +	writew(0x0, glue + 0x802);
> +	writew(0x1, glue + 0x2a);
> +	writew(0x1, glue + 0x81a);
> +
> +	usleep_range(10000, 20000);
> +

Use #defines for register offsets and register values like in 
dwc3_eic7700_init.

Regards,
Krishna,

