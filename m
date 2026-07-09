Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A31D5160;
	Thu,  9 Jul 2026 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783575121; cv=none; b=Rm/IJmhTMbEQhh7jIfWx93Oi5RsWJ3Px0nM+j9ZNGx/KZojcLRkI0aVeLZGqi7JdW4M0egE1JNoLsH3n8mt/OEUX2FcMsOnBtHzmJ5VJwJpXu/OqWBR46xWPHgRLWz8lNN6c7QuayGZDfpXEoXdRzeAb5Ef+ZPOI1/RCIg4CW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783575121; c=relaxed/simple;
	bh=+NKYW+OZIkRbhkdw08isua0mJANjWaWq6VHnTM1iuHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmovCpUG/QmHMbnONsU9VuZchDSob+hvinB3gBUlndwUalrtcEYJhcnKSXRxD0D/KYT+4faThEzUNP69OGCF5cdxBbXfRB6G/7kylPaEEp/HTVTR/nvmSDeu+50JXUzHt8nCvg0o20zj8Kkuwe9E0K57gPaPjGACf1cqnwatVKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pNgzauon; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pNgzauon"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B751F000E9;
	Thu,  9 Jul 2026 05:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783575119;
	bh=uXqjvzpfwDvNZNWKf5RAkNhavD2Al1NFh+VmHZ2j2eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pNgzauonGv9Xl1ykkdCohg8oYmOkJEbgHjxFovM07ITVmZ3ZTNDbDCLFg1yZstNOL
	 cREnwpXANP0H72A/laAwknzNFPyLW6hTzduoPsqeDRkbG2OWegGpOC9/tJ+CuVSfuX
	 GRG2J/S8DUR/Qg3PH2blPij2KfM15i8Eq2aPI7tU=
Date: Thu, 9 Jul 2026 07:31:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Julian Braha <julianbraha@gmail.com>,
	Xu Yang <xu.yang_2@oss.nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chaoyi Chen <kernel@airkyi.com>
Subject: Re: [PATCH v2] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
Message-ID: <2026070936-apostle-carton-c097@gregkh>
References: <20260705065832.184-1-kernel@airkyi.com>
 <2026070830-tattle-corporal-6fcc@gregkh>
 <f0316f09-e78c-495b-8ca9-c7d4fdde3d75@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0316f09-e78c-495b-8ca9-c7d4fdde3d75@rock-chips.com>

On Thu, Jul 09, 2026 at 11:00:43AM +0800, Chaoyi Chen wrote:
> Hello Greg,
> 
> On 7/8/2026 7:51 PM, Greg Kroah-Hartman wrote:
> > On Sun, Jul 05, 2026 at 02:58:32PM +0800, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
> >> also needed for embedded platforms. Select it when available.
> >>
> >> Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
> >> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >> ---
> >>  drivers/usb/typec/altmodes/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> >> index 7867fa7c405d..1f35b253d6b8 100644
> >> --- a/drivers/usb/typec/altmodes/Kconfig
> >> +++ b/drivers/usb/typec/altmodes/Kconfig
> >> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
> >>  config TYPEC_DP_ALTMODE
> >>  	tristate "DisplayPort Alternate Mode driver"
> >>  	depends on DRM
> >> +	imply DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> > 
> > I hate "imply", as this just makes things more complex.  Either this is
> > a dependency or not, right?  Why not fix that?
> >
> 
> Perhaps we can just use the v1 content directly? 
> Hopefully that's already simple enough.
> 
> https://lore.kernel.org/all/20260702022036.44-1-kernel@airkyi.com/

Maybe, send it as a v3 and see if the maintainers of those drivers
agree?

thanks,

greg k-h
