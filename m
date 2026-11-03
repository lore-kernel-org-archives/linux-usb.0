Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699493;
	b=cw7spXL8rqLj5ln3gFDd+veU2M9QJj9euDrzEOn3Z8Yc82WTigc+Og/J2fRXHOjytn5/
	 LmUtxt7IprGaD0p6Y3qgpB+5ecivcZOZgEkD5K8qzpqnsj9Y78C4HAYFW55nIrgu40QXy
	 0EjdfSpUrydBTrOQiZeWwMH0tKxNFOr1uBHvREsO5MApwNTAH0LqihbdYQ18SrE1Ipnra
	 FP+E6npR3H0gQPXYTl/kabccTG4clIzz30XYofQ+DCV4/qMKyjlwLokqJeldLUlpenYQS
	 rcNnWe4F7C8IhWMwE5NgBVnvjvmMU3l3izrPKGsNL40K2iKS3u7tdB4sygN8nSIJ+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
	b=toWP4y/ZPH9rWMdr/VI1O6aBEhypvIzU0xanIQtEiEPu4k8Xw0K6CcBY8IptshoqvHO9
	 MWZHOWbSl+Wu97yByBIA6ZTJWJFPsnD2MsqRpBNKR1zUeIF0QAa0JsW9QfnYiZ3xkrtdC
	 NBQrWnvGPH7QFV3fuJtDPNDJYMRCvxmwY4BVmidgquvn+gGKAbWLlXpHOM+pUIkJVdQe/
	 f7a35s1pRc/9bQXUTLFf44NmoMPwOGbHQ8MznF8x+WVMlbKkbRRGO+qPyCYr89MFW4w29
	 iLAyz2YUtKu4HOAEZk1/TMplhQAOzSoOuoI9PVaLswrZqCcDc0SHHR/5radaKs2e4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLY6HHxE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DhzaJ0Ab;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6B0606D832
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 09:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A6B0606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLY6HHxE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DhzaJ0Ab
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37tXsT1397190
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 09:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ndhs2gPZWQqMxGEvtstXED2i
	vhl7ySi/UCRjgZTdU7I=; b=GLY6HHxEgQBey5ncZnXyjc9HW32D04TovwDXn5gt
	m4tllotCuGqZnLA07vqzTV08uBxlaJe7GpGxQMmnvDiXjvL18OKxErsSjS7dijw1
	yutbpVNjGLfn+TjcFLlUqeyUjFsZoCPTwi+ac6X8VKGRzmiolkIjL8QDRihA3P0y
	X1joBtsE30L4pTvyxzCHr54wYWLF8rPQtY0Lg5uWsaARO7Tl64/zZrBXjSDfRiHj
	Z8/EqW4HgMiT5CzkTkvVSW23TqlOlWXIuyOwUp5QQU9gELWRx6S4sijd4bQycp/I
	sX21A38IVAt7+f9vQQtlMTrl4qtMPcixR937hRfrzziXHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5j1vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 09:51:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943e8ff02d0so351797585a.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 01:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699491; x=1794304291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
        b=DhzaJ0AbAlTuNQZ8TSXHG5SiGdYl17orR4LXwzDpjrvyRUHCuhIRhtvgEtmZFpGf8c
         2YfopVwjUon+61fhIIsveavxG7mXTRGfRz4SmfkFSNNpT9Uosu/R1nr3MOtJkm6f6OPq
         Ysbu2nTofEA3LNYheaHNNahpaw4Pxe3zfno1xgHssjrI2Xab/uvuNWLh2yLay/II42Um
         GT9vhOcaB0KuMPXHGiE7Vmib0U1e1HkjNxFVmLehuYWguo/YU/iyzUscx0+d9PbNI1Op
         cuG9tvGdIn+m4QGGE9kc6kgLWbTnQlgo8CWibf2psUt6YBeoRUBxYUJzOJQ3zClrXyE+
         C5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699491; x=1794304291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndhs2gPZWQqMxGEvtstXED2ivhl7ySi/UCRjgZTdU7I=;
        b=cA5zoF7K3g/Hz/UnlMQhUJShtu0P6ovEWM4KskyJgb+XX6f5rZ8o8X1AX5HrRm3SxN
         k7cg1rD8ywzjxDXvYCNbb+4QA02bBE2dpC97xOY1zsecqQ3IAoCosdytnlY4Vb3baLEc
         OcIhAJ2XPShNlIW12PTy+iFFz6oWocsdyghwJcDwIzq3elgurfqX+1YyqldRMOjb6uR2
         2a/zjc03U/C+nBCxxtTGhM/poAVB+66SkA35HJIzVMa95MqPVQFoK4ExQdNrJchPQqxK
         pZrPJScdLAqrAMNGyVBZvwzlXyOp8NqGFVVR24DyzHjnnI4xS9F6u2mw8vzpz6h5L3x6
         2uVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm6OEEA9LvoaZu7V3qNx5WRjotOaSL/mLL3UhzkQ4Gb7JcAAo0X5Gpz7Krjdhg0V11rediRiBMtBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z98AXA+2oXXeXefiSAM+hftKDOmyXa9Dmkf0W0wZ1MmeNApaKhY
	u0WDLtKdt0N+d9y3w4uGxZ+nTIHQ7UodBYoPX36bNhugRxhD+hVHA5M/ERj2aHqbvDS+wv6KZnI
	RMAldjpsk6jEiP/Acdfo23NlRHyLTj4Vd/kv/hLUmqY0waC1prfSkCU3GLHJaq3M=
X-Gm-Gg: AYBFou314DdHdjYcGX0R3kNnQYwcSzDBWz+XBWBweqpJNarqPTeF83nTLN+ZZaf4/B1
	9sWoOYbhgFNfCd2WKQRWmQpJi/GP39XkRRDpZEIS5eGG94qY/P0H0jHGFbRjkHewrC0CcxyBpz0
	fDx/rHzcVg8kmrIEHZoJREe8SSwrgnHg8nLU0Nnms8B7MGGwtfngIeS7wZ79qwOyvZ+GQbALnyM
	BWNatQW6iBzeGtV7tzMaZ+bYIhgWR/QujTnrXtViER5ZIyL0l1d8tdZbgFrZdwTG5+z/4BqkhjE
	WXTuC1H6msombavMlPlbKMrrmlcP4D4cyYkzBFv9M1mBK2EKiz6HqmO0KytvCVllgoWicoi1WUZ
	VhIvz+zh6SAcgfQhMgEFFmM+CryCdepHuc6cUvvNgN0jpU7NmIOtVvuwv7akLwLE=
X-Received: by 2002:a05:620a:271b:b0:93c:2c15:e513 with SMTP id af79cd13be357-9442178a95emr2014618685a.63.1793699489824;
        Tue, 03 Nov 2026 01:51:29 -0800 (PST)
X-Received: by 2002:a05:620a:271b:b0:93c:2c15:e513 with SMTP id af79cd13be357-9442178a95emr2014614685a.63.1793699489133;
        Tue, 03 Nov 2026 01:51:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b393fd1748sm2186495e9.7.2026.11.03.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:51:28 -0800 (PST)
Date: Tue, 3 Nov 2026 11:51:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller
 as a Type-C mode switch
Message-ID: <6d6aic4idenq2keiqa3jngibrurldo3krytmvjovudo3k5wlmw@zsoujav6f2jd>
References: <20261102215121.738-1-26rote@gmail.com>
 <20261102215121.738-4-26rote@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102215121.738-4-26rote@gmail.com>
X-Proofpoint-ORIG-GUID: l351GjyXuCyGVSeKhmyqVWEjIRjj-N5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX1Wy2pOmGb1W9
 01SWBuqdGCnvuvQkSVsZjvslVxjy3p4Bdeuo3Qb+H1E1QksZPPgRlKmV7z9UXRkJwsyaPU0/MlQ
 slRnSNtvRt4pM6368eYe6AvMWxw/zsZb0mAM0s5SXsG95UM1BmYa2hc+U5L9KiBIbPpadh/9fwn
 8nbdXbmqWfJb+4WPxlZDCoGyD4z9A2fNL1c5eo2MfWaXUHe1r62isrQERPMk8m8hseaVcUd6ot6
 d0xj/+WnZkiSYq3WNv7f3h+6HAYxYDhxroOxCj2RzbPwuLsSrC2fDCMB64mxavXkChmtcY/YWWv
 Jx1T401I/OLI6eCWMEdEeXXiWNSmWnZiSUBKwgA8ECmlXHqwSQbZJoZP3c908p4XL6b9XSwS3Ar
 wzceasTmxTqqgshbYyKoG5aM8BxPGQmWxbgwM9F02lf5VdIdtgfb4yTO+QlYh1pEXj0sHIGIChH
 QN+pBIZFowOKu9xHV8A==
X-Proofpoint-GUID: l351GjyXuCyGVSeKhmyqVWEjIRjj-N5U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXzO1rUCSaUxNS
 gGxuR9gSwrGlaJhwf8aLoB4wqVm5ZETiwfu3lftxmj9vm8fPOEdCXTByLmQRiDeZIyrtKFRiKPz
 CK+V9BsTG7LkfBwo5e5LUC/JNv8NWts=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9aea3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jTYuYfucqK6tsm4y4RIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-03 06:51:20, Joonhoe Kim wrote:
> When the USB3-DP combo PHY is a mode switch, DisplayPort pin
> assignments C and E put it in DP-only mode, where it stops the USB3
> PIPE clock. Make the USB controller a mode switch as well, so that it
> moves to the UTMI clock first and keeps its USB 2.0 port working.
> 
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
