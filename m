Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577EA3A7F7E
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907020; cv=none; b=WSu07oAFvVjrbhrR9oFP9Bjx/Pp0gDAQAyautYWyQKryqGgxM0inon+Qh/ftNPxfybJ9ygMPEyuqNX2CestZ2XlAfoCFIm9ve01vfjo7rk7VASvODctftf7o6kAY3CeP7rpzJRc/v3oTPYJlRtAj0DIPuyrqOxnyG7O/MGWUY9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907020; c=relaxed/simple;
	bh=Dd4rcMrv51UewjxgT22w+WOnqGrV5cgFZoBCGY1q2O0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQ4W25OEQ8zgt2nRAXjsFzxEc4IpK01d4YvRM8boYuUvQxTZdJbaN2Igja6dsaOlYckqeL551zuX0oWoibvHMpnoO110pRE7XulEnUC6e43dWY4MzvR3Z2V0iD8QO9OFLNemH89UkJP8NuITTPadnYZvYqlnrQ4L7sYpg17UJqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgsY1gpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjhzgKkq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgsY1gpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjhzgKkq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OskY2384423
	for <linux-usb@vger.kernel.org>; Mon, 8 Jun 2026 08:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XlNdEziaoTE5V4DLXUj13oxUgJxGoijkLhriRZb5DmM=; b=NgsY1gpQY8Go+fQr
	udoCiCWo173yMkUfA/ze1akq2DypD1PTRuTtJyFTKftjr53fIl0vi23u7DCzm2mj
	v+A3Y9jBY0YXSHFWOEwG5Gszegsvxi0LMMVOEu/SI+Bx/Lz8QiyiFTjN4CAV3JB5
	te8EUMaJ59ryNBLITo7XhtOKd43+P8AGlN75PiSre7PSGR6k/KYGSFevNRHVVSVu
	1du8oC+V6KW6rb5vuxNF9gkS3faSSHDHRvM9UfX23cyX603yxLE/cCfg+xpFtYQs
	jw7+Kobg7+8m4e9myH6XdxjO8Y1Zw6LVG6oxo4DkJqxEHZrU+bGYu6ukWkWgvY0H
	VgZo1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1enj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 08:23:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915732517cdso69030985a.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 01:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907018; x=1781511818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlNdEziaoTE5V4DLXUj13oxUgJxGoijkLhriRZb5DmM=;
        b=AjhzgKkqC9lcRfWjKrQNiyy6mHzIiYVfQaeF6nakwzfO2EslSqAD7gqBgT5GnrozU/
         +urSNRH7OmQ1xtm9tGAxM6oKgI6WOlp/okb1OEp6gvusZkcICibnsw1n7o5vPpI2538q
         LqWKxcA2NmvTcsMSogWYh2n4M77CaRjE+Vn5AoRmbQZZbCikn0IztJjddhRocJiEtYY1
         zX52PTY3NLZdSsERsEspvDOUgsMyHbBT9haZyj7W8oUzdmrzKQHe2MAFYG0ODpGdltKh
         DFHB3J+aia8iDAsIoqWa0KnLT8H9m9LH6KUcXdX3KI+Y3EUKWE86iz8JL0M5vmgFFNQ3
         MqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907018; x=1781511818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlNdEziaoTE5V4DLXUj13oxUgJxGoijkLhriRZb5DmM=;
        b=mLzfFMqBNGLUsbcsJwu/QEjdFRtdhUV+fl/TU6kSTuHHemN8OI2kbnMSaNeUldCuE+
         aGr0DSAcC6P2EZdgf4iCu8fojYHDX96PkjBBrO8+Y/M4cdvAYHzWayjq2gU0dmwt0i0v
         9aE0mgn70wJSnFJLxqArCdXqtFKP2M7ww4Yr8o08AVZrcCr/lkN0RK0jaeClnxmjXbkh
         oI44fNElK4t+ES5PV1GFtv9nprpL/cguF8xF03XioNCGW5pN9C1+AsCSQEUg7bwZeNC+
         /Gd3FxcqbmkVqJHC0mv/01VyrpN/9nWSql0qTaj+whLui9XZAhTOZjzlOcrzy5WgX8PZ
         2QPg==
X-Forwarded-Encrypted: i=1; AFNElJ8mIQwY7N96ehgLSfLuTTsKlzlpQnXc+9MFie+ZMTWJy+fvlA4LsJ2V97Keox88WSj7+al7Yj+n82k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzr2P4lVyJ6v8SKlos02fCFt2FXlCr3/NFoPfO7ofeHviLxdE
	7kY4eR2Y/euaF8v3PRu4zEiWu2gfHyGhhmLJYffF+EEXOJ65X2dXdNP6ZuWSC8inYm5M03fgEW9
	JnJ4pGCL9c5hKNQON2gGnq+tBMpU8nqAnQzb7509fz/AkLb8RJEo4DjqctsELGnk=
X-Gm-Gg: Acq92OGMEDFEh6weOIvMCibmE8VDfTnpKuNF/c/DmHHSqD1Jp2WRJRB8QRPfhHowmaL
	kYEzUSlWrcS5RJQDc1wFhijJxNOVgFZbuQe7kTPO6/C82Iuf3XSXyPdkHeBUNFPBo1etBslKtzN
	HewHrFbuCV6tr+FqfsR7YehFKHGE8WPUB9kDn+t6qvazVmBpF2sGNKA8zWNFGnplpODJ4/NZ5hx
	/vJavTKF6n6TvwekCwnhXNdufTEaKXok7dmVLaJBkMg7TBkhDtVC463XE5upAY3YDv+U7lnJWIT
	nQ7FqMx06tZ9nzPpDXTZ6ZO/pajuX872MEUN/QD1r4od6NA+yjllkMVr9KS11IBDbqZ1r5xllHg
	ZWRwXNOFyw3l59GRYLRNntJZReq85AzLjBqL8FgCcoVJUcpa7Evu2eXjv
X-Received: by 2002:a05:620a:2681:b0:915:54b2:582d with SMTP id af79cd13be357-915a9e4ddc3mr1371597785a.8.1780907017623;
        Mon, 08 Jun 2026 01:23:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2681:b0:915:54b2:582d with SMTP id af79cd13be357-915a9e4ddc3mr1371595785a.8.1780907017188;
        Mon, 08 Jun 2026 01:23:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770994sm839798766b.13.2026.06.08.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:23:36 -0700 (PDT)
Message-ID: <0a14d85b-ce64-4c9f-8cc4-23cd0f963d98@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ps883x: Fix DP+USB3 configuration
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jack Pham <jack.pham@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601-ps883x-usb3dp-fixes-v1-1-d19bec3a6d26@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-ps883x-usb3dp-fixes-v1-1-d19bec3a6d26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NyBTYWx0ZWRfX0lhpNtVZQyZk
 cmTAhWIAo/pFt+JFoh17zqK2rDML+i+IUFNCzt2W+Bs6lFo2qWLUIKGsDgN8TzXZtOZRZtXgNb7
 w5aHngwMpeliIev6uQZCsY0hpTdOb0+WPkTRlPQUj8T/Y0JPNkcP3jmnvVp8N2EsyihNOl7gqWs
 8cnoSrp0zI44hSNlhL36JzIf1AjWRp0Lek+FJ75Kt4/NDbb/78dQz1s8USDArGQbsdaQ86X1Hod
 huktcQSnzu3wMtwwF1XVXwsE+vVu2Jz7Wl3V26Ldo33hlYwt066/6RLAjapP2MJDZZTD55T0GUU
 2mlj2UTWf12yVIKv0vrTt4H3YKrYCWmWNh8LYgfEM4WmO0QGng+QT8we6mAcTPY1NEIkEXlHCpS
 uJ1z8ZvZgVtrs0KI7X94nZg2Yde2O3saXFglvOATWI7S3valT3E+I3L2wic8IckRLa+71y5H1aD
 1P6uMRU7Rngcay9VM4w==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a267c0a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hbyEuSSbhPzj9LylT5UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YAsFfv72IRn5ybqFRVF0ufqwLGpQ0_yA
X-Proofpoint-GUID: YAsFfv72IRn5ybqFRVF0ufqwLGpQ0_yA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080077

On 6/1/26 3:55 PM, Stephan Gerhold wrote:
> Commit 6bebd9b77726 ("usb: typec: ps883x: Rework ps883x_set()") introduced
> two regressions:
> 
>  1. The CONN_STATUS_0_USB_3_1_CONNECTED bit is mistakenly written to the
>     wrong configuration register (cfg1 instead of cfg0). This breaks USB3
>     when using USB3+DP adapters.
> 
>  2. The switch-case fallthrough block is inverted: Currently,
>     TYPEC_DP_STATE_C (DP-only) inherits the USB3 configuration, while
>     TYPEC_DP_STATE_D (DP+USB3) is missing the necessary DP sink flags.
> 
> Fix these by writing the USB3 bit to the correct register and swapping the
> case statement order so both states get their correct bits assigned.

Oops.. sorry about this.. I only had a 4lndp display to test the DP
altmode path..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
