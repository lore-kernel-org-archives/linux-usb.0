Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4434E3C09F1
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735934; cv=none; b=Tg6a6YWv3j/bIpNM7zdXqNQ8cUdkmbvqoj+lS2M2aafacdCRXXDE42J/z1uoDTGozhgrs0MQ/KOjXl1aJ8U744SQE99DGhYYI7D5DXrSJZJ17jy0qS6nPfQZcfgVzNckCrOo9psmKZP4DAOUn7LzfNZLlxXVTtfXZqEAn7AclPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735934; c=relaxed/simple;
	bh=BBmzcHRttvERxItwEBK80w5VIKJ6lVAYxb1TAHNxcK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6kfLj1xFJ6ssbewEWIw8IZRXtTg7FAKuJiGZjnnliFM/feNtzn7cFK4wCLs2lrHrhOfOk99cRHSwjT041r0TRWwkK0xG9iYxpfTPOKkOPRwlvUKSe8j2DmVVW9AaJ1hNJEalaMQpE56AjRN9QZznY9UjMuJpTdI8cMxVHVdk7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGqBgQBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba0pBR3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGqBgQBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba0pBR3+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CQA7481807
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 09:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=; b=NGqBgQByz78n3dAq
	Qd3HNPEXJ0RKszpJeYm4NgejTKfSKJzWMdKu/a8ZUg7kxepi0oCw8uLukiJESjCa
	ifUySoNQ3Y4CnPibkWTK0KBtbAgkZJnC6vJppddDLOV7PLTBkkkmFZQ55soRHayn
	YojJWGYTSwxDki5rf/LllyMlS+KR7dFBqXYhcyYQ8EeG/MuOagvJ/hpgxFUhFro5
	ymIRsK2E5haxBr8bQ01/QrPnRhZAAyEajCzaXb2WFB/YYXY+brZPmRcJvp9oG9ti
	Yg3Se2GUSx/GX9vav5S8ZUupXtkqIrW2fp/OEoBPBN54/phZlHYxYSj97p2T065L
	20TOYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1c2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 09:18:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so280931cf.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735924; x=1788340724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=;
        b=Ba0pBR3+ft4LzMf6qZzOm7GHwuPiCWf/gti69VmwCCKQIj4GTJC3jG3JiEm7yxg/xb
         OpD9xUFyalCecMC34Ve0eP8hpHOaacOjrrPtauTBXd+MaCQ6VbiNCowxXXfzoCR7f6+n
         wq2vJkJbTD4KAUU9t6jX/OK8p6AB3o3DNGPqGYKerCFYU+Mzj5rvWxZKmdo22bp+g9bp
         FNZA+nxLPuWYU/U8i30+0mklpxeOL3vBwHvwqXTowBf0Q9cg2LW1YdCAxvtOjlzvk03x
         ys5Reu3B8TWSJhqRtRQHrYE5qTCK3RUu/37aKqduSrhSJvDJp7E+cys/Kq7nDbzHGpsi
         i5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735924; x=1788340724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=;
        b=bBWtkNnfoUQMkq2qH73qbVDAvnIKqlBeG+mrAAqhIG7PVdyHMkIQ+DDcczUDzqzxGK
         EzTM8W/uzmWCPJCEwxKFolB3acUlEBtP1aBSBlHiKyXOWuGKVKbihf3JoBBTo1DHuAs4
         6nb3Fi44kZaG/cfgsZfqB5hlW54phTb29GsxuaJZTEc5XLRxWVSsnJFwric8j4yZh7vo
         pIzoJd58wIKoKaraBM2BLW3yGmLmkWC/H4YikRdq+Ym3KaXUyec9dxXHpTzwoCfYJfrd
         895vsKB9P5Yp67YpD9k9yxNXmjBICG9heF07VTrgAfPea2o7vnUynHv7Ho48TVprnHCk
         UfLg==
X-Forwarded-Encrypted: i=1; AHgh+RrboVyQLJutEZF9XB9s3uV5CUXj0yY4idsepql78JfMQpFhg4GlyFy6YeLgZ2zZYnHEI1jNyM2wHSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l26EYUNZDYTIBPWEoGumMyb5L7sqN+7WddkfgFMAPiEUvva5L9
	H01jILm/2WEIvt93uvCqDnlXqcgcB2B4KJs5RiLuOXPZrj+NO3F9lByAXZZp+FFGKiTERnSNjgi
	kRaMDqd7mQn35EISSpBaplloA2sRGTOgPDbNakKVqv4YhBYjK8CNikELQ7E245jY=
X-Gm-Gg: AR+sD129roq5IzYU0odeSvDDNm+wRXrJ3dXzqDNRMld02vNa5cVWOmxrTTIY+34nKql
	5UfD02Pjw+GL5bfhFoXG+6Aut8LOybtsZ9+O7aYkd8VoiJA7ghvpfyB94rczaXMwx+BLg6S9rm4
	JejyJDzITOu6Ww7gKTg8U5FzPXFSbgl7j75e2LMd8gR1rEdsaFM9GrtrizonDCZiBGHzIPEl/bc
	kL8K/d44CCqELgwZq+ZISBUtgNwZH5DrKbPW8jNAJ0mXZsG3sEd9M8191od9W6sOqwHmrPNUbFu
	QR71AiesZ5118TUifFCCc2nvHOl+uCnIHVAPylNI1bq8cSSAGkzQRRRm1paFeb9rBa9tBfyu8rI
	u2rJyjnV1Z4VStEHJ0DTX5QYF
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10789381cf.1.1787735923561;
        Wed, 26 Aug 2026 02:18:43 -0700 (PDT)
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10789141cf.1.1787735923070;
        Wed, 26 Aug 2026 02:18:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b235csm300936566b.44.2026.08.26.02.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:18:42 -0700 (PDT)
Message-ID: <28002a60-9a40-42d8-9583-947194da23fb@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:18:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI as
 reference clock
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8eaf74 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=qOnNiLhTMCbsneYrw6IA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfX6vmn9k0TbhGB
 ql37HVfcVwegUaA1IbqKQXSV7Mi+IwAX//kej5rUF1Hm5cZnjvohMCfza6/2RitgcVPY6Vnosra
 Vni0Vehy2W8BtHj+pq9hqfNw8INaZao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfX+lia+BNa7cRs
 do5KxUt2sSbydTbj1U6ygLVxI5+YEtjJiJUjkUvGNrlGQDsbIsntD/xJcwbhsEcfEE1xnnzSmUP
 3LeDOlwf1IDBocrX+k5kRJYB65OGQlvuO83xMoZMhXTSP71HCAVvmcIecrKhPLnbYbNpHb3Y+97
 t2AIpc3uafXa/HPzNX3aPTg9YFw1BOPncZPeyuCpvNL3hhJhiqd7GoamECfU3oQzGhq6OAH2rX6
 2BGlFGrbhm9j3f5bHWREt7IE7Rxo4mZGLcvWPcvkxc4EUuXn0v0iZWbTvFcgOQSkTBP/Whq8vVO
 nE14jSb8WUVpuFlbvTjJMttJIGymoaQhzanAyULx22aD/sKOcCbILLjPLQ7WI+OuneI4LCAN2hz
 vL3susNTJkKFTr/Kx9J//AGTU2x0b9ipjANrzQa9ef03ly+Ze7kdwbXNSCOhXvbY4b0QPUOokLr
 esvA52iKynXjAy7Uodg==
X-Proofpoint-ORIG-GUID: X8NNChHMfJ-et48Dmj83kLzylcRvoujc
X-Proofpoint-GUID: X8NNChHMfJ-et48Dmj83kLzylcRvoujc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260076

On 8/25/26 12:42 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
> 
> The clock rate is used by dwc3 core to derive the reference clock period
> and frame length adjusment. This is needed when the reference clock
> deviates from the hardware default (typically 19.2MHz). Above mentioned
> SoCs use different rates and, as such, the core initializes with the
> wrong values which leads to non-functional USB operation.
> 
> Read the "qcom,select-utmi-as-ref-clk" property to determine if the UTMI
> clock should be used as the reference clock. If so, set it as the
> reference clock in the dwc3_probe_data structure.
> The dwc3 core driver will then use this clock to derive the clock rate.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

There's a shorter patch in flight:

https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

Konrad
