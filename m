Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F071C20C00A;
	Wed, 10 Jun 2026 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053159; cv=none; b=WowlL4dEioJkVzvFEnlPYq60HH5ZdtaHUsH4L0qz/88CKxK8REQvaunoLkaxszad9GdzqOFE6yFUac3/ycZBk/rKt6v1gKe9PjJaDTOy4KxDG+dCnloOaaeGorANgTS3Ij/xlzz5oqTs3Xku4zFZaBqxovQOtEcd2Vqq84yKRYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053159; c=relaxed/simple;
	bh=bg0Kt87vKWA6+4X2YYr8x4OdUB0JRpeubAmPpDheKeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPWTWb6V3JWvbPYKL0Z+zJjI4abe3YudeA7X+cgbqnQwO7QpqlTBvI0rtpTamEaHRfsJag7ZPlXaYDYMt5RAZbPFzTJZOfBDwAgc+V8fTxJGhC6REoqDstmnf0wthmP193FLm1eNcYk/we3069ybQLuwDCUA1NtLvE7IhPPdeuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mc/6UnTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mc/6UnTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26F21F00893;
	Wed, 10 Jun 2026 00:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781053157;
	bh=uUVnW9bl08ieM7eZ90v8rpfEm8zqR16wKdKv8Uejgr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mc/6UnTTvKBwkl68AwgjWg+9Fl4aIdsh+Orye1yQPcO8asfuOuXZZM1KQFoy9XYqQ
	 mX5u/E3xXbmWdlfEUlGhvPktdrY3Gh5aWmnZ5kj4KggKLPrZm/7+vOc1oAkzGymanz
	 tinizkHQLBR7ZdB8OJrFzEs2IstWQl3Cm99JoAlgXyO9O/dKyt9022TKPVYn7uyj/D
	 t6NiM8thSYvstq5WOKtCwLZPcTZnVjWB8L67lvtA+53LgscttLqPTAtNsKBH2x863c
	 ABWyeufxIO1FLKxqjhuyt3IS12LWBRuOQFtVcD7xf2mCP5IVKX50xZZLz185xvZvjs
	 wjse7inSaNB6A==
Date: Wed, 10 Jun 2026 08:59:14 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Peter Chen <peter.chen@cixtech.com>, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: Re: [peter-chen-usb:cdns3_kconfig_reorg 2/4]
 drivers/usb/cdns3/cdnsp-sky1.c:218:12: warning: 'cdnsp_sky1_resume' defined
 but not used
Message-ID: <aii24sVJs/VWE1t/@nchen-desktop>
References: <202606100700.mSjHu5V1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202606100700.mSjHu5V1-lkp@intel.com>

On 26-06-10 07:08:53, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git cdns3_kconfig_reorg
> head:   5ef7c27aa805ae8486b5f20ef21483af7a120386
> commit: 7095d19fba7625032eb775f9f425f33f4ede1517 [2/4] usb: cdns3: sky1: Add cdnsp-sky1 glue driver
> config: arm64-randconfig-002-20260610 (https://download.01.org/0day-ci/archive/20260610/202606100700.mSjHu5V1-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100700.mSjHu5V1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606100700.mSjHu5V1-lkp@intel.com/

Fixed, thanks for reporting it.

Peter
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/usb/cdns3/cdnsp-sky1.c:218:12: warning: 'cdnsp_sky1_resume' defined but not used [-Wunused-function]
>      218 | static int cdnsp_sky1_resume(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~
> >> drivers/usb/cdns3/cdnsp-sky1.c:213:12: warning: 'cdnsp_sky1_suspend' defined but not used [-Wunused-function]
>      213 | static int cdnsp_sky1_suspend(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~
> --
> >> Warning: drivers/usb/cdns3/cdnsp-sky1.c:84 expecting prototype for sky1_set_mode_by_id(). Prototype was for cdnsp_sky1_set_mode_by_id() instead
> 
> 
> vim +/cdnsp_sky1_resume +218 drivers/usb/cdns3/cdnsp-sky1.c
> 
>     77	
>     78	/**
>     79	 * sky1_set_mode_by_id - program one USB controller mode strap
>     80	 * @syscon: regmap for S5 syscon (from DT property cix,syscon-usb)
>     81	 * @id: controller slot ID (U3_TYPEC_DRD_ID .. U2_HOST3_ID)
>     82	 * @mode: MODE_STRAP_OTG, MODE_STRAP_HOST, or MODE_STRAP_DEVICE
>     83	 */
>   > 84	static int cdnsp_sky1_set_mode_by_id(struct regmap *syscon, int id, int mode)
>     85	{
>     86		if (id < 0 || id >= SKY1_USB_S5_NUM)
>     87			return -EINVAL;
>     88	
>     89		return regmap_update_bits(syscon,
>     90					  strap_signals[id].offset,
>     91					  GENMASK(strap_signals[id].bit + 1,
>     92						  strap_signals[id].bit),
>     93					  (unsigned int)mode << strap_signals[id].bit);
>     94	}
>     95	
>     96	static int cdnsp_sky1_set_all_controllers_otg(struct regmap *syscon)
>     97	{
>     98		int id, ret;
>     99	
>    100		for (id = 0; id < SKY1_USB_S5_NUM; id++) {
>    101			ret = cdnsp_sky1_set_mode_by_id(syscon, id, MODE_STRAP_OTG);
>    102			if (ret)
>    103				return ret;
>    104		}
>    105	
>    106		return 0;
>    107	}
>    108	
>    109	static const struct clk_bulk_data cdnsp_sky1_cdns_core_clks[] = {
>    110		{ .id = "sof" },
>    111		{ .id = "aclk" },
>    112		{ .id = "lpm" },
>    113		{ .id = "pclk" },
>    114	};
>    115	
>    116	static int cdnsp_sky1_probe(struct platform_device *pdev)
>    117	{
>    118		struct device *dev = &pdev->dev;
>    119		struct cdnsp_sky1 *priv;
>    120		struct cdns *cdns;
>    121		struct cdns3_probe_data probe_data;
>    122		struct resource *res;
>    123		int ret;
>    124	
>    125		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>    126		if (!priv)
>    127			return -ENOMEM;
>    128	
>    129		priv->dev = dev;
>    130		priv->num_clks = ARRAY_SIZE(cdnsp_sky1_cdns_core_clks);
>    131		priv->clks = devm_kmemdup(dev, cdnsp_sky1_cdns_core_clks,
>    132					   sizeof(cdnsp_sky1_cdns_core_clks), GFP_KERNEL);
>    133		if (!priv->clks)
>    134			return -ENOMEM;
>    135	
>    136		ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
>    137		if (ret)
>    138			return dev_err_probe(dev, ret, "failed to get clocks\n");
>    139	
>    140		ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
>    141		if (ret)
>    142			return dev_err_probe(dev, ret, "failed to enable clocks\n");
>    143	
>    144		priv->usb_syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
>    145								   "cix,syscon-usb");
>    146		if (IS_ERR(priv->usb_syscon)) {
>    147			ret = PTR_ERR(priv->usb_syscon);
>    148			dev_err_probe(dev, ret, "failed to get cix,syscon-usb regmap\n");
>    149			goto err_clk;
>    150		}
>    151	
>    152		ret = cdnsp_sky1_set_all_controllers_otg(priv->usb_syscon);
>    153		if (ret) {
>    154			dev_err_probe(dev, ret,
>    155				      "failed to set USB controllers to OTG strap\n");
>    156			goto err_clk;
>    157		}
>    158	
>    159		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
>    160		if (!res)
>    161			goto err_clk;
>    162	
>    163		priv->glue_base = devm_ioremap_resource(dev, res);
>    164		if (IS_ERR(priv->glue_base)) {
>    165			ret = PTR_ERR(priv->glue_base);
>    166			goto err_clk;
>    167		}
>    168	
>    169		/* Set ARCACHE and AWCACHE */
>    170		writel(SKY1_USB_AXI_WR_CACHE_VALUE, priv->glue_base + AXI_SETTING_OFFSET);
>    171	
>    172		cdns = &priv->cdns;
>    173		cdns->dev = dev;
>    174	
>    175		probe_data.cdns = cdns;
>    176		probe_data.pdev = pdev;
>    177	
>    178		ret = cdns3_core_probe(&probe_data);
>    179		if (ret)
>    180			goto err_clk;
>    181	
>    182		return 0;
>    183	
>    184	err_clk:
>    185		clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>    186	
>    187		return ret;
>    188	}
>    189	
>    190	static void cdnsp_sky1_remove(struct platform_device *pdev)
>    191	{
>    192		struct cdns *cdns = platform_get_drvdata(pdev);
>    193		struct cdnsp_sky1 *priv;
>    194	
>    195		if (!cdns)
>    196			return;
>    197	
>    198		cdns3_core_remove(cdns);
>    199		priv = container_of(cdns, struct cdnsp_sky1, cdns);
>    200		clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>    201	}
>    202	
>    203	static int cdnsp_sky1_runtime_suspend(struct device *dev)
>    204	{
>    205		return cdns3_runtime_suspend(dev_get_drvdata(dev));
>    206	}
>    207	
>    208	static int cdnsp_sky1_runtime_resume(struct device *dev)
>    209	{
>    210		return cdns3_runtime_resume(dev_get_drvdata(dev));
>    211	}
>    212	
>  > 213	static int cdnsp_sky1_suspend(struct device *dev)
>    214	{
>    215		return cdns3_pm_suspend(dev_get_drvdata(dev));
>    216	}
>    217	
>  > 218	static int cdnsp_sky1_resume(struct device *dev)
>    219	{
>    220		return cdns3_pm_resume(dev_get_drvdata(dev));
>    221	}
>    222	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 

Best regards,
Peter
