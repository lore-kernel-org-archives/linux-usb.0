Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122576;
	b=nPzxuRYh/u6I8C+oJgDP1htW35DSHZZByTK8X72sv6g0eMT/gEsII+mDA5AZ3jtOLxbh
	 Cj9pVw/V1cvlG9UVGc01h218p5VbIKrjSsNi/Iwim2kfTYgsxISKGm+fYpNT2sPPXaewj
	 4qwcvWeBzT17PimPav+TFlZ5L9RBWg7cZX/aC9xqBfjPWkUFaj+zMbD6ECDnFxVvk2Goy
	 HoFDW7N/lg85VIzrOwN3f8pJ7NI8iSvN8pAQTX+o+j615M/T01LibGuP8GIDbdV2Y0n6v
	 mmNVJIkpwJEEDqDl1VcdFkUsLK0KxLDJaVd/wfIeWFizD/OnxchXaLRQRP0Dg3CLtzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PyGRZT8lhbyjsAytyG/dL8TatW8134zpllV1HW3ktT4=;
	b=j8eGdsMOMmA0kCVGixq14byNKNgBsGh9Ah4tuSV2GdwQrEN1gL7ImY6f8UVs1lVGnsvu
	 7LX+wuYEdFACsSCOGZv5S0geCTCaOEhDErHDmiu51VfkPyrG1obtx8/w27Us556Rq040y
	 2lKtQ7tu513uggQQ6YOpaQILuA4zRlBOos1zc0pn4CwF3ogYcIsIAsKwfdO7eBiSKcYJR
	 jzsyFaJkZKVxMUOqDrKdVLk64dlQ9qXKssUbBNG5KUXSiycS7GroKrxqUrnnc51MacIRZ
	 wXnYRGzD4r/e+SJFzCHfkck/sEpEzDhEzUdX/aXO4efqoj26bF6C3kvQaMi0rCIER3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpv0f3js;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/Qfnwpp";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688C0606A32A
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 07:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688C0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpv0f3js;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/Qfnwpp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84KFbH472942
	for <linux-usb@vger.kernel.org>; Sun, 8 Nov 2026 07:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyGRZT8lhbyjsAytyG/dL8TatW8134zpllV1HW3ktT4=; b=jpv0f3jsWwKVGGEP
	vI+eJUQQYFk46IVeHaV72VIg+FCEM+q437YWrxU+mLGslhG46WMtops6k/ebvUZa
	Leh3dM4hNfpiD9QguXbLxP3Sue/8L1OaIgIeoxcDeNLeBI2krhszH5XhWah6wsuu
	IUexpZtZZy84jsR2Aoea1TyBHqrkhqAJOodN7fYxTQjQkY1kP48bQoYbzXl+cMVK
	9tnE8KvUW7Re2Iz3ZOw6wwrxdyDlOYhlJKWYbZtuDuzOjESthsd3ueVmD8xBe9bp
	ANqbYKCYWWbaG3k8JwmTcMSj4QzPFsckuJpqnH8k+r7UX94VRHadstoqivY7RfPR
	PKU4mw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbntw2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 07:22:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso657131eec.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 23:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794122574; x=1794727374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyGRZT8lhbyjsAytyG/dL8TatW8134zpllV1HW3ktT4=;
        b=X/QfnwppEic8gY3UqvCSAeWiqKoTe4eYncln5PbAmdenODvFNOjFekIHA0IJ1augj7
         reLsJ9Gc7tiykeK3iTnRxuC2XtxXzvRtCxTyvnEJnta1Ho/iptifK0mbKGPw4dMwwVzU
         jX8sep4cCQUQPG3rgAGDh3J0fsvmcj4QGgjOt729/I1+cHYDNmhwTmn4jX5joZKRVISC
         U7upCSpW8bLn/FDwTgONzoTllUR4iJhJflwYq7OCG+MLA0zh8DRZKlWUZizZKHMaYZez
         TumXnWrTt1x2QDfEELmb34c2mO/tFd+rXjIVbPhquoGg1bbotKOB2sFCZfB0yR/pO5UQ
         cJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122574; x=1794727374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyGRZT8lhbyjsAytyG/dL8TatW8134zpllV1HW3ktT4=;
        b=DTQ9Vgljb1HXCN9b0yJhXnZssmrcj1UD9f2hMZ+gJcSlsd8t1fzs6f1M9TzxhwLuVA
         WHkw4kjiS22XKyGz63WFnLI4OqZQh4uXOMnTP9Ir5OWFAz5ZbkZvL0EZEsDuNLySuRpy
         n0Mv/LYA7v82fdhQgO3yC0Mse9nDQYqv58OGIHBz5IOPPtCJPxQKhtvzXdwNRg1O0d8T
         1xdcM4TKUEF77idOWGz0FWj56HMU9QyhshzhRhpt7jzqzkX3t8O5nFeTEur+5EhIQHi+
         70dun8k0vYBP2VavyZubidIl7SH3cQpW4P3kQ1ojg3hL06QQsom3W1ov+jIX8bCGRZyJ
         2ZBg==
X-Gm-Message-State: APuU4Z+olfvtttfA03gu8N3ZwG/KCGYyhCZ7j6CrzJmRfGWk7RVVTJb+
	FFu8MhoC9JwbL/C04TzF+DuElvsV1FSjpFUp/HLmYkMqWy5tMIvVMJZWGIbb0/RMtgGK5KxUjG5
	dg/ROVGOf/HLL3HMK2nWhXYHPGfjXK/iRcoOyKNoZyV9EJma6sTpeveWenoTTnik=
X-Gm-Gg: AYBFou0oD/RXn3GLwbusx+SzKH13v1fnEag9hhXOfbuEu7Gp7Bp3vHeR+eRXFX1lonO
	k54u5ZUDY63+/Hkq76O3lqDflQrJ7uy3sKcpVX/havSPstKmp/io5JxXF/fq2eOLzM8RaqF1x+7
	VglzwN68WJRylquTx+IX/YkBUBZ+VyoQI66NgjizS7PsHd1zPYNOB2Xg7JMjYMHyHHqKrwCnppq
	KeUVA9ij29nIU6apShjx6W39Ui6edTLJTi+w/mBLXs+wVtzUbWI6gWkVXsvy0ZOc2NCvjgFf0Do
	mYodXDSiKBHo6pKHMlzxbuuLE/7uCuZRwFdK67cuOJ3tgK6aodAkfbgDyZFeCSCsrCgPBf/dUSH
	HI6ME2rid4ml5kxRJQVx1e/GMUmahX3DFgBeoYBDy8SvEUMIpoY4W+Z7C2nUN4FiZUShkN+oZ1r
	tH7c0=
X-Received: by 2002:a05:7301:730e:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-372579ad46dmr2084887eec.41.1794122573966;
        Sat, 07 Nov 2026 23:22:53 -0800 (PST)
X-Received: by 2002:a05:7301:730e:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-372579ad46dmr2084856eec.41.1794122573331;
        Sat, 07 Nov 2026 23:22:53 -0800 (PST)
Received: from [192.168.29.246] ([49.37.135.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265618e11sm3280847eec.7.2026.11.07.23.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 23:22:52 -0800 (PST)
Message-ID: <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Date: Sun, 8 Nov 2026 12:52:26 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
 <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
Content-Language: en-US
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cu7XVTvmbGRo1SZ_QYbQ88XwFbMteLDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAyOSBTYWx0ZWRfXwUx3UqEfyYV/
 7IaYEsKW1xtYGplCx9bmYh9AQZhEaa48JwZMYJo73nQc+8hR7VEnwK3IwU35QaCgKQH1cR6ZU61
 YkUgimTDi01xt4sP5xUrdr6KDj6TnOVWoLPlq0tInQj6OuqBeXSltrGXUSrP7jD1Rd92d2i1u5D
 XYoznIWF73UoDLPJZAfBdYXQXwCqag12roIMCkK6uYfh3iIrw8uLnzgVUGwUg/+8RNJ3uudbqvp
 hKXk5/KjrgetC3WiOnldC1o47pGOnkmLD9hP2S5I50EhErZIXiN1m+IQvz6eho94HWH5z5h376o
 lUDwJMKHdgVCz41rPyezYneOX0GhKdL18HGLadAhiqFCq78ISLhAnD9AdqqVAx+wXvN0Qr5EwqV
 8FjZvxQ2DJ9l4QmoS/Osc4pZYuoO+HnpAr3/GwA001/1AO7k6CIxwftDMUg2TOz8lpiWI1FUKii
 cjnXXuKTvPv5khl558Q==
X-Proofpoint-ORIG-GUID: Cu7XVTvmbGRo1SZ_QYbQ88XwFbMteLDc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAyOSBTYWx0ZWRfX4aLDEM26le78
 ZkL39ufhvs9uTaZn76AODcs8P4CXFP7/u+nFhI/UxD27iYO2SFAGd8HJXSXGnkpbKf/2Wr0PWgW
 vbeFTYO8egzRnpow5ZneTZ/QJ73QT9A=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af0234f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=TqP+r86b5SBipocsz4eaag==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=n4YLBavcT-XMWCbpQ5sA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080029


On 05-11-2026 21:11, Konrad Dybcio wrote:
> On 11/5/26 11:02 AM, Akash Kumar wrote:
>> Increase the nominal max USB memory bandwidth vote to let DDR scale
>> higher within its nominal corner, fixing glitches seen during
>> simultaneous USB audio use cases.
>>
>> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
>> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> Can we scale this depending of the real speed of the connected
> device adjusted for the real data throughput? i.e. if we walk
> the tree and min/max as appropriate, we end up with say 10G
> wire speed, out of which we can shave off some static overhead
>
> 4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
> any configuration.
>
> Konrad
>
> Hi Konrad,
>
> Two things worth separating here:
>
> 1) The ICC vote is not a USB wire-speed requirement, so it
> shouldn't be compared directly against the USB3 line rate. This
> number is a DDR/memory-interconnect bandwidth vote; the platform's
> interconnect/OPP table is what maps a given vote to a DDR
> frequency/voltage corner. 4500 MB/s doesn't mean we expect 36 Gb/s
> on the wire - it means we want the memory subsystem's bus matrix to
> have enough headroom that the platform's table picks the higher
> in-corner DDR frequency instead of pinning it at the lower one. The
> vote intentionally carries margin for the aggregate memory traffic
> of the whole USB subsystem (descriptors, buffering, concurrent
> audio capture/playback, etc.), not just the raw bulk payload of one
> device, which is why it doesn't map 1:1 to link speed.
>
> 2) We do already have a speed-based split for this, just not a
> per-device dynamic one. dwc3_qcom_interconnect_init() picks between
> the HS and SS vote pairs based on usb_get_maximum_speed() of the
> controller:
>
>      max_speed = usb_get_maximum_speed(qcom->dwc.dev);
>      if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
>              ret = icc_set_bw(qcom->icc_path_ddr,
>                              USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
>      else
>              ret = icc_set_bw(qcom->icc_path_ddr,
>                              USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
>
> This patch only touches the SS tier's peak value; a controller
> whose maximum speed is HS is unaffected. It's set once at probe
> based on the controller's maximum capability rather than walking
> the topology for the actually-negotiated speed of whatever is
> plugged in at a given moment, so it's intentionally a worst-case
> value rather than a precise per-device figure - which is also why
> it's sized for the glitch we saw under concurrent audio+bulk load
> rather than for a single device's best-case throughput.
>
> Thanks,
> Akash
