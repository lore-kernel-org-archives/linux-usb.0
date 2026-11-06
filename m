Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977600;
	b=B4HD/waXWaSR26L6cefMEeKQ2MhG7DE0aZ/BC0NtahEqsw1UpBNxCAoie+5pABn4N7je
	 sAPPxsNucsG7l14URCmR5E0qqOGgA1QRihty2fUc8xz/8hGQ5NpVwysbpaDLnHA5eOZvd
	 9zlKNWVIQApO/nmnqmVujCBmLT9ajPutqL44e6to+qwOyy5ii5iLdn1+NbAVkgQdkPlDh
	 SWtl0qxmVzRKsJnsT04+vWxdECOFFMHPFazeOB+u3sxnqYIp1R55vGqqAba30tLaKzYAH
	 by6H+7bilLOWzo9KRGEnNTjHYusquEsvELZc26uVPCqI9kcalQOd7AmzkKis6KzOI8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
	b=JDAPTyo8VCkaNwR0AJAffDP5YvTa5HzPAYZbmV4sCC0riunTD63jAPxrkuyAg5ZJMN0T
	 QAgmdwoFE/oMc9O1YxAaE6SpLhMSk3SZ3iQ6AlAhaYPF1OxyitHFn9J3FSdy47yrdUsUc
	 J+9EEnRegPnqKD7TGGx92H0qXOUwBzQvmpVRutDwzoWvyM+lbTfFOS6+pXthQbQj1DLAU
	 G8DxPoJGMQSShLvcpDRWVXaUi8z1G8wBhlY/Rh+LjQ9G9Sue9BO45fHDnOz5REKaD5lv+
	 D/vexpaBcBWM+asWAqQwwEItcnftGqmTtdvU8J6FfrjSUqFR4Cez0gNbzl+szsxTfUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b0vOnQ/5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XliKU0TK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9F606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 15:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b0vOnQ/5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XliKU0TK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExnuS3324685
	for <linux-usb@vger.kernel.org>; Fri, 6 Nov 2026 15:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=; b=b0vOnQ/5IcPAh21P
	ESwufSWkqa2WlHgnCQvEueVm1DX7NhE1muU2tZuVygmfXeGKyHBoVldgukjvcyNA
	wHJhrGNyjOHwbp8v69n17tWUV7cpBxEh038PxRRAbHIV8q4a3sfKC968dFUbZ4nn
	UIhuW9YyJCjbfJIELSgP3F1w0Dg37TstYuzGEGDM40M6IJQjAlkJI7JCaN0Vn7B/
	EMMZfWkF0yt/Hcdqdu2RxVM3ryCPFthugstsCxni4jArW+Ci7CDxUa5q9AvIGfyf
	azg59TGzclW+ENIOPDNd91yo8o91WxoaSTEOMQ1DR/FJGosTbatnFAjLmMfjrafo
	wKjYIQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9bbqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 15:06:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5cc87885c6eso25262e0c.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 07:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977593; x=1794582393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
        b=XliKU0TKFQcUMOZm7HB0zOlU9QpTng+zHK5EJXKHPLYCNxrdqvRy3zizzAvSWCoknr
         /jfy5Tybkfj9ba4OYHWeLna+Iyp0nUJih5Y4Xzk73L60EBmMtNvYjPjwK8DFWi/qVVRR
         W6uQBDFnn4XcSdD1Bvff2Trn4cK8pGZ2v20+3oHL5QoBwmNORnr3SgIr6umieC5lXqLw
         l0aloE9vcJq1ox5cZyPRkIOUdgi+OpnoqMGr1FvAdD+k9gabmWLefrIMVXJKXIB4y5X8
         LPh/BQgeBCRPS4aOZy9plSsdRdn0ri9iRDxqtkX/x1infvJalRYzDRDoBJd25Cz5E4z+
         l7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977593; x=1794582393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99WHrn39uhF8MOZuOAhU6ApGYxS1ibLGpRDYrU16dFs=;
        b=nf3gsEWpUAOWLEuh5DhsP/fjqzVp3kJtCFzo3+PfuXhGw1CxFY88S6IHM6p8aRK0H0
         /EJPCeRLBUv9te8rtCP4TQXzoFbWGc1VIPRojOlM8YLN/RVa/eLPSfAi1NePmvDAeG8d
         2e6BwoYndHL5VhxOIs8hSSZ/R+7BMqD8pqWmsnyu7l8OW2SGmhmiRLijl5k2ZQ9oKQ2w
         5weFC2yPwBICLIx+OnFZTE40m28lHqe7x0z5cuEXwYsrLD+elrl0LrNx5zKdJxn49m0M
         DdhtVISV05/ePT/0Vd1yZS0LbSYW51bnIwUgK8Exh4U2FKGbEiFqJ2+G6ru88qxeC/40
         iCZA==
X-Forwarded-Encrypted: i=1; AKwUvByv7Rq1StvzL1WGDpwqzcOeWo34GmW8iolFKuJNTFlrj/aj/CGP2xnCImOsY9/JQn/Ob2cVc1E+I7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H7icX/LB4E2MjqDHF3nRNG5E4fcae/x9F7AWH1KVUGumobh8i
	Un2Jw//QMA8ICO+AfgaWDvKNrGTqJv73K4c4r+pLBLPqVMekg4gZChxxpBUvNMNOZw1G5kIxLC2
	hV0YeI1zb6318nWQaPT8FrKZZO7pFZ5BcgSIQK8zcsii/6Fsp0wc0gZ0bep0Ly2M=
X-Gm-Gg: AYBFou2BkFRG8NyuOcuEGXNL8y5KskeghSunlyXLqvNG5ElZWSgDTTlEQ4KoL9f3NKw
	IGFIGDuegc6TyycCCySem88VC9soKwSB2x5YG3HKtIwklbHOV3zQlYJpQhdcqX36yul5aO8MTLZ
	RAAVSLE6n1A49Ry9l4b8hsSa7Qa8Y06Qbu2VevlV3jQMIopQbE8BXwDFY+sk9l7JFff4D7qHk03
	8ollcqqT3MXwhaikzrMNzaKJUc/9w9vPCo692EwpiprfOaRlnewrtixMT4UVnAfsw7e0u0tUzhG
	8h+ziNnrLyauNR81JOGz79VOXZKvsqBCNrh+5xOuNzkGi4C3c65Unw8LePWjhC6OxCNQx5KEDQW
	PIcda+b//LIulXiuwWEeKB+o8jh3FtRMoiuwCfCZlAOUOCcBikLUTYkATKkasVxZvvCfRuQ==
X-Received: by 2002:a05:6123:4007:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ecc41a5a8dmr1177096e0c.0.1793977593024;
        Fri, 06 Nov 2026 07:06:33 -0800 (PST)
X-Received: by 2002:a05:6123:4007:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ecc41a5a8dmr1177044e0c.0.1793977592530;
        Fri, 06 Nov 2026 07:06:32 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d487be8aasm36689066b.15.2026.11.06.07.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:06:31 -0800 (PST)
Message-ID: <23b5c705-cd55-4c0c-9c95-c61afb286416@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 16:06:28 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] phy: qcom: carry live SS-link state without growing
 enum phy_mode
To: Tapas Rana <tapas.rana@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Wesley Cheng
 <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jgdeeVySQuon2rBBl85XvtAj_CcbDkPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfX10TQ40HE8Gr1
 bXkbZjBF1C2RzHabD2o77demnyn3gX1auQnZRjqLlIHwbbeBAfVWILS1ByoeZfO4DmIkV5rowKI
 RwwM3K9Ay2zQVxMwQ5P0w0y1gUNGOngjsF/iHNTBkk6x0Yaa1AJwauF200OaASieVwN5w5byASJ
 d2FYH7wvDGajaah6eO+cuADL/ykFhObrwUlSbIQ1+mzhYRLBpV6rk4cPSSwksmsYrVW8MC44kU8
 4vCZjRLpO/FE0Cf2/frWQpGuVLc0gPh5GXu1W/zofHAVkNNG838psqqjhXuZlc7df46HL6bbzy8
 uga1nCszkJ/5LqakejaU+5vW/WFjAVFNYpGivNzK1qRDr3iuxSb8QG4Ib9oPuTYrwiseoJFfIKP
 ufAzSNe0Vxv4dOAYBZzb0BRhbYR7uBWh9ZnV1pQohtg8Ho1A9WrucrmnUZr5+o5lWRjRnQ0F3mY
 fJcW/i87S+hqRB+0v2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfX03Pz0nxYtC8b
 ekVeW8MFwowahVlHJJPPwYezSQswYM4dfSPxEJtVLR9WQsp4YhwWBWt7heDTVE3aPV23m//LLFf
 ah+m8s1NIfl2ISGeDQGHgGyoQ9XhDZY=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aedecff cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UEx5U1dda6wf6Co_AVQA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: jgdeeVySQuon2rBBl85XvtAj_CcbDkPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060060

On 11/6/26 9:27 AM, Tapas Rana wrote:
> QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
> autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
> when a SuperSpeed link is present; otherwise they fall back to
> receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
> made by comparing phy_mode against
> PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
> calls phy_set_mode()/phy_set_mode_ext() with the base
> PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
> submodes. 

Without much more insight, this sounds like the place to fix it then

Konrad
