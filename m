Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1291A267;
	Sat, 23 May 2026 05:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779515431; cv=none; b=LYGFmiUEzPYuCoUy+jzbZTyvFNV8EHx7BBaUkI6M+bsLcSlZVI9foapSQQEdZSA3uL1s2FZHRPXk+wWh++/gA+WE46p5f8+i7kn/xQU7ZU60MJxKtSYI3xoifw3yJdh2FI5s6TUHbVpbBuRPY2aX3zeM7uxyYuXRv6bAhdPRHgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779515431; c=relaxed/simple;
	bh=AUrEqcE4Lwlm4P03UD6yqxO3BFpwev/iwfaYUBk0Sjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G05L1QlrFdCmRKoVsztgwI+vFnwkVrDyThiisIzYJSw7ad0c6/AhCh8O8zcomujdBIK+Rg6kdkBkGCJYpRxjZoGlLaLYODs6r2WXzYNDcEPSGHWzfmk3L0JWYVue8/VNfg4X7VoKDlow6YwW7ekX9ylrZWSbQFCi508234Kitng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XA9ibfj+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XA9ibfj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B271F000E9;
	Sat, 23 May 2026 05:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779515429;
	bh=/CKlWWECNV51q3gCE6tEZnNKEqyxG1yNwTzcm/qQkgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XA9ibfj+9RPhJsv2lCoprMvCSyuKa5f0FBdEq8hSQDy/ophgjJfx/1PeCs3n1j9ig
	 Q79cEFU9kTEeoDf2pcClFYHQhQdNnp72tUIzvDZNfwHuKsLMSj9+uZ74MrhrmE2hZg
	 kErg0BKb6PU5SHr8rqoTvoQ3VqXzumuO/OVCy/gw=
Date: Sat, 23 May 2026 07:50:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: omninet: fix memory corruption with small
 endpoint
Message-ID: <2026052326-trombone-hemlock-b38c@gregkh>
References: <20260522142058.947562-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522142058.947562-1-johan@kernel.org>

On Fri, May 22, 2026 at 04:20:58PM +0200, Johan Hovold wrote:
> Make sure that the bulk-out buffers are at least as large as the
> hardcoded transfer size to avoid user-controlled slab corruption should
> a malicious device report a smaller endpoint max packet size than
> expected.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/omninet.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

