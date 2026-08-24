Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114493EEAFE
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562074; cv=none; b=a07RSUinE/BuQt8vUY2jhWo5MsumtjNCJDK4fVaPCaSoqrLsMLzAdqwqdd9p3AigPDikg35Zq3TEELBrm8Li7tpasxZLYF8FlCI0GH1krvlCaBmQCaXgy8DHjOTscoBfbzA5mBlBlujMIWEji9VooRDppBcYI7MCb4HYMgRgOno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562074; c=relaxed/simple;
	bh=w5+J7B2KEp+CELJiqcP8nOu7rSEfk9xpU6MwU9YptYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Go/aoQbe4oT42n3GJ56hq8/ux5/W2B35dmqiMOOJCVKFd5jCGTOQ/r08n4NZv9qvig9Ldq06un+Gu5MdZqBEG7E8nPkUy8YA9vENtZDzVrIeqz6UW/bFktqScXsxrPR7wRvCSS/wG6pv6BxvWarTkILRuO7YJgIMbahDbqiaMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pz0t2KBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfqqWRff; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz0t2KBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfqqWRff"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5Rw7M1009223
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nq580rhORxpw9+EdKXXeZOx42xe2bsQS/OhlKVQqL8o=; b=Pz0t2KBSlVnjmoRr
	Mo+GW7tYI1V2/TIPqrGRpHEYseGTaMRVM95Jy63dASalkzZocbv3/XK2qxw0zirr
	l8mkUcNuvWg+dc3H2oq+D4YzhPlgg380mzt3MKVDjFWE2P3qIgUIT4EOmMZNhUSU
	almrcW/CUOWNBzlsTaEGUkeDZA5cnAn2t9m6jS7P9e6oDpv83eJpLY8HioKE/ZAM
	KOcDtMRb1yR2GMML8QokrX8MlEf1/MyivcfijafNHguKLZXQRbyQBkHJGpX+nnTf
	x3aypLqUvopI4nPuhxkIfhZmC2bxjcpCvyNNAZ6OA22FWgYn4c2hpceiM76LINvO
	Y5Yx5g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhe3sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:01:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7674812ca4bso45775137.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562071; x=1788166871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nq580rhORxpw9+EdKXXeZOx42xe2bsQS/OhlKVQqL8o=;
        b=jfqqWRffgkf5wWYiZY85+stseTpUmZzBhbZ14sDxbraZFn9ii+MJytuQNc1tUfgH93
         a10G2rSzQfX9iM79D/TQtUL3ZR8wDurXaxCRftnSxKi4S9ACQpMfZ1mmwBLmojUhyjnl
         4Vf4vd6W6H65twH6isHw19kkHEjnjt0H7l0eS9HHtoW9j+dGuKWl0aENOoQ9mXWjXNoE
         ADU99IJClUJH/O+rHmimD0KaNA6JTlTY3wjNOVWeTVKT1v4VXDDACNBlRFxIMRj/ixJi
         6nIas+9EOqqS9WGS1qWPcnNwNnm8LVfB6s4jcpjM1l4xzlVbmvOcGjeaiKpN6GSNVqPh
         V30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562071; x=1788166871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nq580rhORxpw9+EdKXXeZOx42xe2bsQS/OhlKVQqL8o=;
        b=kCThSu/VIUXzDJ7B4tGAYIXVy3WnD7QXFapNAr1RYbCceX3ulffikSHBKVw0pmkPK0
         i1vqKrJJDQiK5wXiX4oG3ElFM0otHm21m26+elXHf/4AMYjxKJbnLbECD4+N24MTkdd0
         g+o53YmLKCHfTK1q/nHECyJyOhu+pnKpiYULCqe2KHYvxcYSbSqDUItGkSST09xyNf26
         YbE0fxe5cl/WBtJxsM1Bq4cXgeDF7h3uPQXCJrEVYL7hDKtF75a9IGXBmn9gfJMfWCw9
         OSDF6gKZeoQ5bQvxzvYo8EEk76FcZqqibCvub4xiP5ZCyOX7eyQGZ3p4h3IUSG73cXxL
         ty3g==
X-Forwarded-Encrypted: i=1; AHgh+Rr0QaGwk34/hQCh/TUUolqNiiE1tXGm7xiwvUeN8Yy8yz+oK2cnlN9vjt1p1yTNSzxj0a1fNvwV/qk=@vger.kernel.org
X-Gm-Message-State: AFuF++k/9xVIPu4Roa3m6+IOMnyAB78PzN0TEE3KMob8DB9XSnBPqdVA
	pDy7io+w9IOtSYpnzSHxc9rRWkfRrGUk+01Spg5I/BTDAIQTu8y1LrvfcDA/pnEJ8T3BsNR3tsC
	kCp1iZkIEXGFutYFx8L4/sw84kG33fiaz5VnUvvGA/Jrax++RdBYfohNokb4aczY=
X-Gm-Gg: AR+sD13ooUssrZ9ttjhgt0cdCZlzUVrGcECJHogp5jhUHpkdKxDezAMgT5esb20Ncf6
	BQBHSC7ROOK5FStWTmfZQ9X4ZK63ISJWmqvY7KtGx4rFyM8URKdm//xezSVKG3cZVjCvdKidgVm
	8E49KgZurwncBrIAPakDfX7CMa/fkLWNVcR5ra3aFrRUldYci++T7v3kWUHSdI79Z/RIfhK880v
	UzCwpxMBsfqBKozWWwVDA1q+xzIg9Z3wg6+IE0IByQy+9iKe3/DRRedZpXbx8rYbLE7t7I2mczM
	cQdFrN5ESZc1qArUd00mg6fHZLcsngwxF3d2eGVQUedrZdAmmPrI/pONCZ63yun3zEsFvOK+m6g
	CL+02YDAOgXj8Nb7ZjMWGzVfN
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3587202137.0.1787562071241;
        Mon, 24 Aug 2026 02:01:11 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3587190137.0.1787562070637;
        Mon, 24 Aug 2026 02:01:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm9009507a12.1.2026.08.24.02.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:01:09 -0700 (PDT)
Message-ID: <e2aa5f6c-fec6-4be1-b0f0-09bf67347e81@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:01:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
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
 <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Twn5jBF6jhWlN54W1dh6eN0tTMtIjGuv
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8c0858 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=b9ymU4C9UEAgf2vefAoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfXzRR2k7wbDWUF
 oetPXb8nEeKzW3H1ftZ/hmKQZcVXiGzktjS73kEKwVvhbbI3gBQXj1Raqef/xYEss/5xHzsGT11
 OcvxnQFpD6RmtMarY3Tn+4VYoEobkZSF+8MvNC8BlV8OIY3zEf2YFnxYq7fxyz3pzU6Qx9yXKPN
 XsvOLz1bnKLPskkO87oK2PvmWtt+QqymfZUD2Rz1pabwDmv+Nl29gkHfvuA3X2YdanXv4ggbI5g
 Vcc0zLBPZEbsO1nJftn99dQIrxr6gvI7F4LSqowAl9faqXMBH+CEsXQ/hd3g8qeEmcpqKPKetTb
 XYeYxHO2p4yf977Rwl8RM4rY/9MQmzUaMVMY8CMrs0UtpORsVHxa0PO0lt5Ng0ZA9n4hONf32qU
 9DsAZhklT77afccypjlUo2kjIZ7aVIFUTNuFJo1VANS4zhsQ6puDGoNIi7pBQXGsJZnUnyoTnZH
 LvegrwLIuz0T5oAE41A==
X-Proofpoint-GUID: Twn5jBF6jhWlN54W1dh6eN0tTMtIjGuv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX1VBaAHHsve80
 0RNlSJxojvZoW4b0beszXCBsOIxLfM2CRxcR1kTZFu2W/iQO3itZUZJFiCjP8efeIwJ7iul7irb
 Omwrc6fnnEVnIerX6vgBEPg20dclpAc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240078

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> These clocks are required for USB3 mode only and are not needed for USB2
> mode.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 965649db36f3..c98889a7c26c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -604,11 +604,21 @@ usb: usb@8a00000 {
>  			clocks = <&gcc GCC_USB0_MASTER_CLK>,
>  				 <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>  				 <&gcc GCC_USB0_SLEEP_CLK>,
> -				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +				 <&gcc GCC_USB0_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_USB0_AUX_CLK>,
> +				 <&gcc GCC_USB0_LFPS_CLK>;
>  			clock-names = "core",
>  				      "iface",
>  				      "sleep",
> -				      "mock_utmi";
> +				      "mock_utmi",
> +				      "aux",
> +				      "lfps";
> +			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +					  <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,

This one should be an interconnect resource

Konrad
