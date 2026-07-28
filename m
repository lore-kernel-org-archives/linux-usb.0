Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849553B14C0
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228293; cv=none; b=tt5wKu1XgfFtRu5lami3dumQRnG+QPaHMLnkldW2jYw9CYWwqHOooWVMgmLzHZz+vGMXKdM7pwyBJih/BOSCcgWfAzGCKD/VKKU5mDr+mkpL7PLTZ8HMLxVCYhndh8sPxy9ebzroytAZZM4Ain6pfUC/DJfprV/XYJizT5cluuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228293; c=relaxed/simple;
	bh=Piam88+iLIzqYwnRLJSwryfS29l12Oc/d7TIFuXWUOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGasBp744RnoHt7dBlUy6jCbp2LZJcyR2E5kmye3IekLmZECt+l2omB2Rk3vdAVDwIysG69PcxR/54+nq9RpCLi8kimoEAU/EfaZLOwHFbhqtceuMlU5uEx6bTT7ynXReW6Fud25u9ENgC2VYAPdf04V8pqfcJnUNVnCm8OF3P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNWAZGz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcJZFR/b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNWAZGz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcJZFR/b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82VVi2145045
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jwjuk+g9ZLvdkL5zLAfxKOD8ANAOlnxaMHdSXdx4LT4=; b=BNWAZGz6CJkVuIbj
	aP6P9uHfxnil5gkQzs7hlSvb5oaXi25XVgUs6WvIpMwVlzB4B/0rbgsT9GhSJgfX
	3aUlbzuSuDokYlCD8TM9DRwvfC96NRQ5ueghDY8Qo/hKlPwjg0bzxOVXi9YxiVhO
	SP2wB5JMM4dfSlaRlQNXokJ+tHmp8TWP6RzOdpbq/S+r0ppxPY5LyZtscR5dKH6o
	ovOLT3wzIQkAAkRtOljmxBlgKLg6/AmiCrXcgml5FG57H87W/q4Slqv08J3caE7d
	Wo6oWsgBkt8xMCMLEqhcyAIkuSItygmx6aZ/0mHV9o/MesMi1jx3G85XQ4shI1H5
	OHps+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19h23q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:44:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51cab6f7517so6553431cf.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228291; x=1785833091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwjuk+g9ZLvdkL5zLAfxKOD8ANAOlnxaMHdSXdx4LT4=;
        b=NcJZFR/b3oYApn0z7xC0rxHzinPmjImfwcU1p2nFLJAv1Nu0WnodlZyiQ+i3cP1tz3
         s2QNMr/jOgbRLYnhOut2gGSp5UU0vGr1wkBlxRc2vQJTJpq2qUr84MsLi/6NpZbJC2Ey
         4kSATmnfXxtalNinWlSqj6wQnlZSicMkuStFdD8kHbsi48eATEktQfzsLFcSyXcbl0ou
         cBfBjDSutUB72uZ8p6q4wqO/gcCF6E1blWkRlKrfFyjfeubGIKGhKgougAhA7pAlDoAe
         mA1BFE6CBKUqTHbelz1vbQcr396iF0SpL6u+fkKEc/hCZM/M3X00Pcub5IieIXLQXU+z
         UIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228291; x=1785833091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jwjuk+g9ZLvdkL5zLAfxKOD8ANAOlnxaMHdSXdx4LT4=;
        b=Ky51/zOXI6fZQjc6byZ47n06Fh+hPr/MfF6CvTzXw1AGFNMDA2gwBsQ5dd2CozFzVw
         wkRr06q9Mlsfh4ucFvMdHa0lw5qUY9XgGe2AWcA+SYAALbm4R4BamMbC7vrpnwl2gUZL
         jKo8n+BKg89iTdMiuo4Gto3uTAY6L7oEA6WAdYBAhp46SAKjJvn+xomb2ESkw5UZVpXn
         RF/+qi2OlLbckevObqgU7qRKc/LiyJLckoSIjlPwxmaoyvhJAvVpSX7O0cHqVH280BIP
         XFAkMFP7grRhjEdNEflW2wUIZoGmIj4la4yz1iezrRIcWNqla+d0tbXfSZXXWHXtT42u
         qaIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpX5HYo0jPdUpGMZOhgnilF/d0lX72+07Ck2Bzh+AHC368KseS3ciZTkUpKGHlQ7i2gw5OubBWAQ34=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZutztofJdsjaBPy1bO6y0EDRYI5r6sEB3HZlmZmg4HGm7s8Al
	2sxK/Lj/VOz4aUspIiAEFbpqKeZaajcga9Kg1fQr0gCVS/JPibl5qB4crWxpHpBedgbNr0yvCOD
	wVhE9E4vX/iUMSZxSwwkwXTNcx+DW7GCOvUUFrJ9IsgwYu5V5Z629zIsuwFPyHjI=
X-Gm-Gg: AR+sD12cWfeFYKgIsjZAr+yvE4wqM74r3dzLD0clg7DU+DCjhPYjgw/P2N8NIH/6sB4
	ozhwB5TupwEnSNkaxLsVHCf1Yqsl2LnqB9BR4HfJRoqQSgamZs4kBJmoRf7uwOiDc5jm4SlQSWf
	RnTsO9k3iWiBMJegP3143zQaFHYfxMzHyf3Hf1f5Z1mS3RiKqKK65xyQ/UhmMNHkLPwTJFL+ixh
	fYCdUnFRvCiJ3Y37CqQ7ND7VN0ynCLWAaGbKQJKQ8AOTtl3MITg4r9fiuNBYv0QzrR39CukyUMI
	dtdFgtI0jesmvZtqoIXeX+t7PxnAbVufcuRaeHolX9EzzhiDZ1nblUeCcNH9L7BIrfbJMyBmyUn
	wwSkBJcAkLrDFlTtadWWdsNF4
X-Received: by 2002:a05:620a:a293:b0:92e:5ba4:b841 with SMTP id af79cd13be357-933026a6689mr79644285a.6.1785228290861;
        Tue, 28 Jul 2026 01:44:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a293:b0:92e:5ba4:b841 with SMTP id af79cd13be357-933026a6689mr79642285a.6.1785228290302;
        Tue, 28 Jul 2026 01:44:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f13c96sm726041566b.62.2026.07.28.01.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:44:49 -0700 (PDT)
Message-ID: <2baa405c-5f9c-487a-8969-82d697e8cb1e@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:44:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
 <amFCwDiD-StHHV9c@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <amFCwDiD-StHHV9c@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a686c03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4-Pcf2mNZArJK_J2fcEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX+xCoWq9Xa+ma
 jyJITMYLmGvvQrXvvixXhh+wl3St4rtEXvsMq4UUPezSU5guws5NEKQcsUiywBrX0l24cpY6ePO
 IAvvhC6mHbtsgR0Ji3PtdfsLMo4eYx+YlLp0O3qQfcCpO9PX3uBnU330XPij2iq+sRNf488aAPq
 Wd6JWKP2XPeAk8x1McH67AWvpOXjlQnu4HBhx0m5UtsJ2GkSi0mg6T+9NVBfpa+uEpraQZZioI4
 aAtCi5hkSEiSGZBu2zeG7lVnHE6dUyM3nozDBDs+po0iK0PFfeWDZFAMzMW8/mMpvgMsjQuhP2H
 X+8REqwwmNOfPP2h184RiNl5fNertHmgvYTEjdQmo4j3GrjOb90luNTaYbripNdrxGZpD2y5RUa
 VsVhGje3tY0wfqbHkl/RuynDRVcutQHKcG+YMKjOfdnvUwyQq+yrvAH17fiFtYs6FKfIGzQjcqZ
 Uf0GJqQAwkBgNHMTVcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX4RotDOuZcCpV
 VKQuDDFXBqf7jtF0SR/Gkjc/+L31ly5/53iAi6qfEnXQVf8wukfoWhnx4lAATQa5SBau+N4G9Mf
 H6qQZh4PrwUeblkJrz13/wLhz32IRLI=
X-Proofpoint-GUID: eakhg_N0TnOVMjGlSn4IyfV084LO-jBv
X-Proofpoint-ORIG-GUID: eakhg_N0TnOVMjGlSn4IyfV084LO-jBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280074

On 7/23/26 12:57 AM, Thinh Nguyen wrote:
> On Wed, Jul 15, 2026, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Currently, the only way for the USB core to determine whether the link
>> is native or tunneled is via an Intel vendor-specific Extended
>> Capability.

[...]

>> -	/* Don't try and probe this capability for non-Intel hosts */
>> +	/* Prefer the XHCI v1.2 ext_cap if advertised */
>> +	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_USB3_TUNNELING);
>> +	if (offset) {
>> +		if (!(readl(base + offset) & XHCI_USB3_TUNNELING_SUPPORTED))
>> +			return USB_LINK_NATIVE;
> 
> Second, don't return early here. Check if XHCI_EXT_CAPS_USB3_TUNNELING
> present and supported:

So if the extcap is supported and exposed, but it says "this port
is not tunneling-capable", can we not trust that data?
> 
> 	if (offset && (readl(base + offset) & XHCI_USB3_TUNNELING_SUPPORTED)) {
> 
>> +
>> +		val = xhci_portsc_readl(port);
>> +		if (val & PORT_TM)
>> +			return USB_LINK_TUNNELED;
>> +
>> +		return USB_LINK_NATIVE;
>> +	}

Your proposed change says "if !USB3_TUNNELING_SUPPORTED, assume it may
still be supported via the Intel ext_cap below"

Konrad
