Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB64C3DB326
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268593; cv=none; b=KxvOL/8yupH0wCkN1aUm/zD8j96LcluwkkR9liYA1NFDNIuG7CDH6pPqTcLi9MOzECidw3/6NQPUvkRSLWtYWGFhFriJ2ElxXKflIsmm5kMZptGwj40gro3GVAMwahdF5iLUU1RLhM5qZ+WoyWQH4QwRW7u4nUA1CcmNd4gbhzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268593; c=relaxed/simple;
	bh=LQ12SJUBaxMvNbSyq/WSxG7N0fuhvkTI6OyQzsXKTSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKCgcMGHiYc5OV1KM110yjMfu2FlQGEDE7muRf5STTJYrI7v9s7/OvmoxihL4m3eyfPrsPDMkag0QV4nMWGzRUXCEhTz/KxXQPzhX7CSiea9EkORpGovgw92FdIUrUtON4Bxg6IrHod/1UPjqYDKG4pp0jVv4kgGzyCe8xSbjI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0w6tk3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rh4OycyC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0w6tk3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rh4OycyC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdoS1713068
	for <linux-usb@vger.kernel.org>; Tue, 1 Sep 2026 13:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=; b=U0w6tk3id0rNfBAS
	8apj5ENqwbMeBUyf4VZWyDAc8MwLV7WyLghvqZDfjadRanUylve3o1GWTWBzUxui
	YUa2GLCvsaj5X/Z0sKhpO5MPT4isuKQ6JM/f0Cl1sey772Det9Pv7YqjzFJE5mv9
	qPUtd6NpO3knt4liK+GZe2XTXKbSRSX80OOGXfZf114WmWR+q7sPwDKq3iPLZ5xt
	YxyrFLcdi0SO1zLiUWqfpKvEqS4ox18mvjOREDWr0xaK3l16LlTHit/v7M5tm4Mr
	GiRvp349WdlMN5pyrZNAFchut8V3C7C9FMtPSMzyk11nwSBocjKhs+bhIGDco5vN
	FqZ0Lw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxape7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 13:16:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so143179e0c.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268590; x=1788873390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=;
        b=Rh4OycyCfzz3RZt1reUVS6F/tKWjdwjU12UvOtTAkIlsskJYpMmkAsoUXz82Xm0i59
         DJx6LjlNdUIBUa+/7YBdrDEINg56ExncueVGy0qwoAVRqEDjEGKVO35GAtTOZwDjh52q
         lvdtPSECscT5RQXPDyZC4oeWmQX9+NjfgvwiR/RLvwzRtH8ozRDjbcOwGc3SL4kzz6jp
         dkunNu5K3uZ/eZr0/hpJP7ZJKBlx6N9S+TVplZiu+apQplXlZ9FM+dyDYQWvJRqnlYHY
         7VePrAE/6bzrnN0CeJhzcmtYH+Ta2PBGa2vmInQaT4yphWnEk6ORt8OOoUHL7F0eDgGf
         jIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268590; x=1788873390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cy90vL1GBodthWnfvenYboXQveUCRwT7k88OCAWjnQc=;
        b=qlF5Eu7RyLXPkLcAhJ1nrnJiUwo9yWPN33N7+opIqvi1kao+QfFVqVR/XNPV4zIiTX
         97vNGqScRTKbO7kJGw2TIHNteli8f0vQCoSKemYJfuYui8iyKZUuyA0Q5jmiX+CH80FL
         OZ9VeAFbsJy1wvVj5xbhg3nFKFulR3LdukII7aFC2papOhM1/CWxxt2nntZsuKvtaNlf
         90q4WD4yhPpCQevG1iJGeduVSNXsXFXy6BQZmvgeS+MnK2OZtJrgSuRzEXA9cPez+D/Y
         gc59OzHGSp3hzfkeWNZEEv7Yw2g5anZz1WWOJfs0oPdJOoTiu3QOSrc/VcC3U9UNuy+4
         LYGg==
X-Forwarded-Encrypted: i=1; AHgh+RrZk373kdZ7mUEqwfdXFmaF+UUk7/My6PHju4Oa0j9KKo0Cr71ilbMuLkT1hGeCRsHmh0FmPG/NRTo=@vger.kernel.org
X-Gm-Message-State: AFuF++mC6hmLM0LMAz6U9MLCFZfbP/EUod07i98sOsCVB45tMa/88WGH
	Rv6tYnz7Y0+83ZvF/ypSdKE5zytWQ5BBMPj8sw2PBCP1z+sduISP/3Cup9OHAqeN+GWheCEHk9I
	ZLzmKUAy/AwiO2wnI8/PrVQ2D4tRoUGXz9BlYnCtc+3bw+ox3Sf91THfL41PdL+4=
X-Gm-Gg: AR+sD11/Yo/70DhbsZ4MEcWSAcwRzEP/7q3yYvOAd9CzswNXxpER6hpSF6VnJ2E9pW6
	eqWqIo6530ZzQoWUuhwFjFlVluz+7gVdTq244TivmrxMCUvSZZRa0c2YBRQDlOvNzfpBIBx0t7t
	dZ+A7I3nYEWFWLq/9KompDDzV5NTCscRJtaBcJxnncYF1DgGR7+LrLU7auyI6x1wH4K5P4pM6KR
	ehcJgPCKVq5hLfp9QuULC1nxQ7w7lh2TKr8q4nvKMEICLcdA4xePwWbsRmTv+VTemekOn1PuLZF
	679q2H0jEMLygtvE0kyczkaI4hhAfhfnctoP1R22CP2GcqV/BtNq+2QfhkEwltjHZwvBvwu71MY
	Zu0CsBWn0DGkX1v++zYnMbQ==
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4560778e0c.2.1788268589888;
        Tue, 01 Sep 2026 06:16:29 -0700 (PDT)
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4560669e0c.2.1788268584589;
        Tue, 01 Sep 2026 06:16:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a305386390sm22564121fa.5.2026.09.01.06.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:16:23 -0700 (PDT)
Message-ID: <a1d438e9-0a12-4b05-b154-eaf9d1a6d31e@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Use
 bulk reset_control API
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-5-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EosggGYeW_6LL8xYbys6Qfs_kNQ1ivC0
X-Proofpoint-ORIG-GUID: EosggGYeW_6LL8xYbys6Qfs_kNQ1ivC0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX+hInIRLrewnG
 da9eHr4ecwcW60quyi3Fj06i4uUuQpMwUpy0dfo01HF6W8i9nQ1QVMOPgH8oyeptujubaTSb3z7
 e8i3P3SB5i5feNYkZMhSVzxVAqzbiKs=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96d02e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UqCG9HQmAAAA:8 a=r7ctpyJW7PmjMhvLdxUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX2lR4SF1WsV1x
 5m6mnLIzI99CsYplsJKfacOMNHGj4A/MRAJUKU3fqL3fwJ9M3wgxMtQAJ4bCtuVWMFWU0HV/FqF
 05MSkcdhdRd07l1i5BIhUfyGJ8zU4dAxqZL9w0PoPPCVosMN0cbTPXrfANkNGGtflq3GbEPmoLy
 qVP1sU1LoaOLVY+Vw9dn/v80G5mQvohB3eyZS3VZHd8VJqDf/b6qcCK6cI4arduo83cq8FMj/SV
 K6RDGdVEEkJ4N3aIdzBrGcpxqwlrJ96yd2sBn1TP/c+ANOFLPFLUASrX657R2j9JZt8GCTGRURq
 P/03yAMAaVdKlBZvPm4fy7fSNET0YlKH/8xlWgCcAgrR31IbpmwVyMwdrFz7QM35xCvQSM45krD
 KGYGOTGmbFoRNo+eyMxr2cUCa+W4iuOvErP/5SAtCJGAECSnwNrVNRKEhFPc68QSI0Ekp4q7sGQ
 NfCC6A7nUMmrHz5QuGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Switch to using bulk reset_control functions to prepare the driver for
> managing multiple resets, acquiring reset controls by name, and
> uniformly storing resets in the private data structure to enable support
> for future combo PHY functionality requiring multiple resets.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> -	phy->resets = devm_reset_control_array_get_exclusive(phy->dev);
> -	if (IS_ERR(phy->resets))
> -		return PTR_ERR(phy->resets);
> +	count = of_count_phandle_with_args(dev->of_node, "resets", "#reset-cells");
> +	if (count < 0)
> +		return count;
> +
> +	phy->resets = devm_kcalloc(dev, count, sizeof(*phy->resets), GFP_KERNEL);
> +	if (!phy->resets)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < count; i++) {
> +		phy->resets[i].rstc = devm_reset_control_get_exclusive_by_index(dev, i);
> +		if (IS_ERR(phy->resets[i].rstc))
> +			return PTR_ERR(phy->resets[i].rstc);
> +	}

reset_control_bulk_get_exclusive()

Konrad
