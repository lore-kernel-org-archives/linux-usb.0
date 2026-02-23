Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15AE313E36;
	Mon, 23 Feb 2026 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859134; cv=none; b=K5fIu2u68/h+ebJWqkhOI5i2/SxdMELIyMLRbZjTLFJAtFm7H0kudm6I74CX3vHANTfG/i3G1bWYGv6z2kug7msj69Osrvp+whqCFs+peMqrhq5NbUFncyR2eXEQj8WbzA0Op9qF2midkl5rjNKI1l8Szy5bK3icZ/t0H3NGQdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859134; c=relaxed/simple;
	bh=GL8sIZdem/O8x3DOoqqmj4B5NOp7b1kcg8oecXngeSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbQxZDv5kaT/1dyok9VQ7T467bqxJXFpNP4Cg+uAe95+ST9ExD9hR0h74c7uKFq3UxarjiDCSS90ie6a3B2ymF781Ca+Aqtr4i93ifqfxo8wxINVzMhPLqlfMadcxcCkNde6f8YL88rzxN4JYfooL7rjK6gMh9Gz5yJdjzOhTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHTgBxJX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHTgBxJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771859134; x=1803395134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GL8sIZdem/O8x3DOoqqmj4B5NOp7b1kcg8oecXngeSA=;
  b=oHTgBxJXFmeSlMLErxWBw+ilM5aG/Kf5cW2LPFwJ6zX2qnD7quU0lxj6
   XGUv5+sbLMbNQ+EWvejbL63fuzoxuby0lVLX3utlsarSC09HD11wgnvrW
   DgZDkeHWCzNicle9TC/hC/i1HlCuzqApO71yM/YSrivs6z12MjoP4lLVV
   xEtE7i26s1pBpi18djqAFuGbLHZpWmWzcotRfiKK5R9PXa4wiVxS4E4g/
   aEX27mzw5J7XyzilzrZtq1N+B6ciTpCSDh0uK3RNjUvdqhrpAgTSthWk+
   4IcSGrpOk1dBR+d//oityWxzO6h3BwqZywMTu0iFuZvemWT6B7LswQyZq
   A==;
X-CSE-ConnectionGUID: vucUev8rQG+inmwkbLxg0A==
X-CSE-MsgGUID: udNvZW1kR3u2ZtacAK9xew==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95474218"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="95474218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:05:33 -0800
X-CSE-ConnectionGUID: s+XcrIxXSLWjFtBDviy+BQ==
X-CSE-MsgGUID: BoVfvAOYQviXBHYphZWYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213938501"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.123])
  by fmviesa010.fm.intel.com with SMTP; 23 Feb 2026 07:05:30 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 23 Feb 2026 17:04:55 +0200
Date: Mon, 23 Feb 2026 17:04:55 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: typec: tcpci: Make tcpci_pm_ops variable static
Message-ID: <aZxsl9DopEBVArzN@kuha>
References: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>

Mon, Feb 16, 2026 at 12:04:04PM +0100, Krzysztof Kozlowski wrote:
> File-scope 'tcpci_pm_ops' is not used outside of this unit, so make it
> static to silence sparse warning:
> 
>   tcpm/tcpci.c:1002:1: warning: symbol 'tcpci_pm_ops' was not declared. Should it be static?
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 2a951c585e92..8b7e6eb92ca2 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -999,7 +999,7 @@ static int tcpci_resume(struct device *dev)
>  	return ret;
>  }
>  
> -DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
>  
>  static const struct i2c_device_id tcpci_id[] = {
>  	{ "tcpci" },
> -- 
> 2.51.0

-- 
heikki
