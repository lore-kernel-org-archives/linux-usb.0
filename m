Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662763B2FD6;
	Fri,  3 Jul 2026 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086108; cv=none; b=u0xydm8ExWRKEYKUQP048JzxDdFpHPj+ibYjmr1m5JfMDtemcCTkCY24O2NjpholHDQE88eBHk0hxkPzGGE37VBH5d69bjTqyjpvmmLjCZ2WbhE2J5J8abXMw9PsB32eArn24rG/QzXd/ax58qq6htQQeiCzogdYh4SpmgrC8hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086108; c=relaxed/simple;
	bh=AQRRVKFDwv9CEeuMHQeZlHnPcnTXEQsjvxHIYcN6cZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjotEit1eqzsTLlGRWRw6F4bteXzEVEUW2gwDpy9HftP6AEy3FX7D4qSL4ctGanb3OOdj9Kxag/ExI/ZSCNUTsgU+grT9Ef0HS6SYg/MD3ymwq5/mf3QJWx5weJL5R4lpfDxt4I/hLOWn5Npl6AlpSde0VIIpWHsnLQPBEQf9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXxeh7uF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXxeh7uF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783086106; x=1814622106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AQRRVKFDwv9CEeuMHQeZlHnPcnTXEQsjvxHIYcN6cZ0=;
  b=FXxeh7uFZ6muPpKCZpD3BK5xAmbssBN8vftGCyCyHWsuMrPVC7OWxwKm
   hqwRWt0vQtbLi9ay4jTzH6u07sE4IA3jN4qZH8SWFucwqgJnZDJV/a9P7
   JGY0owA7Pi5r6OUAv14H3uvR3lwezORD4Tfb3gbvfiNL05S0bWa5NcmaY
   lftuvw0OSH/7yw21VdPNYKTJjStF8dyLH9isdN/DBSJ7y+5mzE1o+H/oN
   P+gv/Zxn445IOLbuU4ZQGnSeZOPgciLTz5lj41kTjdV1+h9JcolhCVEVa
   wW7Iik4Tu39NBWrPUb8Iltb2MbnHGhi3xVbwWcpsCxbrgBHsTqGEGyuJA
   g==;
X-CSE-ConnectionGUID: /Hnc6KFRQjGVpE+oH70U8A==
X-CSE-MsgGUID: 0uf6huPuQrWDJ5ArfxCmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94995098"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94995098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:41:46 -0700
X-CSE-ConnectionGUID: IWt6Lm2aSzGOA5Y0vVW6rw==
X-CSE-MsgGUID: mkaMD/iWT9KOd/7DmA5GMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253780587"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2026 06:41:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 81FEB95; Fri, 03 Jul 2026 15:41:43 +0200 (CEST)
Date: Fri, 3 Jul 2026 16:41:41 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: unregister TCPCI port with
 devres
Message-ID: <ake8Faa-c6H0CBiX@kuha>
References: <20260701121007.92789-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701121007.92789-1-mhun512@gmail.com>

On Wed, Jul 01, 2026 at 09:10:07PM +0900, Myeonghun Pak wrote:
> rt1711h_probe() registers the TCPCI port before requesting the interrupt
> and enabling alert interrupts. If either of those later steps fails, the
> probe function returns without unregistering the TCPCI port. The explicit
> unregister currently only happens from the remove callback.
> 
> Register a devres action immediately after tcpci_register_port() succeeds,
> so tcpci_unregister_port() runs on later probe failures and on driver
> detach. Drop the remove callback to avoid unregistering the same port
> twice.
> 
> Fixes: 302c570bf36e ("usb: typec: tcpci_rt1711h: avoid screaming irq causing boot hangs")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Why no Cc stable?

thanks,

> ---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index a8726da6fc71..20037ef130ca 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -298,2 +298,4 @@
> +static void rt1711h_unregister_tcpci_port(void *tcpci);
> +
>  static int rt1711h_probe(struct i2c_client *client)
>  {
> @@ -339,7 +341,11 @@ static int rt1711h_probe(struct i2c_client *client)
>  	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
>  	if (IS_ERR_OR_NULL(chip->tcpci))
>  		return PTR_ERR(chip->tcpci);
> +
> +	ret = devm_add_action_or_reset(chip->dev, rt1711h_unregister_tcpci_port, chip->tcpci);
> +	if (ret)
> +		return ret;
>  
>  	ret = devm_request_threaded_irq(chip->dev, client->irq, NULL,
>  					rt1711h_irq,
>  					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> @@ -357,11 +363,9 @@ static int rt1711h_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static void rt1711h_remove(struct i2c_client *client)
> +static void rt1711h_unregister_tcpci_port(void *tcpci)
>  {
> -	struct rt1711h_chip *chip = i2c_get_clientdata(client);
> -
> -	tcpci_unregister_port(chip->tcpci);
> +	tcpci_unregister_port(tcpci);
>  }
>  
>  static const struct rt1711h_chip_info rt1711h = {
> @@ -394,7 +396,6 @@ static struct i2c_driver rt1711h_i2c_driver = {
>  		.of_match_table = rt1711h_of_match,
>  	},
>  	.probe = rt1711h_probe,
> -	.remove = rt1711h_remove,
>  	.id_table = rt1711h_id,
>  };
>  module_i2c_driver(rt1711h_i2c_driver);
> -- 
> 2.47.1

-- 
heikki
