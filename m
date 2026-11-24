Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536593;
	b=RzYGDwDRUEhhtUWTDELpcPsTH95+oodmbIl3TOYJRwZlg/+uhsHF5X3g97Re0r7NvQE8
	 6EyMOpuGm+0tBdN7Pe5cOea9lBu+VG8m2S0m/kl0S3sdblPwr0lKgw/TGPlXLdNrK+RQa
	 DAyHBQ2ATnhrE5EE2QOeHi81DOLKTsI4q0smzUgvzcTZqHLYnj4wCqB8Lx/8gvmU7zxlA
	 i6E+3sU+iiv9o+OF//xedRhYE1XUE8Sv3LZM1OCNZjT3wcJjleAdtfp0s4Gbi+058o4lj
	 gTBUx1lKS0MfFhqRA6tLEhjoH/yn5PTmoi7MjYoseMxZkEKJqbNbbMI7un3L15Hyqlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536593;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qi4Yj6pbHk09P0l9D1zx/PEYjia67PzFjcJgaaMSSPg=;
	b=jIA7s2pwlC1TdJ4GNjV/M+fJsxC6zwQBkGIjQtrlsMfV/g5IRVLIqc70BBU99UNpTflJ
	 7midCcyVSEEPgPFp2NJiC0+dc0kCJC6fH+tKvmOFKnTTFZZjzpkyUXrG/gXBZJMCK9SNR
	 Lg9C2Jesx9On5AK8lfOngr7SydpJoNC4Xve6n2JsHk23bGtKAotCuod7DO8coxXxVdAiU
	 MquKRLxlpm2uWzaYBSk+nc0hRBGnm3pPQa/uqPQhaqYZzZuZkQ+R5R1/1lFLjv4yEWxbD
	 TgBlno78pKSQs6vdgO4ToHT2mEcUSHfzi44zlX4IpBjuB8jHWNv+MKtOeGuy5Zh5+VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZjp2oBK;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A38C606A332;
	Tue, 24 Nov 2026 16:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A38C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZjp2oBK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795536592; x=1827072592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gayD7OSdqafDU/mqu/hlADeyIK427sH2qeIvaFiiZ0s=;
  b=DZjp2oBKgUccH14rRuek2oapkvk7hUucCOF35PAmhTxwdxqOIJGEiR+6
   1EbLATDgFxWGM9BnJ9ygrLhYGSj1sMup1C1bEzM98f1jtTexCMBDQPEUq
   hgIk+zCIIm8OUO9Yob2P59y7TB2Va3+/93nM4NhKCjOeeYEGFnrO+ub4o
   bUIKTNC5XlTS4EA0VLb3/uw+rOsq6RawcH6X7mcG0jS8vRGO3XYMBvMlG
   5XdOrBq5XYZgYaBvXAnVv8UR+ONj3MsDUE/Mygsj4ughIBEEqIZqOXvQ3
   w4kUBKhZybcckdIZUDcpFrhdZJ0iaE9r8Ne2+DwdfzezZ2+Dp8YpPdADs
   A==;
X-CSE-ConnectionGUID: 7PenbBnyRpi/bFiYjTkevQ==
X-CSE-MsgGUID: CNOWjxSjREe/4/BCh88b4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4437694"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4437694"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:01:16 -0800
X-CSE-ConnectionGUID: WBpAHBCHS06bR/JrcUcn8g==
X-CSE-MsgGUID: H+vAR1eYT2WfIrk1s1p53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12188596"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 24 Nov 2026 08:00:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9A6E194; Tue, 24 Nov 2026 17:00:38 +0100 (CET)
Date: Tue, 24 Nov 2026 17:00:38 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Message-ID: <20261124160038.GR229695@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123113705.2297329-8-chunfeng.yun@mediatek.com>

On Mon, Nov 23, 2026 at 07:36:54PM +0800, Chunfeng Yun wrote:
> When USB4 is woke up by device disconnect, no need wait for 2s,
> usually the phase2~4 takes at most about 200ms, and enters to

usually phases 2-4 take at most..

The 200ms is not from the spec though? It's empirical right on your
hardhware?

> TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
> treat it as disconnected.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: fix code style
> ---
>  drivers/thunderbolt/switch.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 97e3fd8cdc0c..0da5b7ee4c29 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -489,8 +489,9 @@ int tb_port_state(struct tb_port *port)
>   * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
>   * wait_if_unplugged is set then we also wait if the port is in state
>   * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
> - * switch resume). Otherwise we only wait if a device is registered but the link
> - * has not yet been established.
> + * router resume, Wait at most 400 ms for link to start connecting,
> + * if timeout, means the device is disconnected). Otherwise we only wait
> + * if a device is registered but the link has not yet been established.
>   *
>   * Return:
>   * * %0 - If the port is not connected or failed to reach
> @@ -500,6 +501,7 @@ int tb_port_state(struct tb_port *port)
>   */
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
> +	int unplugged_retries = 4;
>  	int retries = 20;
>  	int state;
>  	if (!port->cap_phy) {
> @@ -519,7 +521,7 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  			return 0;
>  
>  		case TB_PORT_UNPLUGGED:
> -			if (wait_if_unplugged) {
> +			if (wait_if_unplugged && unplugged_retries--) {
>  				/* used during resume */
>  				tb_port_dbg(port,
>  					    "is unplugged (state: 7), retrying...\n");
> -- 
> 2.45.2
