Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9434D90C;
	Thu, 21 May 2026 23:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405444; cv=none; b=Wkp0hIrtdq3wplKZhRUviW9ZnhNAY8UBM4z5zKwZkprgtEqUwf+Bx/EPdxErHLi/uQ32NkkFe8tiTAPmnJxiJTqHeJ+w3MQ1spw1mFZMft4MuEmh6MFnxTEM8d+jo99lnaaiN8QpTki5Gt5ugrCaz6C4a0C7XjnthoqidRUfJ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405444; c=relaxed/simple;
	bh=PqtDE0huCNOGuCz8sEfVHZu83uF3ui6aBWD1DFRJxB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDYtIXjXA9Nsu9cRixs2SLj9A+07zFr9edkSFF577Bctp9Vr5QKnyzGXjX9h3T3X6DRpu9b1Z2WUuzqNznZcv+FH3S4U8bcO2DTcUc+GqvPxwqu46tgiPBdSuMMj2CCS5C0f4TeZYZD5ygYdqdJzx/yATcvauR/YL73oXZQ1XSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqthTvJf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqthTvJf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE661F000E9;
	Thu, 21 May 2026 23:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779405442;
	bh=j0ebOmJn6u1MxYGewPLj3waI4xbAN7qaMrGtxlI3D9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RqthTvJfQ1ACcaGzGV9ao9TFO/VRou8BJSP4JXt5IuYUBfih0U8dNTpXsMpDFcQWN
	 O2dNS6Ivf7Q6wszwppAtNLAsmvvOQy/Worly6dF6ld38KOYeFxSzvTW+1hkmlLtpoo
	 fU4+SrUi280Gm73Wh3vlxI9wiQ6JHfSQYVw3f3dNeMF1f6gjPHmDL6yLilvfc1Y5HP
	 lP56Q6RZIZq1EsXOT8HpJK4l3bGpmzExwWA3iwU5Ob8/A9YBMujzk1TMfpInqOYc2Z
	 H6AI0Z4Ou+98aTsTYrHKIN56xvdcobEUMajumYS/CzrlB/Y9yZGZ5N2cslRACkzBLz
	 94wZdfkD3uqqA==
Date: Thu, 21 May 2026 18:17:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 5/6] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
Message-ID: <ag-SWn5FgRLBqUTR@baldur>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>

On Wed, May 13, 2026 at 09:23:25PM +0300, Dmitry Baryshkov wrote:
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
> 

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 619bad2c27ee..946eb20b8f83 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
>  		else
>  			conn_status = connector_status_disconnected;
>  
> -		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
> +		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
> +						conn_status,
> +						alt_port->hpd_irq ?
> +						DRM_CONNECTOR_DP_IRQ_HPD :
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
>  		if (alt_port->svid == USB_TYPEC_TBT_SID)
>  			pmic_glink_altmode_enable_tbt(altmode, alt_port);
> 
> -- 
> 2.47.3
> 
