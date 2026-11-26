Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714467;
	b=XdjDf/HX0JG4S1I6m6e9PnpwMpdnTRDRmPSczOF8xVCirO7Fy0MNn+rgXW17oRxcf6TZ
	 QTWc2upFpWCwuMGaw+fmMpPj0nPXNnOAwnSFJRU3jd2/bqHf6ru+wJw+eMyh0p353j2DX
	 GxsCRkf9/8ex4sMqTK2xcrIByvRQu7xXK3bBKEk6pbckO4KOmwVBkhqvMyrr3LJDNzUuA
	 AK8eF62YLpsYzQzlJ8G1JOPxgAYoQr9o4cfhSQNAdFJetHDUBpA4NHo0IASNp0C4reY8J
	 a82rN01UkK/HaVeycHAFkPLHEB6HdSRYUASZaMbUdNfCmVO8CkrexSmDZ6yhIOOD9SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
	b=K1rYwahSEK/mVB2OkyjMGilJHqQnygRJsZ72FV/jEXtcvaCH4EBV3JyMwjavgE6Z8xsl
	 NAroVZETMTr1tSC7ALeCFNH9481WC/K8NCZ8AWTypGnJK6YQfHMjjtHL+x1bw7800rnH5
	 aN7ws8/wqFhyKlX+BvFd6BgRfXvre2tCHjaNqWCdUNVzW/9CLT7AH+yp6zOWdPxDJt1ZR
	 rNFvew/B9zbrmtpdk+o/hdChw7cHwtvh26E6Bg2ndm9SZN/HRQMCqdN9GR17baT0dknRL
	 VPcmulhBGHtV3SciIXWZn2PTheh9f4dC6fXaWjcuU4/btTVU9ssApH86gyr4nt0nYLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OGn8pS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aaUhnfPJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4839C606A326
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4839C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OGn8pS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aaUhnfPJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGc8o3596793
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=; b=c9OGn8pSyXWiy3jP
	ZlD6X/tWVRdT6GibDnT6G3OtkWv6guKJyfvdsDAEItLIyH/jAC7SQjO1MbcWGo+h
	eUx7Az0fAnd9dpVWGjOvQO6u3mbU5RTjU1R3o+qoF7zSWmg0uMAKuvung9Klb9EX
	LmZYv/GiFXS2trGnD6sGWHm8xRwAmpTNf/ilHfG2KXg90tUK1acTPdcTBfGNXdBD
	/9wFahtAe97F2f2pYsbrWPEGSUJSU7/S/S2aIta28seBHp+BLu8LvMigMqU+iRmf
	0vOHHgQ/mk2Ny8NwB6OjLT8rRHxZaXlOlCTYX5+hOaPQwAacLZjPY/mjfzveXeKk
	Muwg/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf907gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:34:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so8649491a91.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714466; x=1796319266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
        b=aaUhnfPJdFdxVad2qFVzUzpYaFZwYoFyGAgS+wVk1k2Ux/wHvsgfy2Oo4I4joAYmFn
         dGU+Be7IMAM5VA9U7NE00Uj0LBT6nKV1++82VxSqgAUjbC/+xNSfT087fAXVP7Z+Wfhu
         eCPJm11FPibJ0P9Q1FheYIN2wHpmM9eHw64Y44dTdqvWony2ZvIyU49aZHEfCtRoaSOR
         q2jLijvmFallrqArE6P03wQtzlAPZY+trIKUR2mmoDeRaEQrLwXRM6dMqK6YPEGrM0P1
         /V8qpl9HmV9MuS4smjvzzTscbIhBFjTlbUOYyrlnhDdjh70A4cEkEs0DLtwLZBqjcJEK
         b+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714466; x=1796319266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
        b=UxiHqtsadLyFYf+W8LGA5esX3uvQzel2V1eQLe5TVJ/OIjgZciAHQmuIB68qlfuIGp
         VmzOe+f1PkJTMI8Bm8TEkh9/WifLziZfKYZt2qF+D0EybEB6dENUjv95M2lRdTm2YeoM
         P2gwuiF69eU5ABbK2H/9wLAaMbmw5RYvQNRGPQbhNPL8kKQTH4CmHCT6bNJBCrYNb6AW
         dGzukz4n6mdsyFwmSNkcp9yRnyO3ASoQDfbTXuMQnLeXPrNiizfLKSklWVIXuxnVZKln
         H1Rae9q+iWW9TyHcjQaHhvGMj/8yf5K1a2IiFxCdSXApJShikNc1z6tnBb7Na2cYWNL2
         mzpQ==
X-Gm-Message-State: APuU4Z8bnmNEycY0OYbnfW6d8DXVdwudl5XLbmM4+biOTUu7HZGjPQng
	IKcEznoA8EVDPHf1CqUyaiDhElZ8NG2aiMUSH+3EQ7uJbbs8QFWP79vEkupkat8bBR789YcHRFl
	aBS3GOzXpn2RdOOfukGpLyPoiwPDX/ilWAXuIQNFnSyVxrbusqn+/WKmhEBlTYEQ=
X-Gm-Gg: AZFdTZe4cbOhhgyDmIH3cyYcgCsMetmzB3VQQ4jKjz/Rkvxqp2cTr2tqLUEfvTrtkkb
	jJRVR6aSoep2bvXht8sf/Sup69bTHQbjvI5sIVtXJFs4eHeli428zej+q9xHbxJOfEnf/6xJakR
	uDQWtHGiBJF+Yk/7zM6aflE23/1vpwXvpVNK2XW223NI0iBlZcHQwjDt7rYurfuOmT/dOP3M7sF
	0h8IxG3iyqHFFfRgGHtkMVeyeMLIiGUJ2GcYO5Zgj/CZTTK4645s+LkE6PBlrhYbDa3bNK0h1HW
	qwSkh47DWe9ubIxh6ItAT0LmOnWu4xdTqedCXC6yhryu2NPKxR/FXCuRdsA9UPt14aF23mTxu6h
	udd/M+TJGTtHHoATYigpaPK74tqo87DRJUUE+bOkzbqY6o+9CuuKPZkwNUwG7kQDU4mDkH3wnTo
	OYbx/wH2kwr3okN8rFuwGE0MKurNk9uEg6AOdnN/j9
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr19204595a91.18.1795714465835;
        Thu, 26 Nov 2026 09:34:25 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr19204570a91.18.1795714465312;
        Thu, 26 Nov 2026 09:34:25 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm33227833a91.3.2026.11.26.09.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:34:24 -0800 (PST)
Message-ID: <3c0a98e5-0696-45eb-a0c2-83f429f6c76b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:04:20 +0530
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
Subject: Re: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Of-AzvNkol3woIGGteXi5FWoqHjonhEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX2SEECqrqPubZ
 IqO946tSmk1ruLkwwzrln5tounqpGP+NnsjVB2HXKzRIqSSLhKX0fQ/V8xPiSlUsie3TpM/w1GS
 /jZPtrABIq6FA8Ie4ECp6w92PGVLq9rgVfDilAxj1LzKLYJscplcl5wySiiOL7LUb2pe00cw/Dw
 USTsCoWE1eqdtHYdeRzhfNvDSbMdA5mU76X2UiWgROosoDAJ37J/b/1yOE+vDzqUqtviA0GfjGM
 vJNORp2ENhzcf6F24cJh13pFmm7L2HnczIs2NkDEcN1xKWRwidLX2eYe5xWd754nSpWD0H0dj3w
 s0/m/AT5GDA4dM8s0UmFSWO3BNvbzp6bIoXfPt7Qyhv/Buc9SWD+zRKBEd8NgIG507MYguiWSHc
 ehKLJJDTlrmqxmAuOK63OvlMeiWhJSWMMsAokiB2p4uDJjnfG1t8Fz66eEsvJ5bluLgeetBnhzM
 fxizf53HgMLM+/APnEQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b086da2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fyVOInN8tGEjVan_8WYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX+0mken4179R8
 NlzU6NF1oZZpFOIJUuIMHEUNSSkMwPeY0BV0EK54YFc8Tjd5EULOyz7reuPQ2eIZiKQvCQdNLyt
 4q0eBIEC5pJEwVYZbP3BpXJCRzoyY7E=
X-Proofpoint-GUID: Of-AzvNkol3woIGGteXi5FWoqHjonhEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override once at probe, after the initial role has been
> determined, whenever that role is USB_ROLE_DEVICE. This also covers the
> dr_mode = "peripheral" case, which previously programmed the override on
> its own.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 559de5172e61..22b6c7ca0297 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   		qcom->current_role = USB_ROLE_HOST;
>   	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>   		qcom->current_role = USB_ROLE_DEVICE;
> -		dwc3_qcom_vbus_override_enable(qcom, true);
>   	} else {
>   		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>   		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> @@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   			qcom->current_role = USB_ROLE_DEVICE;
>   	}
>   
> +	/* Force the VBUS valid indication to the PHYs in device mode */
> +	if (qcom->current_role == USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>   	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>   
>   	qcom->dwc.dev = dev;

