Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024830;
	b=pAxHbaNnJKXBrN7sF2/GXXsJ9xVGVp13Gn6KPrA0fSVjh4dUyQPEnvnBmKeM9rA2sz+c
	 DY6MBx171cxpejsiHqaFCIVSIiaE/MyIolRGJuMkutRZv/hHXn4KCG/QAr0adrs4K2CuO
	 4LuWh9zKJ7su7uiJOUSVPcBMSq5qgJGAIAtL9n6qGmqsw3d+8nVGTManll+tvIfisZWKY
	 KPTm5+eWRE6IbRgQdt5IX4QdXMYOSaNWCo3zfUfOYFlP8oRgW0F7sHpljcWatXnF7oFu9
	 tImG7iO8NS5ofvI1pUxGaqC0e3ax1J7CFFqMuR2PNYqklisZOqE3skySHYp2/gDDNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
	b=ZMJvIJoaTVEfZ2jLSSxDG3tWfSsAjMwBuHXqlPxYrRMP9nhZpSw0i/vxZ02ZiomC/a29
	 a2h+aoCa8VpYCPC0eX3hahNquXPgSKmSgEFArjkW2vtQVk5BKqRYXJsRdM7eMCXAVfK/P
	 U8rqk0f9d2sz5TpoMHrL4tj3GNyHPVu/Ys79qLN1v7Ie5hcgYCOXw9u3zPQ/5ykukN1RM
	 ucDguG3sJV8zEQStflPXZyWlpP8B5P7KNW19L9kMBXb7qLCArfFEEmkNSPxsiO6/r5h42
	 KKvs3jwGHPZesIWyWiCdhefI/TWrlMlkHPcOMfW3Op9023P/9NwpPSAfjsr3MZbz/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwZIzzlE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JDo/xBF0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1C9606A31E
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwZIzzlE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDo/xBF0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtXYO1547945
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=; b=AwZIzzlEeGhTQmT6
	owKx+fKavOPPVwB5kkhFl1jcf2hHNJNiEAqmZyxcbgoeicgnfNQMdIbhowSw9GOH
	SNrjh72i4zTJoP81Un1VYXgoxXqxdslYn3jvj8x7/YtLDLBBXtksRLTIwsdMhS9+
	OOpVn0NnyDuEi0CNREPns4f1eAJlQ182qBc6IALASd5Hg+Svdbwxk9r522N0Xx/D
	IQudgErFZUOqPea/DSjCHBV5Bud0JvSHvsa2tiCEaK6WMVd19Mr444PJLAC9eSHv
	LlTv8HJyGMQKTm7wSXRfzMGVpiGLkn74HkJAXimNF6JE+DqJ+UDWjdjQ1gZ18Uwv
	xpt8Qw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstv02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:27:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc081f3066so86002137.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793024828; x=1793629628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
        b=JDo/xBF0KPxvMm/bZNWhuz8db0UFfPkt4Ce5P1SOkZIr1KfmK5RHZr4Vi9Zro0YymR
         Lgrlnkf8xcXN0OUGAu1Ts6z6J69ulODJMc5yR4MRAUU5ggHx8peOa6kPMRzoO0xGm0ZJ
         2lhgxPRU5CLhAV0jVG/cD3NZI0zzBjka9Ckn13b0wWQ5ASdhA9cZpZIyYT/pLNpJtYHz
         fjUo8K4sfiBf7OWPG99/cE4vI42d/Lm1Vc3KaGEfk4zpB5feyG4WGEI0pJmn8rjRtcvS
         A1Ae2/GQB/Sd/rGgBLrUdk9gQdTunQgv3F45Z4nALrXL6t/lywpCRmcBHg0q+vQ80oyT
         CSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024828; x=1793629628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
        b=hc+EGc/AjHoOj1AWqek1coU71WIPd7bWjN/dqh6fST+LNlmNHpOqLYi5TNAMuCc/Bj
         8QnGyJKb4NqsVwjc8vkKEbrLuF+go3PpeXe/MQ56dn9YD/BeocKFYXgWMx8Q0UjOrRX4
         MXWx8JDsokTn7WU/+GC97qKATFbCN4n4fFz0j+I7kHvcjowmJELalKJwlup8vNT0uIbA
         La8xGQ6/OqVgwdNIN8pAtMyc+vEBVk3JPqQ2SnKe+ydOezrtYQQYMsBiE8fxU97UHKZV
         vgaJPq5yahC3YKtWI5FfOSWIeGcW65WB1n+O/I8OoJpEbkTK0NuFq6OWPvm9CJ9IKXeQ
         fHxw==
X-Forwarded-Encrypted: i=1; AKwUvBxTeqp+5DonjOIoU+Ou8rt4SvQqTggtReGkodahGV9q1rqmt18x6okfnN2Me1Tkwlr+3LYXlvBTQiA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3fRoY65tahSJgVKVRD22/me2Tl0+MkWVCAHygveJGVi7FNilb
	6LIxvjRIsOgbpsSCdd3fbxoGWXja42O7wzP3tQEeTSFaMaJRb2HFdII4kx0cJYe7kZXL2Bdt18a
	3IjN5rljq4umonzGUf8Xu0ipPvyIntj2zQmWaiHoou6NTh1pfgUhwJ/BBXodTSrOhuG/Gl0A=
X-Gm-Gg: AYBFou3NU1ZZ4CNtvogphqBXYCD7EfHSf4AFXwzVfXGwV2SVvEzay2yNg+ZGoKQ04fY
	KIDZbiTsaXTeU+XypI9IrtzwNAWxoWcEogRnD8jk4Uq53U4Z2MkobO6vRxnzJfe2NIQRS8AzA83
	VwioSMVP56S43q6FpWPW3DUtrK07okyRql926TgUPQSfLByE1Dj6WdQvzr6uxBmCNtNmKrZ9z7J
	sqxb8gZdyMICvVSRR57bt1BxqwOmtsvQnQCje+u2ZSKP+egQzFYP6xulO8BTUCe/I1xJEceuXNS
	HnIBjAO2VJRkkbFH9kWxa27dn5NGK0E6Kg38KG2MWXxN9cUmTByAbTemRxNwQ0f2d5sKG54yU31
	Fw6omAU/hcQfLvXmZH6bvKQ==
X-Received: by 2002:a05:6102:8648:10b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7ce5cabd66fmr1677005137.1.1793024827951;
        Mon, 26 Oct 2026 07:27:07 -0700 (PDT)
X-Received: by 2002:a05:6102:8648:10b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7ce5cabd66fmr1676924137.1.1793024827225;
        Mon, 26 Oct 2026 07:27:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm3584442a12.24.2026.10.26.07.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:27:06 -0700 (PDT)
Message-ID: <a603ce1d-6664-4c28-8f07-f8697d833e7a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:27:02 +0100
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
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
 <944d39ba-6e1a-46af-b5ee-32140947f924@oss.qualcomm.com>
 <ba7e8dc5-a5a3-45de-a1b3-ca200faf1ed5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba7e8dc5-a5a3-45de-a1b3-ca200faf1ed5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfXwXNkf53Kl3rP
 H9HsEOmBMkoG17oKDPJmw7zTqEy4syV0cwQOLQcs37f14IkgmdpTte8nNzNQ7SlYMFZZajAqYaX
 zy86ucgfVV3qFYA+VK6HmbB+dOzUDPw=
X-Proofpoint-GUID: WA6e4s8-ltn5M5wE5kgKyZpXdVMX1eBU
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf633d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xHC4QZjwoU4ybDikHDkA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: WA6e4s8-ltn5M5wE5kgKyZpXdVMX1eBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX/tZjfDECLaj2
 r3UzWDsfqx5g8O90/q0i1bqL45sW9wEkpjxNst2EvW+FZiSsOoB2DRQuAa+w1TvCeRTXv5MjLO9
 6ewJYBqL0Iy9QNhiiT1pVMmioCCdRBQfxJ8k30nevb9GdXQQ9iq6BSWdv702xW2eonBpDXh0cUk
 1mcMrMiATut5k2b1lmJ7UkqW/+1lUFw/vBXaBLDEchU3mxYQPWK6jtfJC/c9IoxNhBm2u5kVnq0
 P90RL7zha68Ha6fWA6MtwBq14k7hadHpdhx2tpw73+Qyo8GVfBVyp/B51ZOu9YGjj3ujDulSXBa
 2V5CLXFjy9MVgrKGjSRmonnLRYXnjV0ym/kOlHAqOSUwvpoF2DpMndhGXSS+DQjU1cjAa9PPRSF
 SxVBfp0st6BxklWFrrzEZXfqwPhBvkjzI/krH7p1FoVe2zX3UlR1DpDW7yE+Kp21Bi5e/lUAAmM
 8zOqES+BFUL7a+1bLow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260057

On 10/17/26 3:14 AM, Elson Serrao wrote:
> 
> 
> On 10/15/2026 7:44 AM, Konrad Dybcio wrote:
>> On 9/29/26 11:35 PM, Elson Serrao wrote:
>>> The EUD hardware can support multiple High-Speed USB paths, each connected
>>> to different USB controllers. The current implementation uses a single
>>> chip-level role switch, which cannot properly handle multi-path
>>> configurations where each path needs independent role management. Since
>>> EUD is physically present between the USB connector and the controller,
>>> it should also relay the role change requests from the connector.
>>>
>>> Restructure the driver to support per-path role switches and remove the
>>> chip-level role switch. Additionally, as EUD need not modify the USB
>>> role upon enabling, remove the unnecessary role switch call from
>>> enable_eud().
>>>
>>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> -static void eud_role_switch_release(void *data)
>>> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>>>  {
>>> -	struct eud_chip *chip = data;
>>> +	struct eud_path *path = usb_role_switch_get_drvdata(sw);
>>> +	int ret;
>>> +
>>> +	/* curr_role tracks the role from EUD's point of view */
>>> +	path->curr_role = role;
>>
>> This should be assigned after the fallible call below
>>
> My thinking here was that `curr_role` should track the role requested by
> TCPM, rather than the outcome of the downstream controller role switch.
> 
> When TCPM requests `USB_ROLE_DEVICE` (e.g. cable insertion), EUD should be
> enabled regardless of whether `usb_role_switch_set_role()` eventually
> succeeds or fails. EUD access is tied to the requested device-mode
> operation, not to the controller's ability to complete the transition.
> Likewise, when the port exits `USB_ROLE_DEVICE`, EUD should be disabled
> irrespective of the controller's state, since device-mode EUD access is no
> longer needed.
> 
> If `curr_role` is updated based on the controller's outcome, EUD state and
> `curr_role` can become inconsistent. For example, TCPM may request
> `USB_ROLE_DEVICE` and we enable_eud() as per Patch6, while the downstream
> controller subsequently fails to switch roles. In that case EUD remains
> enabled, but `curr_role` would still be `USB_ROLE_NONE` (see also Sashiko's
> observation with this approach 
> https://lore.kernel.org/all/20260811215406.7FD161F00A3A@smtp.kernel.org/).
> 
> We could keep them synchronized by rolling back the EUD state when the
> controller role switch fails. However, I don't see a strong reason to tie
> EUD state to the controller outcome. EUD is intended to operate
> independently of the controller in device mode. Preserving EUD access in
> this scenario also provides a means to investigate why the downstream
> controller role switch failed.

Okay, I think we can tackle this if any issues show up in the field.
Otherwise, I think it's high time to get this merged!

Konrad
