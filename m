Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58153515FA;
	Mon,  3 Aug 2026 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749870; cv=none; b=rqvzA6Qq7mgtmH8iK+wQvmapY1pOGKadrQ6LYUasHRp/OODhdvpZHAhuSMhD2UBKj1yumvJnJRV9srGH7XW8ah5ij6L6xGyVfXqXCsZbhqERWhAf6J+SyX4ve8AtoIeZRUmSaVIPsLAPeU8u10FvGQWgL1x5CmjAfdJHZxhPFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749870; c=relaxed/simple;
	bh=G94eT6bJrn/ZvPkax48roiSNMelCfL87qY8eGRObIHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mhy7DY86TovcbNW4e3yvcZa4oOTLnh+k7r+M+BlwP0TXsQbGDpRtD5BYv6uLlczHJcxYS8O/cSMlge3mdrAfiVilZgbeZpHLj8/g8FsRSxwS1LnSJNteh75h/eBe9J/ivQNvTiXV99t4exLgpQLlhKpH3Ko1ue+ebiO0Azdzj4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIod4PIL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIod4PIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC3F1F00A3A;
	Mon,  3 Aug 2026 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749867;
	bh=fZ8TOb2SK379Kfn0G3htzPxgM4TelTFOfGTosC7nzYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GIod4PILg5xwOHipvoHBSY110gBWLIykzSo4AZn7b6s1JBI+ybJLcK9RiPkq4LgKC
	 ACfWfxEnN943/6rMBCaNbK0+Ze5c3dYplVl/0AxBC2rMsPR7gosgf5sCliJ0yusiD6
	 Jd+wXZQXyyy262eGVjth/VmhPWJl3cXsB/tyBYNVyLo5ysVi95Io5xOQrVHag63RJb
	 kPrjhjtfC0ktv0s1pj13K9gDPjbygsjlbaarAS110NfvJcJns0fU6EOCVplSOdTTzL
	 5t/t2u4fVDL636yQI80UkpJitvvM7VxUcudv2DLy98+5B7uj6SjcI2Irrojrtv3BcR
	 IOhtXtYUMMCPg==
Date: Mon, 3 Aug 2026 02:37:45 -0700
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
Subject: Re: [PATCH v5 4/9] usb: misc: qcom_eud: add per-path role switch
 support
Message-ID: <anBhabpzx5HvlEri@hu-petche-lv.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-5-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803031534.2942628-5-elson.serrao@oss.qualcomm.com>

On 26-08-02 20:15:29, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/misc/qcom_eud.c | 100 +++++++++++++++++++++++++++++-------
>  1 file changed, 81 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 03d1c200658c..48a4441b0c9c 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -44,12 +44,15 @@ static const char * const eud_port_names[] = {
>  struct eud_path {
>  	struct eud_chip		*chip;
>  	struct phy		*phy;
> +	struct usb_role_switch	*controller_sw;
> +	struct usb_role_switch	*eud_sw;
> +	enum usb_role		curr_role;
> +	char			name[16];
>  	u8			num;
>  };
>  
>  struct eud_chip {
>  	struct device			*dev;
> -	struct usb_role_switch		*role_sw;
>  	void __iomem			*base;
>  	struct eud_path			*paths[EUD_MAX_PORTS];
>  	phys_addr_t			mode_mgr;
> @@ -123,7 +126,7 @@ static int enable_eud(struct eud_chip *priv)
>  	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>  			priv->base + EUD_REG_INT1_EN_MASK);
>  
> -	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
> +	return 0;
>  }
>  
>  static int disable_eud(struct eud_chip *priv)
> @@ -270,12 +273,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
>  static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  {
>  	struct eud_chip *chip = data;
> +	struct eud_path *path;
>  	int ret;
>  
> +	path = chip->paths[chip->port_idx];
> +
>  	if (chip->usb_attached)
> -		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
> +		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
>  	else
> -		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
> +		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
>  	if (ret)
>  		dev_err(chip->dev, "failed to set role switch\n");
>  
> @@ -286,17 +292,39 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static void eud_role_switch_release(void *data)
> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>  {
> -	struct eud_chip *chip = data;
> +	struct eud_path *path = usb_role_switch_get_drvdata(sw);
> +	int ret;
> +
> +	/* Forward the role request to the USB controller */
> +	ret = usb_role_switch_set_role(path->controller_sw, role);
> +	if (ret) {
> +		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
> +			usb_role_string(role), path->num, ret);
> +		return ret;
> +	}
> +
> +	path->curr_role = role;
>  
> -	usb_role_switch_put(chip->role_sw);
> +	return 0;
> +}
> +
> +static void eud_path_role_switch_release(void *data)
> +{
> +	struct eud_path *path = data;
> +
> +	usb_role_switch_unregister(path->eud_sw);
> +	usb_role_switch_put(path->controller_sw);
>  }
>  
>  static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>  {
> +	struct usb_role_switch_desc role_sw_desc = {NULL};
> +	struct usb_role_switch *sw;
>  	struct device_node *controller_node;
>  	struct eud_path *path;
> +	const char *dr_mode = "";
>  	u32 path_num;
>  	int ret;
>  
> @@ -327,14 +355,57 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>  				     "failed to get controller node for path %u\n", path_num);
>  
>  	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
> -	of_node_put(controller_node);
> -
> -	if (IS_ERR(path->phy))
> +	if (IS_ERR(path->phy)) {
> +		of_node_put(controller_node);
>  		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>  				     "failed to get PHY for path %d\n", path_num);
> +	}
>  
>  	chip->paths[path_num] = path;
>  
> +	of_property_read_string(controller_node, "dr_mode", &dr_mode);
> +
> +	if (!strcmp(dr_mode, "host"))
> +		path->curr_role = USB_ROLE_HOST;
> +	else if (!strcmp(dr_mode, "peripheral"))
> +		path->curr_role = USB_ROLE_DEVICE;
> +	else
> +		path->curr_role = USB_ROLE_NONE;
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (path->curr_role != USB_ROLE_NONE) {
> +		of_node_put(controller_node);
> +		return 0;
> +	}
> +
> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
> +	if (!sw) {
> +		of_node_put(controller_node);
> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
> +				     "Failed to get controller role switch for path %d\n",
> +				     path_num);
> +	}
> +	path->controller_sw = sw;
> +
> +	of_node_put(controller_node);
> +
> +	role_sw_desc.fwnode = of_fwnode_handle(np);
> +	role_sw_desc.set = eud_role_switch_set;
> +	role_sw_desc.driver_data = path;
> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
> +	role_sw_desc.name = path->name;
> +
> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
> +	if (IS_ERR(path->eud_sw)) {
> +		usb_role_switch_put(path->controller_sw);
> +		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
> +				     "Failed to register EUD role switch for path %d\n", path_num);
> +	}
> +
> +	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }
>  
> @@ -361,15 +432,6 @@ static int eud_probe(struct platform_device *pdev)
>  	if (!chip->paths[0])
>  		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
>  
> -	chip->role_sw = usb_role_switch_get(&pdev->dev);
> -	if (IS_ERR(chip->role_sw))
> -		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
> -					"failed to get role switch\n");
> -
> -	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
> -	if (ret)
> -		return ret;
> -
>  	chip->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(chip->base))
>  		return PTR_ERR(chip->base);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
