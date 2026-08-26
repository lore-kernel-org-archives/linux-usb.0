Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7761C3C13E0
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740168; cv=none; b=qjDD1MF1rQdi7rnTRsqWrCcfDGUf2ZabBFZeN17V9bQtTAZlHx3JgiAv5RAOVWfLFUiiCCeXvq/5f19HNU11IYETKp3W4OVR8NryyEpsjcf9Vv4iZaze8v2dAv1FcScdIcID4JqtlUlN6cq6FdoXAmqEW+GO33Is2hq4iVhFv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740168; c=relaxed/simple;
	bh=CSyS2AAUx8IjH654HwNFW+tBkieMPajx0k9qQRZi2gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HO16Gr+o6RdjKOA/VXPJm86oeBsSWRPJYRjOCGSNtSbcs5ygw5W/jOIWt5AN0Phu5nGBB6/zVz/upsPPCffBHz/0RnZIKrNMBj0WWnaDwu4KxncExNBsG7tXBnE3JkeX0+33Obf1qaMU5YXKTYKtT4VztrMnGW1urwerU1huI4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgQYI4nj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtbASEkY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgQYI4nj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtbASEkY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHuR8519849
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QveZLHZ1UA6LhKTB0pCtINjffhyivWeyncO8oEF8Ds8=; b=FgQYI4njldTAlU7d
	FCya7p0PQMO5pje5o+UmV1ROpUsw1rlmHFZyqZwX8+xJEES76Ulfazv7Ugjj1RRx
	o9pNueKprZtOaZ4MNDN5BS3aN7VkWjCot9XKdRDT+5bCxblRZpYjET4ibQAq03YS
	CF8QfOlgm6NIQ65GIX1jGr9EExxc+tuwxoBMW4r/RX6HfUKNOOO35dWEviwShehF
	sip93cLHQcBu9prCk09DUHIq5vcS0MDkImhiSQAOl92oTRg5VvQtqo2zLS6IIUkh
	pepbuOuA1a+EBviOWkj4DLnpP6BORYhc4/tt7HXG1hS4+WG4EWm+s/3EmeT5As+5
	qBb+Ng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0370-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:29:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2121758a91.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740165; x=1788344965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QveZLHZ1UA6LhKTB0pCtINjffhyivWeyncO8oEF8Ds8=;
        b=VtbASEkYF8kmmTSybaQH2SSWu2KCnJqIimuFSzJe5+Fo2ocygEPMvWPSbMglOBtyPZ
         yA83uGHOSCY+kETe9r1J6sa13HequT8PBw5NrPCqKwnLuexyZY6/HQeMlF2iFsNQQafb
         K5qyRlaFLVCI61Le336om65382rRHQgD6sSoKqVyCneaFHX6ECPjJeLqCIczjcLPD03g
         QkdzMNL750kIUSQd+AcZL9EFtyDdNx5E5UHCUBkbxcQPKV8pm+k6awUxvVpV/kKzrGY+
         eKcVJzqC+DDPKMtJ0RmAIrS3qPNMO6p8ksHskbS8BbjjiiVPPipOHlNdGsB77nFjra4/
         13nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740165; x=1788344965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QveZLHZ1UA6LhKTB0pCtINjffhyivWeyncO8oEF8Ds8=;
        b=RAa9OL4ezKjcOWnwBWASSwb8lEaR9o7G9sMrRyfk3Af9Iv6sESFFKgRhy8avBtGnXG
         9ZDrkcZNoKtZaHt3Jn21lWN5qWiKEaWmTVVeGyluaOM8/fA+79993WG/yL0Aessq/Nv+
         L0XMSYcQclOhwU53FmKBH130FcpHZP5hOK4SAIHHzax5/j5Bqq40+ZvfcGb7sAzK4i8D
         Hqb1Uu09GX9in8Bw1INfM3q9Yf6wtidG3AEZXzh/Szmjm1VwuT+eNl3Ysuh1ZuA2t1Hu
         MGedF/Zay/7eC+6PlC2mr7jhsmw0s03mCXw14OT17VGJRPCyEynuvxebquzt0u4XaGQJ
         DnMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrITvsxjrMJ9ld8e8OBWXKAUTK29Rj+3kGIus6/YGN9VYb5lfTgsXZy81KS0uK20ZZatR0m2pEHJ1E=@vger.kernel.org
X-Gm-Message-State: AFuF++l1aG9Y0kIa1Ejo7IW9tilaSvUux3oZ7CNWUHiJbO/QIdL2hqY2
	ROJHc2GZ96ZnGQoIh3uDI/8lmqoOrY7Cnre9jGErLTv6JV3cGqTCA5swswVXykm9XPOQ7CO5Xfz
	PQ9cjlYCTokvhGX+nDsBtIhxQQ5fmBHpZvd31ccN/zRqJbWVACiSJyzbPm2jf7Sg=
X-Gm-Gg: AR+sD106s3R1I2TkeXBlpGXjVBzzay9IeBgkU3m6meEcU5f5PAQUien+Ntcjfp96aWl
	eAta4Tw9F+pCiXMY0xXHC9btDgUzB5086/DDwzrtMxnRUm3oYNX2dsyY75m51pgvM9sNLNitRt/
	0SeNR7Fnul9sjHUASkeKTDZN6IxsbgL7jpG7vDdt4NQbvO1s4cVwVIdU6UQIjxhL6XSRm0rICNf
	kV4jZRcODJ+fCtwcxBo58XXX4Oz0W3SMn+W/cGviHOY5SKWcwnSBbLVbltVgbVqOXzQdaG1Kq71
	cnp4pr6TGLisaDTnMx+9Br9nnZwzL/fgEm40jenIzO2e0f1s4MGBcsqxvI9Bp6xZ++1DHNJv50i
	QN8uNDRh+s7oI/3C/LxadclGZu6nWNq7izKPUCc3RAR7D36RvLf/IrInXEyq6bes0WQ==
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr12826269a91.9.1787740165120;
        Wed, 26 Aug 2026 03:29:25 -0700 (PDT)
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr12826103a91.9.1787740164412;
        Wed, 26 Aug 2026 03:29:24 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8861ecsm7249900eec.19.2026.08.26.03.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:29:23 -0700 (PDT)
Message-ID: <611896c5-ce07-4219-a47a-9991bde0c16c@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:59:19 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: hd3ss3220: track VBUS enable state per
 consumer
To: Chang Wu <kunjinkao.jp@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jan Remmet <j.remmet@phytec.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819152027.90994-1-kunjinkao.jp@gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260819152027.90994-1-kunjinkao.jp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wrKJ5qcxAPGoPJkfFqSw2jI-_dcijxi4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX2SlVfEuaFYPz
 54C9MkKZcQNe9XyAGBkYkaGBqCA77Clzsn1TZre/iuisnryKvF0/Y07QEeaD2YvOaYc2JUvkPCH
 qjo9sJG5iZ/gkxgEKruqpzKLhDREU1k=
X-Proofpoint-GUID: wrKJ5qcxAPGoPJkfFqSw2jI-_dcijxi4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX0oCAYvW7hKYa
 a7xyvOpCMLzhrU2gycuNFh+vktjuQdgQJ4W+W0/RUt0CR8wMv1BRjjaeSzpXYa92xzdWEpaW+wT
 Np1VKIYffOMMgPbTZZE5VpJzPj8JFAeF56jikUZ/WcFwZlKXC6nBqvTDAyTb5oK0NZIO5uTEACu
 CIy6wbeZl3R82hhTMo6XIYL5DAXxqqtCtrEdFO2U7rM6UqDHkmxEsHBZ+q/GkspaAkHWXaSFf5H
 avmwwgpM+PHhO3ryxK7YvAn3/vgu+0bBeNT+5mxAaZlXlxsAV7BuK8PHtZF92e2URbZ3oxFUZRb
 TWsX1MB9X1PDDHlLqCfyf11FHyWH1FyB/UAjmrx4HIEpH6EYrlz3j6ULJ7hg4FwrRy3Rq/wYl+a
 hIVckVSCEdrKH3c6bJhYyOQdsSNFaBRDsiODy8Fj+EN9N+IeDualrbzNl1+7YICXRkx0RBstxUu
 44d8KZGumtPQkD5uGng==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ec006 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=iLJ8WFLs6lQ_ZW-OyZwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260087



On 8/19/2026 8:50 PM, Chang Wu wrote:
> regulator_is_enabled() reports the aggregate regulator state, not
> whether this consumer holds an enable reference. If another consumer
> enables VBUS first, the driver can skip its own regulator_enable() call
> and later attempt to drop a reference it never acquired, triggering an
> unbalanced regulator disable warning.
> 
> Track successful enable and disable calls locally. Keep the state
> unchanged when an operation fails so a later role or ID notification
> retries the operation while this consumer keeps balanced references.
> 
> Fixes: b3f9d6e491fd ("usb: typec: hd3ss3220: Check if regulator needs to be switched")
> Cc: stable@vger.kernel.org
> Link: https://github.com/qualcomm-linux/kernel/issues/472
> Signed-off-by: Chang Wu <kunjinkao.jp@gmail.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

> ---
> Testing:
> - scripts/checkpatch.pl --strict: passed
> - Qualcomm CI checkpatch, sparse, DT and UAPI checks: passed
> - Not tested on hardware
> 
>   drivers/usb/typec/hd3ss3220.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index d0de5a2488f9..4eec90c82bae 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -62,6 +62,7 @@ struct hd3ss3220 {
>   	int id_irq;
>   
>   	struct regulator *vbus;
> +	bool vbus_enabled;
>   };
>   
>   static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220, int power_opmode)
> @@ -208,7 +209,7 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
>   {
>   	int ret;
>   
> -	if (regulator_is_enabled(hd3ss3220->vbus) == on)
> +	if (hd3ss3220->vbus_enabled == on)
>   		return;
>   
>   	if (on)
> @@ -216,9 +217,13 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
>   	else
>   		ret = regulator_disable(hd3ss3220->vbus);
>   
> -	if (ret)
> +	if (ret) {
>   		dev_err(hd3ss3220->dev,
>   			"vbus regulator %s failed: %d\n", on ? "enable" : "disable", ret);
> +		return;
> +	}
> +
> +	hd3ss3220->vbus_enabled = on;
>   }
>   
>   static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
> 
> base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440

