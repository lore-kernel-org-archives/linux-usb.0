Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CC2391E7A
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269066; cv=none; b=ExkM48KpwE3p52zsIoc5uruiwH22UFHKlLdOstl7e4OU8Ro1U8+U37wVwuVYGhPlmq/0oZEjLkTFMW11Forn0psFfAWb7J2S+SdHxOvnVTjnZyNpMJHh5TTnzs5zf32MJIrbF2tTzNRZMEGtZYXaHOh8RmaH5c7mHlomOwaHJlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269066; c=relaxed/simple;
	bh=doEy6iBYhjWO+1eu+FG4HEPb/8Dq/l4nV0w0yrASPyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6wnePwvtzU5ES7dvISZIem+jfMERIvYYhs5oDGY8dAX75/W7Mvkqpxh4AxyGQjSRj238KTYuxZjgdU5aAN+nuVffPAbUHAtx0k8f3OiFWScDyd80elhbNlbpCWPLGGQkZZH0VW5lbo3Fk8JFyTmA7hv5WGHKTaKLVeSS7fZ7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtpLlFVC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrmMa2fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtpLlFVC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrmMa2fr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJd6U2406438
	for <linux-usb@vger.kernel.org>; Tue, 1 Sep 2026 13:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=; b=BtpLlFVCVUNzxEYI
	HgGZSJSdQOf5ayDt5hq+IOANbHz0Vn6pG9Vsq58d1AfZTSZiqYiuXyxygNGE3xQc
	lA+79Bw+n5jXcB4yipulo8IYpZfBSTTw5zcwqGhVdakj/DX98Vmiu3d4z+qO9kE+
	x2c/SHpr99RlfuLqxuZUCu9rWkkT4kUgd5+u8tfe7G8Jk7t4aWsPvApx3vW45Xba
	9Xv6iwLE5NUZrhOx52WIGQP0d785Wi7YfJStxsLwNoV5dJrJ6hQXKy1dYCU1dKLV
	dsx8pCQek6g1+g5gTB2F1gYPp65Rx0zxpVzPtIQxRzQego/2TRvjdA4SCH93liR7
	ESgwog==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2g3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 13:24:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1cf1638fso106244137.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269064; x=1788873864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=;
        b=DrmMa2frw3EHHahTc1/8EMp2QTmLW0uSh463iIL65jIlJZh5v9W91oMV1gZf+9rbPw
         0hss4FVaHt5wwGb7+M+YEpWL79pGfTlxyXE1eigLMgjK1lV6FqasBi/PLEkglQ0v+mv4
         PbYxL8dY5T89ciMYkeIXHhlhTEAryQIVeH9u2UiT7EHUDIQEdjBYbtIyA1kMB9MSvzTT
         2Uk/FLg9BLiGUqIpui5rYpM3G0IW6lweonc9kR4EGP60JjwOsq1a0QNG6R792Z80yzhy
         WBLN+kZyxJIiYzH61irCsukKZm9IZZqgtKysqV5bWIqqR6yjvpvvfHN6H8wKit0apNj+
         kPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269064; x=1788873864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=;
        b=PMRjjy5pnaXCTtdmTgRoraEl2VutoUSQIFFGbq19aEfCCGxSXW5Ql9NRJ2YTfofhbn
         BYFbkijGyOhFkC8/q8TAmSRbeBVHyuyFLN9Y+fz6G6ffe26wMoiHOsvCItlDxzWxBvJW
         nYglmU/1qN7oMEl/VcCdd2wSODLP7MrGFo3KqPyrI0zTpNKoIdSsXAxlgTdbvdchdhXB
         rh42zD16xhx7kacpZ74oWtOpT1QFpY2RepVNqhbT5UMTmfG8xMx3Pljf0CzD7hxW9LI/
         NKR8ftSR0ymIcgoCv99vRYNahGPYQ4hB5ywGVij4+px9UYyzbDbIH8iJ4fKPyxD9DB2+
         KfvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMCuzwFSsPLCPehzCOWMjxlfjvWFK83xi0kNY73mgfs+qpu4USUp/hlRMPhJ1w1CV6vIE2rD2RCJY=@vger.kernel.org
X-Gm-Message-State: AFuF++nUDyXiOEW5r3zMNs+QCaKhfd793d3jNZs0igPy/Rad2qJ0UJiX
	LPYvk68ahhrANFqYmgwhw1G0w+l288VqVwSGXNVHMnM2OoQhe9nBCwGmNdgnicaOiEPTK6zzRdW
	IOEuUqBCGEAWoJRJrdWX/aQveuIKS1h1LeDuFVFGb+zsrLhGRp15CE6RC3CbCrqU=
X-Gm-Gg: AR+sD11C7zYrAznLRd6EYGpQ7EOt8ZazIgkaIEZnbIF8K7pCpD9i03kWG0GNAocU5gO
	OV7nDLnQ1Qn2prZOy1a/7r2LxY9XrmT6PJSz7PAcGC+s//l+EDBwqgREarn905GPmYY6uLwW4JD
	qiLQgtO2MhELHAwHQoa/VLKxHqrRULf1RsSPU5sZpG9wYb/BkWeE735HOAgejtCCYDKDbXa1pC3
	RlOz20opQ8sMJyEAz1kGIlF3JAml7TbeAopQWI3kGjfOHsg+J01ip0PKnj/fvOj480b6TXgH4NE
	5xE/BlJ/OkZ0Dk86wZIeTPIrR61gE5v4TmMhOTQ31KKaJG9py4EbW2Z3yVA9wKjI3vqZjDWa0n7
	Y6cxRm6lCcxx4RU46cge0mA==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4431818137.0.1788269063532;
        Tue, 01 Sep 2026 06:24:23 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4431799137.0.1788269062980;
        Tue, 01 Sep 2026 06:24:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5a53sm2874355e87.8.2026.09.01.06.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:24:22 -0700 (PDT)
Message-ID: <3c34164f-08cb-4e33-af8d-c5d19012a1ff@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:24:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
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
 <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96d208 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=_thwKDryVKp783wjlzwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX4j1VAG6wZYDY
 oy6v5erbaXx2vUzn+80r8GJIKnOT839tJv4ilsmMrh6TfhNzP0AKxKEua+PxcEFZp9i6gQUUHAc
 thGx9G/HU80uwIIHMzbFv3IWmQzXA2bMTTcZ2HjIftv7by3fYeQWFz0uSxGp2XB1H7+N7Vk+xa6
 udLv+9wkZ/lDzJKCsK9g7B029Z8AP3W/xkiT/JiBcqpwwnXQzBvzUX/7BZ2RufJ6eqaPyIIcxyZ
 VldK/yBmWpi8wS6kBpMjNvo761rfahx7Urmvr3v1jxwmHd08IYjxlkxTi5FR3HuyJtq2yBhFErV
 k68YZIUald3LddOEbOZX4e+JvkjAAjkFRIDYjSXSQ7foGNkvr5WssytCF1j/+9msBf+Jaf/cJ6k
 BkSBAL8X+qd2ABEGytXTRh7Th+E7UNfintyiKEHC9X4BmnotWehyi4Hl9h65auMFGKAHpMbLYnT
 B0Ry0FQ9kWHqswZ6zeA==
X-Proofpoint-GUID: f9hq-hEPLk5HbPPpCg21GORdN2yKCwH0
X-Proofpoint-ORIG-GUID: f9hq-hEPLk5HbPPpCg21GORdN2yKCwH0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX//sPjEKdEhs+
 LSfmy5rtRagAwqE57ykuYsWeiUdWl234kW/C1kt5U91Ae3sHj9LeS8XDdQ9j8nRYr/70IF2ebw6
 p9SlbUV1lz19iotXM1GexRRQqtq5zXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the 5V supply regulator and enable USB Super-Speed PHY support.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

subject:

arm64: dts: qcom: ipq5018-rdp432-c2: ...

please

Konrad
