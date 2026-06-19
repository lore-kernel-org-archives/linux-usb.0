Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B65332EA2;
	Fri, 19 Jun 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781880065; cv=none; b=Ne8n5NQ/0hLb6rHIiHtVK5yb5ps3fRglSwcfZ0YQ1fgHSGlYTXltEmXj11bE87jqYhVaUItIdju/P4MAhdOCqxVDwKsb4oiPKo+OZvl5c8mIHVA8OX2r+fUbkwUIHeCSYQztJe1STi/8LUmDJsdImB7GyClJP3pNTmkjaV5J+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781880065; c=relaxed/simple;
	bh=9uzAxbgY276cDF8NJhPMw6DH6fe4vcMz19beuBoNBYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPXwCuNhCxhykT8MQLjqA+MJRZtbpos77YSBIpeoXKwC5tXZ1HR4+d6CK0WWEFJAZzorOFoQJ0bSzuV0hLwqC4QiRT5go1ROJe9a0CXfFNY68mJ86QqtxIn1GZFHtDi8IVL11Ucx4OIJpoirXGE1RLYl8kXcTqxIBfILa6eK734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=om8jm5tV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="om8jm5tV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E5E1F000E9;
	Fri, 19 Jun 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781880064;
	bh=4SpoEsU1IWYor7v6seeZoBHp6wG5jNVAZLy5aS77teE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=om8jm5tVI+WHSji8zhZ2HRfOBrCchwBU4Dl8wrlfws2tOKJL6aBFOwtyQMPV/DFgF
	 eyJoX9t5yNAEVGL+1r2XmkBh65eHIgdKa8nPlRuOaj7idbY9Lsb1FQy+KkUJYpkHrF
	 J4gn2ztnZmHfsp3gqDBVKc5spsIXJNzXDby3RqG0=
Date: Fri, 19 Jun 2026 16:39:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: madhu.m@intel.com
Cc: heikki.krogerus@linux.intel.com, pooja.katiyar@intel.com,
	akuchynski@chromium.org, jthies@google.com, johan@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: ucsi: Pass full DP config payload in
 SET_NEW_CAM for DP alt mode
Message-ID: <2026061938-daylong-diffusion-c491@gregkh>
References: <20260619150329.3524162-1-madhu.m@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619150329.3524162-1-madhu.m@intel.com>

On Fri, Jun 19, 2026 at 08:33:29PM +0530, madhu.m@intel.com wrote:
> From: Madhu M <madhu.m@intel.com>
> 
> In the UCSI Specification Revision 3.1 RC1, bits 32-63 of the SET_NEW_CAM
> command hold the 32-bit Alternate Mode Specific (AMSpecific) field.
> 
> For DisplayPort Alternate Mode, this field must contain the full
> 32-bit DisplayPort configuration VDO payload that the OPM wants the
> connector to operate in, rather than just the pin assignment value.
> This AMSpecific value follows the DisplayPort Configurations defined
> in the DisplayPort Alt Mode on USB Type-C Specification v2.1a,
> Table 5-13: SOP DisplayPort Configurations.
> 
> Signed-off-by: Madhu M <madhu.m@intel.com>
> Reviewed-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/displayport.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
> index 67a0991a7b76..2e3d7c734d9f 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -185,13 +185,12 @@ static int ucsi_displayport_status_update(struct ucsi_dp *dp)
>  
>  static int ucsi_displayport_configure(struct ucsi_dp *dp)
>  {
> -	u32 pins = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
>  	u64 command;
>  
>  	if (!dp->override)
>  		return 0;
>  
> -	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
> +	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, dp->data.conf);
>  
>  	return ucsi_send_command(dp->con->ucsi, command, NULL, 0);
>  }
> -- 
> 2.34.1
> 
> 

SHouldn't this have a Fixes: and cc: stable tag?

thanks,

greg k-h

