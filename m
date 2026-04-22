Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BF23932D1;
	Wed, 22 Apr 2026 03:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826803; cv=none; b=jaflwzcQ9FVzmOopQxIjkogsuXSuf19PcyfZLpcwIu+vJrqZRXFleJlPkfpwl/jRf8nnVXjtHRJ5igcADu4cQMiMtIPgzcLAe6NGN6D0C5dNf+ZdY71HZjT+OQaKdZrvyt/2BkSjJEfShA29JBdk6zAkdrG1vFAwd4uavX1GhTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826803; c=relaxed/simple;
	bh=iTZLpIY5fvuOjydXXrZUB7k4dLoQNStCe/+l+MJiS/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7L6ierbmrJKgC85Ig0Z2n2d5NS96meVPqKRBhvOY/F2xdwbemmSeU8gLleL6wuzdKwlP5lRFO+Ced8b5JfI3rembN+sEyKGKvMc/+QJV3NEDR1lvmE7WL1+IRR7c8SG/2IUuv4L101o+PbOv4PHIOy4r6HEOXwjvL9F5vJEMlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSRhjv+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSRhjv+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93866C2BCB0;
	Wed, 22 Apr 2026 03:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776826802;
	bh=iTZLpIY5fvuOjydXXrZUB7k4dLoQNStCe/+l+MJiS/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSRhjv+lj77eyi+AuXdFXy3BTYyiNc2iH8CVrf2mNGzmK8+94mXo22gYNGxnaLn3R
	 7MqOMrj0mzXESNXrofXo0Fj0RUPURhtjBZtdImjkcrRxkZ3Yf9OqHuR4A2JYZZ76Pn
	 e4bLEhdsy6kbxf7fhVPoPvz6leqE8nAK6EUxIv+X65krQRsYCBFtfFfbW+f25krh/c
	 JRsNJ+Oqa7sp4sapBYsYHkjQXhgT50mq4DH2ymt8IjjWf0T2fWGK38B+t9B7/gPZNr
	 OPycA6XvXxuGBEXG0C9CQq0bztm8xrnUA4Fjak/uBReXZvpdrrqCyYSDqYQo9FQDI/
	 WXNNWHVhgPVRA==
Date: Wed, 22 Apr 2026 10:59:59 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/3] usb: chipidea: core: convert ci_role_switch to local
 variable
Message-ID: <aeg5rxDYmYrTiJL7@nchen-desktop>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
 <20260421082436.1264442-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421082436.1264442-3-xu.yang_2@nxp.com>

On 26-04-21 16:24:36, Xu Yang wrote:
> When a system contains multiple USB controllers, the global ci_role_switch
> variable may be overwritten by subsequent driver initialization code.
> 
> This can cause issues in the following cases:
>  - The 2nd ci_hdrc_probe() sees ci_role_switch.fwnode as non-NULL even
>    though the "usb-role-switch" property is not present for the controller.
>  - When the ci_hdrc device is unbound and bound again, ci_role_switch
>    fwnode will not be reassigned, and the old value will be used instead.
> 
> Convert ci_role_switch to a local variable to fix these issues.
> 
> Fixes: 05559f10ed79 ("usb: chipidea: add role switch class support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/core.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 95d9db159ce8..07563be0013f 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -655,12 +655,6 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
>  	return role;
>  }
>  
> -static struct usb_role_switch_desc ci_role_switch = {
> -	.set = ci_usb_role_switch_set,
> -	.get = ci_usb_role_switch_get,
> -	.allow_userspace_control = true,
> -};
> -
>  static int ci_get_platdata(struct device *dev,
>  		struct ci_hdrc_platform_data *platdata)
>  {
> @@ -787,9 +781,6 @@ static int ci_get_platdata(struct device *dev,
>  			cable->connected = false;
>  	}
>  
> -	if (device_property_read_bool(dev, "usb-role-switch"))
> -		ci_role_switch.fwnode = dev->fwnode;
> -
>  	platdata->pctl = devm_pinctrl_get(dev);
>  	if (!IS_ERR(platdata->pctl)) {
>  		struct pinctrl_state *p;
> @@ -1033,6 +1024,7 @@ ATTRIBUTE_GROUPS(ci);
>  
>  static int ci_hdrc_probe(struct platform_device *pdev)
>  {
> +	struct usb_role_switch_desc ci_role_switch = {};
>  	struct device	*dev = &pdev->dev;
>  	struct ci_hdrc	*ci;
>  	struct resource	*res;
> @@ -1179,7 +1171,11 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	if (ci_role_switch.fwnode) {
> +	if (device_property_read_bool(dev, "usb-role-switch")) {
> +		ci_role_switch.set = ci_usb_role_switch_set;
> +		ci_role_switch.get = ci_usb_role_switch_get;
> +		ci_role_switch.allow_userspace_control = true;
> +		ci_role_switch.fwnode = dev_fwnode(dev);
>  		ci_role_switch.driver_data = ci;
>  		ci->role_switch = usb_role_switch_register(dev,
>  					&ci_role_switch);
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter
