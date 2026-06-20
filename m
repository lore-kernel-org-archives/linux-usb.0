Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847741A3166;
	Sat, 20 Jun 2026 05:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781932323; cv=none; b=Y2iXofGsoHBegaFK8w5OF1Q3FDoKjiTO2OKlnBd1c9+iv+uzlAKCvpYl2nhEQR5/1ELQ3+OjsP0JsBI9556+TMCgwcAmvpL+EoTQpsVuNCX0za61jdbSFKs2ApHmrSetAGB2tVdOz9eFwDR5ef29uapYbj449mDFPeNiaraPm2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781932323; c=relaxed/simple;
	bh=qpkWCyEX10SdG/GCtCpysYhBpX5GCTe+Vu1OvuHP3go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKWVMrIcopsndJjcZtlOy7vsHteYIWxgLUWn9aLyCmQHMBaEVW+lNA2TkPzCvBCj31TUWI3poDZQhtNCJQwFragNdaYClUYspPJemfDrQCfg/zM6iDtP22ce2wdTtInnVYZPLehosjbK1fbwqAzyjGOgBhNAjUSEzr3o/RHFjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kJ1ZRcgG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kJ1ZRcgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934981F000E9;
	Sat, 20 Jun 2026 05:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781932322;
	bh=0Ltnc4lD8DFTvA0y7v5AyZbCDr4Q/p4u2/Re4WpZMKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kJ1ZRcgGHvet+GKdzZ/xztosjrtS0XIEjPVkNFE/x1wVKRWdXdiF3Q7GAkVxRljuh
	 tNcnTmR8DBgULfIxwIRgivIM8Yjby81PyUcNAUfMwo0SR/MlYdlwz7drhrZV8okzdP
	 /VuzRG4k8vogVQwn9Z1GneQZ/ssIdNvHWqzcW3k0=
Date: Sat, 20 Jun 2026 07:10:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: madhu.m@intel.com
Cc: heikki.krogerus@linux.intel.com, akuchynski@chromium.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: displayport: Reject DP Alt Mode VDO with
 no pin assignment for its capability
Message-ID: <2026062042-criteria-recycling-1d70@gregkh>
References: <20260619163109.3529666-1-madhu.m@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619163109.3529666-1-madhu.m@intel.com>

On Fri, Jun 19, 2026 at 10:01:09PM +0530, madhu.m@intel.com wrote:
> From: Madhu M <madhu.m@intel.com>
> 
> Some docks/Type-C dongles expose a malformed DP Capabilities VDO: they
> claim a DFP_D (source) or UFP_D (sink) capability but leave the
> corresponding pin assignment field empty. Such a device can never have
> Alt Mode configured. Currently the driver still proceeds, which is
> misleading and offers no diagnostic.
> 
> Per VESA DPAM v2.1a Section 5.4.1 (Table 5-6):
> Case 1 (receptacle): A DP Source device receptacle (DFP_D) declares its
> lane routing in the DP Source Pin field (Bits 15:8); a DP Sink device
> receptacle (UFP_D) declares its lanes in the DP Sink Pin field
> (Bits 23:16).
> Case 2 (direct-attach plug): A DP Sink device plug (UFP_D) declares its
> lane routing in the DP Source Pin field (Bits 15:8), and a DP Source
> device plug (DFP_D) declares its lanes in the DP Sink Pin field
> (Bits 23:16).
> In either case the field holds the supported pin assignment values
> (e.g. C/D/E); 00000000b means no pin assignment is supported for that
> capability.
> 
> Reject such a DP Alt Mode VDO in dp_altmode_probe(): if the claimed
> capability has no matching pin assignments, fail probe with -ENODEV,
> releasing the SOP' plug reference on the error path.
> 
> Signed-off-by: Madhu M <madhu.m@intel.com>
> Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 263a89c5f324..2a553cfcf61d 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -764,6 +764,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	struct typec_altmode *plug = typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
>  	struct fwnode_handle *fwnode;
>  	struct dp_altmode *dp;
> +	u32 cap = DP_CAP_CAPABILITY(alt->vdo);
>  
>  	/* Port can only be DFP_U. */
>  	if (typec_altmode_get_data_role(alt) != TYPEC_HOST)
> @@ -778,6 +779,18 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  		return -ENODEV;
>  	}
>  
> +	/*
> +	 * Make sure the DisplayPort VDO is valid (VESA DPAM v2.1a, Section
> +	 * 5.4.1, Table 5-6, DP Capabilities VDO). A device exposing DP on a
> +	 * USB-C receptacle must advertise at least one pin assignment for the
> +	 * capability it claims, otherwise Alt Mode can never be configured.
> +	 */
> +	if ((cap == DP_CAP_DFP_D && !DP_CAP_PIN_ASSIGN_DFP_D(alt->vdo)) ||
> +	    (cap == DP_CAP_UFP_D && !DP_CAP_PIN_ASSIGN_UFP_D(alt->vdo))) {
> +		typec_altmode_put_plug(plug);
> +		return -ENODEV;
> +	}
> +
>  	dp = devm_kzalloc(&alt->dev, sizeof(*dp), GFP_KERNEL);
>  	if (!dp) {
>  		typec_altmode_put_plug(plug);
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
