Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747992;
	b=g1K8cTQI2MZm0F3S4HQgDbe1OCqa3ULp5ChM8UqJ9diTcZ9cYSIg+sSDGEbjNcDqcNAb
	 sIQLCp/ItnGSHZUYi/00KP/TUnJE2W0G9ldeMlauZyYNJdMJ8A7nQd4k0NnH7IDMisQlI
	 J/JGDAcbdq6ztm1qh9z4YpUTeUTpDoS1Oezj7fFqdiitk7K3C75w9CxiFVZkry8hhK815
	 2wdaR8sTOvqZb9pNCJ2Y8m0zuUwNMxDvv7Moypk0KGrJUjQIDa5fXjfumkZxDKJm2Zdaw
	 SDvoB3SwzA7BdjxZgGfklNdA9dn945RidlFOspiAjIxZ3uBTAqgpgGBzuqpbrHjG9Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
	b=zNpvtbQ/bP8K+xPpEyi1VwHlsplmS8W8Sgd55+d16nF6UhQlM4YwaEq38g0IL/eToW3a
	 af9U9rb2ez1urQp3ayt1WLWxlQcJBBws8CGe5WGMV6aPTm76r4qh6i6Ju/MYzwTM4EYzq
	 aSB/pAtl0tH60DHsTpHUKjMW1g9see84EBXrjBFldmPwLGRTqJ4+rntKfdblSAMYr/VH4
	 rY/p5j0uz4TtWdPTRbM8+EL3ELevXcxFCbgU10C4JdYXM3DOThAi36rOScBzfEdDovxsk
	 i88JlaO9k0uCtsrrU8SJDMEMpPJOIztw2dGmiD6owwkvM2L+l6a884+RPOzzyaupJ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/pTGnW3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhd0EbfN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8068606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8068606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/pTGnW3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhd0EbfN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvx6q2573557
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ihb54u+kgrrE1U7Av2KFgSmC
	Ki3tz7MkRPHnycgWiQc=; b=G/pTGnW3L7T1p6kJiSc40Jvqrw2jwPX4UjJ9KzJ4
	6nRa5ZdWe/88rqF9vaEtah+LhXsrXJi6A8c/zR+3xo/ZjT741gIdnvb+buaBTL/K
	UyJrPIhY8NjFi0ooab/iFFVVlRqKlnbR0+vgAQFgZMgWGo29lCOk3UF5bQM2Yj73
	PdD+nSZfmxLXTEpTqGUSFmTyeHh5yZ9yuqm55ni7gf0ox+CzKSPYUbr6ZHXWetlM
	7qLuHRSxNp/TjeK/mGiRB0uEpzcHtfkHH2TEnAgKbqG5RCQRv35F89IWzEY3kQR9
	G5dr8YIJZ/g4uv5JUiK26xOm55kk4xQhxjOvD7tfDyyocw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u498x6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b56c696405so11296253c88.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 18:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795747989; x=1796352789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
        b=jhd0EbfN5IufckxD3j8IsuxRwLKc8DwiFYnBFwUvLBzjAIPrEuPPUpNVdpiyxYb/+H
         YCLz2GqSN8wxnheF2xHdSvnM3prhlknlGqITmwXOuNMDDHTlZpTskXaV4NQTSNN1bT01
         yNB/FQc8RjHvbKcdA62HnSx/01/0wu6jvYstqeXX4A6PNHVQ7Ro8Xior2g3861BXBiTo
         iDWAgQZSKbFtOd3LDzzPw+P4BYUMVpPMEYhOl60EEPhXCuybc+YiJC2SD+Ri4dtvKfp3
         F7HQJloDypdfvpT2T5N9Baneajn7SgPsKw0hj/NGDHw9Zao++Xkg6BNuCXG4aYUul7UN
         RV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795747989; x=1796352789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
        b=Czj0SNhuhnLoBVht9YZJnddQY+o9o/iSCSYSg0lbsAus8mwdgbgrGGanS704XsKKmI
         EmPBzX4q4IqOKgWm6K6hpEgm0kK7Ck+SSunBmNr6Wuir7D6rXwaUH2M0sClimm85WLPM
         0Di27DkHXMHEjhc+yfu/7fCR7t4UIoTUnlppO6CBFY+WZr/dzBSMj4C7wZEpUs/qKULz
         39mmC/ShtFt6YR7kAZMLEjIRaW7XktteDoQZ9uPS5cmajEYrgg8m/+O37mhWkQSXzGse
         0BxjKOSv1nsKmhKyMg7wzZYrW3y3xzyzc8OZVNkZLj9FKoxWr4uHh9C/Dl6heAYwY+ZD
         xR1Q==
X-Forwarded-Encrypted: i=1; AL+hErHNi16G88Dq2SYezdOJwHAc11r2oa31yQM23/sxSWNOvNeoKoEvd+RjhJ2cRC1cFQaLppC+H2gA5HE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rjRSz7jNyXAnX78ycYJzUY8T+kA7uZ5q6wJ9MSMyoQ9zSQORE
	fJdDiGY5TU1wobl+/g3d7LJeSVYRBpp6pI74eDYKro7ofeSzX/liaL9sNW3j6CxdV/s7jqImLsD
	1IZDgydPD79EEVhke+xTA+5iJtQGdps/87PDQ0ZpOWunPZK5sOa+vGNOWHJhs6SI=
X-Gm-Gg: AZFdTZe2w5wwu81hEaeLtjO/ZFSoIiW+Cj1C8bloNwijhmpu3uRmvOgd9th1o7G6MaC
	SpLyGwf2zn/ZSklKI0bHd8AjWOKX051+CCEkU6GiNxhUbkRQ0JcDNgakPwGbwVND93Zd/X1fJlJ
	x8hx+kGtM00FpiyqYax7FnHurNe+ybM8xshi/jzrrBSmY9hPjB6KKQsZY/wCyvvP/IHfnIOXXC6
	bfeyLazbzerx8MJC8PNJ8N56KjUILLiShwf0s2W+Q08p2thFc+wxlgXzx3kr/o7BMQvoP5155pJ
	W48hoTF0Mj6jT0vd+K0ndA9jTfLdLPxdcC2mB5/bMG9NyTlFMMa3+t5A19qcrtZvWDpVtsLDL+k
	RxQs2L6ly5tFsfmwb9l9Ex7Vf0NwsJjueTTrXEG1sfZi2AYkmXqSR2qtVOiYU2kkSezQbhlSeyl
	39kVvilUsVPY9G+bVodEGL9Lg=
X-Received: by 2002:a05:701a:8148:20b0:196:e2d0:129 with SMTP id a92af1059eb24-1b55682362fmr22466593c88.2.1795747989428;
        Thu, 26 Nov 2026 18:53:09 -0800 (PST)
X-Received: by 2002:a05:701a:8148:20b0:196:e2d0:129 with SMTP id a92af1059eb24-1b55682362fmr22466571c88.2.1795747988922;
        Thu, 26 Nov 2026 18:53:08 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm63321776c88.5.2026.11.26.18.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:08 -0800 (PST)
Date: Thu, 26 Nov 2026 18:53:06 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types
 on unbind
Message-ID: <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
References: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
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
In-Reply-To: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
X-Proofpoint-GUID: 3XmfrAKbz44X_3YYqjoTINAJLPt9Aiwg
X-Proofpoint-ORIG-GUID: 3XmfrAKbz44X_3YYqjoTINAJLPt9Aiwg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMCBTYWx0ZWRfX7DTH/QeFzYQ4
 wYTM1aXm0Fpbow9lUEB5Y2GBPbmoloOm8B78dEYaS0A9IXKf/w3Z/jGqPO6jzUQ9KpMb3q9ZwUe
 q6bO+FT5fsFApg8D76LIwkshUxHPTnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMCBTYWx0ZWRfX2rASmtp1aWy+
 AyahrbEYDoNTyt9pahcFbZbbnybZxg/OHeGmoGBh49bykUCPC9J/9wA9oj0SmfZN40o4NW4UL0Q
 raqErY3ave/8gsEW/eYD8a3aMpexOgs29Doodo+LvUHTRsCm4ACj2FTAXQ4upTdLZBlGctIeoF0
 HUer2j3UZkR2Sdelcvd8usz7fXyYjoY+5t8IE4jorsUVd0iGm7FdklwUb8gmpXZtv0RimWiFHmj
 tAdOuD4eBuAYmzoaS1jHYpX/45mKWFs67+HxF9LN1FBYR4dQrR/iPQvdIVMn97iBUDgUruA536+
 pR85sU+Z9d2OfOcNB09DsqLGtB403ZB8Pu6Zh9/qJ9pvyr1JiwJ2DUVsX8RdTzT69zALr9/fHqQ
 zvJBzwSoItdS/wyJLV84YNEZDJ3sPrTxDbLxEHj8qi+C53idZFZNQnczvXS7AkDARcoTBMgkWen
 Q+V63JVjy1cegSZY9qA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b08f097 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=k6P2HFnLoGwu0CQW8jMA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270010

On 26-11-26 14:41:24, Felipe Infante de Castro wrote:

Good caught.

> Assisted-by: OpenAI Codex
> Assisted-by: Claude Fable 5.2

- It is not needed any more.

- Add to Cc for stable tree.


> 	int			dm_hs_phy_irq;
> 	int			ss_phy_irq;
> +	unsigned int		dp_hs_irq_type;
> +	unsigned int		dm_hs_irq_type;

- Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type" to align which
existed code.

Others are okay for me.

I not sure if Greg could get the patch with attachment, try to send with patch
text.

-- 

Thanks,
Peter Chen
