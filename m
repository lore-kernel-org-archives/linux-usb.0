Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451708003D
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 00:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784075563; cv=none; b=OK6l/KsRh//JsvmSZ/Nbepcm1IcwH6GidDkFkAt5Ty8ALr2M34EkOngA03AtxROMdtQ4tdd2K5aEEOnA0FEZh5WP587VQW8R9Hv8jSF857IEdXcLY7AF++Xw0RNK8M5y/YmEJhAn8I4Cz3tTCSBgfSalnXJjYqtRCnALllUrxug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784075563; c=relaxed/simple;
	bh=AMcJL/mRPIW1zvhlGxD9ehRkfC4ziM8fajxX6PHuQjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dor/0m0SrByi04H0KeCSEXNasT9SuGDtVFHcdvkONueasIj5KIiZ7Sx2lMH4HkkN5QcXolr/seEO8B0Dsgt3IQ65L7PW63Q+kej0P3m84JBKmbIfPFdkTAWdUYG9tihBB06EqEcJl4D57r9+F4MmrOfVCF8LjIC9T6OvaZLjAEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d60iblaT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpdQxl1v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d60iblaT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpdQxl1v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IYFw2143875
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 00:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VhRmVe2L95WfB3tIH5U/OZaaS9Pdz/HPXPNfie3HA24=; b=d60iblaTngRBE3Ph
	UwX6/IxRG/tsA06eeE9tDdXmZ4eq30zgXZq1j9Mnuwic2xMKQ9LKfq2Atx4f8+aq
	lYd1nbOj69HDmdKsjL7QTSbuB3KFf7pO61XZ7WVNsFSWu9LWwuAgr2+KmmGT+uCT
	G+oEjlOJmSyR3vCQRZf7B3hwgCpM+c8PaBoLYYshaPtX3viAQLJT0gkf++cmOg1F
	bseu6njYHKdCu49YYU85aRFF/Xu1qfty3GbjDC7KYErzw0+ZWmk9FPkZgsI7MIpI
	7f+E/p+CfOzs11TMxLcqUkvOPzqjLGQXBGpDmWiTq4DtEaJ4T2j/XsNvSDpE2HB5
	oDjwSw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq2m32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 00:32:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso7179980a12.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 17:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784075557; x=1784680357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhRmVe2L95WfB3tIH5U/OZaaS9Pdz/HPXPNfie3HA24=;
        b=fpdQxl1vDD0/DYUEAjiSrG9qGv48L7sqe3B1InWRXSB0eGJ9AYOOcmPldIunqhm55u
         KDcDhY5P8MrKXyg1X+eC0fVGTfhznHWaKmDi+4Jw5xWnvksO/c8PPNMdSKSGyzsikKAw
         Nfk1H1ZO5y7rDzm7cRQIG8ynzKVmA48b8RZci0PiZ03H6cEuzLgLP+9jprOCExs7RqQS
         mqHdiZrcfhr4esnHrdPkHgSv73mdLvI8bmPAp1EMA4Mvtvq8ZSqAAxtAU+rxFTsDOYvQ
         SoMjBH8wlR2o+c3tozhlJ6XLtvw0FSd2SaKT99V5yTcIrlCYrEepskQeHPmnJVs8k1tF
         Z3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784075557; x=1784680357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhRmVe2L95WfB3tIH5U/OZaaS9Pdz/HPXPNfie3HA24=;
        b=KYqwTmtA+Xj828x4u1WdBGUvGh/zCgoV6nQ3NpRHiNsu4pwfEkyeXlmO/F4ebqtG/O
         9GoENI8TAGrIG+L8HidGd4Klx5V6kXY/gBacivZXPtkNcL2CjsTvLTQ43GnyzOkXuVeX
         GAlwxRFlnxoVJn7JswZmSGvbqxhieGBgZPWbwKI3t3Vrw3Om4FCGkryX4KG+7RMhloR4
         wAicDWjnYdog1doyr4DBTtoZ4+mL+h0FGlMGAIp/WGK+AkvpJ8YBQ67W6cEGetHHrJne
         474QYvtuSwGqoy5CX8PVu1DEP/5N2As5mFr2/GoKhx6uDyr7n9GHnRv4V24FWHSVgdkK
         Yrrg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1Ev77gAao6hZCo882TqDbnQ481pua2L7Cf5nJNxXpqIXp+eVL4uHTl3xJJmUH+I1BL5Yj7s/wZIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQo3x607L1q+ElLglPowoEsMb6UqwRjnr4JqlyXbAI23CHChqQ
	8Vn+JRJHNR8E0tMCLqM0WUyz+D14bx4POQYP14agI/HTZITTlbJKKdfDALwK/q53FL0EQCJv1/v
	J90McGaeQ1Q9Mw4CXvfOfsEReL2c8BsmvKbrdTnarYNUE3cQtFVi7lDOtKis/coE=
X-Gm-Gg: AfdE7clO2zMTCV64zAlIJsQ7VnGqV4bo6pl5W0+tvqcCT8MDPjEMHePrGwOjJy8TdFP
	BfZriynUbTV+oMBhLkkbt73sKLbDmA2zUkd2vM6ExmEum8Wh3Ly9MPUYpD0mp4EU0sbq24K7YS6
	zFZBU3aRzwRJA8q0ZAeOMlVY3HuCMmnLHnsHBju4eah+iNkwK6t01nlVEJD3K0HXYev3hNVtMiK
	RX904OXoLvMBvb86fOS9GvSzrA20B6Smq355qRFIDRujSL19FDczZBZJnpN+I24bSJ8EKLcjv66
	PU6m5D/08b5ALX92cX+9NMJUlH1Az35cV7uCzkRPp3xKCTX+WeMEDnuoxrTQifDRDcNWI7GO2Eh
	mGoRp/0wfFP9ZasdkR4xy8DgVmTFLvSC//wpIyTzZ
X-Received: by 2002:a05:6a21:2291:b0:3bf:b40b:def2 with SMTP id adf61e73a8af0-3c36c0f6cf0mr837619637.9.1784075556781;
        Tue, 14 Jul 2026 17:32:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:2291:b0:3bf:b40b:def2 with SMTP id adf61e73a8af0-3c36c0f6cf0mr837593637.9.1784075556344;
        Tue, 14 Jul 2026 17:32:36 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9081d5c3sm32453703c88.9.2026.07.14.17.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 17:32:35 -0700 (PDT)
Message-ID: <4ffd0645-dc50-4157-b63b-5e93fd7520a7@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:32:34 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
To: Peter Chen <peter.chen@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-4-elson.serrao@oss.qualcomm.com>
 <aktKpIXVnJeydgCE@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <aktKpIXVnJeydgCE@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a56d525 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6PPZE6R56-VPGRRjajsA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Wu8TvZKec7KZsVgMALeDauTdd-_EO9j1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwMiBTYWx0ZWRfX2phFWBYGgEOa
 iS2hRo+hlxRECnigBQnTiwlrRRZzcn64hmvcDT3aGKrI6CCdiQqnFKNVxjhQJP7ClL2gemyo96O
 wCdJktnyNZnVVA9a8DibUsjv6ZgNvOQFutQdSHtlmMRKnKxRn7pUAoWuUqGEiF++F5QtaOYR0dY
 S3SB32rvvD9lKeEeLdYKFQfQ/oyp0Xb7uptRFoD7BezKIM8lj1vkYrtWzMAe1ilUH5Vylj78KDm
 PLhQ4heDObXs2RZcI3PjurzX56z0wWTe0X1AcrhKDwHpUbHSATsPgQKGdWZHI07Ufnugxtb22hM
 3X0JF/0RVrEiJ27DnRwv6KmVNWDZjnej0nAPx8FaBaq7Bc4zWNOhTKn/wRVZNK1mfZurOJRhd4v
 egZmhK3ThC8GuzTUKoSXz2H1C4jSjfNCB7fgb0st/UQFem3b72fn1ki1z0GND+gC66K23VSHiqH
 U3YfckKvG7YohqoELfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwMiBTYWx0ZWRfXxc+u4MWxhgpa
 YkUN8oYRBfQ87TGPm0UmOh0/3IxaWp7JLWcBIk8KehkFvhVyPfAnKWIHKdZdEByyBmFM0CBRl/9
 0lchA7AzG2OGW1XbEEqfUaFbKygfZUQ=
X-Proofpoint-ORIG-GUID: Wu8TvZKec7KZsVgMALeDauTdd-_EO9j1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150002



On 7/5/2026 11:26 PM, Peter Chen wrote:
> On 26-05-01 10:06:29, Elson Serrao wrote:
>> EUD hardware can support multiple High-Speed USB paths, each routed
>> through its own PHY. The active path is selected in hardware via the
>> EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
>> the High-Speed PHY associated with the active path. To support this
>> multi-path capability, the driver must manage PHY resources on a
>> per-path basis, ensuring that the PHY for the currently selected
>> path is properly initialized and powered.
>>
>> This patch restructures the driver to implement per-path PHY management.
>> The driver now powers the appropriate PHY based on the selected and
>> enabled UTMI path, ensuring correct operation when EUD is enabled.
>>
>> Historically, EUD appeared to work on single-path systems because the
>> USB controller kept the PHY initialized. However, EUD is designed to
>> operate independently of the USB controller and therefore requires
>> explicit PHY control for proper operation.

[...]

>> +};
>> +
>>  struct eud_chip {
>>  	struct device			*dev;
>>  	struct usb_role_switch		*role_sw;
>>  	void __iomem			*base;
>> +	struct eud_path			*paths[EUD_MAX_PORTS];
>>  	phys_addr_t			mode_mgr;
>>  	unsigned int			int_status;
>>  	int				irq;
>>  	bool				enabled;
>>  	bool				usb_attached;
>> +	bool				phy_enabled;
> 
> There is already a 'enabled' flag, could be leveraged or still need
> a new 'phy_enabled' flag?
> 
enabled reflects the user's sysfs intent, while phy_enabled tracks the
actual PHY power state. These need to stay independent because a later
patch in this series ("add host mode coordination") disables/re-enables
the PHY on host-mode role transitions without touching chip->enabled, so
as to preserve the user's original sysfs setting across the transition.

Thanks,
Elson

u8				port_idx;
>>  };
>>  
>> +static int eud_phy_enable(struct eud_chip *chip)
>> +{
>> +	struct phy *phy;
>> +	int ret;
>> +
>> +	if (chip->phy_enabled)
>> +		return 0;
>> +
>> +	phy = chip->paths[chip->port_idx]->phy;
>> +
>> +	ret = phy_init(phy);
>> +	if (ret) {
>> +		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
>> +			chip->port_idx, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = phy_power_on(phy);
>> +	if (ret) {
>> +		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
>> +			chip->port_idx, ret);
>> +		phy_exit(phy);
>> +		return ret;
>> +	}
>> +
>> +	chip->phy_enabled = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static void eud_phy_disable(struct eud_chip *chip)
>> +{
>> +	struct phy *phy;
>> +
>> +	if (!chip->phy_enabled)
>> +		return;
>> +
>> +	phy = chip->paths[chip->port_idx]->phy;
>> +
>> +	phy_power_off(phy);
>> +	phy_exit(phy);
>> +	chip->phy_enabled = false;
>> +}
>> +
>>  static int enable_eud(struct eud_chip *priv)
>>  {
>>  	int ret;
>>  
>> -	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
>> +	ret = eud_phy_enable(priv);
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
>> +	if (ret) {
>> +		eud_phy_disable(priv);
>> +		return ret;
>> +	}
>> +
>>  	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
>>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>>  			priv->base + EUD_REG_INT1_EN_MASK);
>> @@ -75,6 +135,8 @@ static int disable_eud(struct eud_chip *priv)
>>  		return ret;
>>  
>>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
>> +	eud_phy_disable(priv);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -130,6 +192,12 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
>>  	if (port < 0)
>>  		return port;
>>  
>> +	/* Check if the corresponding path is available */
>> +	if (!chip->paths[port]) {
>> +		dev_err(chip->dev, "EUD not supported on selected port\n");
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>>  	/* Port selection must be done before enabling EUD */
>>  	if (chip->enabled) {
>>  		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
>> @@ -229,8 +297,54 @@ static void eud_role_switch_release(void *data)
>>  	usb_role_switch_put(chip->role_sw);
>>  }
>>  
>> +static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>> +{
>> +	struct device_node *controller_node;
>> +	struct eud_path *path;
>> +	u32 path_num;
>> +	int ret;
>> +
>> +	ret = of_property_read_u32(np, "reg", &path_num);
>> +	if (ret) {
>> +		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
>> +		if (of_node_name_eq(np, "ports"))
>> +			path_num = 0;
>> +		else
>> +			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
>> +					     np->name);
>> +	}
>> +
>> +	if (path_num >= EUD_MAX_PORTS)
>> +		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
>> +				     path_num, EUD_MAX_PORTS - 1);
>> +
>> +	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
>> +	if (!path)
>> +		return -ENOMEM;
>> +
>> +	path->chip = chip;
>> +	path->num = path_num;
>> +
>> +	controller_node = of_graph_get_remote_node(np, 0, -1);
>> +	if (!controller_node)
>> +		return dev_err_probe(chip->dev, -ENODEV,
>> +				     "failed to get controller node for path %u\n", path_num);
>> +
>> +	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
>> +	of_node_put(controller_node);
>> +
>> +	if (IS_ERR(path->phy))
>> +		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>> +				     "failed to get PHY for path %d\n", path_num);
>> +
>> +	chip->paths[path_num] = path;
>> +
>> +	return 0;
>> +}
>> +
>>  static int eud_probe(struct platform_device *pdev)
>>  {
>> +	struct device_node *np = pdev->dev.of_node;
>>  	struct eud_chip *chip;
>>  	struct resource *res;
>>  	int ret;
>> @@ -241,6 +355,16 @@ static int eud_probe(struct platform_device *pdev)
>>  
>>  	chip->dev = &pdev->dev;
>>  
>> +	for_each_child_of_node_scoped(np, child) {
>> +		ret = eud_init_path(chip, child);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	/* Primary path is mandatory. Secondary is optional */
>> +	if (!chip->paths[0])
>> +		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
>> +
>>  	chip->role_sw = usb_role_switch_get(&pdev->dev);
>>  	if (IS_ERR(chip->role_sw))
>>  		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
>> -- 
>> 2.34.1
>>
>>
> 
