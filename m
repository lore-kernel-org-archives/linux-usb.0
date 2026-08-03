Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6453644BE;
	Mon,  3 Aug 2026 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750616; cv=none; b=g7YZUvYOcq7o8yCiE6fAQfLF0bB12E3erfgaDN2/+WRjCYnt3kjmJMsqkBIq9IDlw7sJu2Yvq87w6TlzcYqMgw4Wh0qHXT0h55tzHSPfdEyNepux74lJMD5YiM+HNn5bc+OEKsYY79Ia/e3qzZup43/+hF8NtQLERNA5zzxFErs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750616; c=relaxed/simple;
	bh=j4RHiwv6TgpBLw4SOjISJT0B7Aeg8bCfisVgmeR2fx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rU03jEXIMiV5juNudSQzJNDbedlEhUFeIgBtSI+Vo4y5m9RIka+ztW+MckVDgWzBrpoGIqTlllz/4jUGgQ+S0JrFLh5DeSJAEX1iZGTdk7oas23BEeR3FDjslwcWBOsBIShPBn7aPiIcEafMCEVtUwG0T5shT21MsWWxhbgTdLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQlTj868; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQlTj868"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72471F000E9;
	Mon,  3 Aug 2026 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785750614;
	bh=P621m3SOD37P6TPJYggZz+jUAa9qQ0JE3Va863E/fVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQlTj868MICyE01+Efpxn+G2jaOU9F8JcpvcT9+EMSIXrubmkTg6SzQkv3DtI9H/g
	 DnnHS8rDJ26f6N+HTOh5+u7z0M2vxyKB/H6TRK3DCHF+d5balT4gOsKRyXcaQquNs7
	 bTbMfS2ejHEnV/aZvZQZp5wjMotyelsSXH6tlBzY6q+QCISNmSnqwRcqG5jMgtY0vW
	 gIl2muHuic7Z22v/qx2eS3AN8ctUoHiTwduQ8CTx3Yc+3Hvopm8qgWkIMQ0gtiIW9X
	 QxfksZc3X3FCcKjGvcV1UmXSE6w3yqBGS/8ZOOLLVSApJRz/FXnz4/4bxaAA+IEuO9
	 Yh510JQh+o9jw==
Date: Mon, 3 Aug 2026 02:50:12 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/9] usb: misc: qcom_eud: add role-based EUD control
Message-ID: <anBkVECMjdJcFX9W@hu-petche-lv.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-7-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803031534.2942628-7-elson.serrao@oss.qualcomm.com>

On 26-08-02 20:15:31, Elson Serrao wrote:
> EUD functions by presenting itself as a USB device to the host PC and is
> therefore only applicable when the port operates in device role. Keeping
> EUD enabled in other roles provides no benefit and unnecessarily keeps
> the associated PHY resources enabled. Furthermore, enabling EUD in host
> role can cause the USB controller to misbehave because the EUD hub
> supports only a single upstream-facing port.
> 
> Address this by treating EUD as usable only in device role. The
> role-switch callback enables or disables EUD as the port enters or
> leaves device role. A sysfs enable request made outside device role is
> recorded and honored when the port subsequently switches to device role.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/misc/qcom_eud.c | 46 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index e83a4402e4b8..538e070cc140 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -15,6 +15,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/sysfs.h>
>  #include <linux/usb/role.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
> @@ -55,6 +56,8 @@ struct eud_chip {
>  	struct device			*dev;
>  	void __iomem			*base;
>  	struct eud_path			*paths[EUD_MAX_PORTS];
> +	/* serializes EUD control operations */
> +	struct mutex			state_lock;
>  	phys_addr_t			mode_mgr;
>  	unsigned int			int_status;
>  	int				irq;
> @@ -156,17 +159,33 @@ static ssize_t enable_store(struct device *dev,
>  		const char *buf, size_t count)
>  {
>  	struct eud_chip *chip = dev_get_drvdata(dev);
> +	struct eud_path *path;
>  	bool enable;
>  	int ret;
>  
>  	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
>  
> +	guard(mutex)(&chip->state_lock);
> +
>  	/* Skip operation if already in desired state */
>  	if (chip->enabled == enable)
>  		return count;
>  
>  	if (enable) {
> +		path = chip->paths[chip->port_idx];
> +
> +		/*
> +		 * If not yet in device role, honor the userspace request and defer
> +		 * EUD enablement until the port transitions to device role in the
> +		 * set_role callback.
> +		 */
> +		if (path->curr_role != USB_ROLE_DEVICE) {
> +			dev_info(chip->dev, "Deferring EUD enable until port enters device mode\n");
> +			chip->enabled = enable;
> +			return count;
> +		}
> +
>  		ret = enable_eud(chip);
>  		if (ret) {
>  			dev_err(chip->dev, "failed to enable eud\n");
> @@ -304,7 +323,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>  {
>  	struct eud_path *path = usb_role_switch_get_drvdata(sw);
> -	int ret;
> +	struct eud_chip *chip = path->chip;
> +	int ret = 0;
> +
> +	guard(mutex)(&chip->state_lock);
> +
> +	/*
> +	 * EUD is usable only in device role. Power it down for every other
> +	 * role to avoid keeping an unusable module 'ON'. chip->enabled
> +	 * preserves user's sysfs configuration and is not modified across
> +	 * role transitions.
> +	 */
> +	if (chip->enabled && path->num == chip->port_idx && role != path->curr_role) {
> +		if (role == USB_ROLE_DEVICE)
> +			ret = enable_eud(chip);
> +		else if (path->curr_role == USB_ROLE_DEVICE)
> +			ret = disable_eud(chip);
> +
> +		if (ret) {
> +			dev_err(chip->dev, "failed to %s EUD for role %s: %d\n",
> +				str_enable_disable(role == USB_ROLE_DEVICE),
> +				usb_role_string(role), ret);
> +			return ret;
> +		}
> +	}
>  
>  	/* Forward the role request to the USB controller */
>  	ret = usb_role_switch_set_role(path->controller_sw, role);
> @@ -431,6 +473,8 @@ static int eud_probe(struct platform_device *pdev)
>  
>  	chip->dev = &pdev->dev;
>  
> +	mutex_init(&chip->state_lock);
> +
>  	for_each_child_of_node_scoped(np, child) {
>  		ret = eud_init_path(chip, child);
>  		if (ret)
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
