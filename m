Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921C025782D;
	Wed, 25 Mar 2026 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422773; cv=none; b=E1Z+uQCWaBNuF8sINnjTSUKFXHOO5mYlyvWRfLrSWyyrIkMoTI0YlFR1YpPBzBQsKc2O61IQcoZq/LgnFkWrxDfMPw8Lf0X09eabnsUoTnaz19RSHQUCVGp6oUeiEifBerbju6IhlI9xkeTJCS8Ez1onHDoBO8WKu62RUFViwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422773; c=relaxed/simple;
	bh=UMNMA9WJ/RFG5+COvIDH3HPmJlBQjC/Z290t1sOlAGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfvnfQ2SvLNgBqLXrkzRDtgV4xeUkyqzCEh0l71ZPCC2zbts4GxzxTiqCE7YLFmrXwXWwD+JKF5bv3NS+/yUUaY5s00ZrDyh7Phnx1qBE6enGoglqoESsQCvSf8wvfkydqDyCDSn3WkromyVxsDCAv9fWOqM23vxQm+UkTTWmPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSFflHje; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSFflHje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477ABC4CEF7;
	Wed, 25 Mar 2026 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774422773;
	bh=UMNMA9WJ/RFG5+COvIDH3HPmJlBQjC/Z290t1sOlAGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSFflHjeX/O0zG4u7aSvzlLrN9lKKuCk98bmRlk2SpJsfaopEGPiUH0fjwO9Mo95j
	 YB4hYOgd2VOHUgvooVA9sTsQTzK1vamu++PbRgqPo1s0u4/fjbIRFUhSkVcEckqZII
	 zRnp9lIuawVRFaHlBC47ErFSpQhtaxUbpNl/my6++BShCL3W/foq0WlIjvPoLIIlWB
	 nPioypIn+UYGng/p2K8nEpCplPa85gzRAysc3br9lbEwzJGGYB2pXsKaA4BbYZeSlC
	 gXgoKFwqiptQipqkKCnGiCAMwvp5bI5+dq+c9eWuMtsWDmh3NCKY+JFNO1uYezrHco
	 X+9Psj8wEBa2g==
Date: Wed, 25 Mar 2026 15:12:49 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] usb: chipidea: otg: not wait vbus drop if use
 role_switch
Message-ID: <acOK8YfT35GiNmuO@nchen-desktop>
References: <20260319095716.634568-1-xu.yang_2@nxp.com>
 <20260319095716.634568-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319095716.634568-2-xu.yang_2@nxp.com>

On 26-03-19 17:57:16, Xu Yang wrote:
> The usb role switch will update ID and VBUS states at the same time, and
> vbus will not drop when execute data role swap in Type-C usecase. So lets
> not wait vbus drop in usb role switch case too.
> 
> Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/otg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 647e98f4e351..2371789effa0 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -187,8 +187,8 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
>  
>  		ci_role_stop(ci);
>  
> -		if (role == CI_ROLE_GADGET &&
> -				IS_ERR(ci->platdata->vbus_extcon.edev))
> +		if (role == CI_ROLE_GADGET && !ci->role_switch &&
> +		    IS_ERR(ci->platdata->vbus_extcon.edev))
>  			/*
>  			 * Wait vbus lower than OTGSC_BSV before connecting
>  			 * to host. If connecting status is from an external
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter
