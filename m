Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB24D385D6E
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043638; cv=none; b=oEnTjzVf3Rv9JdiyTqASOz0nbiQDKst8F9M85Lo36d9IKF7AxAHN8wchqWXGnxVGnDFSkvPggqUrc+3AtfGvsYF6pOIUSozrR/gG4a/6+hPcbVWoWTu8S6L/aZPAQlVbgHiHpFjVYTpDfpoSuBY7JtfbRMPBZZoeqlA+9aYgXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043638; c=relaxed/simple;
	bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gwi/TTfywT9cHcKaUXRjz9awKw2Li4E8FpxTy7H94ikm1auMIGopdL50mziZrV8IESL2qIoKAiFlN9TQledxU5RpnA7yOrfJHHRw4lLWXn6hnmTwm0ezN9f21KB4RdsdkaVAX/hNuxOhBXiWKfWADMtPTxK73IIpSqPiNYAOKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECxShCjk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYYisWsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECxShCjk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYYisWsJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BP2C645564
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=; b=ECxShCjkR2GtPzyI
	32OZlQAIhQKIt3ynmLWUJFBAJBLcQl77htHF5n6IH4xY8YYxyBDbrDCrPjZOvDyA
	EP6V2KBbPpcy7zkQU6gqVgwNR3Kd3bu6QzIZebsPdjeZb6fq5joaGlWDS43iyKjC
	hFdoD4eNJXNy4hsB+BL50s0xMDzOmrjsXLA+9YVgl3bV4VkP4cqTJ794zj0UUDmS
	oje+pBALDhIwGEH6/SA6EsRDALuJ8Z3Gcp8gkdrMGOshNHtJvkFO61N50gjhVMZZ
	+ZdAaGIDTk6MjoiMmNi6AdXU+T3wLltydHSwjXQtmmEpmQ0HBYQ+0k4/riKMAVP1
	0/58xA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bq25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:00:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso30945585a.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043635; x=1787648435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
        b=XYYisWsJ5Kl41NHW2DbFRSgiER/NnmF4r+lbQRkAFhO5vbMTEy0uswehU7HDuVI7FY
         FeU/t3FbuKnIw7yGCTKLPgJ1Br+KvqL+1vlsx72nb0cPF2fDLCwvF1C+jIJO5kKbA0F5
         CQo+m1HkErHyCsfFlygp3OqxNxGeB/cmMw2XBmqmcrH3maIswhzw3YJjIRRaAXZWWQ4N
         Jj8rXRWUAsC70v/iA4XZB+eIhtSVrnCB5TyoZkpO9IJeUDT37D7O70ZsiIviGSP+xTLD
         NbV0h5chOkpWrDdbSzvGaeF8yF2FXR36DUbO4vFz0Zjb/D+2HgVTYoUX3j4AV4WspAZP
         CUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043635; x=1787648435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
        b=jvYhHyH16PloLA8t7uLA/VBx4eZkQkaTPWB518lUpmnklL1bpE0EZB1nPOdub+37tD
         Z+GYeT/DpcaQVgMACvY+piNr83EaCvJg5kPPQGNyKHTItYY8oeBjVqW0lORXiG3IA0Qv
         Ii44wyr8o3+HXbgA7wVGY/a1eph+wFTC4EFPWBk17KgioP+qzwSit+89s+Ltv/FyTkV4
         XXhPA2YRg75VjqjWiEKp2/ixtZ5huJX8c75fxDvW+JeyKOTqx4qw7+gDxiL4LYrx0Yb/
         kDiiI3I6m7+fY+zpcPvPLF/1KfaBbTJJXpo4cFWJ/Rqr1YYBhFZGaWRYIkcqA/bAaufg
         PPdw==
X-Forwarded-Encrypted: i=1; AHgh+RoZLizmYELiW3H0qHst0ok8nT/Kha3GO2/cRS8kTzLduXEni08ToK+6LDk7SePABbs84/i1emKbJi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzdCAdm/BAyUqAhiq81LQUjDMtASb7z+j89rGy8kK5zR00Zlnd
	Jvgc/L6Oc32gzdOnPwD0jddkty2AO7TiUwZT/CZpSxdkRbp+7lUWb+HGVv0fymn94pql/tVEC5u
	yFBBwviiLL1oH5XZCNyxxVyJyXlvqausq/KxHCcnZMFRNvzq03tvGVC+C6GZUveE=
X-Gm-Gg: AR+sD13qKg6drnY866RNOh0lP/OznDQC4+sl4+Kucsrq90j6BZCsiVN9aKxnsDwGu0z
	PjmZ0QT2tSGyytrpLt3LCGXC5g2SEAJ2/ouED0Rlb5N0D32hsKw/QXzJD0DwznJEh5sV5/3b0p7
	20bEPFA3/dJVf/pTU3+hyUqev3qSqLkNrwf7SkJRA8zD4dh0BRR6+8BP/ZNu2CH9NQIyQkta5dL
	xN02gyFOObv4FFcWQXWxi7qWC0bx69E7nZzAt+IMw0/5lO6gj8OMKIJDwH5zhOrDxyRW3GZeVtu
	BDd+SolrKlzzulqCl8tvEUsW6C66UNc67/rkROOq0A6GAvCBpxmjomq9ZtNwMoiUo7R2mZGvibX
	a37aMhv3aRTgw++zZ/m7JJ6Ge
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr358147885a.3.1787043635139;
        Tue, 18 Aug 2026 02:00:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr358140885a.3.1787043634620;
        Tue, 18 Aug 2026 02:00:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00b60asm1026805e87.61.2026.08.18.02.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:00:33 -0700 (PDT)
Message-ID: <161415a0-58b8-4370-81ca-dd26424d726b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:00:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db
 property as documented
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lHzaslNQv7meaQBLDmn9GrmvzFG3JHeU
X-Proofpoint-ORIG-GUID: lHzaslNQv7meaQBLDmn9GrmvzFG3JHeU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfXxqpVk0lkA0Hx
 pmLtx/xZBcrhTK87NW+6IGYuPaROE1dRgWUjIgOFsWCUxHikJbWGRoDZtDiOMWs2QJourM2teAe
 vIulAP6J1ETM4oMHjYkDrt1lH9zleas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX1AJT7t+b2KXV
 Q8AlbChCpAewoT7tmHKq9eDsbL62Vmc0H3Xbp6vlFsD8u5DfEp8VjP6j27vJGX8l6wQP6Vs3m/q
 OUB4qzZwwHMQU+ocnetGEcWqhYVzPos7WwhAv5o/u2gMq96IHFiG2iAttUv2Q36sUkoSteq5OTS
 ikpT0yLkr1OwEuUJ/wLksq6JjbamkNw+0y7ql/DwZN9Q/BIg0wSG5j7kKZZ7F9++qolQ+itBIBi
 ON6SWMbbCP8txIOYm7xjsRQ2hjHMw7mgsCy0diT1AoYyr0u33JmuRelzPM8+wlGDK45MCzRPmjb
 eIU1HfezSz+Lgk247vOLG7FP1mclNXXgVoBQpE8GEazRmqZ1tCx0Wo15QQje1h8b1R9qNvY6wHZ
 o6YGRHOEAoXVzBb/G97f29Rk/eViJUUL+GmBQRxNRi+Gt1g45UWxXFFBRO1ng4VBzfBUDl4cOd/
 AK0Wf4rgN/9F9yFcQXQ==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a841f33 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MF3fq9KJeJn4W8AoZ4UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The driver reads the transmit de-emphasis override from
> qcom,tx-deamp_3_5db while the binding documents qcom,tx-deamp-3_5db,
> so a device tree following the binding is silently ignored and the
> default is used instead. No in-tree device tree uses either spelling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
