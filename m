Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879309;
	b=QGk4VMiF4imGHyBqpirgzIlX5XigJvq6nn0DZOQep++fEZWQTPZEEVe6s76nj9wQw888
	 r7YP0xwwTbSDdGQTMsEbSpVbFZRsfwOXvAeZdeSh0BpISY4cnQrVg9jDINbUyi383oA5t
	 /vRksmslVPfR8P/KFbD9Hnwf2K3awPmVKduvYM7jSucDsejzz03JHvl0y5vCEHcUCZ2bA
	 VtMIMUQnjPqboOdtecFORwHyHNjluogFcIIGMKQDSk/nQlUYTkCzv1UWAo/L08iwxw9Na
	 0UHEf/JtCF6ssZ2LDNkKJ6VDg5QYaDLab1KEdW3+MghL/axQkfFyKMtkBx4Y05khOUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879309;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=aCE1gdqZG0gj8sGUQxXy0HGUs7pUtWJaz5F8kcOEKQc=;
	b=ovMkqYCH59AYzi313dsKCUnIz0epuFNJj0GpSEbMS5+AgJ++ZPWMQ3HE+aV25rL4qzBf
	 A7lMYZn3mw6MEUmukM5rsq/aDM6qKTbadoQfnvK8FkGaL9ml57BBaBnWhYLF8/GGRvYaI
	 6al8svk6wBqu8HOndqe94/3MuDwxqZF3mTJPpoU/XhOK0F7p7J7uqd3g6oYO7o+tQUpHC
	 tfOxUWUIxrCzLlI2WdvVahQ2N6MrbgsrbadHBwAkwzTrvco3ZVTffzcTNa0diyRSbdK6b
	 cO0MckOWv5v5ZlbX8GhFwC8wAD6FlkbBVPkneMPKQDgBoLs7WwtB7iBWFl/Go9KNy5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xudMFcQn;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF37606CE8B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 11:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF37606CE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xudMFcQn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EBE15C6915A;
	Thu,  5 Nov 2026 11:48:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCE275FF85;
	Thu,  5 Nov 2026 11:48:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B78AF10328CE3;
	Thu,  5 Nov 2026 12:48:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793879304; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aCE1gdqZG0gj8sGUQxXy0HGUs7pUtWJaz5F8kcOEKQc=;
	b=xudMFcQnUyvhlTEFR+H0l8xy1hxLPwGa5as2O9dl+7nUdaCk3qObAKF4n70YuGyTV1v/T0
	kWZdpoV6uG4iN3nkON4O0xweTrkdE/UcPffku4JOcAfvcXUs6Gr1+umlGMQpO8qskEBHoB
	nUIqUMHJs9XrGZ/sTwbPvji2jRPmv9ny9hDt7TLuaT8VFscVzM4DsXSrMLolw1QF5CBFev
	UkdbKUsE8B59CwR1BrjUZh1yFnFBfQzlTmjSXOlh1HpBy4xqVlmDRoFjhwD4vMxSRQxsCj
	hvr1FbfRfh46jfWflpl1l0dCzESRAlycFTxEvap1riXMqvltxt3Z6ljJ9bB7NQ==
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
In-Reply-To: <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 12:47:24 +0100
Message-Id: <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
>
> Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> events to the DisplayPort drivers.
>
> The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> preventing extra cross-tree merges. It will be removed once all
> drivers are converted. The drm_bridge_hpd_notify() function is kept for
> the drivers which only care about the connector status and will always
> pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.

Do you have a plan to later convert all drm_bridge_hpd_notify() to the new
_extra() variant, then remove drm_bridge_hpd_notify() and eventually rename
drm_bridge_hpd_notify_extra() to drm_bridge_hpd_notify()?

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

