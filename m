Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482001;
	b=CphF5gMb+6mGNXJny2euKx4e005aqmW5dMNBLzUwEDWxgWm0URDe3ftaWCTqzGwijU0f
	 ssFGeK+ua+7XtbIa1FhkqawhACCP5A/nGGxABjHyRTAoQueIiWP6Ffhqsj6GPgg1g1qsJ
	 s5a7uY47wJ4VWN7hXQyLcP+w0zEvRWqKrVvA+hzP7xJWsZYWlm4+d7KcnBM8okkLgl6TG
	 ORxNF0un5jIafReeV3PQnx1ldortvIOiHKM5/spjpzX8zRYSVDJOVzR6UY4698jOGWm+C
	 XJYa+kdVHvio6uh46YJnS7ToCDX8YUuhHRNw01BgbJHV5qrbgPl0VirOI9M95nEf7tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
	b=P/Kz/wnNwzwwNV8P+cW5uNVMsBrzOt2O9Q1ydv05taV5y33Q+UWZ16eGhf1ZxH+XlRrV
	 7bUScKdaE7WZUnNidW2SfudaVKflsxkJqZn80d8z0I66nR+llH3UIG74uJSMmwRIf1uAo
	 DvkpkdS5QGJWcQ/y8upn82qcKCJJcUgzkKeuan0WYSgIvqDJO41EQjMMKX8F9Nc6zS40/
	 yj4mLNQSZWiSf9UCPa306zbiMPOozkpv1zmQuRJiwQkqnt6Kk6BRHJzHPsgb6nfzxkPs2
	 3+lOw3TUwBHjvU8Eh5tINL8A6/wfY0v8Us+pF3KJYdhzsgalLbFculJRThs3jBQ3nPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lC0XPaJz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkzFbT7i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3CD606A31D
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3CD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lC0XPaJz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkzFbT7i
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tF8u620201
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=; b=lC0XPaJz05GRIrQW
	n1H9FHcfsHzwjpXJJAkuLznQ3BULE/Oxb1MfCFyTfZmlmoLWt8gFqxe/NXJY2Zf5
	j38d8UJqo7WhAax3DnSIv+ltq7sA/D9++ecjqKF4u+ZIxqSOmkwlrq+piF/RfViD
	PTFLxopqD3Pqp+GoZwTJK5SuFwqzNfNhCgBujZxwiqBbHNJ/WGhf+0wX2JMKWcon
	FSsgEm1mYTmw3XcA4pguyo1eWHJlVKhlKdVA1Tv8sebX+dBoDfOoea5u54bYQYJB
	ipeoAagYLEoBsVavwAXGGI5yKpyH4YWyilEtgYvVCdcePYrWsoZ5hvpte0baZHmY
	EXeVkg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsc7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:39:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso56150985a.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481999; x=1793086799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
        b=bkzFbT7iSnrHUmc64jj1L2e6dz0XZCgt3yvGJNv4/v8yfTBHOa4hQHKnTHTTilX08L
         xkWp9mO41j65QJHtd13FWWEZdxoxP/MAhh80Sw/4I9w8x1ia0S0MjuIgXm3eMYn1wjwO
         IZuVsDGMRAaiMavydwrxtUplQKKH6dYTbHmyIvihReycD4QCX6WqKQQYTZjrOo7Catsn
         IGivRT9o5v/O8vjHDG5OEhe2awNkZVtZaSR4DavpNXFL1zCLEdemhlFklaEVD5GMjNqD
         yvNJE0oUHBDi3YvhSaELZ2LKh0Ly9Un/RKn/cHGC25FCcJ1SlqmG72vMAfN1n1G+x21m
         m40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481999; x=1793086799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
        b=pFTd5XmQW0tkZg9/IgXBPhrSSZiWbtt09J6XhcYU8H1JyjuVnkqGuEn8NrbITjzYP4
         SpdpbecK8S32Ul7Mbp8qu4YZ6VmGLvml9CAhq6SZ6HQtkSp0Uh/g9DzkgZ8soA0U0H8v
         pRRAbIMFYxezUXklahIXRV8wB0joZQM/C6Kl6M7vIfNU35t8pe1zidTehDirRqoV6U+X
         /ln4lyryc3gH9qBJuscpoW/PIV008CzKrga+4o//cCoEYC2UwxARGEtkyW6SANhA0zyO
         5mqvgDP/fR2QO2GKbnv0QiBTVb+eUAfUgSpiI2Z+a1yWxO43s3CyMeWGGmFZ8eHZFbFM
         Z/+A==
X-Gm-Message-State: AFq9FYLp/6eL5zlKy2dYgw/0pSBaM+vF1Bk07MZnN83k1pJkPpJiahcr
	lresW9Z2ns7l2b9R26+5g/ItNTx5oq8M065rxDs/ULAiHLNEL9uooFiIMQI4SnzkRcQNeFYgl70
	aJ0639BF8c+p2NWtCKVghQ19rrnVliXnT/w5sGp+Y/emVwoOjzHcLv89HybfgM5D0UMKlZPE=
X-Gm-Gg: AYBFou0aeuFjNPbt7JAhMy+jcnCGvp+3dEs777dswhfjHMb3cyt73WJ501u4HE5U833
	Rk7b7U3Zd+5fRjrLnmISIz4yNPdNTE02xZSr3bJALXu548WzY0er6DWYLHQA7AcNvwlWy7rC+79
	JuSMjTPBtrw2WAYtUigbbR58xM07apOeZDr20THLl+N6xhfYsEZkj0q9qxI21SQG8joo/ax2ypF
	QXxaHyroCgksiWPk7mBxMGzCVRDaXdMxOkGzJdHjk3PXkSE/Wv3f9lw++5dHJ+SVQgmvCiBwR4Q
	w+2zBhVXZBmUUHsERYenshadjUAMdCt8OQZc/g9x0y76wGAWkPvVlqx+7ZCbpu78UQk2BultjNX
	8m12qwQkDzTzocuQlQXv16g==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1772977085a.6.1792481994012;
        Tue, 20 Oct 2026 00:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1772975485a.6.1792481993572;
        Tue, 20 Oct 2026 00:39:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm4978138a12.13.2026.10.20.00.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:39:50 -0700 (PDT)
Message-ID: <491df02f-c122-4349-ad6e-c27987290f73@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:39:48 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C
 controller support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX16Mk4s6D+DvJ
 m5VZ6BYyKpbCe+p1wmcMWl2QweJi0+s4P7jz38jdlNQyO/s1xPNxonArVr3hEMA8eYOBWLdsTMA
 0lYJzRievX/z4NS5ThMQ2+0HJNjAZqI=
X-Proofpoint-GUID: vfzqXZ1JpZVZo91qvwypx15ohH44hFcu
X-Proofpoint-ORIG-GUID: vfzqXZ1JpZVZo91qvwypx15ohH44hFcu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXz5BhZFxlyl4f
 v0hLsBBWg+NwPXIrFF3VXbQhsJNw1K9L6uIJtGnjZJWcLTQLTt4IAWoB8l3m8LaiyV66e6KaOXZ
 644XdDTCayulSVhZEVnWNm2k7ICGgZT4KT3rmtoQ3FLt3UjOzwMASBwpNUzLgetDqWqac1zv5Z7
 hCXjrVrKk7JJHv0TrjdjssDi5ojIYpNmJWTIHxITnP9lkNOYjWoygC1EL4zHNh1f6RhUHDWMsIW
 HfFXBisIY8I6+bUrRmG5VeHl5qx5iG2o81T5mVdklWGvaZSw3UgYLR83ZYNCv7yRgqX6Jsz0AVG
 RWjQZnfQ3riAHtcKqd0GHHTD9bjrxaIkLLN+nJOZttqp3npHERGGOm5vbX2mC8Qo5X8S2T3PgT7
 +QSfXD5IGFhokEm2thh4psUFjfUQUkOH4a14pwlHQZd6Tjc3S7osfpso7NnQs1GajdRRFVmjm8N
 HKI6GJAzO5jcokhg60g==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad71acf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0dpjz_nAn25EwL7gGyMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/12/26 11:45 AM, Akash Kumar wrote:
> This series adds support for the Cypress cypd6129/cypd6229 dual
> Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
> handle usb-role-switch, and wires up the corresponding DT nodes.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---

[...]

> +&usb_2 {
> +	dr_mode = "otg";
> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port>;
> +		};
> +	};
> +};

Do not redefine existing nodes. Do:

&usb_2_dwc3_hs {
	remote-endpoint = ..
};

instead.

Konrad
