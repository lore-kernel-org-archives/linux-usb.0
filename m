Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F280F421F10;
	Thu,  5 Feb 2026 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307627; cv=none; b=mj1dR+Redbi7a+d8mxxIMncDiWJTuxFoFsGruPs6grXj88PhQRUY3qr5hsLanuwSsLGI+4nAU2D4Xbj6wFZJt7KCHTG1qKARCjvFt7prjjLqxmP1iDwB4sozXuJuf8LAsLfXgOVwnJ9g033fxf0PEpDcYfOCW8I1uKedJBl711U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307627; c=relaxed/simple;
	bh=zQrCKvALeYKSNawTM2Qn6t8bur9FZaWr0VuqXzom4tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjw03XV9PW1nMiMl9mxlcolIIR5X+KrfcMK9aRVoWx4tQug5pjFhZLCVbu12mF+kRggo7+kwmfzTvimDNqGMjzp74vfqWMolvxUR/EQQFCWN3JsF3XOPv8m5cTcrJN6lTCjgskl3jdzglmOJhcrUD0XnEyFn3QM0gpB2H+O97uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ERr4hNA2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ERr4hNA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25449C4CEF7;
	Thu,  5 Feb 2026 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770307626;
	bh=zQrCKvALeYKSNawTM2Qn6t8bur9FZaWr0VuqXzom4tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERr4hNA29GwkfZO2qVL8ksVL0HHnDFNpQylAIjyuAc9oHVyphdvgdeReqDeroBJY0
	 vUJX5G0ENZUb8E6isdDJJw+vSPtxr09IKUmYWrDC5YFDEzjYmg/K0m7klf80n9qAcl
	 YTnkb2sgIvuVcyQJbXv/gBxxo742peBLEBHdp+B4=
Date: Thu, 5 Feb 2026 17:07:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial device ids for 6.20-rc1
Message-ID: <2026020557-during-overdress-d04b@gregkh>
References: <aYN1KleJnyjJb6HR@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYN1KleJnyjJb6HR@hovoldconsulting.com>

On Wed, Feb 04, 2026 at 05:34:50PM +0100, Johan Hovold wrote:
> The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:
> 
>   Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.20-rc1
> 
> for you to fetch changes up to 509f403f3ccec14188036212118651bf23599396:
> 
>   USB: serial: option: add Telit FN920C04 RNDIS compositions (2026-01-27 16:29:46 +0100)
> 
> ----------------------------------------------------------------
> USB serial device ids for 6.20-rc1
> 
> Here are some new modem device ids for 6.20-rc1.
> 
> Everything has been in linux-next with no reported issues.
> 
> ----------------------------------------------------------------
> Fabio Porcedda (1):
>       USB: serial: option: add Telit FN920C04 RNDIS compositions
> 
>  drivers/usb/serial/option.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Pulled and pushed out, thanks.

greg k-h
