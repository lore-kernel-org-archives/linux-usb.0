Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1D237A4B7;
	Wed,  5 Aug 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926006; cv=none; b=ZI+0qWXJMog2meB8+z1yC0ebDrpBlA7eiLR0mdDBc7DNkRxpQJTHghzx7vHVAOjEvQPlKIdNgdxH/iYyXteanzaPQUgwZCTLEW0WLCQylOCrzEGQdb2GT7ok52PRUL3W9iKaUTl7ihZnp931O2Tyeb6wLMPlobz+coo/F6cpFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926006; c=relaxed/simple;
	bh=r5qwsUWnLAx6qNSAum77kEXblDytR48I5gUBXHYTE98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6DSgzHkhlh/5/FHM7hlL7kM+SiOcrhGUVcEbfraug6A/xuk56/yFH0CZ2+igTKs+Pg53TaRjgQzjdB3UlW6uyiQje4djSDSXLVr2MklqCrfjVkTF7x0PGTVxDCpt+AxAdZPapoN978jx6fLvBFfV+BgaN/VdKFzNoUQBALhfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRB4uI3k; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRB4uI3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785926004; x=1817462004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r5qwsUWnLAx6qNSAum77kEXblDytR48I5gUBXHYTE98=;
  b=jRB4uI3kihdXa8OG0C62JCixpG4o/PVRz4uljutuwJO4OnWD9dh0T/Lg
   nm1mLp52t79WIFGYdZGNXU499y3in9NsO8xkjyXM7OINW54o2vlHElMo8
   jrnlUI+reV8LH62/D4Ze5/GzLbKemI6MrzehYUeJyOopj1D5S8CwLeqhj
   lA297CdIkV4WULYehNxPutQfS569RmHphoEWxhg7ypqIYX4H2Ki8W5zNj
   IbncawB8Igy655Hw6bEUoVHdEywNQNblxSkjQt3kr7jfJgbdnzy9vPHQL
   rkXABa2Q9lyZnY4eCoQ61ixIly2TEvOJdbvbtXrtKT4EnnEB3vzgduv/r
   A==;
X-CSE-ConnectionGUID: qJVieWBvSFSfn8lAg76akw==
X-CSE-MsgGUID: dKWDiqZlSbGUR6genXdBow==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="85472081"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="85472081"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 03:33:21 -0700
X-CSE-ConnectionGUID: DcO94oYKTiidRNjTevxnPw==
X-CSE-MsgGUID: 2W8Jy5toSo60fRpSfzMhIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="291708770"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 05 Aug 2026 03:33:20 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9959899; Wed, 05 Aug 2026 12:33:18 +0200 (CEST)
Date: Wed, 5 Aug 2026 12:33:18 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpci: pass correct rx_type to
 tcpm_pd_receive()
Message-ID: <anMRbinFAZ668Rpm@black.igk.intel.com>
References: <20260723104614.3717623-1-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723104614.3717623-1-xu.yang_2@oss.nxp.com>

On Thu, Jul 23, 2026 at 06:46:14PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> Previously, tcpci_irq() always passed TCPC_TX_SOP as the receive type
> to tcpm_pd_receive(), ignoring the actual frame type reported by the
> TCPC_RX_BUF_FRAME_TYPE register.
> 
> Cache the TCPC_RX_DETECT register value in rx_type_mask variable. When
> a PD messageis received, read TCPC_RX_BUF_FRAME_TYPE register and handle
> the message only if its frame type is enabled in mask.
> 
> The TCPC_RX_BUF_FRAME_TYPE register records the received message type,
> which has a 1:1 mapping to enum tcpm_transmit_type.
> 
> Fixes: fb7ff25ae433 ("usb: typec: tcpm: add discover identity support for SOP'")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
>  - add fix tag
>  - check return value when get RX SOP type
>  - pass all possible RX message type to tcpm_pd_receive()
>  - cache TCPC_RX_DETECT to filter out unallowed RX messages as suggested by Badhri
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 12 +++++++++++-
>  include/linux/usb/tcpci.h      |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 7ac7000b2d13..6717ac914c6a 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -38,6 +38,7 @@ struct tcpci {
>  
>  	struct regmap *regmap;
>  	unsigned int alert_mask;
> +	unsigned int rx_type_mask;
>  
>  	bool controls_vbus;
>  
> @@ -488,6 +489,8 @@ static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, bool enable)
>  		if (tcpci->data->cable_comm_capable)
>  			reg |= TCPC_RX_DETECT_SOP1;
>  	}
> +
> +	tcpci->rx_type_mask = reg;
>  	ret = regmap_write(tcpci->regmap, TCPC_RX_DETECT, reg);
>  	if (ret < 0)
>  		return ret;
> @@ -749,6 +752,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  	if (status & TCPC_ALERT_RX_STATUS) {
>  		struct pd_message msg;
>  		unsigned int cnt, payload_cnt;
> +		enum tcpm_transmit_type rx_type;
>  		u16 header;
>  
>  		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> @@ -773,10 +777,16 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
>  					&msg.payload, payload_cnt);
>  
> +		ret = regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &rx_type);
> +		if (ret)
> +			return ret;
> +
>  		/* Read complete, clear RX status alert bit */
>  		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
>  
> -		tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
> +		rx_type &= TCPC_RX_BUF_FRAME_TYPE_MASK;
> +		if (tcpci->rx_type_mask & BIT(rx_type))
> +			tcpm_pd_receive(tcpci->port, &msg, rx_type);
>  	}
>  
>  	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS)) {
> diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
> index f7f5cfbdef12..9b46a6bc762c 100644
> --- a/include/linux/usb/tcpci.h
> +++ b/include/linux/usb/tcpci.h
> @@ -144,6 +144,7 @@
>  #define TCPC_RX_BUF_FRAME_TYPE		0x31
>  #define TCPC_RX_BUF_FRAME_TYPE_SOP	0
>  #define TCPC_RX_BUF_FRAME_TYPE_SOP1	1
> +#define TCPC_RX_BUF_FRAME_TYPE_MASK	GENMASK(2, 0)
>  #define TCPC_RX_HDR			0x32
>  #define TCPC_RX_DATA			0x34 /* through 0x4f */
>  
> -- 
> 2.34.1

-- 
heikki
