Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB13B6BF5;
	Mon,  6 Jul 2026 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320430; cv=none; b=qEJfj8ZQumIGImeqA0OxZa2bD/1gUSt5gdVPxu+937YqDkTbN6JfqvvUzcyVio9jQwIYEnUA1w1NXXcJ6x0SFlMWGSRWYEluynxFs1rs1Uj2dVqKAnY4hMId9q4c5rMqXA4h0viKtCgzeogWbRVb29nfGZW/oOm4S9sZt2bkwe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320430; c=relaxed/simple;
	bh=WSIsdQU2pyRhmfyLF78HeRoVTASfckInwwfvFWy/22Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBgwxuz/iAYY5Nn40LMGQxkh6/5i76q4Xyg0k3ugdqpiGjVlu2bE4Tb5WucgCk2iSjK6NiVc3m38go4lUQqcmzyeh3X6Hn9XFx31nlsEKNrTRVa6eMgegQ0WauA1dqvCe0ePm7WLnQybtnP/NOm6ttznV36Q05v93hHY9X6MPkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuHbbIBz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuHbbIBz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E451F000E9;
	Mon,  6 Jul 2026 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320418;
	bh=QqNfUex+j9ATVz44P9ndccUhO6+rl3jS0mJdu5yrkL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZuHbbIBzWsqc2Zsub+rf39Agvmp/xQQwDHQDQkWpif+FQ6DSTBSQb8fQdcZ4YVALZ
	 Q0eI9olDdxilLj2GZ1VkZpubFCIpmRGCrU9UCdj1O3/xaWNBkSbkG26MbS7oCxdaV+
	 /vatAhKvzwcwYM9Mdkk5dQqJ55Y78OHpknSxjVvseG3+ZD691IS85/ubJbi4BnOrkw
	 LE4d2odZHJlLDf3GcaCE0GZSQr+uxZbbmzvCG+Ecz6yhc4CLGp53526hSusFRzYon8
	 ju+uxzZLpZ9zUinuk29elh8p/AaY7Yb8ld9hxcUGWpHZ3BEPCfHlZHE1Er/K4sA1h1
	 mfpbBRO6JJ3Lg==
Date: Sun, 5 Jul 2026 23:46:56 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/9] usb: misc: qcom_eud: add host mode coordination
Message-ID: <aktPYAddL-5efK9i@hu-petche-lv.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-7-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501170635.2641748-7-elson.serrao@oss.qualcomm.com>

On 26-05-01 10:06:32, Elson Serrao wrote:
> EUD functions by presenting itself as a USB device to the host PC for
> debugging, making it incompatible with USB host mode configurations.
> Enabling EUD while in host mode can also cause the USB controller to
> misbehave, as the EUD hub supports only a single upstream-facing port.
> 
> Handle the following scenarios to prevent these conflicts:
> 1. Prevent the user from enabling EUD via sysfs when the USB port is in
>    host mode.
> 2. Automatically disable EUD when the USB port switches to host mode,
>    and re-enable it when exiting host mode.
> 
> This ensures consistent state management without creating conflicts
> between the EUD debug hub and the USB controller.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  drivers/usb/misc/qcom_eud.c | 65 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index f656ffc8818a..4734b6307a85 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -55,12 +55,15 @@ struct eud_chip {
>  	struct device			*dev;
>  	void __iomem			*base;
>  	struct eud_path			*paths[EUD_MAX_PORTS];
> +	/* serializes EUD control operations */
> +	struct mutex			state_lock;
>  	phys_addr_t			mode_mgr;
>  	unsigned int			int_status;
>  	int				irq;
>  	bool				enabled;
>  	bool				usb_attached;
>  	bool				phy_enabled;
> +	bool				eud_disabled_for_host;

Could just use below two conditions for EUD enable/disable judgement:

Enable:
(path->curr_role == USB_ROLE_DEVICE) && (chip->enabled == true)

Disable:
(path->curr_role != USB_ROLE_DEVICE) || (chip->enabled == false)

Peter

>  	u8				port_idx;
>  };
>  
> @@ -156,17 +159,43 @@ static ssize_t enable_store(struct device *dev,
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
> +	/*
> +	 * Handle double-disable scenario: User is disabling EUD that was already
> +	 * disabled due to host mode. Since the hardware is already disabled, we
> +	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
> +	 * when exiting host mode. This respects the user's explicit disable request.
> +	 */
> +	if (!enable && chip->eud_disabled_for_host) {
> +		chip->eud_disabled_for_host = false;
> +		chip->enabled = false;
> +		return count;
> +	}
> +
>  	if (enable) {
> +		/*
> +		 * EUD functions by presenting itself as a USB device to the host PC for
> +		 * debugging, making it incompatible with USB host mode configuration.
> +		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
> +		 */
> +		path = chip->paths[chip->port_idx];
> +		if (path->curr_role == USB_ROLE_HOST) {
> +			dev_err(chip->dev, "cannot enable EUD: USB port is in host mode\n");
> +			return -EBUSY;
> +		}
> +
>  		ret = enable_eud(chip);
>  		if (ret) {
>  			dev_err(chip->dev, "failed to enable eud\n");
> @@ -308,9 +337,41 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>  {
>  	struct eud_path *path = usb_role_switch_get_drvdata(sw);
> +	struct eud_chip *chip = path->chip;
>  	int ret;
>  
> -	/* Forward the role request to the USB controller */
> +	guard(mutex)(&chip->state_lock);
> +
> +	/*
> +	 * EUD must be disabled when USB operates in host mode. EUD functions by
> +	 * presenting itself as a USB device to the host PC for debugging, making
> +	 * it incompatible with host mode configuration.
> +	 *
> +	 * chip->enabled preserves user's sysfs configuration and is not modified
> +	 * during host mode transitions to maintain user intent.
> +	 */
> +
> +	/* Only act if EUD is enabled and this is the active path */
> +	if (chip->enabled && path->num == chip->port_idx) {
> +		if (role == USB_ROLE_HOST && !chip->eud_disabled_for_host) {
> +			ret = disable_eud(chip);
> +			if (ret) {
> +				dev_err(chip->dev, "failed to disable EUD for host mode: %d\n",
> +					ret);
> +				return ret;
> +			}
> +			chip->eud_disabled_for_host = true;
> +		} else if (role != USB_ROLE_HOST && chip->eud_disabled_for_host) {
> +			ret = enable_eud(chip);
> +			if (ret) {
> +				dev_err(chip->dev, "failed to re-enable EUD after host mode: %d\n",
> +					ret);
> +				return ret;
> +			}
> +			chip->eud_disabled_for_host = false;
> +		}
> +	}
> +
>  	ret = usb_role_switch_set_role(path->controller_sw, role);
>  	if (ret) {
>  		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
> @@ -424,6 +485,8 @@ static int eud_probe(struct platform_device *pdev)
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
> 

-- 

Thanks,
Peter Chen
