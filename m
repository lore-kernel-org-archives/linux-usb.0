Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81F23A453B;
	Mon, 22 Jun 2026 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123537; cv=none; b=MKsJoxA4wDnSzylsdDd2YGa2mOOYqfKrMuO+qsft8/FpFTIu5BtXoPVtIuQ65GlXA8PH/jRVFVYCkJ/VaoYoLaywS1O/LmyLN5GyQrzoq0HArDw5iBJzTUthfMJlYz2SulgBb6M87Hy/S2IO2LVbu7+FWPh5WI6zslBGpewLjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123537; c=relaxed/simple;
	bh=+ujngRhFVXDEdryOndccdQG5D/KiH6b6ITGyOgjbZaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ST84ihR7qPxPNBDG3TsBrNQjopGp8zFYZA3YiKcM7LOi3uc+8geGOCOn1ScHqshAS6Ljeh5FTLYEjCi1btTVX8sKcdZWJp6LJ7Fh8i7P+5GavKpabqdSPxG81txyo61CbcfnrM5zXmil+h6QLCcM5EuSfgjRhGBl6eOJX2UwlvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Au2/P3A1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Au2/P3A1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782123535; x=1813659535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ujngRhFVXDEdryOndccdQG5D/KiH6b6ITGyOgjbZaA=;
  b=Au2/P3A17dTVs21lbHFrVNz++uxbN2uzSBzhbWLzYjsXfNxX4fR+64dv
   eot179hBGi/E47nbOskryCXtsGy4ca/x6oUGARMyTAC6ThOrjGeSkaZd3
   203jRtAc4mf1N/6Zl3PE4M/eHRdV/oA2K4wMwK/BU00qpD2R8FS4vPxI8
   3mit+xPqUTFMUyjr2JjTAEDyIngVAl1eIDCNXox7LOwFkiMhyrbKUIAr2
   hdf1aSnaNVYlA9sqBgxz8ww0O+KlyQPMOhDV5TqSg4FHYzL6ybHKf22gs
   4YUEUgMjEAaQFMwAsgeOZq3LDRevU2e4KPNno9HEzpaAJSFENUOdXj9zz
   g==;
X-CSE-ConnectionGUID: 2nV0m9pRRJGnjU4zN+vhmw==
X-CSE-MsgGUID: F2iLA7WkQh+FuaIADm3CnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86532153"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86532153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:18:55 -0700
X-CSE-ConnectionGUID: RQxnr6a7QQaA3ymrFeVXzw==
X-CSE-MsgGUID: wGOiQujFR2isMeqcCDeW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="254184102"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 22 Jun 2026 03:18:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9C0CE95; Mon, 22 Jun 2026 12:18:52 +0200 (CEST)
Date: Mon, 22 Jun 2026 13:18:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: Add helper to check cable altmode
 support
Message-ID: <ajkMCz52lkq9hz3s@kuha>
References: <20260622093910.1210089-1-akuchynski@chromium.org>
 <20260622093910.1210089-2-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622093910.1210089-2-akuchynski@chromium.org>

Hi Andrei,

> +bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
> +{
> +	struct typec_altmode *plug;
> +	struct typec_cable *cable;
> +	bool unsupported = false;
> +
> +	/*
> +	 * Check if the cable has an e-marker, supports modal operation, and the
> +	 * SOP' altmode nodes are created. If yes, then altmode is supported.
> +	 */
> +	plug = typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
> +	if (plug) {
> +		typec_altmode_put_plug(plug);
> +		return false;
> +	}
> +
> +	/*
> +	 * Check if the cable is registered and its identity is specified.
> +	 * If not, the cable altmode restriction cannot be checked.
> +	 */
> +	cable = typec_cable_get(typec_altmode2port(alt));
> +	if (cable && cable->identity) {
> +		const u32 id_header = cable->identity->id_header;
> +		const u32 speed = VDO_TYPEC_CABLE_SPEED(cable->identity->vdo[0]);
> +
> +		/*
> +		 * A cable lacking an ID Header indicates a non-e-marked cable,
> +		 * can only be guaranteed to have a USB 2.0 data path (D+ and D-).
> +		 */
> +		if (!id_header) {
> +			unsupported = true;
> +		} else {
> +			switch (PD_IDH_PTYPE(id_header)) {
> +			/*
> +			 * If the speed field explicitly declares it is a
> +			 * USB 2.0-only cable, altmode is unsupported.
> +			 */
> +			case IDH_PTYPE_PCABLE:
> +				unsupported = (speed == CABLE_USB2_ONLY);
> +				break;
> +			/*
> +			 * Active cables must establish an SOP' communication
> +			 * node. Since that check failed at the beginning of
> +			 * this function, this active cable does not support
> +			 * this specific altmode.
> +			 */
> +			case IDH_PTYPE_ACABLE:
> +				unsupported = true;
> +				break;
> +			}
> +		}
> +	}
> +	if (cable)
> +		typec_cable_put(cable);
> +
> +	return unsupported;

So if typec_cable_get() doesn't return a cable, this function will now
always return false - i.e. the cable is supported? Is that intentional?

This would probable be much more clear if you checked the cable only
ones, right after you take the handle.

	cable = typec_cable_get(typec_altmode2port(alt));
        if (!cable)
                return true; /* or false? */
        ...
        /* Now unconditionally */
	typec_cable_put(cable);

I think this would be even more clear if the function was called
typec_cable_altmode_supported() and you would then have a wrapper:

static inline bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
{
        return !typec_cable_altmode_supported(alt);
}

Thanks,

-- 
heikki
