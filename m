Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507277;
	b=DHUCPGp5ZwqDBxRs+BknIK38K7qFKlaxsFXh+C68B+hYPaZ6a+/ZIeeuzts7x6wsOD7s
	 lW5+ji5NKfnR6C0SKXMsgQTPQh/49Dlquc3rnyu+P2vbz6lAHKkqvP9y0L5TyVETuk3wq
	 jj3Vwd+MMtJfR4/U+jGM3CbQCmIrisGgMUgAvopyhIFk8xkzVHRIPf72UdlEfpgpvh9fy
	 wwpQzo1opKbBvqjsZsfaLeWTgqJKknjDTI8SJuXi2GPdlBf0qfV4bx83GrYhoEIvFbVO6
	 B8AI+I7Q6WP5cnllTOXbZQSJq/84cWqpRNaAC+quzD26c6dbqoGgL+Zy6g7xeD9uPjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M4aoTvaWwUMwy50VJh27ZiJbEOO22PDQ4jEs7HBeRt0=;
	b=jzv6IlTkUSjoY/sKIi9ylyOYooID482HrhZALiTmMbEq2aOlurXz+XiOGmnWjbs56qUz
	 X2yf3opdwGwvkpbqYI8teu1UHNkK166nHeYoSsUxJO/baeQ2EcNU5xFvJwbTELvZDQw9Q
	 fet13pAdH/sjnS8DKPE2jABWsqp1xiUPtghQID/wnXhu6Toon9IoghlXs1/xvi1Xcem5S
	 BGDrd+MG/6Msm8G+YC44m23IDCCjaNmrjMF9p/VULA1Kg+Prmjl91ZNKdkJva26oPxHSp
	 Z1/2yVosv0zUHCqBp/VJkn/1v+HvziEBs9D/gc+EoidMnhgeApCwJgqiJ5QKU2UT3fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MkucNR58;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnPYDpYo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07A606A31A
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C07A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MkucNR58;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnPYDpYo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDACJf1429966
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4aoTvaWwUMwy50VJh27ZiJbEOO22PDQ4jEs7HBeRt0=; b=MkucNR58bymGLymL
	X0wFDVy5PY6mD1Fyeq8owHTKM85oymAAQ6rgUbrrcIKx5wfNNcl0Wyr851ioQ8M6
	UCzaXEl4M5nI8mgbfXJP77wVWTBGVJlIlAE3y6Ymz1dpT4fF8t+rftUW05QtNkq7
	J6JqvPJn09nix92Ea2q4SgAQ1vs+1g3CcJg+xq5eSFTv0EInB5P6yiphYQl1uyw4
	9LUkbYGW8DtFJz8QIN6QFRWxuvvy8CKm0RNZglXFVrPpbQTGkT2zGiLLtdPfhj0U
	PviKDx4u2Lf3BOlq5mQ4RTgSI4Pyty7W0ZvliVJi8ekdkPt7fzA+/9w6+xaNkV3i
	beiZPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qax9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:41:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso63424185a.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792507276; x=1793112076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4aoTvaWwUMwy50VJh27ZiJbEOO22PDQ4jEs7HBeRt0=;
        b=AnPYDpYonEI/vZl+9zM4s0CoDTtBy3JiNKBU0KnTYE++gHt5xXraUsfwbSYJ4bVYTN
         gmmrcoIH7VoPA4dYH9VCdfZMGAmBqW7fZNYBPsH4ta6iPorH0ow9F5y7WgI9FxP5R2MN
         2S45SWbcwjVFDBGGpL5RHl/VIFiSgWsg9JQTR0fcI/baLHMHc+E6rvj0Mp02esPhOsyR
         KdfQE1xlfZnA/SVOMm90iiKbJV9f1v1wFoBA8vUh+5pIobe7wN/tTcmrINdC/1HLynco
         6EhpIu3WBjrrcwq0WK8mIwpswV+nOd1qG6lE2XzZKY0T/DBV5uIqpJh887oyqpy67lse
         TaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507276; x=1793112076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4aoTvaWwUMwy50VJh27ZiJbEOO22PDQ4jEs7HBeRt0=;
        b=r3ZVciuK2FTg3ptQpHZpHzXBnK/KVLmexNBoliD630Lnt0fI4zdhf35NDASHKxaIFM
         pUHsPq1ZupFdGuceJBcgTvXHwm/cQK76wsEcEhNSaYOb6f1FgPoLXE0VN4e6TiIyYNQ4
         OmTCOSPjfpY73VOWbe4G/g8ULUSE/K1gbMZ2a1j6UxwlkLlfttQhc/HmP+fFUHT1FqVs
         WPdQavggtesJh4BOJPDnhNI/16f/w7DiuLfuNDJXPYGM+qk+pJBiZnc2r6TghBg6bwuN
         hHWFyrgJVVYn68UurjLt9K1pCw3pPkLhJvN6C6cT2nr4MaAQDJ9HLVm42c1Jd+/HrDrF
         ezZg==
X-Forwarded-Encrypted: i=1; AKwUvBwRMApT6yyMFJV26BLUSNijpJjiR6dcSB08Cl5YcDTuJcuAhP77aBpqd+28C0mvhSV4E2jPbKEcdxA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG7bsM0mWY6qTo4xD9JuKSHjJa/3aVv05CGyrD3uE/xeql//4h
	/ftAQf/FInoP/peMKZr0ylqAWHG9WJw40FQNvDDLkX/mzrqyMrtraai9UH3PJ8hJj5hMRiMTRLV
	Po2aiWKZmQWfm+o0SymXWJPdhBtVNNj5WoeVY5KWHyM/2/CKXDNqVeFv7kMQjX1w=
X-Gm-Gg: AYBFou3YZK8J0xcXqzQGzZMGgYLkCsVdH8T55Zr6wRGpqPes1p0lBydPSX19SRngR1x
	Jlvf40ovsp/Y/HfHYddX+R9WSGf8LdUAKkIWKjc+23Wl2/3DgohFD8jwZ1fWSQ9CqvCmO6JME4x
	bdDyVRpSqp6Itx7mU9+K/hg56au5o2FTarx2owwx1GQ+M+boFNsMaJQe9mp2dtNXyUO8ZZO9jdf
	IO3LVhxuR7wqihGLUPX+I/v/09fXiridFLVzzlV+8H4c+d/jSN14Me2PYNWtL9t0SabRE3vJn1b
	lWGAmewvG4Vm8ansZnx2uJ/bzq4gsn5YYpsrd4i4mxSWCJJY8w1kh1NVbHh4X74ojHU3lgozgvK
	cUEVRUikBEblHF4q7uVQHHQ==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1920606285a.6.1792507275541;
        Tue, 20 Oct 2026 07:41:15 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1920600285a.6.1792507274885;
        Tue, 20 Oct 2026 07:41:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm468162866b.64.2026.10.20.07.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:41:13 -0700 (PDT)
Message-ID: <8be959d7-cae1-4f1a-8247-67381a6dc811@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:41:11 +0200
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
Subject: Re: [PATCH v4 4/4] usb: dwc3: Notify XHCI core of tunneled status
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>
References: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
 <20260929-topic-dwc3_tunneling_state-v4-4-63e296346d57@oss.qualcomm.com>
 <asBMw-j0fxVLVW5Q@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <asBMw-j0fxVLVW5Q@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PJVwjspaPOa50zilpOHgLhAYrd-KCYGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfX3aW7XFrZboq4
 3uVVYXTSnqF6X9IptqaqVW7Qw1NXQPX3YrVmAH6K6RGaOpOEkHpbZw8rZ6bggoqPDRfsfUSJP4g
 CwL2H90cWL+hX+bl/uxSDUSYW9oLuNpmP4pxYiSZyvcjoCVY/YKPXxNX5s8CSmSq0BOJ9eAXccT
 zpyz/WVpyY0YjMYXE5ZhcH0mi0rH1IXesmlU0Ju/LL7/yhmX/fvMg04EWHozMu80+EzYFwM3Plo
 P52QGoQZtMXPiRNo5CW2QJYecqEh6D8F4RUgYPux4pohKpHGe4PwYRCmKkm7+R4M+iuhdsn+h7U
 0L5g2hI8mrvC58imdyycWhB9sBX3jPDRRS9PrIpdbaw8kjB/qD/+7f8nxlaROb1tCuCExObvxrt
 /2zSjb/vd6nBwzcbEhydPvZ72HicijyKnu2Cnhp2hzfHgONlX3ThODHJ4Vn9mrF2aNIok/L1zly
 p7chyuuLOpvEDUaqdFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfXyPZApmF7gMtR
 VzKHsvvi6t64LD0kuNtb83gpXRBo/5bFFVxgf/XJAd+hOBQCEWUlKZi/8DcYv09embz+7Lj4NxA
 td91qRYglDh6Ff+umIItwRF2Dpt2ERk=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad77d8c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ORxTflC89JRLnpgA4MQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PJVwjspaPOa50zilpOHgLhAYrd-KCYGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200058

On 10/3/26 3:23 AM, Thinh Nguyen wrote:
> On Tue, Sep 29, 2026, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Thunderbolt framework relies on the USB core to create device links
>> for tunneled ports, so that the USB3 controller is only kept
>> runtime-resumed for the duration of the tunneling. This depends on
>> first knowing whether a connection is tunneled or native.
>>
>> Add the logic to handle that for DWC3 controllers.
>>
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +	/* Not all DWC3 instances have CIO HW, trust the platform firmware */
>> +	if (!device_property_present(dwc->dev, "usb4-host-interface"))
> 
> Can we pass this as a dwc3 property from your glue driver instead,
> inferred from the compatible string? (ie. add dwc->has_cio)

We have both CIO and non-CIO hosts with the exact same compatible
strings on the SoCs that support it :/

Ack to other comments. If we need to wait for this dt property,
would you be open to getting patches 1-3 merged in meantime?

Or maybe we can lean on the fact that there exist dwc3+ACPI devices
that could consume this property too and sneak by ;)

Konrad
