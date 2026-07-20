Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC6330678;
	Mon, 20 Jul 2026 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558024; cv=none; b=gl3V4GywDx0jA7G3t3G9kimIOGoEIBjvwlMcVcXtB0iYUAw04cHITHjzhy/Odvsh4FnWBgUbjWf4WSYoiZEKkVDnduEo77fVjQUZDnaJJ6nC7d2MuqxKOwAcvXaxqbMhGELt10BcqLytzjdQ9kqL0ixjw3UuxvwtEjvz9Ui+Tv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558024; c=relaxed/simple;
	bh=eootNuHQb7wp1clM0Tb6jv8IgVvb3McQ6koi9vpBmVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwsoqoVHil+kKLjMmf5x7IhpF4xBSEUmwgf+wVkCUfUW9Ec25vjQ5H6HjqRwASFvO4cs1VnIA1m6SqN7JxlZU5rM9A9YosFXWWrAWMVOCWe0Cb+nPsaQuxjdAg+gRSFLo/Yka/srVMRYIoZpqk3g5gcyo3eRCj0mcdDhgkHS6yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjrxzpmf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjrxzpmf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F3E1F000E9;
	Mon, 20 Jul 2026 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558022;
	bh=JGwRHgxBYzYUEQ/1LJeb8r9PpiVkE+w9FBVk0QbPpSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gjrxzpmfTXXCi09CMzarnGWsLn8sN6L2lgfOBRImtUH/27TJwY0ikzCrIaL4mtzG4
	 4UlgpHCjgmEaCJbEqgA3Ii5H47gjq8LcpFiUvNK5behF4sskvgbpAPEc1rFaYND3zG
	 t4/yRfUiG7vOnB1n4igaaH3uNh4g8cwyi32qpqkiwtw7uP6ghJv/lyWsfTKZiM/GkR
	 8ytUmfegX+n7oaEjngdFfKis7v7Tz3fUhn/vTGep3VnSUIVmvZcofLgJvQJR8L9Jv7
	 JQypCejZsgJ4Mx50EKWXcSh2uJ3WKgYp2XfE2INNRCHBMRdWpA5ljJuXAWSSxayPcv
	 ExJ5Y59BWf44A==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wlp3s-00000008p9d-1Oc8;
	Mon, 20 Jul 2026 16:33:40 +0200
Date: Mon, 20 Jul 2026 16:33:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mxuport: validate firmware header size
Message-ID: <al4xxLVJlevgpACq@hovoldconsulting.com>
References: <20260715084611.45995-1-pengpeng@iscas.ac.cn>
 <7cd8b7b0-17bc-4470-ae92-0bf39904b7d1@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cd8b7b0-17bc-4470-ae92-0bf39904b7d1@lunn.ch>

On Wed, Jul 15, 2026 at 07:17:33PM +0200, Andrew Lunn wrote:
> On Wed, Jul 15, 2026 at 04:46:11PM +0800, Pengpeng Hou wrote:
> > mxuport_probe() reads version bytes at fixed offsets after
> > request_firmware() succeeds. Firmware loading success does not prove that
> > the blob contains the whole header.
> > 
> > Reject blobs that do not reach the highest version byte before
> > dereferencing them.
> > 
> > Fixes: ee467a1f2066 ("USB: serial: add Moxa UPORT 12XX/14XX/16XX driver")
> 
> Does this bother people?
> 
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> 
> I would suggest dropping the Fixes tag, unless you can point to
> reports of this crashing.

I'd say not validating input is still a bug even if it should not be
backported to stable.

Here we may end up leaking three bytes beyond the buffer to the logs,
but of course only root should be able to corrupt the fw file in the
first place.

So I'll add back the Fixes tag (without adding CC-stable) when applying
v2.
 
> > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks for reviewing.

Johan
