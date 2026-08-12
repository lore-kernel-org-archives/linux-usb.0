Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A43546C9;
	Wed, 12 Aug 2026 07:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519460; cv=none; b=tQic82qweo+oS8hULhEsCP3FAH3t6bdvsD9gbHRSbgTZbQ36H/vSm1k+Gae9h69QhFFRXQ6ttCuAdCZjhM2vyw34lKAJnDfDDeT3Wo2L+Dhs5y+jFaat7KAFijKqw8mhRUsLEffpNFmv5TC9xk6q+JkiSPLOn8bDBubBgRA5yKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519460; c=relaxed/simple;
	bh=2fRif9LFmEF8luiE0PJWVKj7ULtpQt6q7+Ju2R5xw+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YY+z80+exim/fUR6mSfz81dclxbhrK3UNd+b2gu1Zt3u8Bmjyt56Y3YTRpl7lLsjl6MseUJWCUlZDD44wp+Esds3u5nsRd8H6kTmjixa+FJkz4NCO6Ot6/+9JZbLMKCUapirNeat/M8hphqHnoqs9Ls8h1mSkYZOUmmxnBgnoR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z7GzNN9A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z7GzNN9A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D3F1F000E9;
	Wed, 12 Aug 2026 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786519458;
	bh=orcE077VNmf0pOGt1L/uozOB+nmmXz9DGvU2rokqBxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z7GzNN9A7rO3ao+Q8wTbBcV2ZQxE3+56TlAxacZ9fEqHgZo8eUkHltM/wI+4gtFfT
	 jUMW8G4iqthAz9zBonRRndFcKAgGtUkUUCVHNr7Wmm8VMAw1K3nQpqlccW1xSHzLil
	 +VPTuk7VEY79eDQgohdcrMkTeBqtf/m+z+Jdcddk=
Date: Wed, 12 Aug 2026 16:22:44 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Colapietro <jasoncola1@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 1/2] usbip: make remote list honor parsable
 output
Message-ID: <2026081225-imprison-upper-e03a@gregkh>
References: <20260812063910.31293-1-jasoncola1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812063910.31293-1-jasoncola1@gmail.com>

On Wed, Aug 12, 2026 at 02:39:09AM -0400, Jason Colapietro wrote:
> The -p option only affects local devices and gadgets. Remote lists still
> print their human-readable headings and details, so scripts cannot parse
> them using the documented option.
> 
> Pass the parsable flag through the remote listing path. Emit the same busid
> and usbid record used for local devices while continuing to consume every
> interface record from the server.
> 
> Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5
> Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
> ---
>  tools/usb/usbip/src/usbip_list.c | 33 ++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
> index 3d810bcca..b9d60b87e 100644
> --- a/tools/usb/usbip/src/usbip_list.c
> +++ b/tools/usb/usbip/src/usbip_list.c
> @@ -41,7 +41,7 @@ void usbip_list_usage(void)
>  	printf("usage: %s", usbip_list_usage_string);
>  }
>  
> -static int get_exported_devices(char *host, int sockfd)
> +static int get_exported_devices(char *host, int sockfd, bool parsable)
>  {
>  	char product_name[100];
>  	char class_name[100];
> @@ -80,9 +80,11 @@ static int get_exported_devices(char *host, int sockfd)
>  		return 0;
>  	}
>  
> -	printf("Exportable USB devices\n");
> -	printf("======================\n");
> -	printf(" - %s\n", host);
> +	if (!parsable) {
> +		printf("Exportable USB devices\n");
> +		printf("======================\n");
> +		printf(" - %s\n", host);
> +	}
>  
>  	for (i = 0; i < reply.ndev; i++) {
>  		memset(&udev, 0, sizeof(udev));
> @@ -98,9 +100,14 @@ static int get_exported_devices(char *host, int sockfd)
>  		usbip_names_get_class(class_name, sizeof(class_name),
>  				      udev.bDeviceClass, udev.bDeviceSubClass,
>  				      udev.bDeviceProtocol);
> -		printf("%11s: %s\n", udev.busid, product_name);
> -		printf("%11s: %s\n", "", udev.path);
> -		printf("%11s: %s\n", "", class_name);
> +		if (parsable) {
> +			printf("busid=%s#usbid=%04x:%04x#\n", udev.busid,
> +			       udev.idVendor, udev.idProduct);
> +		} else {
> +			printf("%11s: %s\n", udev.busid, product_name);
> +			printf("%11s: %s\n", "", udev.path);
> +			printf("%11s: %s\n", "", class_name);
> +		}
>  
>  		for (j = 0; j < udev.bNumInterfaces; j++) {
>  			rc = usbip_net_recv(sockfd, &uintf, sizeof(uintf));
> @@ -116,16 +123,18 @@ static int get_exported_devices(char *host, int sockfd)
>  					uintf.bInterfaceClass,
>  					uintf.bInterfaceSubClass,
>  					uintf.bInterfaceProtocol);
> -			printf("%11s: %2d - %s\n", "", j, class_name);
> +			if (!parsable)
> +				printf("%11s: %2d - %s\n", "", j, class_name);
>  		}
>  
> -		printf("\n");
> +		if (!parsable)
> +			printf("\n");
>  	}
>  
>  	return 0;
>  }
>  
> -static int list_exported_devices(char *host)
> +static int list_exported_devices(char *host, bool parsable)
>  {
>  	int rc;
>  	int sockfd;
> @@ -138,7 +147,7 @@ static int list_exported_devices(char *host)
>  	}
>  	dbg("connected to %s:%s", host, usbip_port_string);
>  
> -	rc = get_exported_devices(host, sockfd);
> +	rc = get_exported_devices(host, sockfd, parsable);
>  	if (rc < 0) {
>  		err("failed to get device list from %s", host);
>  		return -1;
> @@ -351,7 +360,7 @@ int usbip_list(int argc, char *argv[])
>  			parsable = true;
>  			break;
>  		case 'r':
> -			ret = list_exported_devices(optarg);
> +			ret = list_exported_devices(optarg, parsable);
>  			goto out;
>  		case 'l':
>  			ret = list_devices(parsable);
> -- 
> 2.50.1 (Apple Git-155)
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
