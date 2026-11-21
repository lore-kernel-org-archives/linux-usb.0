Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261076;
	b=ROsVobCZ5eiXtYSlt5/GQE7EYH8VJnm5eOc9klXOxlPCkwlrKVaZJWEaSE/yV+2dzwU0
	 muV06D4LWENiHMsloQAdmGVAZmNZ3MhZfL4yMfAt43/KYdbhH4V2Ll8THkF9yD3lWEtni
	 FpGDoh0dKeWdAmBBRQej3wZbB1gk8iWf9iNxT3twFVb/G1fk+O3YIjr70+QMQY3MmKdun
	 rRJAHaAH6lY7jPQ6ClBQjNa6UJHQOPF/mfxGbufVNL8q9fUa50cYnZTonEnPMMhaE9jOl
	 06RyVH5Z45e2TnT1tpbgvtZA4Pb5yFvik8eV5jgT5L4WG0Rxq1Ita6/UuWqxmr+1t7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=;
	b=VOx4iP02/qXLjsng9tu91qq2OhF8F5av2V3cGMe4tEicSj8WGw8L5WOX8pfbs5MZGKUn
	 7UmZKnOyJO/oABFumRVGMu4LDTzfnB0+GeNJ10kBf34kvjZGoLF3L0i+OIwy77T2aydpd
	 6iW3jKJdZpzlEuD+MimnphYPgfBCmHb4SCFhONcvfY5cux0vSdTW4CXD2QUxpYU5b0gT1
	 G+51LPC2VLbusbWdDAZbkIgOgFazYclgMynnAeJMzDEfmTdUaFNBmq+HQcrhrCDdaMdBg
	 cFNdSEheWHdLjQ7MIzsd9WhJx6n8chEkuQFP+4KSr/ri0UxZ3O/ZtpP04JtibDSqqbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b="C/+fmriv";
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2B3606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 11:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2B3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=C/+fmriv
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so2573221a12.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 03:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261074; x=1795865874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=;
        b=C/+fmrivfDTC9cEzCN8TJCFXm4mvDOp8Zb5DvRINqYe+CZIjnSj9ZQYWMeftgURNEL
         wT6+UdMDYrKy8cGBl7mc3zPQXdOMB2dYQte3y5KERVlx1260ZIdBVbw1f2dCmyp/WleF
         azBlghCLUTmhGlYgC3tn/maDmXVD/+4ZPn3yvPmq7L8No/35PRDrLpQUB6fuTrNdbLGF
         rOC9iI9Q7s5eMjkK3JxtXIqpgrN4+oIJdeAqGy88US2Fncmmo82c+Mh4R/Cyq2sEh0n6
         DwEtwJJxHaneQFBNr8i/LuxikvGNmARJkGhsqCVQ3QVGTgAeMJZ8V+ccn1FnqzaOTWTB
         mHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261074; x=1795865874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWBZ24J2L01VeEpwZsAilZvLBxGps9oMKqAOB5tV14o=;
        b=MsX5YKHAIiJZZdYwjnEryX4yKsah6/jW38TmD+Bm2vukVX+lFUT2kCuj7SOstzCaQi
         XNeFonxFUcbg8phb9qZ99X58e7Ou5frYk3gWWPdcRl0dxWmMhG+3ECAS0HXjagWVvJET
         VWYq6wj+O14r8rqZIiPVgq+hpLz7M598pQAtvx3joZGbkOU/eT8YjEGAc07SJ1/JGM51
         h6O6J5abGRjWDlQzlrw8sA72r6OYQEFizDxAhEsIdBgslZ+XLNnQhZDOsJc/e0SANMuW
         KYYW6rN9zgqaETqeN0ay4hCKdby5JHReY76ASCxKz1wAXxTkna35TssGGkXnsmPcChQq
         FmRQ==
X-Forwarded-Encrypted: i=1; AL+hErF4jEIj0DgsB5G34dmhemfSuqie7qQoJc7Ig/fYFHDXmYTmIqZOU0MeTE2omQLYU1hU5cMLT5yXqEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GlnvWHFd4QEulk1jLYyzF0m+JfiQmdPAo4ysJmp+V26lL1W0O
	vWKwuZ9GGSi5UIgQ1eBlFGfopqdNPWpj4HyZKHvQ8k/FH00sMYsfk78xZ6YVHZM3oQ==
X-Gm-Gg: AZFdTZdnSRHLROOM0oU2WHhEwMIj+r1Vbrp9DbjEDDyeOyU0G0Jf1EwIwpWWkg2klSQ
	MrMGNkR7SufCXOsvM53os6z403xH7PdD+QeE8liiRL5a4ZwKEvs+gPPvUmnKNT08lMQiDBXnXF7
	3n7qGi63hc54wUVSwEQIGrMxD5vbK2m1nseTxZx3BV26BR+NzP7oJKhmHkTBKN5za5VpjjQe9wC
	9NZxnra8yT5RZ96xbzhDzojP3wEJj3XnCuyWMLOZeQM2RI+q4YV/HDnPASTQbJvIl7ucDS9qu0C
	96nveJBM+04UlRPxVHlozYMvWg83LuceUd8NyTVeD8R+iV5ZoqvsO6O5SyVdmWivZivkFeX2otm
	h1qRl2sZtunOD9tjA2yrxln49XpiPzw0gd+h1z42J9Yzt1MXr7XiGDh0gnZnVGg38anCRx9UXDQ
	FYWDEG0J7fl+GHtJswM/JKh18yOyuoR/HnIJ2VEO+aq+rBVQ83gOW/UVeeeITTlOwbCStjwtlt9
	8wD+onJGQow3+cSPzg+iitOX3GnA3WFMIWpyy5Hog3WVmUZdC1RlDMtqpoifEYBL3j6gVhcbNuN
	xM09OoeJVwYh1HogQs/mnwRFBMAIhmAU1OmkAjx5xrGHxkw4yKjgqhnfBTiGIHOiXabrKh6dtU2
	Wnobbxs+uC1THa9/bCkfGBxgmYR+1TryNwMp4LBrDknbVuZHBjJ7zLlSLNqonBMeMUsaiaNN59q
	3L
X-Received: by 2002:a05:6402:1cc3:b0:6b8:7816:8735 with SMTP id 4fb4d7f45d1cf-6ba37cc09f1mr4099511a12.3.1795261074138;
        Sat, 21 Nov 2026 03:37:54 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e91c3sm2202346a12.19.2026.11.21.03.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:37:52 -0800 (PST)
Message-ID: <1cf0e772-e5ab-485f-bd6a-d1088e01ad1e@pardini.net>
Date: Sat, 21 Nov 2026 12:37:52 +0100
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
Subject: Re: [PATCH v19 0/6] usb: dwc3: introduce Rockchip glue driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, kernel@collabora.com
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 02:01, Sebastian Reichel wrote:
> The recent Rockchip platforms have a combined PHY, which does USB3 and
> DisplayPort as well as muxing the lines in arbitrary order.
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588,
FUSB302, source-only Type-C) on v7.4-rc3, with usbdp part3 v18:

RTL8156 2.5G USB NIC, flipped (reverse, normal, reverse): 5 Gbps every 
time. Before the series, reverse needed a dwc3 rebind.

Apple USB-C Digital AV Multiport adapter (A2119): a SanDisk Extreme Pro 
USB 3 stick on it reads ~220 MB/s at 5 Gbps while DP alt mode runs, in 
both orientations.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo

