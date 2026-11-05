Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879317;
	b=cYXG/op9A+OIL8YOBueCnyQWiSaKdjgKdkOC7D4lL0PiHIE7tZzpmfxttB5OhQ9KkbXs
	 w4bn92S6DpQzXz7SvJOKejIDw1Vmpi2QFzXAOwaYF7b6RtYPGKM6osYNzzL93PP0JyjBo
	 +bhxVMyNkkaO9akPMTP4cDXkomJ02DPmwdlBPbyBpPCP8ETiY5UxCbJ8HtXMsoaIq7oHm
	 DLxxm06X7ae3TPXY6OYSywCT3p3AcB/+UWp6LKkd0knK6hVeT41kok9uvJjkc1a8fghVB
	 iGJ0o4eRen/wakobcO7uYH6rctboPL+XZeJVCo5mgSrGl7RDC8IodN+/EWBj6c5eSGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879317;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=MR6tfuaPqx6X1tSqqMXZMCaVWj/hidvj/pZlCig8WlQ=;
	b=S3EM0JVyJse6Nxynqp6Kl7XFgl/VG4shcc1X/TpC+L0YrE/Mn6ygDy+JRuFZNHFwvZLq
	 Ixtag2zTicNR+IUhn0UpMJ5VuVO2MtjcNhzqoMt0ybazGyKkk/tE6sYW8HXvC+X0uqTjJ
	 qlM0TSP481q/pK90EjupNenmVwwHMU/XOYMQU7it9it5zevnXhN7sIRc/jZgsD3hPKFMv
	 NwaeuT3eRvA1sa2JF6m2OYTbe3yqjEUZm1/Yri1cLBcJLn440vriuMmcvUq2lPQL+j4g5
	 7mXKkBZwY7V1Yp8v4vfITSg12X/2uJ3qunkM0dsGEiPyEGI23LZqDUBUrbVzukEDjVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Df+mS7x0;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8608606A33A
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 11:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8608606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Df+mS7x0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78799C6915A;
	Thu,  5 Nov 2026 11:48:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E2D15FF85;
	Thu,  5 Nov 2026 11:48:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3165010329271;
	Thu,  5 Nov 2026 12:48:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793879311; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MR6tfuaPqx6X1tSqqMXZMCaVWj/hidvj/pZlCig8WlQ=;
	b=Df+mS7x0GrBZLzcuyMUY7BdqYLkgB9R0tV6DNOBEMiDkO59W9Z4DLRp5foZ87YU8WTE41o
	xNOCp9bejflAijHycxUU75X+rZiV3IZW2ob4MTIl0v1n3K6jAx39Bjf3fxV3kshrJm+4Ln
	iOdt6Pe5oYkZUWbBHP321Kr4YHsQ3ctZUyxZMPb4GYaoBvhkbRgOV59OeKiP3JzfURit9S
	Dheo83dfMJJrPwrRZ87mmA/0IvSv0JpuEA4HsilUKBMtPD588cVwlTHpYFXXdAETGbq4PF
	KpwSyjqwp6Z72lyI09bKsdGTlBYxJkKGozfNu8VTItYQcQ+TSgY/T6SKvGA8Gw==
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
Subject: Re: [PATCH v8 8/9] soc: qcom: pmic-glink-altmode: pass down
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 12:47:24 +0100
Message-Id: <179387924496.1025980.207023547129772297.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 24 Oct 2026 03:35:24 +0300, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
> to be delivered to the DisplayPort driver.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

