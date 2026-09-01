Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D04636196C
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262581; cv=none; b=bk9Bs98V+g6Z35T8pAgDwdZtOvrB0h8tk8u/sehU59iqXbY/Qf/qI012HS0aG98Tesa4vo6qUa/LlqP4JKm5Llj9lxuSDTpNBhQvJjRbn5etzic2jmTT0W5RLCYHt9QsuXfZyzJVSGwrFYQPdBAMOqttQC5+h7ZlPl53YcvkjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262581; c=relaxed/simple;
	bh=IRfoPRQyx4mDV1KY7zF8pbQdd1HlpYooqi9V56M7h8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4boT3Zsg20Ok+WFsziMmW23IFj5WzjhLvLa6l3LBsNmYd2ppaAuI2prprvjZ5AIwbWZT0QwXBtGCI/97hE2F2fx7c2lAc1S1pbsiXtt2ZZYblauOGR9CxKgt+o0/lJJEXk5AeoefOTA9aKHAFSsV8suAfAgIYtp8Rrkh2PaqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZUJGFAm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1y9+Q29; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZUJGFAm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1y9+Q29"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJPKN2993727
	for <linux-usb@vger.kernel.org>; Tue, 1 Sep 2026 11:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STS6AjEPxzj5uH0XV1tv1hJBJqfHjLpFSlGx5GMKpwk=; b=pZUJGFAm7VygXV7U
	Jt2iv/ugWVxWHblyI4wMvS9p9nYc4BehIyLSYvKZjmMb2U6J8p152vxUw8dSSw+8
	RyFl9rPgjpaZIADPKtsLYNNNu5lROnlep7U35grrABJ7xaZV+uWJfFSSr2/lTzgB
	CxBpRlCGkrStVuOwZPFKLeriZH6fJ8l7IjdKWBw6q+ZSnIs+nTob331Lpsr5MjtR
	C7D+1KcqtDA2BnJODGJGZOHU4AqH4vVl5FvDI90mfUdK9d1lg6q5rP4wfjJghqa7
	J/qCtqaxLMtcLZ4dujo8+tFclzJmpXyywOm4F7AKXOT7k2ttlocspGlUnxBGK0PR
	r9U6PA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3c5j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 11:36:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9310484c005so71676685a.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788262578; x=1788867378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STS6AjEPxzj5uH0XV1tv1hJBJqfHjLpFSlGx5GMKpwk=;
        b=c1y9+Q29G4K0oZ1KNOGmi4aytW8aDt377+KQU1Zbqk59g/1scwRrwgxi44CZh504i/
         6MyL+E8IFTv6U5usyvQatXgivFgfT4HJhnN441IJvooq4GHUPvC8ccYgRCgYOuJrEGJ7
         A6o3sYPOZro8J9jTO3dLVyl0Z7K1zPXJS5Wum2d6h9j81hNb3dKyO4iTFMK4z4r8gkMe
         mtJhKsWJwNHUqR1/I/w9e60KwP+BsVieqkXltQ/TWWwsL3aAMOczDWcfLnqF9CGXMxVU
         G/jmrvBN15LCnxRZqUNpjvDMcysLFUFPoa5JCloansRfANGXGysKQB/IdXwWaqG1G8Jg
         oYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262578; x=1788867378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STS6AjEPxzj5uH0XV1tv1hJBJqfHjLpFSlGx5GMKpwk=;
        b=cAbD5uolaWxLUtZ8lfQ0qvkwDGCXoUAHyWpI1dpHdl7rfD23bXjsmAOD+UeNEdmVlN
         8jJ/UaMDd6UT8OdSU3f2qnAAgrrLnBt0SaZUc5aeGeBffwF+hcc7pxkg4imt5VeeGJ+A
         g1/op26R0zvuEOhQTPVMv7VzX4+IAFcD/56KA/R1AoC2vBtq8G1NL4HAlbrDMaELNKoA
         UQHlGLwiEOfU06HiPczEkzUKGaRL+GTwS7KlIBina6UcjTwbdfLKrZL2ZyV+ufUEN0Gb
         P3M4lNfn7r1hSj3TDKPwgfcbPoaMpu+un0vVsf/w+nQGR288pdRiSwTuLkqzqlN5X8/b
         Y1sQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpphbz6kd2vexba3rn2KTO+ElHwIykadwdjo0tYY8pLWL4uh0pcqEfJSpiOdYEsZMiTVIi/SAtztZE=@vger.kernel.org
X-Gm-Message-State: AFuF++kDFM6T2qvw2KDV85NLYf+00GwAr9ZK+ewiu3qoO7Dkqq5E0Tak
	TOxip4S9xTSPt0bTh+mtcDwDqchPGgUxUPNqXXd7BBTT0C4QXda+KZ9Quh2QC20D5PMl+3rN6eQ
	Upq5El1NEI2aHkVwW/7LncWXas+3pdau2VAmJKEuS/FZpH47ZjZ9Q75puJGrEljE=
X-Gm-Gg: AR+sD11/fJ31heUdohA+pVKZvXqBI/v9LKAfDk0KUBpGpbwvIDbX2bhdl+Pld+iKhWi
	hTFCfVFTNVAByb4UJkboAXI2PRtKflMMxRcIi412ezM5jIcS7COw5RK0XeDN8xRV3GKBTPavIbK
	JrZTEqfhDc7gMhg9AQASH1uuzq55a9goMfvqJ5zMhFi/8CzWd4nSL7k0MNXv3WZQ0nnjwiQm3Qb
	C1+4HWxSBnarenVs3blNzv9t0XJbvWbyALsrE7Bafvq8Bs6I2rUMILoL8YWhtqk7OnKDWJIUzyX
	c1UHC3fgBqN5k1XYref1wP50+yaOC+GNo0M4D0VZcWC72lr+OWFq3ew2Di68To/EkwxZoZuw2TV
	r7YS9AdSLLrIAJ/xckSCFKQ==
X-Received: by 2002:a05:620a:8018:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-9392875e6b1mr1452515085a.2.1788262578421;
        Tue, 01 Sep 2026 04:36:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8018:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-9392875e6b1mr1452509185a.2.1788262577784;
        Tue, 01 Sep 2026 04:36:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f25177bsm579310766b.57.2026.09.01.04.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:36:16 -0700 (PDT)
Message-ID: <f23595ab-e0ef-40d8-998b-4cb0426ec166@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:36:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] usb: misc: qcom_eud: add role-based EUD control
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831030147.1500616-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwMyBTYWx0ZWRfX10Y12/t5Wijo
 Ru4rFx5H3NOJkkGLRB70XsYLgzvsFbUHZSnraCOg38lK4xBTC2t5VhInXyK15d4u+6AcXmlqB1B
 gl7SoFM2X7EwVVYeC8clbPyAjXV90TrHR+COja49e8GWneHm+Wd3a2r6PqADB0wx2/c8+gx4gDl
 aDhJnXgPRe9avRi8R9kBjs+s3VnJaH8vAS3M1k1tMOh+j5otIVg10yBNzqLMpCaJlZQLW+HfR5P
 GgE/7e3Zxq2bCB4kVbiHFAHNmPJKXY4oIYHqS57N8tqZT2NoUtOsQeZJMNlBevrjecxbtvm7AJO
 dLtCRQu+1WV5PdLljx/gu/eWowIwfkJIU8MlDWjv8H1yFN7WYA/cIkjBTsPCLk668Z/QPGHrJzd
 Dj8Ym9FcKxGD73UJStu1jVfUwPkH5H5wuAiPrFpYEH2htaPaeLjD9vPaMC+O0FMZxkzfV1UOHFv
 xxkJ/TZfF7/qzv1puCA==
X-Proofpoint-GUID: stDfq-jygOLXXMgup2b_MF2VAddiZ9yB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwMyBTYWx0ZWRfX9+DCxuaEjfrS
 Do8I0uuHMQ6IaU4uieIopBZEI52eDclzPLJcYOx1qJXEtHrhjBbS9ZM4Rgc2WxnzqlsqrLeqbCB
 w2+jW9fLlgoMkIdn2qcq/xevXvrNs9c=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a96b8b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=X7E0pNrBJpJ0GBZA2WEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: stDfq-jygOLXXMgup2b_MF2VAddiZ9yB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010103

On 8/31/26 5:01 AM, Elson Serrao wrote:
> EUD functions by presenting itself as a USB device to the host PC and is
> therefore only applicable when the port operates in device role. Keeping
> EUD enabled in other roles provides no benefit and unnecessarily keeps
> the associated PHY resources enabled. Furthermore, enabling EUD in host
> role can cause the USB controller to misbehave because the EUD hub
> supports only a single upstream-facing port.

[...]

>  	struct eud_chip *chip = dev_get_drvdata(dev);
> +	struct eud_path *path;
>  	bool enable;
>  	int ret;
>  
>  	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
>  
> +	guard(mutex)(&chip->state_lock);

GPT suggests port_store() should also take this lock.. I think that's
a valid concern

Konrad
