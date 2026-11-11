Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369990;
	b=bNuzWOYzCcSTMJt9fkenP/B0OU4smSyNQ/ec1pJYxETbUCjqoduHfPutnzt1tzwbsGb+
	 MFZ+6EYSQidCvRzWAn40DI7tUKGY+Q8JMy/tHXlMq3C+XsD3QzC74+PSnl7mW5KZsI3Hi
	 FcYH2DQ5rEb3paURfvHwPEIR0/Fz3MxAtP5L6AVFDX9GM3MBrFHEwPE0tzSJvD6pdQDYP
	 2qbX06HGL2law2HNzlthq4nBCH/k3T2Q6WZTZsfOaM1cjR03hu54+6+08/FRq95A0nJKC
	 qeOwyMa1C/2ViRuvXxDqbrHkLAGfWUATvFelBq1DLQGqS9j7ig87sSjcuYNo0lo6qIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
	b=atER0co9o8jNn8O6SKBu/Wwcub1MZaO8GTDObAhjdmafXBgihpCetdKjCn7e+LdbTfSI
	 yvH0ICp5KJD3fK1KG6tW+Swcf/MZeRUKK1Xm3SYQZ8+6Cj8rMZsu0db9v/DYJY5GypHiC
	 B+gAiRL/sGIF7++bmeIwjAKyy0jGxHUqMF9Zjxj92brfbMP7g02O5KV/rCc+79N/KZxYF
	 P/ke5vk/WUDHDF46BIoIlkMKTv4Sjc95+aRQalKnkjF72gED9O5oy0hgkAuQhjpwB6mQp
	 9zJXnuNAGKnPvtaGnNf1jOjc+EP5sH73OuBRCIlnTK5fbOp9EYnSg7cObdGH7G48yUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcL7E54o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHRtWC8a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088C1606A332
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 04:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 088C1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcL7E54o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHRtWC8a
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tZLj923308
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 04:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=; b=mcL7E54ozQDbMzmA
	mNpGJabuuRSkm1Vm6Iutj5fzqHDToSWvXi1Z3N3PWkoqcXxx5lUE2AX6Uc7XxFEc
	Mw5xjro7woOr2ZRIAe3EJS0fNZOjXjSl06H7AZuU62I6JK1/Me3CuBDf51crIaBF
	vgMAMDAq8vodazyRJPY5s+zJkO72Dz8ARIEmFlsXyRqJbEfAlzndz+E1Kl7fFVkL
	X5fFMUGyfCy25vKKmnfYNEtpCUiDOwmevJm/tdNyUw9+igItkG1DDK2V8Z0quL9R
	fxpLRcNdUywVS0/ql9XKrAqLuFAdVS7JmRWjhsKHXOSRjEFKq/TrOT6t3+/lUaKP
	Ve+jdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpegwmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 04:06:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4782541eec.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 20:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369988; x=1794974788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
        b=UHRtWC8auY3z1Wnca5nuuZH3nXi7e3tS4BjaiWty1RFvQpTPU/TmP56yn2+jKxqQwm
         s3JeDROmjTn3ux9ju27A9Y7x3rYkenKGlX18cTq4sUVSO8bjB6K2KhkdFwkssAexfkyi
         3qSP0VmlW7ABZqkpAgtJpXAdFuR3us65ZFXgfKdfWKdCnDh0reuMIJ1jHvyEuR9a1Sfk
         5BTiZlo0C5qgA/57H3GT+tKfS1HNTVlkvh2No3oj5rfC8f5WB4lQnoBD8FbiFOfIRZjF
         x4ORIETRiYpadsjT49gI2MxMlwvejMH9X9RCpsCFiLtQJg7DwjFsnuYxSjeL8iYyQzl7
         fe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369988; x=1794974788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
        b=C12Gcml/BdujM3p2X5mUmLuaJQYWoTAvKO5s4nP/Soj9/TAhJWGLXgHXsWBcSx5g7w
         0X/j9K8kYpSNjriayhMcdyOwk65Wxx2n5xOMqPphwEqgapgSN2+01vo2hcO/lPRcyzix
         5bE0AxsFvK+L1ZNEeXhNH1Pmv+q3Eac/EjnE+vk7LN/avMlSrLaYuqeGzj0eEWz0vrQK
         wZux4eQHEgq/yD4QVHtd4v0bQwWU4RHXTdN7LUngiyBmEwJZv1LquOLOcyp/nabPAJok
         f2CvN86T1VJGEFMXWgESqkUX6rpwU3JS/DMWkc8QyxJRvF2JZo3izmG77wB1TC350zeX
         P2Gg==
X-Gm-Message-State: APuU4Z/1CC2PvjNIWT2OwBv5l0OUb0QLfCksz9qjkcLoBVQx2Kmytz8r
	xRDdWeyxHbB4X9gzXGpzZ4MStxAi/gsHo75h4Gl8vMc9GOB8Pu8u2qMvkNwgEw+Iawim+iM+aJQ
	7bdGC0GhWRty4vvLyVZNNHjcwbFrsBWe/4lab8SFN9LixYUDlJKVqZ6fX3ud4BiU=
X-Gm-Gg: AYBFou1Wy1hhRBlxleKFWDtqw3zPmOxsPtuo3aUxYNB8LoeJszLYEqeHT2NByxxNnyi
	fgv7bPYog1ChJ0wuhK/Ew1NsP5TokSKaY9tz2aI/aEF45aOTmfoI6Z0lqh/IMvRjtYbYbORWBj1
	XJgT5Dy2sveAlpClpA4A70FCcE26vcJgaRVwTHVD89icG2+P9Hs3xieWQOHlbkxAY6elGW+Eo3h
	JWnsDIfndrl/417CODpJjDW3XgFCm30Y8kq8TRsSpTbvK1qQmsn4eeY1e8bbrfyvsn5Hi3o5A8l
	ovrsdATI5BAbPHZeFBbwKD3evzHNcM+5TDJB6DXMhIY9101BZf+YlZcewJpLkP96lzgjSrAxJvP
	CFpusA5BQD+DSYY0rtFaNuCaPoeoN3fImLoz7Eq63yOV5zC4pcC/W9NvgxHHemFRS/9QY03SOGN
	Dq/8+7AS3N+VaxVhET6rt/WykWEp0Euy2/sQRbxgsZ
X-Received: by 2002:a05:7022:5f08:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3c030fcd1mr1051378c88.19.1794369987526;
        Tue, 10 Nov 2026 20:06:27 -0800 (PST)
X-Received: by 2002:a05:7022:5f08:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3c030fcd1mr1051345c88.19.1794369986889;
        Tue, 10 Nov 2026 20:06:26 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11420079c88.2.2026.11.10.20.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 20:06:26 -0800 (PST)
Message-ID: <b47f5ff6-014b-4b4b-924c-bd6310bcbded@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 09:36:21 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
 <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
 <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNiBTYWx0ZWRfX9nAj5eXlqjAN
 mHwKjTh1q9XSRnAVsjD12T50zVO1ux/v/7P2SSVmtHJL9BE+IVm1W2exQbD4MhvIK97vljuIt+s
 1UDZMKBEhDwVKieW0U9Oe0JA1t6cjTby0Jk38XB/7tfvhyf3dwpD1jV77u4nbL0M9U9n+re3VHp
 Lw5k/6S6cOWUgbZq8xf09uydFA8Gp+Ml+nxwGKQQ1qQqUgW2h6FcIOIOYPwoSvvZlB5S2ePoYQS
 smHSBw+hDp1xoTmhRrn962hj/baN6ZXmKax77YU3sBhn8DXRgBsh66KKfUCQ8ozer65VzmoSvD3
 0nE0nI+GJVUeB4ZR+DegWFooY84j5wcE2KmkV4J0Ki9TfvstW2iwQKxgU7j/OkKdW+2yFAMLAtj
 KPnUgbqhRRUcJMcg3PpTe9M34EDGKGhKNgEqBwHa6SCDfcZqmp+fRzzI2aMmOPKItxptGHwvWk/
 Es7lrBcdRKgp75ZILyw==
X-Proofpoint-ORIG-GUID: wyeYEJd28VxyVSBHriMXivcmXbmXYI-c
X-Proofpoint-GUID: wyeYEJd28VxyVSBHriMXivcmXbmXYI-c
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af3e9c4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dkA42MIeFly6lUBFm3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNiBTYWx0ZWRfX9NkPqt4dlZJY
 vNCIMFNi7tIllNDBV0FFi4vlGW32GymSGFmn7MzJgH7tvEACJZ6b7ZhFtr7xxoD0csGBtzivnCi
 P0yBey8WahY73I2zzkvUW5E5lEMiXxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110016



On 11/8/2026 12:52 PM, Akash Kumar wrote:
> 
> On 05-11-2026 21:11, Konrad Dybcio wrote:
>> On 11/5/26 11:02 AM, Akash Kumar wrote:
>>> Increase the nominal max USB memory bandwidth vote to let DDR scale
>>> higher within its nominal corner, fixing glitches seen during
>>> simultaneous USB audio use cases.
>>>
>>> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
>>> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
>> Can we scale this depending of the real speed of the connected
>> device adjusted for the real data throughput? i.e. if we walk
>> the tree and min/max as appropriate, we end up with say 10G
>> wire speed, out of which we can shave off some static overhead
>>
>> 4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
>> any configuration.
>>
>> Konrad
>>
>> Hi Konrad,
>>
>> Two things worth separating here:
>>
>> 1) The ICC vote is not a USB wire-speed requirement, so it
>> shouldn't be compared directly against the USB3 line rate. This
>> number is a DDR/memory-interconnect bandwidth vote; the platform's
>> interconnect/OPP table is what maps a given vote to a DDR
>> frequency/voltage corner. 4500 MB/s doesn't mean we expect 36 Gb/s
>> on the wire - it means we want the memory subsystem's bus matrix to
>> have enough headroom that the platform's table picks the higher
>> in-corner DDR frequency instead of pinning it at the lower one. The
>> vote intentionally carries margin for the aggregate memory traffic
>> of the whole USB subsystem (descriptors, buffering, concurrent
>> audio capture/playback, etc.), not just the raw bulk payload of one
>> device, which is why it doesn't map 1:1 to link speed.
>>
>> 2) We do already have a speed-based split for this, just not a
>> per-device dynamic one. dwc3_qcom_interconnect_init() picks between
>> the HS and SS vote pairs based on usb_get_maximum_speed() of the
>> controller:
>>
>>      max_speed = usb_get_maximum_speed(qcom->dwc.dev);
>>      if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
>>              ret = icc_set_bw(qcom->icc_path_ddr,
>>                              USB_MEMORY_AVG_SS_BW, 
>> USB_MEMORY_PEAK_SS_BW);
>>      else
>>              ret = icc_set_bw(qcom->icc_path_ddr,
>>                              USB_MEMORY_AVG_HS_BW, 
>> USB_MEMORY_PEAK_HS_BW);
>>

Hi Akash,

  Rather than relying on DT parameter to determine ICC bandwidth, we can 
do the following:

  a) In host mode, we can register notifier to usb core and based on 
device connection speed at runtime, we can modify the ICC bandwidth. If 
its High-Speed, we can scale back to SVS. This reference is present in 
downstream.

  b) For device mode, we can register a post-conndone glue hook to dwc3 
core and depending on connection speed (DSTS regsiter read), we can set 
appropriate ICC vote. This is not tried on downstream but I think it 
must work fine.

Regards,
Krishna,

>> This patch only touches the SS tier's peak value; a controller
>> whose maximum speed is HS is unaffected. It's set once at probe
>> based on the controller's maximum capability rather than walking
>> the topology for the actually-negotiated speed of whatever is
>> plugged in at a given moment, so it's intentionally a worst-case
>> value rather than a precise per-device figure - which is also why
>> it's sized for the glitch we saw under concurrent audio+bulk load
>> rather than for a single device's best-case throughput.
>>
>> Thanks,
>> Akash
> 

