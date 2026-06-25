Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76A34CFBA;
	Thu, 25 Jun 2026 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395793; cv=none; b=YIdvoesMey99sPA7p7rryuziRtUlO2F3pmKF/9JZbji7wvZHzEi+N6wuxniJYOHZ7KekgxhaW29C3jdyqk6t5vGTL/mZl/QT3lJu9VqBph7OKXFmS1LQWxXQrqkiLOkOMau5CImYN2BPZRK6W/hMnZoRsC8sBvgbYBSb1reNbqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395793; c=relaxed/simple;
	bh=CNfmS8bbRabm1iqvFbH1ZzqCkH9FrcXD4e/kGchZWfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFNCfGevJ3MWEKnpBB1pj64Md+EqU7ljo3AKfMsiNYw5ZC0MpXmjMrDkXXxnDKP4Nv3UYz9xsj6MV+T+N6neS3eMsccl2ulZCVSUhdULUJ8H29HHNULhCH2fCR8yZ1nylm8eDKN4QHI+TylDK16T8h1OGbO3EA7cgca+bYTQTr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RI2hdoB7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RI2hdoB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090011F000E9;
	Thu, 25 Jun 2026 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782395791;
	bh=FNbbktM1Ahz8D4/nbDMEV4nBKwwmFLwPSPxhbDDCQOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RI2hdoB7qnYKrB0zv/qAntWdq7bbKTnCgLWxLnny9iX9NLa6wU4x5tawhXB2vMqpr
	 XEu2RasT8Of6QDidnQls4rH9IPJTo3rqckLUpIsDk5TXjNkhtYs1UezLXT1d5RhIYY
	 fm0eAVYocQVLJPvTeHpLMP+wDMT5VkIESKbHVn/U=
Date: Thu, 25 Jun 2026 14:55:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: renesas_usbhs: Check pipe allocation in host pipe
 init
Message-ID: <2026062533-dock-frosting-5a64@gregkh>
References: <20260622114521.1022197-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622114521.1022197-1-haoxiang_li2024@163.com>

On Mon, Jun 22, 2026 at 07:45:21PM +0800, Haoxiang Li wrote:
> usbhsh_pipe_init_for_host() allocates pipes with usbhs_dcp_malloc()
> or usbhs_pipe_malloc(), both of which may return NULL. The returned
> pointer is dereferenced unconditionally when clearing pipe->mod_private.
> 
> Check the returned pipe before using it to avoid a NULL pointer
> dereference on pipe allocation/setup failure.
> 
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/usb/renesas_usbhs/mod_host.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/renesas_usbhs/mod_host.c b/drivers/usb/renesas_usbhs/mod_host.c
> index f7ef3a9f82a4..11244cf3408d 100644
> --- a/drivers/usb/renesas_usbhs/mod_host.c
> +++ b/drivers/usb/renesas_usbhs/mod_host.c
> @@ -1441,6 +1441,9 @@ static void usbhsh_pipe_init_for_host(struct usbhs_priv *priv)
>  						 dir_in);
>  		}
>  
> +		if (!pipe)
> +			return;

No, you just leaked memory and caused the system to be in an unknown
state, which is probably worse off than the crash that would have
happened.

Please fix this properly, if you really have ever hit this before.

thanks,

greg k-h
