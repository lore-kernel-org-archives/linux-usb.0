Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795513183;
	b=ci66BRY1vUxLtH98H9emJjd7afza+2t7ltAIatbeeAHL7FI+rOxV4eNON5e2BaxafipD
	 TbsXELwJbt1Fou9MGC6jgZ1VInE/UEBD0WbG7Uu3k58AeinAI7Zujr0ll8sBs5+SgyZ8e
	 AKskRztrR+PejMxNYJA/ackTBpsv7JsxrHXJndc/RJYMBL7WD7vvZfXeY4OhyS7hFgt8q
	 kHy6tIexST+ZL2NS24E0IuqzcL1u1ydk1ZNAlQ5S6cYTIC56yCpq94Cp9iGtT8tWh5OnH
	 kFx8r3SOxC07AShZkJpIFpuLrtKbf+4ZVY4E2fY62RHzSf0sa1GH9BvrTb5SQO3LAMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513183;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
	b=NXmBKp/AEz3nMx6Zi7FJZU3GASzzb/rBlOsN9fh3q1O7njMDcz0fRqAD1cEAe5npBYl6
	 5FJxPR1ZtTyojn8cVCskJdaSh3dsKqivb8L/qcv+X1RipUGBA44CAkad79x59z3UPOLiy
	 izgSmW71Fw5BFokpGkOz9zkU5kYnTd0NycYS7Fhi8tf4A7HAkxryz8hMOelbR8AbZOpJh
	 DVe4kkqWsTImnqhqXe4i9Kes40EanfWN/ARg9/c5hF5oGekOZ7i16u8tDVrAUlHT0jKzC
	 5puSitHOVkLT1ORMXJn9ooFOVudczv85na/R0gtMARAk5qc2PaQelYi/v1w1fcECZ/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTk8bDSE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WMXKYfH1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521D6606A6A2
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 521D6606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTk8bDSE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WMXKYfH1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5m3Cm2848362
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=; b=dTk8bDSEiqxTbg3U
	oCSrJdEvIJRJSkFKq31xn8QSz8auMxz3OMom76294AEERLzHdUhss58H0lSpKtKE
	0GaaohZUnx/Bm02qtXna0C8ZvNdydTqmfOgYz5Ya4BooN2AIlE0bqVFrAUr2M09x
	WQBHSAzzCxlU2JArvfbOf0Ox0TJa8kCd/xsj9Uzb2ifO40ZhaJnSYI+tEP70a6zA
	MLkmsFiPQApe8HUCQuUGxINbSA2bXDDMhBVvw1h7NCf+9JCRZSx6LFOsX4edZAfz
	SZmzfte0A14PfJlIqWFkZdr5BYc47qJjsmfDDLW6UL8dbAJAucpUZzokS4tWxnBt
	SD+UPQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh8wpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:39:40 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0f1c06332so65802777b3.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 01:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795513179; cv=none;
        d=google.com; s=arc-20260327;
        b=IMVuKRfbkeHDH0kyjQ5cSirWsscZXXIZeqZETQqarKJlM7PekAjRhk5V3DpxqW8+ZL
         pMnXGEC9fuNSb/HDeOHgc95gzm5Lyk92eHa68RfYAi6dZ9DQJ5lB2UNzeUDtyO9hzmbQ
         WuKFzdjsGKwsKjotDESSHfyqSkxFb20DGfgAzcB8ejzmVPaQIP6CnyBd/WP+Q2s4LW7U
         ++TeMzPPf5BDXyydkGIZswBhaOLys86n0XCD/FDBR3HlU8P6CXnhA/2lzTxEsFXWZlDx
         LcZRK8QtMnW8ZnoNJaOf6h3sStnxxh0/pKrsj+KbEydSF4nGWj9418E1M4kOhr0Ws/MR
         d3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        fh=8+cFkWi6T/vwsdGKqlWLDh30LXiOiiW8PKtuo1/8rqo=;
        b=YjsGbQn4YU6/LIrsimbxq44h3+OnqkOcZj7YxktX9jUL6L6dp0qBzZZ8Fy+lhIIo4n
         gbnrdv8g43eYA4SmJxuq+S8t4amtQIK3swzePnUECl7p/rKryIDiD30Me/B/+YCE9hxD
         ZDQHujniNTwA6TgyMG9e2fn/ejnMEFn8hg/4NOhHiMMVhRp+QMk+ClJKmwr/5dy2NJlF
         OFZWbA/8LbH8a5j26VHy4cAIWb90NdDl3CJmICZ1zu3+ClKTmVVlRVjQQypW5+oBb5p9
         kdtO7rnshM7FGXCSO1G/15QWJ0zh5Kc+vzfb3ozNx1UnCeRqdk64twM/CEv2R8TpysYm
         N2sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513179; x=1796117979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        b=WMXKYfH1GbLGA0n1SAP/AWKZLVIONJPyt2UyshxCll64fTWkZJOjUL1Mi5HOzsP53e
         7JW85+JF7Z5MLE7Xblri4sxL657aHOXUG2tSSKJxI06oiUGn0wRa4Osqk1kRdFwz//2n
         OQEp2pOqH/JRxDv6LVvYefbfdEzn3mZVJ8HnrYbAkVyvnN9axkvA/zvZkKS+dliBEsHd
         Lqx7Mpw9Ae0IYdSU4gXZaLJH7OOeLKnxRRZGXhilI6LiP4+kvLxQl3sg0+ntNNO8cOfb
         dp8IIQ+lNRoYxC8a2xkldVycdMXISwp0LJEqfTex89pGWeSk0RzEgzCiU3HRlzBErng1
         QPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513179; x=1796117979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        b=gVGQ8XrsPut5yrsZ+n8E64s/AHkLQPb0bsgE718x/LCLkqGIX2I9ZykXElSd0fASK+
         YgnwCSUN6+fHX7SwOytpLPLh3bgyaVNKQf97Ni2CP+Xtx7uNtFVJFOlSujn5XOI+cbiL
         fdv0NlKzRTxBEeUkzANVSESQwcr+JyhCexAieKCr2H6kw6fQL9huNd/mhmz+QVr7nCl+
         peiGwIB+SqM2EaciL8w9ptFxmo0ZFyQmdJM1UkgqToUg9gdbjlCtnGc5TpWQDdLJeY6H
         CF24AH9U6w6ODlidSOBoQRF50IxFmAr0uFtWQXN6BqUxYBOAKzv1STOJIgL1ynOmpYhX
         yxpw==
X-Forwarded-Encrypted: i=1; AL+hErGteIN4FuLoSe4CvT+m7cvB5LO6t+Jp9AhWDTpxj8YpZrBx9Ns1ggrxrPPbsY9PXrglvMFf2tC5PfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kHBBXiw39R4KtKAXv5sPX/lnamlAzDd/X7qy2YuT6km02hvWK
	WO4kOfVOO6icf+m2UO/R3bGfD0nOPjyBb9wK/jJydCQ0Z7VgO+vqSOrJyR+oKcwkFB8GxsSwm5b
	Fa8lTIaBy+ZKKOfo47IHYm4qWPLhVmOFdbUSealvqxbD9HPzPRbWNPQZQSon8Ce/9WWhAjfdNst
	/uBmesUHfUxWTphNu0nLKCL4fd4IsDMmJBRdKR4w==
X-Gm-Gg: AZFdTZe5kQ60oRiuQtwXk7LlJKDCCuGIw093kLXFXa8Uy9I3KRqMAFfrlG0+qw1bG+Z
	8wdnBXa6q5VE5M/QzX5++KhCF6pQ6rTIUc2ZvCB/0yAC08a5Zz/3TdzwOhYQd4ZsKsYZPYSDAm1
	15V414OV0y71DH7Q4tivgzrL0cmdesrlbkGZ6nInAp+sszdU2pA1WYmQY=
X-Received: by 2002:a05:690c:9a8f:b0:8b3:17fc:1066 with SMTP id 00721157ae682-8b5204e150amr61751847b3.44.1795513179547;
        Tue, 24 Nov 2026 01:39:39 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:8b3:17fc:1066 with SMTP id
 00721157ae682-8b5204e150amr61751737b3.44.1795513179141; Tue, 24 Nov 2026
 01:39:39 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com> <ba76dc4c-f8d7-4d7e-a9d4-c2de88e9a9b3@kernel.org>
In-Reply-To: <ba76dc4c-f8d7-4d7e-a9d4-c2de88e9a9b3@kernel.org>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:39:28 +0100
X-Gm-Features: Aa3M54r9dlpa1zHkZUYs8QQIpfUY7qTgP8CTQlWBurbJeaYxxsFl26_dQcCj_Yg
Message-ID: <CAPzfCAYSMpReEtrendxOHPtQRCEf-9UN--MywjS+f=7OOU4HXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB Debugger
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b055b5c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rs2CXmWTE79dq6mJqzAA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX828tiXQWPlyz
 yFgMPmchbwxTBRptGKvqCCQgLJE3QQqw9VT7LXs6WRj/o5B/6jaom4eN3K5/VV8Dp8fxs6msjpW
 NTrPCIt8FaLytzVYMMJy7Me5V8q0tpk=
X-Proofpoint-GUID: 3U-xOy74ouxOfe-WeL_zIT4b7u7ZrEdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfXwsANhwRIub5v
 Xdo2CGXLZ9y32zQ2lmn5Ls9tElmnTGf6qe5DYCI0DFpVU65KglSh0nP8wnX5qb8naGIhfM1yeWK
 JQvgxlJCpClGtu7NPBTISZDKU0DGrGEq7Mj5j1JFpTex9aWFhty6Mz6rF9gxLKa6yxsZRJO2BFz
 BCQXIpv6PsVJuEiIWEZ7tDAjKrkKSf2C1+4YPfyFJ9ksU3AkYFr1GHhqskgOJaSpo/4V4UZM0VT
 qlKH/+WkEldfWMsge97EU35zY1uskugddNCD+yk8wPoMfAvsijMsE/iWN8sf0a4CmBr/OI33T+U
 hHgAfUusBs41xAQ+81PokOxP/l31KEdc4lI5a70WYVz9rFpoyoyxTkV9LrchE8IrzIpqNnbDBSf
 r7YmKhlVjo97S/s+ezEEIjnJV6qdIC/Tli2qo+80+NElTXiuKs4z3JdpfsjenziOAx9I55asHr9
 bYEb4REJjDjlhbOljIA==
X-Proofpoint-ORIG-GUID: 3U-xOy74ouxOfe-WeL_zIT4b7u7ZrEdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240036

Hi Krzysztof,

On Tue, Nov 24, 2026 at 7:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/11/2026 17:42, Igor Opaniuk wrote:
> > Describe the EUD:
> >
> > - its CSRs at 0x1610000 and the mode manager register at 0x1612000;
> > - TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
> >   syscon;
> > - its interrupt (eud_int[1], GIC SPI 189).
> >
> > Hook its port to a second endpoint of the dwc3 high-speed port so the
> > driver finds the role switch, while the board keeps the first endpoint
> > for its connector.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
>
> USB parts in this patchset grew here, so now DTS must be split:

Will do in v3, thanks!

>
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
>
>
> Best regards,
> Krzysztof

Best regards,
Igor
