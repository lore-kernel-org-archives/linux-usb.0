Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7338E39023A
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268903; cv=none; b=fwSgU2FS0jsfMGN3AfzYLHabo0ky4vpEbsWjNwWuAwcZByNGU6Mtw7KyPymoE1fNadTGvsyMBACeYrqhTNTSpd0im8KRTiyqVPkr+k6ksYUPlDRXGOU3WZuWpLLliNIONg2/nPOh6d0NRxNhbcexInKX3nPxPlA0JHD6lgMVowg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268903; c=relaxed/simple;
	bh=qJfVo8NaWUV3he8g/jBVBQ24fD8jjxPCQ2QJcjp93xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi/rKULHTEdvU+ej1dtncfRYIPrLp3xZCmwrtGsuRTzZoL232Pp3GijUR8nTFZkI6UvTg25rrbNvtIrxLgkL0aCHbsiOj29lw/kuyjoL7rZ+Uw3lwPSbhdNkATBgIgJA/BzHivXSYvI8dprnuYDrog66sHhKr9sVICooZlO8y38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC5Iec2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqeRDBqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC5Iec2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqeRDBqG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJgh42141793
	for <linux-usb@vger.kernel.org>; Tue, 1 Sep 2026 13:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=; b=HC5Iec2w8Q0r8o2A
	gfZcfMA9VCQ25Uo/i7Hq+YU/CARRMRIHDaWAE6sGzILPk0zqOr2cDoUK9dMVF1eB
	/YbwY02vuOH3zSeyfuarRA8HACvFGdQ9ZinhFNLZ/BnPkjA0jk3IHlmdOo5DYMnL
	DrljuhRUt8Dsd+0H9kIflADs+CrOjees55BopLaJLEJyMlJT6ok//edN4L3224L5
	VFXNeaEmRI29Oh3LsyJW99LNoep1dIr6NyOVrgx7rpOBhXXd5OcukWY5soXnbyr+
	Q3NPRYh3A22ah6fqKIYFDV6sDKImu0VZiXh2uetRTv9gYY3b0qM6ryopeTCXFMc0
	DMap9Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8ftea7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 13:21:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c6645a6ab1so126530e0c.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268901; x=1788873701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=;
        b=fqeRDBqGCgzZFU800J+yoe9S/QQGT1rq+KFBxAbJJp0VPDCVBGj95WdH+UQD3Abwv0
         1aa2Jh9pIJD4bI6JEHveMCQ7wqA5AoBet9QUFpgIsl9gZS/cXqvwTqA+fw7tOIyt5aHs
         +Pnb9UVw/dh1E3IbztyUbmqCmpI4vw3Kt1+qs6gL4u7ORCBGbbzB1UgWHnCUDvpomN42
         KZHVOfHIy8M4cxwqwqRqT4BR4cgfbk4G6uVlJkKZ6HgG0VDhpBfkMg0AhJRrsobw6DhR
         ccJUMal0eH8MI3KkH1YUpmZl7jlakU24CMY2htIbGCwgAn2SC8YJpKb2NDctF920FFUj
         Kynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268901; x=1788873701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=;
        b=doejfzJVhIKcZ4IJE789tKNGnYv5kX+tRe0QkLwxK+i995urK7y3vT1WtvKlRRhZGy
         x1el1suAWk4WFA8vVER5WAJ/9lyG5DrfBrbM0FXbEfP7t+IkXneiePc044dj5O4datMi
         x2i3xlEJYwpgWsXdVAgmlC8PbWJSsp5cddj6UYs5zSzslN0WecQT/Esap2K44ywazby5
         UHW5EC5YzH/1yxQCPBBTPbkoSg8DQ5KnethIlK5CafKIQ5yfdFYVvQg5uOoctAyeDsbg
         USLJNBq4d2CoWsONuzNMGgmB59VJrawGu+AB00m3YPJ6XPU1G82zv57W9jufuIOyCv8x
         47PQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFSwl0ADFdIfIXBZOrI0nKFxkLgLzlcoC1OSlXJW6GHoGynpqx0G6SNmec6/EvNp1QW7bWjgUS0zQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ltRKWd1yP7V/Cgu9ktZWyXdU+a+uwW7ksFZM3lN5Vc7gmG6wLa
	xL54QPa4CQ3qFaqOkZnsPrtQCMTVw/N0iD5aqhLVsfekg1VCU8cU41gOQSXEl7bmszqIiQ+IwP4
	hDK2UeRrourstpNyNj2a1qXg47hZoTmcGIhCTpNzrZe7ch/yeE6IEnEZ9/dGqzoE=
X-Gm-Gg: AR+sD11yrJgRNAN2pVhnudKYpMx0Fya3yaL3XgDPzuFC9wr6RhPh+5WwMqaL5Z0BW1E
	BDyNgGcmPGMa/qYgkj9yAG0VP79vKed/lL/PlYVNgO3GD9HzconphT7SH+FLjpVKOo0fvIayHUI
	7OhMAAyjxco2oqelEx+E1rpqpFjsgin7m39ICDYek046dlsmBKlSswMtoHW5ZlYY3quBE0oqD0E
	0T5GlP6rbTlV0mmIWMkRKWB7daWA3wqgAJYEWNO1/PM106b1v9TaOZCrYrho28TpWF3fXO2bajz
	Po+AW5D8cA/tymTnpXSE1/A8WdXYRJ3sduCzJxr54J+yfAb8TWjTJ6kwf3WQVpDKsgisBCcEFWN
	I6cohZLVrinziY1qgCUf27w==
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2441007137.2.1788268900672;
        Tue, 01 Sep 2026 06:21:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2440992137.2.1788268900215;
        Tue, 01 Sep 2026 06:21:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b605b17582sm57141e87.69.2026.09.01.06.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:21:39 -0700 (PDT)
Message-ID: <773d4d11-dedb-4630-bdaf-ed9bf5dedc5d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
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
 <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HUCsZVmNsianeIej_OJ7vA459LG30wX1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXw06p3ED6zhqQ
 7dD7bflmxtHSTgGEuspZrqYPorj7APru7RHEznuqLfgKqdNDlbSG7kbGqwfkjjhF/w37Pltiq3q
 TxU4wBdVYLj/JVOuf10g7rJ6JiW9Zms=
X-Proofpoint-ORIG-GUID: HUCsZVmNsianeIej_OJ7vA459LG30wX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXzsqY9DDsZbIs
 Lodr9JnhHXCcBGsk3gC+h8LuCCWPyUekzCA7bcFvS41XEDHfBYYWeFNWus6mx7+/CeBzLR2HFwi
 zo+BbydP+vJNe5+hD0Mn7eNw2H00VWDpeYJLo/4FjV05ZhUytKqUrvsm7DrgoVThcj6go3WKoHo
 oMtAcN3h/YfwdrEeu6v8FJchS9fh9Fy5FWSQBsCS/CZe+I0ravsx8xZr6gbWJzzphS/RSOc8Nhf
 lxHTA1e5SBMS4y1g72EIN6TjbB+adaDAQhsROeP7yc1EHK1DL3Tl4QY10x4RJ2vTfbKVXD5dIVe
 M28I8B1EjHhVbw2O5PFee3HhtVBglayso7T87bTHMfv+DHbNATptVUViMLy+2WAe5bEKywDCF9N
 p18d6aOHYBM6XXTaSzMfJu41w0QR13It2YXwt5tAXIKC99S3EZYHIZU0lZlM6ZEPy13gkm1syVj
 cEBwcaVGAkksQvmIRfg==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96d165 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=xr6W56IWL_GKtPyFExwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.

[...]

> +static int qcom_uniphy_usb_mux_select(struct qcom_uniphy *phy, bool enable)
> +{
> +	return regmap_update_bits(phy->tcsr, phy->mux_offset,
> +				  TCSR_USB_MUX_SEL,
> +				  enable ? TCSR_USB_MUX_SEL : 0);

regmap_assign_bits()

Konrad
