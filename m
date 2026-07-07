Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9631B7910
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 23:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468100; cv=none; b=GT2yGlOZ2opidw/Y9pczEnfJ+5vIxZWY8C6zCtcHrwMV1zSKw0QYXDQORJzLaEj6fscx+S99siJT+V8CMitIA0fxrXEXWNQDfZZDjiuGk7SAWQPvs7aI/Zwd6PIAOKZwEb6wUNRdS5enQR0Aksg9ZwloOobeWaiVg/rBvbKworo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468100; c=relaxed/simple;
	bh=Bd+IWsqKnV9mCYORxl3Suup9InkBoPropt9ylUnGm0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S88IOOZpnLvhc+UfHxKYmPl+1hgvf9BnDllDBnWYfB9rxnS7fELF9IkN49aeaGSYUiPEHuZB95127I+B7QN8/olZ3mQ6RyrRvl3Lbt1tiBRJHaEs2eFXOKwhnT2TLvRtRibWM6IL2o6eci2eRFB/Z+/M4liFvau55ak9gFEDd3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhUp9gIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dt11S98J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhUp9gIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dt11S98J"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MdBag974797
	for <linux-usb@vger.kernel.org>; Tue, 7 Jul 2026 23:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=; b=LhUp9gIJtrVmm787
	eSfxk+GWeUoG35Nf2zt/K1ZQH6wQpByNCriuOysIujPU859zpaeONYeRTCbjGwX4
	CCB5G+Nv6dfhhsBshiA6yFOC61nOiUk/PZet7FUwm0OQxilpWmclV2xTFsezatST
	81Mv6V32f0jusHOtD5pG7OSBKbwbU1dvLpjO8vE3fIJ+qEMq6N+cV8kPhxB1pvlY
	2Gkk0d6eYxrjXapOQrhywuZKwtfBjIJ0t/9Sc0sheX4eK0cZGckb1bWNrqrGegNT
	+h2aXN1FSyA4NHY03i4w+icioV0a+kLjULbC3VvPcIZZgYokRM05i0ffDuRDiwov
	fFxppw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5spgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 23:48:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381d039b797so100823a91.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 16:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783468097; x=1784072897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=;
        b=dt11S98JUNdz3K93s0gGhjbRMLZM1z4flM1doModrttw33foqexFc9ZeI0OGqwPAeO
         qKoC0TD9LKFVCfowxbfROa+0wzuEVxBPeaAUjb0iZKInqo+19tEj4ZH5Ho36Fp28TL3l
         dQ5y+Q5qCJbaJg60zCj4TfhbHypL3o4yYp+v0NEZ/zbw9zaR3rWWI1z+70fxBTa+qZri
         GxbDOD+THrzAqekUbzH1cOmpVDhlRP5NHHWB7bGjXFzeHQPZItghu/lgB8C7SY4f7sp6
         yD1I/aom80dEgiTLc994kj0weMAT8ExSv1zLBtkbonzifQtgkcF7LGwuMhZAW2obrs0D
         hyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783468097; x=1784072897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=;
        b=J3dDY7R/VPL+3cPOMtQKb++J+KFBKhCf8PkcOorNLBNVVRZ58q5nPmvT46hN8TAea+
         AN9hANcaCT1jNiZuKXnuF0IrGmc1hGkHBiMa4o4wFjNAc8iiIxp7jjsOHTOjJnA7xO2A
         rWMbgPCBHYk21vxt/ul/wU5LbENqphSzq3xNl8QK4su46vugXUT6Sq+ljnh48fDADmeq
         hSHaaighoEU8EeZMxsSsrAG6nuxOGOKEbhnJ5O6WCBs7HEOX0twl/kh7wPMhu9vngmif
         3UTTQelTbDW/ZSObKNrH0pQXAYMJqnHyyfaXLE80gHp9eqH8t00UZwxGjyMH3bK6g6Sq
         24DQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMH61jPDnNFm/azlRKxOZ/jE/Gj8R0HI/zSnJCRiBbq6/hL7vxs8vEpLmXIoA7p8ed/FYj162Pw9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwssdoseWaKjh00pytc8VI9g2a31QpH+ipCJVze91G/2o0ko0bE
	3K22nJsA7/vs/EK0YUn8DRN3ITnDE2DKU+F3R69kEbU0SAjHVijMwTtpOD7Umue34QM0NABc0mC
	OkzcJGJACOvU+zsRQj9Tne/mQr2Q6+xYc8ISlTD6INSQXEOoKlUiumjP+qyBeFYI=
X-Gm-Gg: AfdE7cmzvOq7yKcrltBoIwii2ZGtWfCmvNMwNumluYULvoJM5b0F7aoLMxpuc2B8151
	g72RKzs8pLN1Ta5QOZWlpNaJOEUf4ogBz38jxhZHviuc0ha/8xzdfThQfzihgSim9brrrJu8rQF
	jYX+SmPKLT9TSYClcPlRVL3Ngn3TDds2a1hoIkrUDk+33kFk2UcfFnKWX9nMn0bfk0ihVfJ1Zpp
	RgAlvwWJERVZ45bniPMAz17oIrKVOiWtYiCe5m68WGqW3noMJSipb0cK8Q+SNuLM2Qyr9XRWvTo
	6VQ/3WvWM6pXrdDZDfGcggxD5ubzz9WtIomIQPlCq6PgLhf7Nyt3wpXGVA7qiPIN1T4cl4nSr/G
	H+U9nKtGAJxm3ID5NtjaVZ0lPHChXMYKJZEYjx8ClSYTa/jDpm5CwEwYGRwgxl3Nc7T7xj97CFA
	JylEw=
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr41993a91.38.1783468097259;
        Tue, 07 Jul 2026 16:48:17 -0700 (PDT)
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr41961a91.38.1783468096706;
        Tue, 07 Jul 2026 16:48:16 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm12059705eec.4.2026.07.07.16.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:48:16 -0700 (PDT)
Message-ID: <f33f8d98-1da2-4b5f-84f0-3b7174af8728@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:48:14 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] usb: misc: qcom_eud: add per-path role switch
 support
To: Peter Chen <peter.chen@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-5-elson.serrao@oss.qualcomm.com>
 <akshsA2VuKEoq796@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <akshsA2VuKEoq796@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y7mRZwjrsIEybl_r573oHyudz0LBoZX1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfX+3n1YQwCDs43
 rGhKMkxsIRV8I7V6AbB0kOD7w11B6arqTLxNFcM2u5M5yVc2WQc7J2ZCfI5a3ux7Q3UzvIKl9xP
 vMRsChjzKGcHK1LcD8hC7A3CKkYXAXc=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4d9042 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=H_2qtCgBOHeE-je_SbAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Y7mRZwjrsIEybl_r573oHyudz0LBoZX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfX1h1QYe4iD0zH
 cYaVO5PpfPnOR8T6fyxGIkOa8XPyVh0Dm0wKfrZ+d65I0aXaFtyog6Jgsdn2n46rjy1H8v5Qkeg
 PorJTXoy99u++5PtUx935BlZiVwNTiSM1grQ0JLdz3SsWI2t12NbC2v6lIjNSqvqBZROBMXPhQa
 qMmDfa5Jf8EOAEYQLL/kR+Etk2tPK9SX6Vb+NOverMO6pAVvITCNOw1A/LQXhuyidjIFY/Sbv0X
 w7BlxkkAtxmrpTZi0oQN7pJsLoz6qrLcylDF4RRgKsTxuN/rNG35dGYKpPI5Fe5Slq8kQ57vYgh
 +KH2Yn3Gdvmp7xPft0izuAzLJh6gbapUuTbX6BBPTv2eRJYFIgdH8yPr+rQT600MIKErLfkf7Hx
 zPhcP9nTYSqbetkRAvVWQ/bYHnrutY0TRxm/ugms6x4irbsjF4GIdGkJcMHr05tlDHqMlg0LFyo
 h5MEoVVTPQQqB7pSu/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070233



On 7/5/2026 8:32 PM, Peter Chen wrote:
> On 26-05-01 10:06:30, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single

[...]

>> +static void eud_path_role_switch_release(void *data)
>> +{
>> +	struct eud_path *path = data;
>> +
>> +	usb_role_switch_unregister(path->eud_sw);
>> +	usb_role_switch_put(path->controller_sw);
>>  }
>>  
>>  static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>>  {
>> +	struct usb_role_switch_desc role_sw_desc;
> 
> Should role_sw_desc be zero-initialized here? Otherwise, some entries
> of path->eud_sw are uncertain after calling usb_role_switch_register?
> 

Thank you for your review, Peter.

I'll zero-initialize role_sw_desc in the next revision to avoid any
uninitialized fields.

Elson

>> +	struct usb_role_switch *sw;
>>  	struct device_node *controller_node;
>>  	struct eud_path *path;
>>  	u32 path_num;
>> @@ -331,11 +358,44 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>>  				     "failed to get controller node for path %u\n", path_num);
>>  
>>  	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
>> -	of_node_put(controller_node);
>> -
>> -	if (IS_ERR(path->phy))
>> +	if (IS_ERR(path->phy)) {
>> +		of_node_put(controller_node);
>>  		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>>  				     "failed to get PHY for path %d\n", path_num);
>> +	}
>> +
>> +	path->curr_role = USB_ROLE_NONE;
>> +
>> +	/* Fetch controller role switch if it is role switch capable */
>> +	if (of_property_read_bool(controller_node, "usb-role-switch")) {
>> +		sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>> +		if (!sw) {
>> +			of_node_put(controller_node);
>> +			return dev_err_probe(chip->dev, -EPROBE_DEFER,
>> +					     "Failed to get controller role switch for path %d\n",
>> +					     path_num);
>> +		}
>> +		path->controller_sw = sw;
>> +	}
>> +
>> +	of_node_put(controller_node);
>> +
>> +	role_sw_desc.fwnode = of_fwnode_handle(np);
>> +	role_sw_desc.set = eud_role_switch_set;
>> +	role_sw_desc.driver_data = path;
>> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
>> +	role_sw_desc.name = path->name;
>> +
>> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
>> +	if (IS_ERR(path->eud_sw)) {
>> +		usb_role_switch_put(path->controller_sw);
>> +		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
>> +				     "Failed to register EUD role switch for path %d\n", path_num);
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
>> +	if (ret)
>> +		return ret;
>>  
>>  	chip->paths[path_num] = path;
>>  
>> @@ -365,15 +425,6 @@ static int eud_probe(struct platform_device *pdev)
>>  	if (!chip->paths[0])
>>  		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
>>  
>> -	chip->role_sw = usb_role_switch_get(&pdev->dev);
>> -	if (IS_ERR(chip->role_sw))
>> -		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
>> -					"failed to get role switch\n");
>> -
>> -	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
>> -	if (ret)
>> -		return ret;
>> -
>>  	chip->base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(chip->base))
>>  		return PTR_ERR(chip->base);
>> -- 
>> 2.34.1
>>
>>
> 
