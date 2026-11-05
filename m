Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879323;
	b=Z6sKW1ga6h7NuiFa9ceh8hIsbgfa85SIGvYCfgcTIzvRG5BZ4apzmsUcAXylSQzut6tM
	 3mwhuPvpCOA+8tlbXzb19s3xe4EZVaweGgQNK5w/GG/6NYtxRnTuAfRcYh7aBoZZymbFT
	 CgdUuqxUvf0BVuIF5aVTNaG8kcEmR0B7dvlR4yFCyTxNwf4hxtA6dhC9r9OeFWHXoKn1P
	 1qoMglgR20ySvE5vArwUU6622DOZmjGkfAcjqaSNkaclMzH4abOhMiepOs5Z6YMRGYvUM
	 V2T2G6QE/K0J4/A3zK963o0tSH2W/VHDPEtWQunPAePU//SJMqTSErqDkuUwMQcoHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879323;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=VDPNZAab1PM8LOjgIqFcAGmLTyOIwR5dfmB79CXKQsE=;
	b=s5JdMaLaGMpi8GrW3MhK2lQb5ulfGOz0O68PN0zPzTBb7DsVHkmFzpL9gZx/VkSYGXJa
	 VgSm4Arok3vUMV7AwZRV3DxRTtXemKiKUtNMFbmfufHFzeImgAvdP6AxaDXllJjDiitb3
	 jG4AgWaY0nsLQzWkbJFGigeTMzxu8obmpH0EILq0hzZBTklBfM7PnLR48D02ahTEs5rVd
	 rKjOumM91e/D472HUX4HgT3vAHPlIQXhzbawX+iQmY7gQ9G4doITMswV2ZQaz5O6ovKeu
	 5kMJk0om9tJ0pBdcn86iA2HUamK8Gwx/b6gapGNnLDEZ6TI7EmT74Z8f2q4YuyUYT1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gTUeBLA2;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15854606CE8A
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 11:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15854606CE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gTUeBLA2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C19CE1A0C32;
	Thu,  5 Nov 2026 11:48:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92CCE5FF85;
	Thu,  5 Nov 2026 11:48:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D73E1032928A;
	Thu,  5 Nov 2026 12:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793879318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VDPNZAab1PM8LOjgIqFcAGmLTyOIwR5dfmB79CXKQsE=;
	b=gTUeBLA2N/O/B+wx+ljwmMGwLW3XWpRyBwcJ1LUmbJ7FMJjwGp0PjVnKIwFXVqrf2sYxdm
	/62NVGRIA64/9wvmhAQM3e36EOQXGzXPsq0Pbz4Tvf7HAr3lfnBvVua5pVenkzmXuhytq2
	uk3ENuExjaGLtsdduVRr7OHoQ1rK6OFf0oBSC1tEAl6fOmK+PiP98AyRCRsq9vlYWq1Tvs
	rKjoGBwt/j3gYp47YiBr01OjvqjJJz3WFs0Mp9Tivfx8xcKBZxEiYNIJyi1gmzjVbzdZd+
	U8vxJ3TttmoVX94A1sKT4PQyMI+tje46ghusL5IPcunmBTbv0aPEgrmsjctS1w==
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
Subject: Re: [PATCH v8 9/9] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
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
In-Reply-To: <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 12:47:24 +0100
Message-Id: <179387924497.1025980.2920324286398089325.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 24 Oct 2026 03:35:25 +0300, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Pass IRQ_HPD events from the EC to the HPD bridge, letting those
> to be delivered to the DisplayPort driver.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

