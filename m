Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780088;
	b=zxR86QPtagQbGahoE0l/Gw11UFt/0kFTPresK4I3JDqv2ycad3RChHTO3HLmTau5samo
	 0U9VTA24lyVfSzGdjbgoUqFQGpqXx0tbUtm6Beb5s8dg/Z8FUUD6xmHW3U/QFI2Y9U2c/
	 KfuvH1xKxCBLqhpO2xmyWqIR+PMf1uDhBAxqISB1CB2Ihw7YOX5xJ1UBs2KF3v33qJpP2
	 eY48Dpgns+IOodQdo4vqwZPe6ndisZ8/W6gAoz+GOMysEkhV7l2K94Xe0Lvwf2e1grBh4
	 z/7pRky98dU7eU/tXItbkOELNzLDvK3IgTlkiJmBm85UxGNkck0+FjlBCeI/ssTqiDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tbal/ZkG6Z3XFW+o0xC7HHpMaNOPsDMuc3tJN0tWynI=;
	b=Fdx+9t0UL64N1Zvkd76kic+xvHWhMXWgzPJJOQUa3/v/Utek5xr02NM0ncdfNTnWNTvJ
	 YQBgmq/iYsYm1sFq4fA2kR19m1xThH1X30MN2/wx1oioq3QZrRuuH36fAUGlWyI15fULz
	 5CDDpcyRf60dXZWNvTctiVurrPq5OLHcX5Vku4wCHln5deCommRvhWa48J2P/oVuVNO1/
	 2uM1o5d6UCZnHmPVrWe6tQtfWj4IE9xCEEyoLWaOnv4bzTE0wekY2FonzspwlflZesYqK
	 /9zTd17uieteO1PUJ6wSYsrUBp+IOBUB/FODVU2Cixw2JDbJum1tf8lyRAwLnUDeBZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pHkXeqV6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmPHRtr9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3EB606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 08:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3EB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pHkXeqV6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmPHRtr9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47CuVw809345
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 08:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tbal/ZkG6Z3XFW+o0xC7HHpM
	aNOPsDMuc3tJN0tWynI=; b=pHkXeqV6evqnstGnUGw1ZXFoP5wPgDZd9FKKqSD0
	Jjhnu+jlZpPGX01DzVhh2vWavE8EIDnBjodzE93dZe5xQI6KvvJ2MztgHjcJoxRs
	x2XwrDWQv+c5IIEviMli2BaYo1JrUExxVPeacUWAI5QC3DLbySZeLeC4u37p6pht
	R8q14RhN/s+JV+2piZijnNSUDeqbRrWHzH0D7h9TOiex71Is+sFvDVYtCSY79Kkp
	hc0MWjtt27xLW7i9ME6C3hsribeyJ794tTDrRYO1htH6GUTRcRpmjhFi38N8doc6
	N2NBdSSPa/mMhbNVAxAEY/n1eU+FF3xkW2OlbWO3+881Ag==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpbd5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 08:14:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d2a94abf7so156125eec.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 00:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793780086; x=1794384886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tbal/ZkG6Z3XFW+o0xC7HHpMaNOPsDMuc3tJN0tWynI=;
        b=RmPHRtr9IOJF40G9WdX8K6PLMCGst1DQ3njXoAjIeaqk59003kpIrUP9X9dpPpfsNU
         UuJwieOe0rliHFO2+k409dhi9FSye15EZ7P573korBw7h/VYp29jiMOWpzUhyqzMNOZN
         wN006OXfQ/i8IWJTCa4oLJhQ6u6MgK8Vj46PyDOcYTCM99KWab7vSgRFQ3Hp+9Dw7IJa
         Q4l3AyFltnDCpDZ321cVs8J/I3Scvr7ZBoLsb893oMfjtrHGoRhDyKm1rhrvcYH1Ek+s
         syt0wy8Aooir8v4XbpujL/+YXHrDCkIiyj9wiT/G0yW0H+epFjqPOa7ZYLDjdH+y0gPe
         hpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780086; x=1794384886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbal/ZkG6Z3XFW+o0xC7HHpMaNOPsDMuc3tJN0tWynI=;
        b=ZsWxPZ5jV93+NphtzdcQklBKVHAokqJEkG0F6AIMt0rKtXeVcIw6BvOKECQksOjy13
         qajYH25DgDERwFvjB3yi6JdCV6c4e9QYHi/SbQBQb6yoNSO4eQNDCQaUCkpbBTKa1ZhI
         BgY/GQrP+ojES/386tQegahYUn55Vraos6Nae2tqscwSC+vNR5LtellE8j+gtw6w3A7P
         7FTC9cJa9OngisuSkUjM9CGgB5FrhJthgo94RpyRf3zekqiIPWpgkxvGroukM4M60kaH
         iq95AYA2VYGVwlv5WeEL7S6UJGgrG6jwMTSKTSfOm11Z99SjIRf3OnCoEcxaDJr2JuYR
         Nwmg==
X-Forwarded-Encrypted: i=1; AKwUvBxXbKGYnxUrqDBvpc+k6vNgacbQeVJWORkp7k51k/t4siGdALwFNn9JxV7Z+x4U240syG3C6+qIL+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pqIiZsVczNc6FtUPvJlHKo3jITWD1Vo/iQdimZrLgvDNuc5Z2
	7TU9nYVlRkzAuYuZ6mfCpkiSIgnQXxriyrRVWzHO4g7gWgqVyzER/45zwVODHEp9D/mi0c79eob
	F8YgRAE38LUQHgnrxETRY/otkNzod5pIe9uhqzlWKsCcWXLK7Z1TkjOZVHwHF11Y=
X-Gm-Gg: AYBFou1xplTQPmHfU+a4juHokbcd95yq/Z5uBSjL3tiyhFL2VwYPGJpAn+mv/1KFMoN
	8ZA1QuqIVKYNggj3YamqvcpsYQV4yPiGvNiJ+9z+GNSHrJ8OuY7BemuZlhTJ5/r4tvBdlaq9MWZ
	wC7f3rsBAMYlKPqTX7Uxg1j5RuuOs6PSmAPmngt+q+ulLeut+laAg3ujOnM0+WwpVdITxHTar99
	5RECDy8HUci7mfYxg0x14TihHejMA8zHz97u9canSSjtkggPxw4EY5Q6jr6VU4e+ChmoX7cfcyW
	nMpWYFw6+RJrrzM1eVXWMVGA0J6P41UQWbotsBTwB+OwF3X5v5WuJRb6nzo+1PmcyMybNP0F1Bg
	L/b4XuGB0lFcAxcZv4dQkwS2Pr5PdbfpqNgpJOgX1BCpPs901Gc6wGgPEX8xcBHiIye51BDebpn
	hj2fMfypb7MQbIKENCqhkT
X-Received: by 2002:a05:701b:220d:b0:1b2:365f:736f with SMTP id a92af1059eb24-1b2365f76c2mr8150394c88.9.1793780086189;
        Wed, 04 Nov 2026 00:14:46 -0800 (PST)
X-Received: by 2002:a05:701b:220d:b0:1b2:365f:736f with SMTP id a92af1059eb24-1b2365f76c2mr8150360c88.9.1793780085419;
        Wed, 04 Nov 2026 00:14:45 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm6286845c88.22.2026.11.04.00.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:14:45 -0800 (PST)
Date: Wed, 4 Nov 2026 00:14:43 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: npcm: keep the ci_hdrc platform device
 for removal
Message-ID: <aurpc-QvQ-9ak1dD@hu-petche-lv.qualcomm.com>
References: <20261104021456.1468462-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021456.1468462-1-vulab@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXzoei9h7pnZbR
 4ZV75rAbsvqY9vVu69s10dGhmdJcYff+S38b7JQt2LUFdXMnG/YXqQ2xB068tC954UoBlyGlDs/
 na2mxirZlAH9Fi6KhkfPJ5ssFWoGsA1kgRRvschz6qezM+VkWDAsPNDQw2zDy3Jjpx//QWPMuae
 ECkw5yTUrQqyy6U6SE6AcWabR6KRNhX+gJ5SxcH6nN6W2VzZEa6raL/8p3Q/cZTGjyPGR3HJEpt
 luX6FPVfGbvsIRx8Jm6hNr+OA9GiOmpfxf+GWJzwitgvxAJvUNgkz//bdoqHluZnRw8R94tWp6Q
 Cjsrle4iofsNmlVAMbLORnXpIV/aBXtUmOkg4uH5lITXkaWVNDnLpdG/GeWUllxjc5f16386/mQ
 YYb8/sYc22EbHZ6U/MfNEOFJG9Gg9CZaapZ7eAutCEyUPv9PEyDi63j9ntAH3ITJshYvcznDhdU
 9b7Vq+J2OQjIE+NjSqg==
X-Proofpoint-GUID: Mm8o5Q7gRNk8aCZReq2PIr88mwKXTlWh
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeae977 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=jKONAvGbKtYcbMD76CUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX6qbNqSS6hBqV
 YflvMNrw22m90b4HiDPxx26yDgfJRH/IRjAOxXLZcpe/uuJAXBX3Dy39BPzrwecXs9U6Vi28+Cu
 kDi/s/LRBvp8zzdszBPWBNWR2/7arGc=
X-Proofpoint-ORIG-GUID: Mm8o5Q7gRNk8aCZReq2PIr88mwKXTlWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

On 26-11-04 02:14:56, Wentao Liang wrote:
> npcm_udc_probe() creates the ci_hdrc platform device with
> ci_hdrc_add_device() and stores it only in the local plat_ci variable.
> The npcm_udc_data::ci field that npcm_udc_remove() passes to
> ci_hdrc_remove_device() is never assigned, so it stays NULL.
> 
> ci_hdrc_remove_device() therefore never unregisters the device created
> during probe.  Both the platform device and the reference it holds on
> its parent are leaked on every unbind, and the UDC core structures are
> never torn down.
> 
> Store the returned device in ci->ci.
> 
> Fixes: 70f13579c2f7 ("usb: chipidea: Add support for NPCM")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_npcm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
> index e52a2b05cbe2..8ad8797742f1 100644
> --- a/drivers/usb/chipidea/ci_hdrc_npcm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
> @@ -70,6 +70,8 @@ static int npcm_udc_probe(struct platform_device *pdev)
>  		goto clk_err;
>  	}
>  
> +	ci->ci = plat_ci;
> +
>  	pm_runtime_no_callbacks(dev);
>  	pm_runtime_enable(dev);
>  
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
