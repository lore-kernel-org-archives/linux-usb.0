Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9237C91A;
	Wed,  4 Mar 2026 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614667; cv=none; b=gU4q0eHZONXUwyE6UOiHWsk1yy2sCdhbP7VBZ47K/GJ7vprOUi5kryqg0ZxRuRwQiH0N8S9vChwM8lm971abyx7KTTE9d4K9yRXLkilw84U9g5VErVqCGx1J3195CllxVWMfOzNJgIswQHOKJw31KoRQ/BZwhrH63WRRNRS7G2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614667; c=relaxed/simple;
	bh=zk4mZUD99XuyJ9kO5nUDaVSjJ65UdTAwp1sOVrs4xuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=be21DNFWoijITdo7TalcDN0hKTEeWn4nll7TPeBOxUiAIKy1kRhkYjL0wru1iFyGSRkdVOQdd+fAHdoUdN8h3MGqQ09/clKxaslh7YNBqV5lBSzC1r2sbbmtIrwz6jAwQg+51FdIuMjNzOY64lVA/2DxnXQLgnl+3wR9PzSlgiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y72TNB7G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y72TNB7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBFAC19423;
	Wed,  4 Mar 2026 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772614666;
	bh=zk4mZUD99XuyJ9kO5nUDaVSjJ65UdTAwp1sOVrs4xuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y72TNB7GXGmhicNwVvw4hlqk6eojRbIc7Vo4LKhiAC+R0WsPnLIJ8iVGZTpvnDKPB
	 wijRfej8bjUUyPfkUSCLix+6EMww4YDd3R1IB2LZY9ci/KuR07lqePdYyfvn8Ckjwy
	 V7fg2NvPVLCWsop2CEj/kOv61mNfnxxAu4qhJm48=
Date: Wed, 4 Mar 2026 09:57:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: remove unnecessary goto in
 usb_create_newid_files()
Message-ID: <2026030419-retract-level-7101@gregkh>
References: <20260304064646.6612-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304064646.6612-1-marusik.adamenko@gmail.com>

On Tue, Mar 03, 2026 at 10:46:46PM -0800, Mark Adamenko wrote:
> The goto to 'exit' only returns the already initialized variable
> 'error', which would be 0. At that point it could not yet be anything
> else. Replacing with an early return 0 removes the
> need for the label entirely.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
>  drivers/usb/core/driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 2574e65bc640..752ff84a8dc1 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -186,7 +186,7 @@ static int usb_create_newid_files(struct usb_driver *usb_drv)
>  	int error = 0;
>  
>  	if (usb_drv->no_dynamic_id)
> -		goto exit;
> +		return 0;
>  
>  	if (usb_drv->probe != NULL) {
>  		error = driver_create_file(&usb_drv->driver,
> @@ -199,7 +199,7 @@ static int usb_create_newid_files(struct usb_driver *usb_drv)
>  						&driver_attr_new_id);
>  		}
>  	}
> -exit:
> +
>  	return error;
>  }
>  
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
