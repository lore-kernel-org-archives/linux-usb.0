Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BF73793D0
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846629; cv=none; b=bHf1bYfJo49xmtR0lrsWIyNGn/zLUpQV7xPrJS5dElpbxxiQHhV6V/cxffBR32ZyaWagaDdRvLXYt+Frt9jfL/g9OcTkpI/P3vwtRZmA6VYi8xOtVxe5Vq8UmvQJzyNSoaRJ0QJHQxs7DO2c8ke8g+ba0RcXXkGJHXKfIUqKwnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846629; c=relaxed/simple;
	bh=QW36FWYaiiY503CIMZ5hx3jkhTiBuujO8oLDuSmIJI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6nIl+nGVglhJO8Eu1ROeaNQV4VTJbyfRDVCP8jioAlGzs00Jczu2x4UbZ0Vsrkm3nAeaygA8Fi0y/h8nW6WNl87rQr7cOeaxmgg83A4FfLWu1H5gjT3vIaMqU8khaMmz/ejvtRHMaJa4BhuU9P9/cQdJ7h/NE5MQmxS7Bn+gTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZAhmHr4P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZAhmHr4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0224EC19421;
	Wed, 18 Mar 2026 15:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773846628;
	bh=QW36FWYaiiY503CIMZ5hx3jkhTiBuujO8oLDuSmIJI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAhmHr4PyTCyBsqnmVkVSklgzYp6ArulLtmpgqUKrrZZawOeM4v1YZv+uZEKEp7E6
	 bQTcpPvwZTdwPkZjU4tFIhF7yL5ikplCGqdENVbpyS0FRwbttf8Q5OjVX6dllCmZKa
	 h+tZnNBm9ULmcgDjuqZf3uuWsXiG27dXoI8J3/t8=
Date: Wed, 18 Mar 2026 16:10:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: uapi: add BULK_MAX_PACKET_UPDATE
Message-ID: <2026031809-wobbling-sedation-1208@gregkh>
References: <20260317092244.1464921-1-oneukum@suse.com>
 <20260317092244.1464921-2-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317092244.1464921-2-oneukum@suse.com>

On Tue, Mar 17, 2026 at 10:22:29AM +0100, Oliver Neukum wrote:
> The spec for Embedded USB2 Version 2.0 adds a new feature
> request. This needs to be added to uapi for monitoring.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  include/uapi/linux/usb/ch9.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> index 6f02dc39430a..bf1bae138844 100644
> --- a/include/uapi/linux/usb/ch9.h
> +++ b/include/uapi/linux/usb/ch9.h
> @@ -133,6 +133,8 @@
>  #define USB_DEVICE_A_ALT_HNP_SUPPORT	5	/* (otg) other RH port does */
>  #define USB_DEVICE_DEBUG_MODE		6	/* (special devices only) */
>  
> +#define BULK_MAX_PACKET_UPDATE		8	/* (eUSB2v2) bump maxpacket to 1024 */

Should have USB_ as a prefix.

And what is 7?

thanks,

greg k-h
