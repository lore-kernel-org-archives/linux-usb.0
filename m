Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7A448BB7
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344951; cv=none; b=ZijGQ4XCVzHbLIGmdCZPnWIIIihYk0Bynmiz48zxmNA9mH69VHh+0qGL8dQ5+dtLsucxdFX7Hz7lEekuPZdphw465Kwld1JK+wkCw5NnhOAEHGK160d+gZkjtjjTslH/XUccbkA4RN/dKW9QD6ktXG8a3AjNTFNJlkfsBu9jimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344951; c=relaxed/simple;
	bh=D8ZSpMUPIDCNW+TKfznVVt3G/+Z1IAgE/rX07jvs3Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NrPvmLtT/a4x111YAP/SafXt6xsnmpH5txrO4olHH0Fe5ek/1ClPpHvMfwEXSGafvT/f/gGswiipZK2hfdWrgsLYBeq29DpTzK1JD432gLgyu/dh8fssIgPBe49ALU4FayBcbVTMmT+o2FiCCrXXzlEjHRSg0Md8moO01xA+jJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuWlE+PE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAg2QRPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuWlE+PE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAg2QRPY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682A5hO6688621
	for <linux-usb@vger.kernel.org>; Wed, 2 Sep 2026 10:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=; b=TuWlE+PEE0fHl+Q+
	Z7tHB0FNlZLyis+6uv07INbF2nYVZdRoJ+svY5ACNrl0dQ7DqE00o7BlnrLI/Asu
	s38/IVguMpGDQid9B7Whs1FHbi2SlIWEkyQbHU2UWz6lj15k02oN/3xh0zZepY0/
	7I3rpZBQRUd5tn7LiQOGnkG4HPE2ea4EjhtRpjt3Wbiim26QShD+YcjVTQTtKdGm
	dKb96JQS2tZeuufTmb200IGGDYSSHbR3aYRdC2jKt5zQjkuRl+3Lw+BNQmdEU7aR
	uwsfJmrM7P+viUve9DEi+tnQYkN/Vs8gS3oi3soF7vXC4XfaH5WCAD5WqCtyRjwN
	DcDtsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gehrd834b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 10:29:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390890ae83so24510085a.3
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344942; x=1788949742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=;
        b=aAg2QRPYeQSSnJ/pnIBzxmkITRiXqqFk/TFtiyYYVZH3BZn1Zvpa6ZmtxUeTsAAV4C
         8OP2i8zxKGYxblf23Ug/ygPUW2WW/x05L58OqSTNjtRQB/j/PrREHoAB8RFlKX/TsMOZ
         HIKB0TJBJdM87qF2SCS5B5P3cw7JhsSF01ylczEKslhydvDzAqIdLYh6wp8opH1IL4Bx
         oGwMGUNu1+i3nyC30DXtaWoOmVJ09052PiIchsYTkxUYt53OGvF+YztYXHrYRZ7rJsC/
         ZruXnbbH2gYRsXWgj4D4ACN0+4ksc7pdSw9svAKcqasJW8F9nZmY+t/c+ZLs/By2VL+y
         +WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344942; x=1788949742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=;
        b=IjVWU6hD7f/BW8ko6l0QQDy+hKCnCb8wErYpWZ3+wd3PwKu8388Ld6O6gdSIa9fECH
         UeeD/2+hdL4/wpeWbOk/hB7juOcmYUsSlKf9yRmrEBig9k8p6qUDfb8LbygEuRX7a1yH
         ABR075tT+NQD8em1jMZKPr6L7fvryDWzih706z3RCKJIP3HyRKhY9aVyE1o99lLkDgfB
         YCEsAX4JodaEwyUqgTFiu3+E9qyackdh/1dZqfjRzsWCWpsCkIuwh0EZvDqHDWoPD7Rt
         G+EqLybuhfw6AfhDTGb+86FzOSC9/UvILgtYj5UThYNJ7W9DwjzxKsbBjpTvJseJlWo4
         UeZA==
X-Forwarded-Encrypted: i=1; AHgh+RpNz8CUot5vw15erWkcPU6FGdPEFT1UCaAjZvpRwBnpCsCY8oN9QSZdFfboTAtXRUwDl0JxjF3Gpog=@vger.kernel.org
X-Gm-Message-State: AFuF++kTT4EWELw9FsF6o2FDUhG1RsWJHgvLlGAOdOlfQfojJ+eUqZCC
	JdD41+w+V+Bi2aOhQGqIuAU1TK4rBe6F3U3T/ru6wZJaLUv1bt7exbXYySg9Ht4kFj43tA4FyYD
	M/bBdxNEoFUCQ+jFtWILWFDOm/LQveV8ntqIWGTmR+ZirhM9Pe1V/7hfXtD6BiJ60CMqSZTQ=
X-Gm-Gg: AR+sD10Senr+MlCWu4EdJ4kshd3YV5MRPzuUMXIHALoPtZ3wM8uZpuUNu8my5z45tnz
	yXEWfQ1S79Zsyl9wGyvKaHkYQPL1lrbxfJkL1JZtdnF0g34fxc4dNRYHcmRkGYANbjMfEgEzZIa
	31ZACwHoVobB1QUtO0NbtnEWu7wZE+S+rQAtkb1EUYU3S3rSYiIhh04AXTPLL7uu1KxAGPVZ+fB
	GMkyf9l6P5dxNNBIwFPxod5iOTza9JTgnvkIMAN+TUIVNdg0Z4Ugk1iU4t741V3AU1Tg2BOZ9Li
	tzhyhPsSeg2IZuvlj0Qsgh4gH7KA3NGxzkweaQLRpGpSKuCWbv1Ir5/k8LuM37hl8pSJb8/8kyS
	orYMDWXPHA2ZSyPamCq+Fgg==
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr241295885a.2.1788344942250;
        Wed, 02 Sep 2026 03:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr241292085a.2.1788344941785;
        Wed, 02 Sep 2026 03:29:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002dcbesm109123366b.16.2026.09.02.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:29:01 -0700 (PDT)
Message-ID: <3d31f750-750b-4561-96a3-d265b632da6d@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
 <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UZhjsDeYNRmH1PTJA6YW1bYGaZf7-B5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfXyrONDyCSHBtL
 CKdlfl+0OMHQzwfvhBrZx24TapL3CLTAdZdDJASS3ZGHYT6chIc3SDvjnhCcsGIxG+gPGpIXAMe
 A1sVFcHS1PAt+2Ag7pacOi8EJ9NnWbkQMVCu8SvbV3hXOmh7ncPfd2/WiLaq+oHDy7vvt5Fqhy6
 sjYsTUSgViKBbYenWtCmHqZhv2YVNbJz4Xyb3mWDly8SVm1knPkjIwH0X0SspUOhUU7hblZVr2N
 EyqWCBZMdtBl3SAEMCL5krrff38AwkU0FT0hoZHGoa+WS/YmWr/IpV0qYjEKMNDkzVl3aXT/qKN
 KOpt2xP+RSrE0jXrjKO4RkX5oMJwhnJA6t+r0LRhJ5es8QlzmVjc7LVRajzU821oxwbkazxM14J
 YdaqwpHYRpwLSd/EcFpNPyJ/dzpdwQ5bvWEeaXr69vBpxspmI+nRwgKcq86U6RiARBfwO+ozv/4
 MvcSaxdT5PYM7Bp5uIw==
X-Authority-Analysis: v=2.4 cv=NLflPU6g c=1 sm=1 tr=0 ts=6a97fa6f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FycFWezSpWEMHrBiXq0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfXw/DOGNyEzAdi
 vwMMTxZ0JzgY4+55mCVQTCSX7joldMRp4MRHCu2FtZTbVSovfgKhMRfGTkGytgHoqbgFMdf5TTZ
 49qKOZbFejetY4GbucSh12NyM7obcbc=
X-Proofpoint-ORIG-GUID: UZhjsDeYNRmH1PTJA6YW1bYGaZf7-B5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020092

On 8/26/26 7:02 PM, Krishna Kurapati wrote:
> eUSB2 targets handle wakeup interrupts differently depending on device
> speed when operating in host mode.
> 
> According to the eUSB2 specification, remote wakeup signaling in host
> mode is detected via different data-line assertions based on the
> connected device speed.
> 
> When a low-speed device is connected, the host repeater drives eD+ to
> logic '1' upon detecting a K-state on the USB lines during remote wakeup
> (eUSB2 specification, Section 5.5.14).
> 
> When a full-speed or high-speed device is connected, the host repeater
> drives eD- to logic '1' upon detecting a K-state on the USB line during
> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
> 
> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
> eD- line states, query the phy type and configure the wakeup interrupts
> accordingly.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> +	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) != -ENODEV) {
> +			ret = dev_err_probe(dev, PTR_ERR(phy),
> +					    "failed to get usb2 phy\n");
> +			goto clk_disable;
> +		}
> +		phy = NULL;
> +	}

Looks like we don't have a devm_of_phy_optional_get_by_index()..

> +	qcom->has_eusb2_phy = phy && (phy_get_type(phy) == PHY_TYPE_EUSB2);

phy_get_type() and generally all PHY APIs accept nullptrs just fine,
no need for the first check

Konrad
