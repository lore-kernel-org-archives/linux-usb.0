Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33FB85296
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706813989; cv=none; b=kcvzDiIwRnY1xkmBhdaWE8VJNSP2oOJtMvu2Hjv8IP3vCLzanj/k2BMeWQMVv7Rto5YwFnH9Kxxuf2IgU9qcIrey7K2Q8V8DSNg2LN4/BcmcXQ5V+CeS2yEbaCwe1CGBWZO8NOdPAf8v45b6nkbtKY5IBQkNJdZQ7lBGCrnoCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706813989; c=relaxed/simple;
	bh=mu6Su8/q2NaqJVDJQ2JP/A6xmuURL5cPtxthPKoOAxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F95UrhuHZOS0NQYnpIEgMpPI6IJv5QqEAoyU6HkAhjUT8/5EK9TZgq419qEAvI+Us0OSnEZtOQpCnjVd2LWZUadcgPLqOUB6u0tcwPu95xafksY7DJtn3nReAK/bs1n7C8X/Y7BbOk8jbcKxQRD4/7MjId1fK92eRzHLGbDJyp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id AA7F91403E6; Thu,  1 Feb 2024 19:59:42 +0100 (CET)
Date: Thu, 1 Feb 2024 19:59:42 +0100
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [bug report] usb: ucsi_acpi: Quirk to ack a connector change ack
 cmd
Message-ID: <ZbvqHtYjn3GK2GPo@cae.in-ulm.de>
References: <dbaf3630-6284-4ef6-b471-43c3885e16b0@moroto.mountain>
 <ZbtEmyHMBKnPU01A@cae.in-ulm.de>
 <24758ac7-4be4-4312-9254-f7ea71a4ec8c@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24758ac7-4be4-4312-9254-f7ea71a4ec8c@moroto.mountain>


Hi Dan,

On Thu, Feb 01, 2024 at 12:33:30PM +0300, Dan Carpenter wrote:
> Ah, thanks for the explanation.  I misread the code.  To be honest we
> spent an embarrasing long time looking at this code.  At first that
> Smatch was wrong and that ret could be -ETIMEDOUT and went down a whole
> long rabbit hole trying to debug that.  :P  What about if we did this
> instead?
> 
> I can send this as a proper patch if you're okay with it.
> 
> regards,
> dan carpenter
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 928eacbeb21a..5251132cb35b 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -153,6 +153,9 @@ ucsi_dell_sync_write(struct ucsi *ucsi, unsigned int offset,
>  	if (ack == 0)
>  		return ret;
>  
> +	if (ua->dell_quirk_probed && !ua->dell_quirk_active)
> +		return 0;
> +
>  	if (!ua->dell_quirk_probed) {
>  		ua->dell_quirk_probed = true;
>  
> @@ -170,9 +173,6 @@ ucsi_dell_sync_write(struct ucsi *ucsi, unsigned int offset,
>  		dev_err(ua->dev, "Firmware bug: Enabling workaround\n");
>  	}
>  
> -	if (!ua->dell_quirk_active)
> -		return ret;
> -
>  	return ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &ack, sizeof(ack));
>  }

It's not my preferred solution but it looks correct, so go ahead.
I will review the final patch.

Thanks  Christian

