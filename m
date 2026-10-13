Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675554E9C0A
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889321; cv=none; b=umOhWS44glG/xyT5CZ/E8siSLUWPsPqJG7I731J6JmcWovXPEf/jYCan9PgECgYwqbLxMoFxq4cRD8MUJNbwZBfx1jqWuLCiL6mXp7K8j89kT9N0b9Gd2+v1UroVEfydz0M+al0lpW9fp0WUE5M86MM5fZ43mmo1aaEUdDYgpas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889321; c=relaxed/simple;
	bh=GHmwKE0UxwHRtrATAosll6uYBXuuBS4AK3dGPwQgzSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMGw+qyz8iOg5YXroe8wKGJ6WRW7DKQ//SE2n2fb/7ltZIpVzkdya2O7WALdOCYqpKRXJPVF1wYZ9W7XOStELiUj6fjdWwLKyD1YOJ1Rg0ZyDOw6u29LdvnoxWm0OWi5LUIvFJURsNvZTdyOWAK5ro5TqAfPFX6WOlPxVf3L5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOO7bPzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyB07Txj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOO7bPzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyB07Txj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8HCnW3908182
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 11:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=; b=lOO7bPzZ3j+m7Sha
	w6srrquNg0hkyIjnQHnYDd9qR5MZcYdM+HiNIn/xELTL+gchT1bK4Hgbq+ysJFt5
	T5hhwZz5OcHyLWuQ6KiFKeAxlqx1l3fu0P/oGaB+rVfPEict6RnmqBRHX6pE2jZp
	fXaPDQVP/ZiO51olPrkL2ntXLAfG4wNUW7gdt9ULeHgUnl8nhas+s5y29aFSMEDr
	LWtOp9UOl/2e984qcgQ1Ch91+Ctjgk6rcwDFtvq8XSOYacwzu3r3PIqXwWGpC9X4
	S80fbSweiv9SoHCRPMYvcMBAF0SMmqf09/i1vGxlsgkv24miYfXzT2TDlGEoilVL
	/4lB+Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqu6aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 11:01:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77f133855b9so60220137.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889318; x=1792494118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=;
        b=GyB07TxjLmHsQRY513HyD6tK98XutV3mzOgMPVGUjHky0uhzAy0dIc5rUGoNRETCWL
         v1+vF5+18Q1JcPRkqEvGV560+DapDekVyXfgFJyVl4avEC6/nhL7AJhiPZi43hY7bDJh
         9x7vgS1wgm1gIzh1+XZoZYshuNEiXHPG2EjMl0jyZkOarge0fqPcxgBqqy7LVffEBxsc
         4nj1AzcDCOWXCeeOzka2gXrVFhs+v7c5MJzRTht1ge7dWh5XAlS4lHciLklnRdS4bzWG
         lrAke57jrI13weDN2mCJD1tMRfkiBtsa6nifBVnhLbROzT16BGcC85ldcUnDnXOVae/t
         Xv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889318; x=1792494118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=;
        b=hVbCjAW9lo6J9neUT6cA+0OyZ3TksM3RNXZQ6eK7lgHHmsh81kjljjPTghdFio4dyd
         MWGvzPr6FhzS69zSwzokMYS8mCloAMLwCvxq9/+qLs4pS+T59CoV7fmvrI49ALR3PjcF
         4cNNkUFcBQ/KvHOYKKq9aPkp9Obf7h8Rruj5K51MJzwdttASpbWc1MNjEzWl7djzYDlf
         AFwtWEQHdLMyuLa4hF4JJvf3Fp9l0ilHeTqw16OV1IPW5oQh20pIXrJC+jRJt8Lq0zwJ
         tQ+nv+278KbQ89zCojhsrw/2bXly5wFyZLCaACkPQf4RofVxNYMXsPUo8gW4UakhPYQ8
         FRnQ==
X-Forwarded-Encrypted: i=1; AKwUvByKtxGh3gUa2yyVkf/TrpL85c617JDpL79iwvNDIyy0WzTo4u3GYunghuvA5FJV0++Xp/a4woghgv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc3QWIU8cqvdkuAygJYzPh5q87qzPlLwtzZim28xWjHaCJhsdm
	t3OhEKkgyd20JAPXEp+QyP7/GxBS0OdiVUqRbQ1g43TnB+QO9Ds6Kc47Ho1IXeMcNIUYQR1SCBh
	rZtyQbQeDMGlJ/vVb74sQhifhJ/xZjTwofOq0IzVC+EvnFzGNar2gMSOTW2st04c=
X-Gm-Gg: AYBFou3KGC5ozEaYT0TBIa1lr7A3kmqLt7fapgL/jyESRB6zMvgP02kEqr5nmUKld3m
	qSZyoPNcqzS+V/5ZLQKmAWsiVwSl4BF0CLSRtguH00aO3cC1z9IQA+/TMn43zjup2+GMyz9Vu5L
	BAPGlBfSd0SVvBNAhEiAjDzvp4yxuLP56FZLSzjOELUDWa3SLosTliDBeB7/D0z/DaRGQ2xaITo
	H+2Iwsbt0CCdQ5Nr/IBE+HrcDjUOR+PXtV9xBUjl1P2b7OJhr3Vq2rIn1KPUZsrAOs23jmuTDCI
	8rYJOf4QTbyGrUso5bFgJ1iydoX1bN+kZil2gPpc9OZe7BIxycXq5YAK2H24zwCaw7TXgj31Idz
	jd3upYazxF/xn0G3/TxjZVg==
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2310921e0c.5.1791889316618;
        Tue, 13 Oct 2026 04:01:56 -0700 (PDT)
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2310887e0c.5.1791889316040;
        Tue, 13 Oct 2026 04:01:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1da0641d0sm1640396a12.25.2026.10.13.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:01:55 -0700 (PDT)
Message-ID: <1afa3099-055c-46e3-b7ae-3921b8ecce3c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing
 and connector mapping
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXw8Vjq3us3u+5
 ZW2oBERxfL36oU3+pHPVP34pr7emvMbAC9yos4/msUv7RNUxh3XdZvyxO0D5axO9/Y/ERcmdd8e
 Zi4u/E0TDAdFaddMi3yuMyu62MlCZ9pCGTr0JF0VSimlTLgyS2dUii7L0b1mDVq8ttNSL7CImz/
 aIVKnCDkd/2hF66eeRyHx0Yb9GDLoVtXNujwkfiVQS8gEjKlBsPc0FTV42lN9JTTqRA08qTZ+OZ
 wXuIs+cfWlb9HvtRAUgYGs3t5E41/l7dEE5Rr77hxDd+JQ0GBuMBT3j2F5gLKYCel52+dSr2yu1
 p24wFWlz/gwq07sIhKQ+6+HKUANckDZdRkClZtHVS04p6MT1pMxDt7yU6QU8jtJxS25AphTUJSA
 HFsZpRg2OnOJA6CnkST0OXlKo4//Key2hFchscrk7z2g51K2RVPSHGU6JtTtxUBZSHZSde6LCmw
 /7zSXscN3U2V5WVYIPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX/3egc3gmlsqx
 Me55yK0TIZUErwMyeHS9LLtfzTHyjPskOK9APMloMfY9FcFKeSSuxiyCbgZ1vquC15tEqAYjrei
 tqeDv+IJ0Zp4is2P5+5VJ+9DCtX++jc=
X-Proofpoint-ORIG-GUID: FhD8UyZi7pDrkwLKbLq7u3-awsSjkruy
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace0fa6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZFXNGOwF0fqHmEQM8WIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: FhD8UyZi7pDrkwLKbLq7u3-awsSjkruy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The existing EUD description uses a legacy single-path representation
> that assumes uniform UTMI routing. This was sufficient for minimal
> configurations where the USB port operated only in device mode and role
> switching was not considered.
> 
> Update the description to explicitly model the topology using eud path
> child node and add a role-switch declaration to reflect role-dependent
> UTMI routing. Also on this SoC, the EUD hardware intercepts only the
> primary UTMI path. So remove the USB endpoint mapping to the secondary
> controller and associate it with the primary controller.
> 
> With the intermediate EUD node now in place, update the Kodiak board
> descriptions to map the USB connector endpoint to the EUD instead of
> directly to the USB controller, reflecting the intended hardware
> topology. Enable the EUD by default now that the complete topology is
> described.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
