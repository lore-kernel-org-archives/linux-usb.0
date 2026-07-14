Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1F3FADFD;
	Tue, 14 Jul 2026 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035956; cv=none; b=bLCXt7EmZ1Y8kMvMR2WTYF8ZR9GNyqwPRG+bWZPw8fkV/oWPSCd1TPpDgFBYTwm1m8Up07V7OTb0eoluZFLY6OTJbP9lCizuvo5MaUMtYb4wtpVJlp4iXzlBchMOxcudyP24RiRl6FOU4Dsxq3jXgS7eBCHkWON36kabnenJO1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035956; c=relaxed/simple;
	bh=0Ayb5SZkyIQ3JLXUdbuPESyU2c5gycyEFNk1AymdpSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dr4hzOBv2ARa7BrsTNr7Q7lPVNtVG3ypxMNUmcNHh3YXCi27CCGY3UWjnZrJvme1XffojHiADVXwAr0fJH+BciTtH8u3/oleox+sQBENUTYPlrvsSdfdGGb0JwRqR4nJ6FLlNAhLYyHJIbnSpvtM8BY0u1UINIpqqthj09expzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUdr7yms; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUdr7yms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784035953; x=1815571953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0Ayb5SZkyIQ3JLXUdbuPESyU2c5gycyEFNk1AymdpSk=;
  b=kUdr7ymsCLkLj2R1ZmEcq54z6twVupdzPoV6zHicdMFxV/J3Gj3eYoVZ
   TpO2RJTY1LlKdbHIrueldGtbN45YLUpTaKGQDPl8jY4jRHmwct1Tzz5Pe
   CRK6MCtSQQXhSdcQKK4kMQBtqNLhD6XO2lFHZS5DHiwtKUxd69cFZSuit
   t+Agc17AmdBoU/VYDTbUvF3wugNRmxRxMmGxYGXi6FcQSsvnJcIihdDqM
   Ql3LdGInsRZbOMDLeZ4k1cf2+F2HthJeYnV543fDmz+jzH/VL3Yfpxr0H
   M9uamF3vZuIHUaaVsCbJIH1KLaSwKyrH48vNMtiWScbI2eua6XovX/vZ5
   Q==;
X-CSE-ConnectionGUID: +UwPuP0tT0ij0xHC4iNuhg==
X-CSE-MsgGUID: +KYcZ/o8Sk6cBPDnvmPaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84620709"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84620709"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 06:32:33 -0700
X-CSE-ConnectionGUID: lI4QUOv3T+eb48ekCNRaLw==
X-CSE-MsgGUID: FU8WawmGQZOHNBE1aiIzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="294060834"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 14 Jul 2026 06:32:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C221295; Tue, 14 Jul 2026 15:32:29 +0200 (CEST)
Date: Tue, 14 Jul 2026 16:32:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
Message-ID: <alY6bJT9_g5t0ZT7@kuha>
References: <20260713182500.GB22956@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713182500.GB22956@altlinux.org>

On Mon, Jul 13, 2026 at 09:25:00PM +0300, Alexey V. Vissarionov wrote:
> When regmap_read() fails, the execution goes to done: label, where
> currsrc is passed to rp_sel_to_name() and used as an index after a
> proper check. However, to make this situation easier to notice, an
> explicit initialization of currsrc with obviously impossible value
> is suggested. Alas, we can't simply use zero value here because it
> means TYPEC_SRC_RP_SEL_80UA.
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org) using SVACE.
> 
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6bea4..d7cb69cf6044841b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>  	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>  	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>  	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
> +	unsigned int mode, misc;
>  	unsigned long flags;
>  	int ret;
>  
> 
> 
> -- 
> Alexey V. Vissarionov
> gremlin ПРИ altlinux ТЧК org; +vii-cmiii-ccxxix-lxxix-xlii
> GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

-- 
heikki
