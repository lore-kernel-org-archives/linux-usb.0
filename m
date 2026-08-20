Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96082485CE9
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 21:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261222; cv=none; b=r2XkdL/1Blp7SUwQLo1hfCI/pH8dUauWrjtb9Q6ClWb0kpuxjYdx5/NzjTLPz1F5NEg1wq48hYGJczTbNW9kIyDE0HEO7nDXHUdFaIYrPhJ2d0qKtPKP4vYJg87JreH3fTzRbG+dEvNjqDR+6HjtU4Unugaaiw9hRDvEfqovgW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261222; c=relaxed/simple;
	bh=w0tqc/qAsTZcQxJ6E0oajHLsLKYRyo66GvT7yMIN3ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=L16PUz10gDezwm99w7sgtdcjn0xqmk/mvmEpDOVP+19XqE+S2knbkpilXfHzN/1kDoBX6623lw8NS5+2zwE2sB02V4p3ol28ZL5LNZc5jfqejm9ctanjRZAvvVSW3J5Gj3HUTabASKdPqvuPme9exW4lL1TVwpP1U7RUNsghqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1amSMjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUTKX0ya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1amSMjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUTKX0ya"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7gGg065816
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 21:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilFUYTSvseE2hfnCHpx5oP37S3j7dMYhyjZylo0TUmg=; b=K1amSMjreW41xPuc
	GU8oIZRzuBr5SMNR463gzHCi80K2qs/yyyuHwpUrX6ccRTKJRmQwhI9otzB+r87p
	eSjisgJQKMeAdx7BPpNPENi3TpGIdvxuk8alNSWLnIqJvrnNZZN9h70pgLLg9rv8
	p6ZEyJQgGulJKTTr/gKVhWPCCXNcXkDEk4R7bFWYJjmkocnKkN8YINHb6StWund4
	Vn3MbiVOwL8WyhOitOEIT7jhCkB8V4y2u8DKgsduq3iDjkRfXuGbI4+X/JQOCyFf
	AOA4mImbsriMpk5Rz9Kb+oNZowViMCsPpUkCvyZw5yfzz2iVVw4SY5PS3edFoxLS
	+1E9vw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0jytt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 21:26:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so28855985a.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787261219; x=1787866019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilFUYTSvseE2hfnCHpx5oP37S3j7dMYhyjZylo0TUmg=;
        b=eUTKX0yaIfwF3m/94GP6hTAD5lD4e5TDWpnfazdU9ZORFeObBJmrmW6ZDdrZmnjIzi
         nrRUPUedExYoXsfHT/NMR0r7CIDjpEl02WkcyHnQ8XGNLgK17/ALv2wUfqsGSnw1fpez
         ywzKsNBGJX24Pcc/vxcR0XVLxjTEB+P4cUHxsnQFKJRCvoJb1nJ/nOhdjqXeSMyp8XjY
         wH9otfVjtxF5WyxLRjTY/AtmzwVuInbOHrDWm3EwafSqFNMw4TEAXpWMHW6EYd0GaUAQ
         RsgSv0E8QEpkahXJbq+cR5fGoU/3Z3/3wZrI7+GsFcULGvduaTgh7nlaP0Ed5pbSUA+p
         tclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787261219; x=1787866019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilFUYTSvseE2hfnCHpx5oP37S3j7dMYhyjZylo0TUmg=;
        b=I15IE72GQpucaTySBO3TGNdvEszRzab9BD+RLFb3zLCnOk7kA+vd2OhF7QvXAbpOdV
         2HuDm+d/u7jSI/wDIbnDsrOb2OUTQ8aqomh8+DAQvhYp0NsZPRZmIvGxzrC4LRR2MZKs
         WidjyLbfGTuF7FDbqVTxtNAhc8/rCKrXKcXIA77jzyFEXw5nJ2fzLBh4zrOYbVsL6zMi
         BPIlAkwcpIHm5cIoD3BGShcJUsIWzjBCgLJdrQ1ijt40hIt9WuzNSXvUnAPS/n1IFrmY
         8J8P6qfmNUwgm52CXINyTUqNCb9S6c9sTthow41eJ7ND6PHj7l95xbONxh9AxJc+RcH3
         nnTw==
X-Forwarded-Encrypted: i=1; AHgh+Roh02ryPCMmRNAKBVyUJPxb3evpT11uqOCqyFw3cr37cKKmy8kophmOnJPIRUGFYbQbBsGoK5VQbt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWioNTFIN1uBz5gMycaC01V6oc7qEcutsU+3dYOMopneOXQubT
	Yjzdz9yQXCfUAp5B0rl5XomxZ5UOdmg/q5vky3l6//GxGvv71W95QhuZL7wrANNh7q8hyOWNCWw
	maVrJrfNSuF5ZpzLJbyQbjMmFtL8J4eGFt1KXG+xxhy5iuQqo+Yw0LrBJuJ79LFI=
X-Gm-Gg: AR+sD13QMvyM0HeSGCq6YCD2ZynXljWt7wJzB+P/QbdFcWgoA/a2Vse2FIizqposCp+
	uI3VGb+K0BxepuwqFSHxqD29vCxxUnv76mItV1bZBX+a2iBh6S53nse6s561oXyEswXWbcC1jfF
	39ebd+nxUxm4SxMSNDe7X1LqQ9tgoRXWp0hNp3Bb5G/PWX9E2mbcoG0RU8794Su7JLHleAROkxV
	sLO5KBtPDNlkZGMknFgZ3VIUnjQFEpL2gryyVtpfDvWu8iikawsP07zdlVkzKufpxfpINbLWpPJ
	Lh4snK4kAhbl55ou4MA0p2E2H6/HhjSEI+jXGxUMg9gMXiinzwJw5e2YS0VahMwUFalydshO1V3
	NFEm8vLLfmiY44aoGua2li1e2FgS0aMj4l5ag+ToTDxPJCXQasEF8zPBI+HOozd8=
X-Received: by 2002:a05:620a:2714:b0:930:f285:5ee9 with SMTP id af79cd13be357-93728551dd8mr1072189985a.20.1787261218775;
        Thu, 20 Aug 2026 14:26:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:930:f285:5ee9 with SMTP id af79cd13be357-93728551dd8mr1072184685a.20.1787261218308;
        Thu, 20 Aug 2026 14:26:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:50cd:a866:bdef:4e9f? ([2a05:6e02:1041:c10:50cd:a866:bdef:4e9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b91037a6sm5664815e9.11.2026.08.20.14.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 14:26:57 -0700 (PDT)
Message-ID: <d62e3e3d-9639-4f11-a9f1-460d300c2ac0@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 23:26:56 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] thermal: hwmon: Remove redundant OOM message
To: phucduc.bui@gmail.com, Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>, rafael@kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812042842.15209-1-phucduc.bui@gmail.com>
 <20260812042842.15209-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260812042842.15209-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qQJlp9kVfxlvCNsoYbUEWM7iOvegjMDM
X-Proofpoint-ORIG-GUID: qQJlp9kVfxlvCNsoYbUEWM7iOvegjMDM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MCBTYWx0ZWRfX2gaYXqP/IuHG
 kSL88aMwXiKP5b4WRay1Jfhif4RZUK9ggBYTpKQCT+NxQ/8B3uRTwZKlXsLylE7yQ1BnS0X7jwn
 /w9spcgrY3Iuetd/1jMLjdV5whD1acOb8dR9c+VC78paDB9z19wB/qQQ0wk4magCkHuMdw/z88u
 nQuFXHttsNHQcAz/amr7E0UoAhpnlUrJg4o7c64Xx3bLvBJPIK7KXJCubCYgb7k16NEt1+ZLiHE
 3Jcz2loYyrGvLe7D1UXdYvsB078QWn+NFmT3XWfrQf2YcYwrCgi00GSxjKThr9fV6ymQMVS8KNy
 +BIfdN23UKsWHIDx8aiB6rcpK6RLPGAdFEncmLBc7NpvvlUq5HBkE56Tqju8nqBMqh9ShasJdU1
 G9REV/cS8oX+U9lAuAKUtJIChkQk31YmPYCWwx1bDXpGIPetG+0rmTzcGudJ/PJfD5J7/VmVGkO
 4wIZLteBecP+cC2QpBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MCBTYWx0ZWRfX8SCUZhu18vk+
 foWZRhBjFLiz5Z4IHBrQ6T0W3rMNJYjmFDVC46DEK5UsOawjZT5D17Omdw8kmtN/jcNIr11ehxA
 hVE+A/dGGVTEEI9zaGJxTq0rwtigjR4=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a877123 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=CFgyGuPsqRpADsk7uTEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200160

On 8/12/26 06:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Remove the dev_warn() after a failed devres_alloc(). This is
> consistent with checkpatch's OOM_MESSAGE convention: no error
> message is needed after a kzalloc()-style allocation failure.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   drivers/thermal/thermal_hwmon.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
> index ec73d03a1e60..747ac87d1c37 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
> @@ -269,10 +269,8 @@ int devm_thermal_add_hwmon_sysfs(struct device *dev, struct thermal_zone_device
>   
>   	ptr = devres_alloc(devm_thermal_hwmon_release, sizeof(*ptr),
>   			   GFP_KERNEL);
> -	if (!ptr) {
> -		dev_warn(dev, "Failed to allocate device resource data\n");
> +	if (!ptr)
>   		return -ENOMEM;
> -	}
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
