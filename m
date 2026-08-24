Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86E3F12E0
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562889; cv=none; b=I6kS2/BBY8uCcFHtMilpZ/FZ+LmetRaRtVvKpoVGEmmnJ46nWEa+skg4cdR0DUXdTDgufNPF85k+FGXCWVscWGFxBxbduGjdxl8TTAbchYUz28XjG2oGZoI2sPpSLhs7elBSeYW05PblX4gGRRzFaOY9RW2T5RE22BkHwG3IaXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562889; c=relaxed/simple;
	bh=wjBDqucFrRC45yMGo+rPsfNjFdgM9qjfUM6yowFCPEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0iZaqaeIIOktZBQxYC/XJY6IvKNoXlEDZZTuh+A2NgGIdm5dX2xIryz9URoqqz0LSi8BJMadFYPuMRRtqVXm7jJht0IgwAVIciCSDjDtHX0/UhME5h4nbKtNkmViXWMm7+if316ywlfU6NZbu0aV0xxGcRMwueRdDDmyIMN+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asRfMmz1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XngAxgv2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asRfMmz1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XngAxgv2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99CfT2083024
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVKjACmPCTwpOjPO5Zsk93gqawR7eD8Uoji5YK6o2TQ=; b=asRfMmz1E44tekbH
	Ma9yQg4lA4ttV10merKpK2tz1tKnR/6PvbKaPam9uuz3egvVxWZ47SUN8GZCKD0v
	urQ2BDB3M2fWaSp+OWhbOxqcAN1N1onYVt9A6i00gDni3XZ3KeqIet8XeJRtoKNh
	gi/5Strk4pGU6rvxbQ2qXu4Sxsv4fsgyyvzw91nLkIVFkoBCncReOrdFwvQ20jxz
	ek4YyLfJhp4ZAO9Dywd1PQQSYHWszfJpSgObyU+QTORik6tnSGRBTl3XXtqutFh1
	ZKGwtKf3xhOg/OV0K4Gh5Fn7CVBpcX/8vbF4ee8ZM/aCgG8Cqai8QVH2kLFRWis0
	w0V9gQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtggjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:14:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52845bd815bso6355991cf.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562887; x=1788167687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVKjACmPCTwpOjPO5Zsk93gqawR7eD8Uoji5YK6o2TQ=;
        b=XngAxgv2wV61myCR5t68nqUxfGQUdAkipXjy9K2u0oaRzNbAO2voZAezV1crNnVaR9
         asr2KctNPoY3DA3aOsGVL7RMml2ZE6qE/HHwtijtyWHmOv4AbQUiqcseiNuVWUt6Qijq
         8HJuA8x6/DQdXDBSQECqn7LNz4Je3kbGJmifRuGVKWa8RaKH6dlaEzORKxXIFZEwJXhl
         CksadqcnmaB68JeQO/lZY+05HrKq3nB/M2OS2e+WuinBf9V9yEQxfZpLEW2SKGrkmJSp
         aAw59yKtcrCoeuqnkh4wVCQNyEdoR+9rFDvZGbDFiy9gJxt8eW0SPQZC4hbNv+4yKLeu
         SWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562887; x=1788167687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVKjACmPCTwpOjPO5Zsk93gqawR7eD8Uoji5YK6o2TQ=;
        b=e2ygB7JZfGjUKmsJKV7dXx6hJWEzvyQpr063csAQCrY4UF/i7Ittp24o36ahUin1YT
         mG+fT3H2dO47EDSKWgWF7t9PokU69qM/7DOrCwyFkIRFPF1YEXUKCxFTNM4hRW3SBt3Z
         OUQLBNBD+UMlEVDi5n6pqJ6DFDB9RkA0N4F0dtmD0JOQlcNs4EtBykxXz/S/hML41FII
         4Uq2eZgEWiFHzu+JEcRcyZ2LCs9hyBV14cT+0XMEynyRGsDi14I5rVHRVfzOOqKbJaQ2
         lCNzzPoZB0Mkd3CMT2AbY9kceKwg5Sxxi9FRWWcbMPovIFfURJ1TOmIjfqe+pUACndSl
         E9vw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9dlHemecqoGYH0WRewEiQzzRU2EXpCf+MMRXbDXWZG1U41/Lu8UFwSzpL+62bOMy+Xv1C+F47tOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nohpCbqLa+XSOTHFaUHjUXB7EjcsmANh89jSk6glIJAX0Sw8D2
	3+g5iboYi5qVllk7Jars/DT5mAqlBWITdnRFqFnmPQV/I317vPy5ci4R2itygpIwgAx9TlEdu9n
	uvtSwgg7o0qseAbAxgOXB72EJADudIpIe4lM56SaUdkN0wgQPBumBbAZXHauzsWI=
X-Gm-Gg: AR+sD13ItvqtgG/zRru+wDc79DQYX2p+BnVpmf28vqlWazaPnkfcAwwvGSqOlD3z6LB
	B0mPPmNkKA7iZTGCuE60oMxOhh/0TxQFOh3NnsK8dmKTSroFM/4jVYwL476HshRz2uv2McgonCS
	BemjX6Xt+CC9UXeCujy5PjSD892XSrxrgtVyiW+8xhMyfjYIPOCnf8UrboI3h3F5hROLJGrPSVf
	PKUR03y9GhpQWDtHCQdDVnmHFg98rOCeLmMvpyd0ycCdn8JngLSNJ4fT1pjKEAMmrk4WjBUJxt0
	riwED4cY9UPxCAEHsTzhkh5pBHbB1YQaI9VHYVBUIRSUqLxRcCYXusTPqCsYeISdJ3v2w7l9DIp
	grI1fUbuIHgskwhHLUBrtHmok
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr168245931cf.4.1787562886780;
        Mon, 24 Aug 2026 02:14:46 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr168245651cf.4.1787562886372;
        Mon, 24 Aug 2026 02:14:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296a46sm1295602866b.21.2026.08.24.02.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:14:45 -0700 (PDT)
Message-ID: <5ee26dfc-1924-47b2-87ba-ef15faa2d324@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-4-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-4-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX7kNvgWrwJNYR
 OcIRxTy4KYMdavoJCK52R1b99iYPCJcchsRpKwW/dwZi/lKuoNHzMj753KEzTuZ5bp/oiKN9pIR
 ZzfbQeygO5fQmjMpYnzQaCWg6OekGyZVPhbrpgSYmUtDQag7p9OLzB/37kmcxbnXYHP0acqgMZT
 4KngXis5g5ncem7CKaJHfGTCv0x/FRYiShyoFbH+/DA3MYpbBoRu0c6WQxf0h33+/f9HFAY0Iqr
 RgAFXT220E1HzxaOIGXOwCMJPSgXxAVk2eLgFbQ+SIWKI9m7gA1eGWSWoqV14Na33xxy0Q8QwtS
 Y1N/kH6izTJgJr0ligYQyGl+Ov5FYecoFeR6fJwIrgMb5W0z4/yVmP/aKhP/ObvDPxvb7mIYvo2
 QftsBEXV4rYBen4jdP51nq/RuDBHDJYTaJtKcgjMqvvWVD4Buw92nNyD6VQVa3zJBeAgl7cFhFP
 LP2uQ/6kikNIJ7LbLMw==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c0b87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3IDAERHfcDOGiZqD5XsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX9kMA8A7DyEer
 YGvCdqOVQ5kl2Rb8j8DHjQ36eGcVm5nkMsXNMP/BzD2HcuKYfkwahGhPWKVzbnC+kfdcuxNjs5h
 UdalF7vT7PT/OoaBjFbSuHobSVaZkXI=
X-Proofpoint-GUID: OsIPprRS_ylck6yBH9A9HyUosnwdSez0
X-Proofpoint-ORIG-GUID: OsIPprRS_ylck6yBH9A9HyUosnwdSez0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 8/11/26 11:36 PM, Elson Serrao wrote:
> EUD hardware can support multiple High-Speed USB paths, each routed
> through its own PHY. The active path is selected in hardware via the
> EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
> the High-Speed PHY associated with the active path. To support this
> multi-path capability, the driver must manage PHY resources on a
> per-path basis, ensuring that the PHY for the currently selected
> path is properly initialized and powered.
> 
> This patch restructures the driver to implement per-path PHY management.
> The driver now powers the appropriate PHY based on the selected and
> enabled UTMI path, ensuring correct operation when EUD is enabled.
> 
> Historically, EUD appeared to work on single-path systems because the
> USB controller kept the PHY initialized. However, EUD is designed to
> operate independently of the USB controller and therefore requires
> explicit PHY control for proper operation.
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
