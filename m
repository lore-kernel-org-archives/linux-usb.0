Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABB33A5E78;
	Mon, 13 Jul 2026 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933573; cv=none; b=nBVdGdiiu+w2nXuIr8shPq48fkRCP3IDDCXVDSemM5pVaoWfcf0rXhwMeyeqxLxJ/3/qE640ZRtxPRD+LiiEJZjhBJPOr1jTns7C3M9l6J9VstX0ZG2Wnveugpu6SucGYEF+soITTNZNabnOCPcx2sKHKnDQxoxrDrKOb/LCyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933573; c=relaxed/simple;
	bh=7/s/0L8CU5agf7OGuihtHSYLxqAO/2Do66IwQN+UbIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUnw1sAzTMw87DJ2TeBrmEYiHwKk9RZniHdvq/k0y+XgXdFZG4zK73ewgvtp5veHz4i/IeFTmukgteDvi7YtGKh6ZECj/e2DQaV9HHgkvLSLIx7xEOL5maF+oEAe6H+oK8Qcj/m1Y6h1tweQMrwigwbL10EGCDbW4MHhOTKJaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIJfC0N9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIJfC0N9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783933571; x=1815469571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7/s/0L8CU5agf7OGuihtHSYLxqAO/2Do66IwQN+UbIg=;
  b=WIJfC0N9JDFCGDOqTh5CI/aq0/nMjnCq+Kr2UsS5lFEOsZqOOzPsDswv
   fEWgGlImu9SKnVoaowHh4sSAp8MqWnkSlavBVuUGZ1Tw1IuUg3XQyO9vx
   cIrXARX+3Q6Vkv8QrAd0d6Fx+qyYIVleDUr0kIsmTOES3fjfIwIdJ1MMQ
   tJ84V/p5IqQ5rbo51sbtmCBdBsDSDwD9GVzVRkBSSK+R48qT+/ni6Lc6E
   g+WGLb3Y8IG2nEr/OZ0xPBvREjc1tBXEeM9rXbktbnfIb0y14g5uRZAWb
   6I+1y10COU7ZsDncgg8GAeGNq569MlsVvwBoXV6uFtV//1SvPbJxYPMpD
   Q==;
X-CSE-ConnectionGUID: WrV5KfUfSCW9fEQ5aIY1MA==
X-CSE-MsgGUID: nVy6DDrxQH6ojSnJ2cPqbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87082039"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87082039"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:06:10 -0700
X-CSE-ConnectionGUID: Jmcoa6TzTyOkSx2s5VZOEg==
X-CSE-MsgGUID: t3bINfXITCK4uMvK9e6knQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260389534"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 02:06:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3626E95; Mon, 13 Jul 2026 11:06:08 +0200 (CEST)
Date: Mon, 13 Jul 2026 12:06:06 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: mux: tusb1046: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <alSqfondd-pz25lq@kuha>
References: <20260704124714.18404-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704124714.18404-1-pengpeng@iscas.ac.cn>

On Sat, Jul 04, 2026 at 08:47:14PM +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/tusb1046.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
> index d6e1289a4945..34ef81f75693 100644
> --- a/drivers/usb/typec/mux/tusb1046.c
> +++ b/drivers/usb/typec/mux/tusb1046.c
> @@ -178,6 +178,7 @@ static const struct of_device_id tusb1046_match_table[] = {
>  	{.compatible = "ti,tusb1046"},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, tusb1046_match_table);
>  
>  static struct i2c_driver tusb1046_driver = {
>  	.driver = {

-- 
heikki
