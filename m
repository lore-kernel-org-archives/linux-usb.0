Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9690377AA6;
	Sat, 22 Aug 2026 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385393; cv=none; b=RW0KCZfeaeZ7A4qxvjVraU+nQURxZEXkOUTUaHHGG5+aDXli3oimHrJkVnt401pYUH47pl9o3cs35UhIOJ/Y0rE0PhT6+LdpQFkwxsu/pYABJmLRq+06KPyGiTxE6CS91M0TYznINC6EKWcymRVcPyeoUzBMea/E4SNTRrrFNVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385393; c=relaxed/simple;
	bh=pIr9y1AtuK7vSrkNNRrUY19OOXCExacQaP2zNzxq0GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmPQ6APjvHD3DTbhi3fJDIawQsWjR/nLI1OnWog2U0Eax6bKsQsjSvayaQ2V9Ve6NVawxVV0U1aR7Ed9YIaqCfyF1f0FxtgL01ALuteBj4f6X6BFDrp3LOfI1Gs9eHho28n404H+dhxRd0JdfXyFmFbff96JAOjZ7ZiF43Z1ezU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=iJWwySiS; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="iJWwySiS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83EE711C821;
	Sat, 22 Aug 2026 09:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787385385;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=86TSTNJbA0vh6MpGoO0Nw1mMTb7YtQgj21vqlwf1cxc=;
	b=iJWwySiSJB29Uhb2Iw5CShZxVoAPl1IrdePqLPtyuvGAYzekddAPDXjR4AmsWs+wKCqCZ1
	y8XwvdPc3xz9toBaFIxtg5f9jtrZNZlv7N3k4F308xvF+4h5uv+E2hkeSamZbBe3lme2Wo
	o9dkM8jp1Y4hKOMibXz9WkwRJ5Zd90o4WuYexStv+75cfq536QvVK+1ClCAh0jiq+iBgZf
	KK65vANwnNq6jD8khwWqoQasE1+7WY3f57dszKrEHXtHSStNKPIQ/PziNyt/YPb6CeHIP/
	5TL1JvgqTvj8vA3ar219xh6Yaay2+7Bq9COVPK6cGMjgnpAJkWVsPtTdkhixRg==
Message-ID: <de3f992b-f39c-4ed3-9033-91eca7fc966c@nabladev.com>
Date: Sat, 22 Aug 2026 06:50:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] usb: typec: tcpm: Add STM32 tcpp driver
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pankaj Dev <pankaj.dev@st.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-2-c5e27cbc0795@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-2-c5e27cbc0795@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/21/26 6:23 PM, Fabrice Gasnier wrote:
> From: Christian Bruel <christian.bruel@foss.st.com>
> 
> Add support for the STMicroelectronics TCPP02 and TCPP03 USB-C PD
> protection for dual role power (DRP).
> It can be used with the STM32 family embedding UCPD controller.

[...]

> +++ b/drivers/usb/typec/tcpm/st_tcpp.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 STMicroelectronics
> + */
> +
> +#ifndef __ST_TCPP_H__
> +#define __ST_TCPP_H__
> +
> +typedef void (*tcpp_vbus_cb_t)(void *data, bool vbus_present);
> +
> +int tcpp_init(struct device *tcpp);
> +void tcpp_deinit(struct device *tcpp);
> +int tcpp_get_vbus(struct device *tcpp);
> +int tcpp_set_vbus(struct device *tcpp, bool on, bool charge);
> +int tcpp_set_vconn(struct device *dev, bool on, enum typec_cc_polarity polarity);
> +int tcpp_attach(struct device *tcpp);
> +int tcpp_detach(struct device *tcpp);
> +int tcpp_register_vbus_notifier(struct device *dev, tcpp_vbus_cb_t cb, void *data);
> +void tcpp_unregister_vbus_notifier(struct device *dev);
Model the TCPP as four GPIOs and you won't need any of this 
horribleness. Have a look at the UCPD driver I posted two days ago, 
"[PATCH 2/4] usb: typec: ucpd: Add ST UCPD driver", it operates TCPP 
exactly that way.
