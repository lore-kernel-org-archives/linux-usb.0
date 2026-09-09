Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DD055D887
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958826; cv=none; b=hM53TN78TgtOwKhr0UTILIFih17cZ0hgpjndfC4kHJDnNX/kITiSF2IEtS1DHhCae41S7Y0hBuaTHGmqO/1+adM4zRJ0KcebiaI1om+HdR1uoUvL3hZk87cx7/JJQiNPfcD7lSFWCwX/RiEXZ4xaSxd1mYZtbqF831KS0H6JwWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958826; c=relaxed/simple;
	bh=gJY3Tp1Tc5qnXPWVux6crch4A8fYuRuz8YbTnJeADhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3ZCYSQcwtVGQY64pj48fA1MAFmPLIn50HlvGPeNHuHGg++Kq7YNMbdIEt6hCgcsWng+zheTU2tQs4AUQbiRbSltlFU+Ll+n7bfkvnwwx5JQYnyI/Bbfe+ui9RYUzK/Ghxamcf/GO92wJnM11tMq/s0HtG8uRgAyjNhUzQI+UEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HaBlJ2zw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V78Bp0HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HaBlJ2zw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V78Bp0HO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CChVv1400887
	for <linux-usb@vger.kernel.org>; Wed, 9 Sep 2026 13:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=; b=HaBlJ2zwEDFVYmKW
	A/kid77zZU9Rp930kIOBNutwZL125050efqZFA1QM+6ZXO+dWtrbwTMbFLaO1Kjt
	S2Y9EjDF080lGo9Uhi+dbWBrAja08/nAt4a0inwOITpwOWaeC7Ck+evtEeuzlyeA
	1d13/2cM3JSHG9Wjuf6vJwWqLuEpFkYrJ5stQ9KIeMEeOIvI4rdi28gVj4TnhQer
	/LgrywlVnPFppxuuD8MvrqagTa/LzZh0U73ulRM3J1jVUgXQEfrJaJeoZykPkrMk
	n4Tkx8WjURABflPbZ/eSA8RJ1C4ThSBLzQCtFAzNEHnwsr2xpmIeM5A4iua5rA5C
	ozKZVA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x051x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 13:00:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-789eb1bdd79so165649137.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958819; x=1789563619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=;
        b=V78Bp0HOx/2Ye2rZZUFJPSCupr4xKbH+gZ0CbvVEjVGsoRUe6xqFreQteU248kMVe6
         nwok01pVch/VFZPYhJ/q3wlaunec0p+0ry3BqPgxiN/5PckjWUEw5kY0ayrBr+7QKM3m
         7FlOICWdMjL06ZhukIoH5MZhf4PYUhwFFrhLm39nNmGL282torHYyGhfw1bzby6DwBZ1
         vSHNw02cRjv5NHj2fQIsu34rf/KSzzL77UYMZseSMIreHX1As0FRX3Ml2IxBPAg1quPT
         wX2nVDztwZevxFw0RWT/6EBexh0I7gnhGmglSLuJsJOqlSn0oSDRcLUGk/79s1o9qwOG
         lZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958819; x=1789563619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=;
        b=FqyuQX0H4Aq25xDz2bMNvSrUcZGM+faY3lDa1tYvB9mcsqnc0JiQWgz4jeEGp0pf3E
         6y5VBeCyTB1biZjz+IuwuhrzvIwpvzr2kePHJZw973RygWPpykZSnEQJson0gIAS50s7
         k5ADBMfSrjVa+DiS8AIBKbgg6lIITfVKiZQaig/0u1oN705sF+9u5Ad39rytx6ch+J6h
         oih8aFlhs0q4Rqppy5vXUqDgb8j/RJSe8sPKEQ8jnaLTaADEo/dfsKC1h92JLMLyMcs4
         pk1ZYrPPvIUoEFqYSOHxS8beyywXfoGc7vsS9sioH+k9xy8GX9yQMoMr9VPBEjmED5k/
         FgxQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5yO1IrsTACgu8gdeLEwcJVSVOaq/pV5Vl2ukCy9ERtBzMD/BV+SnjDVuVhKN9lZmqAXqJLhlaalI=@vger.kernel.org
X-Gm-Message-State: AFuF++n8nrbw03Bp9DjQwj1iqzSCd/eho6gWnf4kHnRzhSaR5xTZbBUO
	02GnGVZb89Lw9p6//al6PHbRAPlfw2MbjBe08Dd9A1xzCjou4Jby0bp2KMpuxN/a9bujEtt9NEt
	8XsLur3IQr9RsbQlwh5vKb2/f9AFPXZdAxLYKzP4xx2PniaYZkqagglpdp7J+kQc=
X-Gm-Gg: AYBFou3S+akHCJ+VZZQtRZ7E/1fXG/kFB3pgpWcqzBXlxwI/25DNaKgE/K7UZ2Y8uTf
	kh7BDCot/nvbWhQycFIFUaSmSh/AG/0RAtWBbjHHY2mNu+lw3wDUBEqQw/mvLH8O2/Ndtac+QIq
	telbDPPYPOoZ7Z4bk5VHIg2jexX1iS2HPCTMjYf5HgpQiJ57bL9jz4G8/iuaUYzQ2fPIR0V1+zM
	yUWpXDtvAaJbYwq/S9UpJ2jW/ue2DiDIMc802ZFBVywy77RYaaWSZ2O+0tUuIjwKJ6w92lai6Jv
	9b4L4RaLxcVTqehibGHI8+2CxrH9zYAlO/NCi2+/51zeX5YYe5QOwg9xHQsNauG3ojWMBxEA/9t
	2fUdD3mzYG76+tjHIDV0fqA==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2591556137.1.1788958818671;
        Wed, 09 Sep 2026 06:00:18 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2591535137.1.1788958818116;
        Wed, 09 Sep 2026 06:00:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b667b6c30fsm3387051e87.9.2026.09.09.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:00:17 -0700 (PDT)
Message-ID: <978dee45-827e-4fbf-a574-8c61c7e0e097@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] usb: dwc3: qcom: Modify interrupt handling for
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
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX/7Fmgsn4YX38
 m6kvkGfqBVWr8joYufBe1dbTj7J+W38iboEhz5AZfIlqL/Uqz4Y/loJ4k5LyShM9eGbH9E5vGxs
 vlBZkjjk25dbE7pIIkV7IDn9ZCB5JEQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX01m+zin4lVXu
 XFwHetpmGUaxg7blAbM/4GcHnMg0WnXF2GJ8RNh43FwN0r8/SPioFEi8/qhS6+875YpLhADZJRO
 e9Jrrj7LPBig9o/sNMSlFEE29kS43FIPW+Sg4eg/GUqzYwWXBB7PkCCVkUkKqEEhXHfaIAF57ST
 long7yjDm2mVTnOuHlh7kAHjTMmsbCihKNzeDpkJZHdHGD/blwnIxck100/3klweI3f5Tn+7W7i
 wYbYNjkfNz2qM58GnOiR6xb6raI+EXFWyptDo4Aip3jFpPkNCIBbuib0h0JYgcNgPnOSCeYHZoz
 69M4kakVIOuJ33I92Kj9yT3HwwVMv3f2qXV+dlILWa5yKbEost+2xFj2jawMUo9fJwTOIvkfOxR
 PAe8TOJeZGSYgBt45DQY3sgUr9Fpmw==
X-Proofpoint-ORIG-GUID: 2be7GLlFREJ5EgqnY80Z_qrkboqC7bFt
X-Proofpoint-GUID: 2be7GLlFREJ5EgqnY80Z_qrkboqC7bFt
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa15863 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FycFWezSpWEMHrBiXq0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609090145

On 9/5/26 5:29 PM, Krishna Kurapati wrote:
> eUSB2 targets handle wakeup interrupts differently depending on device
> speed when operating in host mode.
> 
> According to the eUSB2 specification, remote wakeup signaling in host
> mode is detected via different data-line assertions based on the
> connected device speed.

[...]


> @@ -628,6 +649,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	int			ret;
>  	bool			ignore_pipe_clk;
>  	bool			wakeup_source;
> +	struct phy		*phy;
>  
>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>  	if (!qcom)
> @@ -698,6 +720,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto clk_disable;
>  
> +	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) != -ENODEV) {

GPT reports:

When CONFIG_GENERIC_PHY is disabled, the stub in include/linux/phy/phy.h:489-493
returns ERR_PTR(-ENOSYS). The patch only treats -ENODEV as “no PHY”:

But it's not like one can really use this driver without a PHY..
We can add a follow-up to depend on that for the qcom driver

otherwise

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
