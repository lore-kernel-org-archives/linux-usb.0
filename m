Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4963C2B8D;
	Tue, 16 Jun 2026 02:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781576868; cv=none; b=TpI2KZqcNsXtA94nWAjXXNKjvi3NMiUPazsEcw27CrnztMH3fPMGOVQ9HA35BybZhvGaQBQ7VOnf8BopiJQItiVQE8m/zuv/ZWoBzHu6OzQdI4jdiq9EN73ap57CGmL6ahyiU9aqlwLuDEIph4RhfKh4n05joGq/TKlw5+kZoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781576868; c=relaxed/simple;
	bh=9GvlDMB8Tg1OV9TgMkmQik8+drQeT5FSpoPRvVfu0yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbCv9LmmdjrBbTXT2ZAQRoNbeCaasiMtxqzLluRHsibe4TR4jyl2K+IXswg073vDZ/BF7SHnvKqqL3W5PZPGTUAnoVeHx6IZZhn6uXLOy498lO85Xy8EzrUzimxmr3nlenTZjbkbMHUiEbc2B2gDYrMCCkIC2q6C2j3YGoK3G28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QaASKndT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QaASKndT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0B91F00A3D;
	Tue, 16 Jun 2026 02:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781576866;
	bh=BGVxO9sRTpS02DGqPrb9g0+3A4Y+HQdgvGxTg67McFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaASKndTh7vi/bavUHSKGq1/YtMTAjaOw06lKRpCbIhhHM6xq+cLvC+wbIUQFlEHV
	 w5FJNVPf1kVNgAjtyvSFHWsP7VTzawHW/pquGcN382NyrkT7lIkQ/7mijXwx6KqnX5
	 PxSAPnXj9IxMaEVS43c6CiapgjE1vhyHKQ988mhg=
Date: Tue, 16 Jun 2026 07:56:42 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: heikki.krogerus@linux.intel.com, bleung@chromium.org, jthies@google.com,
	myrrhperiwinkle@qtmlabs.xyz, pooja.katiyar@intel.com,
	abelvesa@kernel.org, yuanhsinte@chromium.org, johan@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: recover from silent PPM completion in
 sync_control
Message-ID: <2026061632-gleaming-resend-9a5f@gregkh>
References: <20260616020044.1646085-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616020044.1646085-1-acelan.kao@canonical.com>

On Tue, Jun 16, 2026 at 10:00:44AM +0800, Chia-Lin Kao (AceLan) wrote:
> Some firmware completes UCSI commands and sets COMMAND_COMPLETE (or
> ACK_COMPLETE for ACK_CC_CI) in CCI but never fires the ACPI notify that
> would wake ucsi_sync_control_common().  The driver then times out after
> 5 seconds and returns -ETIMEDOUT, even though the EC finished the command
> successfully.
> 
> Fix this by polling CCI once via poll_cci() on timeout.  If the relevant
> completion bit is already set, the EC finished silently; fall through to
> out_clear_bit so the normal read_cci()/read_message_in() path retrieves
> the data and ucsi_run_command() issues ACK_CC_CI as usual.  Only return
> -ETIMEDOUT when the EC has genuinely not completed the command.
> 
> Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command handling")
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 9eeb38e7472c0..ed5b10d8b58ef 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -91,8 +91,28 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
>  	if (ret)
>  		goto out_clear_bit;
>  
> -	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
> -		ret = -ETIMEDOUT;
> +	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ)) {
> +		u32 polled_cci = 0;
> +
> +		/*
> +		 * Notification from EC did not arrive.  Poll once to check
> +		 * whether the PPM actually finished without firing a notify.
> +		 * If poll_cci() fails, polled_cci stays 0 and we correctly
> +		 * report -ETIMEDOUT below.
> +		 */
> +		ucsi->ops->poll_cci(ucsi, &polled_cci);
> +
> +		if ((ack && (polled_cci & UCSI_CCI_ACK_COMPLETE)) ||
> +		    (!ack && (polled_cci & UCSI_CCI_COMMAND_COMPLETE))) {
> +			/*
> +			 * EC completed the command silently.  Proceed to
> +			 * out_clear_bit which reads CCI+data normally, and
> +			 * ucsi_run_command() will issue ACK_CC_CI as usual.
> +			 */
> +		} else {
> +			ret = -ETIMEDOUT;
> +		}
> +	}
>  
>  out_clear_bit:
>  	if (ack)
> -- 
> 2.53.0
> 
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
