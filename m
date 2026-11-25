Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599026;
	b=djRtLPEn+Sjr4UemlBosuZ6b0AeUmCilUW8uAz4c9eNDccGzwoo31x11AOee+BPrdw+b
	 fQ68E2g5khbswy7lO+pdOLbN1V+YaLqp6JHyYgfhTzi8tUY+CO+fSOKDdCQ8W67Sqvqxu
	 fM6igIFoxAkY5WjyKrhdd+E6uXF+hNqGI9z9BG1UjOLDh0DcQKE0qTk6y4VfaMXJptjt2
	 lF94bBlG1B7meDugFpGXKtvp9Y2X4PEH+FRh+lNEz71twoUACjIUBVGHPrwQiPwbK/VXQ
	 eMVmmMorv7MqPhQ0TjRp/ArUTpJ/ot8gqRvuhTg4I0SJlZ4DI37x1MpCBHbEE04OX9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
	b=jBJgXCYswnGutlGIxjbkRculxVXPksvxoTjMlcNBdGx8G+ZJP0pRZxfx3xLycjnC4dQ3
	 hshGhwveqmfd4fa2G6NIe2EKQMO1CHOWCK+mdD7iZMAzPWmoRZXWeBtY5udPerlKj+MQR
	 OamWAwXrnqpPRGaFU4I4BUB99Uoi/yYGlh84MMtuGhT+bkpOZhGX8seoU1w1iojfdCC6u
	 PlTvomwGlYsTrXdmUsLyZzQs17ONiZVLcp/Ax3o0KVcqNYM5nyo/aCXNdcMo0x580sCRd
	 SVr36NctvNInKctYt24WuejLne8Se9cef2VmUm35gNQGvJWX1Bek4dQ1fyrT8se3yEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLTWBrfA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJTGwrbt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF2606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLTWBrfA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJTGwrbt
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68TiK3534167
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cMF8AgDnGajgqsL/XKmOeeqW
	WFeYelvrpbA+S49mnc4=; b=SLTWBrfAjL+AhhBnNSNdJoCcl3OjCwoZmueEiR4S
	wv1I9ME+zUa2DLwQ0rEFh8ltUturc3vK1NqNxErYyoshKLHtsgbZo+UI6RJ9CnYR
	2XOfOeMtzVJpFHn8Yjk3gyWO3B5uWSlKF/5v0nhCE6i0R4eEGaCceSZK0D3IfSCs
	1w6Xbvcm1iABubcTp4KGrCJ3IwqvBpJZ7LRlXUC+uuW4ef8V/AT/zV120YLma7Hn
	KS7knVatp2lVxNDSJz9bVDfWl78+qaKLiYjZxYuE98RVjiVzSq8aoV6321QKkUcM
	+HOaZBehr2X0UpHSi2N9Qk9vsWTl2uELzhHLFYutwszqhw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj1j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:30:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so5451865c88.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795599024; x=1796203824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
        b=gJTGwrbtJA/z5KVFSLvxOJP+jKWba7kvszTKn5GBkCI+6nArrAA5KVs/b8d4VSNRx2
         kcUfsmddUnZxjiyCkhoR8YwYzcQyvi/gHnB3Hetu9nFMELWo39TE4IB0+7uiTfYjFJY3
         zKXwwZ9aqi3hHcUsIsTcP6EwzfIsOzQHVmQ7/tpqUZmo3qyeSscKw7DKWbm/X3u00jLB
         eMlTOl7jLUPv2pXoGOFaxqGEr9cw4nc13JeDPxvWWYPYtzG3W6JqFEcPzVGHymfUru1o
         yAo5aqsAEFvDz1XJf4yAQILfvqRD0W8nYeRJonJwxHeKfbOs6CNa81ienOffF84ZJE2V
         Zp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599024; x=1796203824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMF8AgDnGajgqsL/XKmOeeqWWFeYelvrpbA+S49mnc4=;
        b=Hq+RumFrh0bBtiGHI1C/rcCkpUWJ00RoLxSqeJwH1WVAu3bgNLsE0xZ/HF5qCGznaR
         IyKp0QiG8N2pQpjRBcg7wzWd/nvR+j/Ki/7ySwCdUo4mplJTOlvbG9wsSITn1DNwdu4A
         Q44ft6OHve1K+ZMsZ3up13l5XquJrvuyKzRCcp+r/sjpZluND2m2y3/++5mCy/2UBilt
         PeDLZS6/9UFsO/oSfK9xKtF7aqVHbkM+/gmiUqwmhDT3iwrInByrgYfUyjCfMUjp0RmW
         bJbLNcLay+gZBWwC3E9Us47e18GAfdS9U+Agorueh3De5+2fv1fSn12h/6BlJAmDfL6Q
         Bf1w==
X-Forwarded-Encrypted: i=1; AL+hErGvMsFd4BsdsjdG0WWR8CAMELRbjhrNsUsPL3cKrNzyGMLnsHovxDspuaOH3QIDjy/YeSSIhvG/ekw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6kBKTpjOJ9rZr6PwxeXScH7DhFVl1ht/rc5cRELiwJBFamjk0
	bAeQZwqgVcCya6gFBFdKn9YTYNbF+HuR84QWDfElaJcn8LMNdQlsKeM6rTFIwqP7yTgoxLZQQBk
	7ihcWxHCrxRhh3XCLzHb3dcymwF2wVPwzCGBxT+92zZB4HNX2xQ3gvWWgi9loZF4=
X-Gm-Gg: AZFdTZdSUhTePQo4r9TKAI/JICtjV4Sg5a4FEIfvo1BKqp+DQw3k//bwWnlX5S4NgVp
	o5F5uoz63cKnCHyuYNnDg8/D0djPeT5T0LalOQ8/k0vM0dWQb5M2r7gSSSRqHQ/GTjBjm9EsHvd
	A6HOoqXOiHrJnEvHEgxnYezfLlTmjzzN7IiAJd5l44GY0Nx54AR6ezPRvftqOH9MJkiVA4gSbZ4
	vLUH6fe4NLR0SdEtiER3oaLjSI1k0/n8dSJMnpLR1EXlqbAhjbEOfaqrRM++/C+Zs77/v9Y7VD8
	2lOWBDw8u4svO9HYQyVITeEid5rrJ88D+KGFSmP4MpD7mQllT8tPnikC3BufX2AT4ah3H0HfxlO
	6qsnllSDEyxIEjtKU8m0b9OiN+aZaGgrJ8s3UOiaigtsV2Bczn9LIMqwSSzWMtE0jom6xRd4vF8
	UWDVJ7bSFYMB93VhXkSLuyNgk=
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr18649564c88.16.1795599024475;
        Wed, 25 Nov 2026 01:30:24 -0800 (PST)
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr18649537c88.16.1795599023960;
        Wed, 25 Nov 2026 01:30:23 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm46753868eec.20.2026.11.25.01.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:30:23 -0800 (PST)
Date: Wed, 25 Nov 2026 01:30:21 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Message-ID: <awaqrbU1n-40XQ5G@hu-petche-lv.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
 <avUMs981FKk7Kr3a@vbox>
 <avV0Y5dLG0HOD1ny@hu-petche-lv.qualcomm.com>
 <awT8VH-ZccQXmw-G@vbox>
 <awZoaJ6Wlfuxvuit@hu-petche-lv.qualcomm.com>
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
In-Reply-To: <awZoaJ6Wlfuxvuit@hu-petche-lv.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX1No3hRY7U/+o
 svQjxOUhBr2990+pZBgnCqwi1b+2Gb4nDs5w8nWifMkvG1gvOl8UreQXtNxshNY6B7F3pLK8TIu
 1GGJbUYr/BFdwW6rh+5meTjjxFzAooU=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06aab1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yfwHPf6EdPLVZ9QPc6AA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX2bkq4RQwM9yw
 SDbolRzOBTAcHkPmn39+p08CFwvSwsgsxzr0o7nWD+kvoQXmzRlXcrLm7KjUont9ySY/NkE/gsk
 cKaB0jGI1C1bAGwxepD0GRk/F5tKKm0XUSIMRVNi1/Zm9CCEyfgJzCbxyN3l2Fymp0wjoSssQ/3
 dVeIJRwKzKpQ9EzQYvbMXFmvePh5vwtHhvRvMehdzFSHG7bL5/Dod7qJycy2/UGlXENnCpgqrKW
 ODdsSejQ6Y/r5TFLwOQuZTVPyTvaBhsl+aORzwaSJbqRI4J90hiEDsNewVYVpsIKHuT5jwK51WD
 mpSQMHUj5TQ0WJ2xJmvlkczAs4ZaGXIOfRJEZ5Dbxox3gKhCYRMmAdMQ9GNqe3qQosTfsXtw38/
 POEUF5ofdlMObXtBw+4AxJY7wnO87CbcyBu2mxorOl+N2lbmNSFGzBcLIzcEKsJaC+dS6eRG7My
 JiogmZJHvz91NuGByUQ==
X-Proofpoint-ORIG-GUID: VPhgWTM3CAD_e15C2xBds9qc3s8Ar1gu
X-Proofpoint-GUID: VPhgWTM3CAD_e15C2xBds9qc3s8Ar1gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037

On 26-11-24 20:47:36, Peter Chen wrote:
> > Which other platforms can you test? I'm fine with the change if it's
> > tested enough across platforms, or if the affected platforms have a way
> > to keep the current default.
> > 
> 
> There are 10+ SoCs enable USB wakeup default on for Qcom, I think it is
> hard for without function regression we keep PHY off during the suspend,
> although it also should be fixed. Let's see Bjorn's opinion?
> 

One wakeup disabled failure has reported and fixed [1]

[1]: https://lore.kernel.org/r/20261112141512.1840-1-26rote@gmail.com

-- 

Thanks,
Peter Chen
