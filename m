Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631CC34251B;
	Tue, 30 Jun 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813294; cv=none; b=bbRwDNP6R2PfzcofgFhPQcgsAzRxesf1d0JcM4dEd8P/joZMQwXYqrmG4VGDvCF8uim39VTcSvxi/cjbuLKqSGUEH/cNtiJJhkvXQhlH4tCCWPpXROeByevQeGUQFgy+1gSIiyQShqryCyFdVEtLkebvw0V2vsoTOtsrSlGI46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813294; c=relaxed/simple;
	bh=yFdNZwVFhbbRd/mn/WFs5v2ropeqaVxom/v/MdhKyJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JM0iAcYN8QcG2os+XOpOt+IxnVJMaSxBHSot1snbuqLyx94vYTIzxW+GA64yPMd84Hki4ZnxYJD6iiwoD9it10O6qSoj65hyA9NZUi8AAVebFW2LAK+k+7MD6enyEeu0mkH1biud2yOrssaYtuGQe4M4qHRlggNnyGi9koXVYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVEZIkVE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVEZIkVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782813293; x=1814349293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yFdNZwVFhbbRd/mn/WFs5v2ropeqaVxom/v/MdhKyJ0=;
  b=cVEZIkVEdpq6T2Djax/bziwFmwx8uAoYLPmwMDLP2l2PzrzLGdY08Jc1
   nNKtSHdhHHxVJMKQK+8RQdLZyq9Yjwm4+IoJdUgy4oUml1axJSzgLp/UR
   ygBrt+l+0gV3AD7BKdq1L7RoV2xn7Z3/v1dNQaBk6CI+JwsnxKbcy+S0m
   +SkpRLhMWLAq7rJa52KpFBcb3igQMrlX/clRlB7GjTv+6Ufq1WNu0ZIjg
   oImjSK2gme4ksUF3dQY2D4SGavCzdq/8sVZVf36Vj6ndBacY00yIwwhxH
   DI551D3z9MUW5JMRRzSkXYvFh5wPqzzHhHJsPdnDC+QCg1yhLuSEnZRr2
   g==;
X-CSE-ConnectionGUID: FBL/8qSFT5Cwh3LM5AK4rA==
X-CSE-MsgGUID: Yle4gZMCSKmr6y+Dfai8Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94121331"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="94121331"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:54:52 -0700
X-CSE-ConnectionGUID: 0hz0Ybo9T4ahdiG68gNfsA==
X-CSE-MsgGUID: wmd5dzvtSaeoUTNv7c+DrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="254135822"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jun 2026 02:54:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6175195; Tue, 30 Jun 2026 11:54:43 +0200 (CEST)
Date: Tue, 30 Jun 2026 12:54:41 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, Chaoyi Chen <kernel@airkyi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v15 1/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <akOSYXV7zRY4inSo@kuha>
References: <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-2-kernel@airkyi.com>
 <erx73m2ueuvbzjteadjli6aki5by4pr3hyertkkqqoqwhaa4v3@5cstmshcercx>
 <56c6abb8-c127-449f-9368-12f94620c2bc@rock-chips.com>
 <k53t2soc3nxhwugncatksektig6agxfgdkogkdwbhrhu2fn2g7@auvsfrv76wxy>
 <b2633b22-da30-4778-8e23-7b5bed9ead07@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2633b22-da30-4778-8e23-7b5bed9ead07@rock-chips.com>

> @Heikki, what do you think of the following change?
> Should we add a new patch for this? Thanks.
> 
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> index 7867fa7c405d..f89cdf3c949b 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
>  config TYPEC_DP_ALTMODE
>         tristate "DisplayPort Alternate Mode driver"
>         depends on DRM
> +       select DRM_AUX_HPD_BRIDGE 
>         help
>           DisplayPort USB Type-C Alternate Mode allows DisplayPort
>           displays and adapters to be attached to the USB Type-C

This look good to me. Please do add the patch for this.

thanks,

-- 
heikki
