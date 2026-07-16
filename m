Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B25034403A;
	Thu, 16 Jul 2026 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240626; cv=none; b=gE+T1s1LyFa/n4NK3uhCMIYEwWDAeK22J4qst+bHJGGkMgXrgQ/VJjUwvvisWPjwhh9xUFCHmVlOXupCZ05o1BiXS9/vaCrwESHr4jhM5UfOfN20166G6RVqEHXceQvt56TY/4n8E1agovBhYjWJg91kPb4i6iBc3o7wFkB3YsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240626; c=relaxed/simple;
	bh=oXdgeAwlMIa0XxHXfYCjsG9jLicu3OkxAeadoG0GvtA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bz/twLejFC7hZGUj2bSJzc1N+TXwZuGWDduo0xjENUEICPuiVslcXMpSVm9/y0OZmAaWfyGIa66JPo492ECACSsMfi7FsPlNFlTmwA4RjD2j9pcpZ1jeU0Uc/Vpa/z/1ak99/RaLl3aLl9YqPQQn7X8ffyml5GSF1CfCzFVVS14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=brdBxwk5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="brdBxwk5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1E254408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784240624; bh=wNx7xBqMgLvvUirDMBZJsaQ4Fmn5lCNCU1JCNRYmAcE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=brdBxwk5wHV3J5UJGYBx7bI1bMWerKx81uU3yZfQaUSawpoJv4KdUmZ90a3bGfXus
	 qh0wlh0KGZowVISs++Xnowq3sCThBFRIBYdel/qc0w1CgnwatnpC781n/EQ6gtmuzU
	 rdryliCzgT/+IiG74e9KBbW3ZeV6cKTQ1LX+1jBOccwn3ZpQgUZjTLO6gGyDFSplqa
	 oN0973i3f7bqtY7z+NayJy0HGMUir054IOsV03Wfd8aF64UD4tqYMmiMdioQggum5m
	 n0nuTLqONLYH7wriXPqZcbZIzgBb1nCpV8OaDUzSi536kUdnRxRLRp73jbMJ85MIe9
	 ggIk9+BG7md4Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1E254408B2;
	Thu, 16 Jul 2026 22:23:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Utsav Shankar <utsaveshan0206@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, Utsav Shankar <utsaveshan0206@gmail.com>
Subject: Re: [PATCH] Documentation: usb: remove dead link to external USB
 programming guide
In-Reply-To: <20260713150544.20962-1-utsaveshan0206@gmail.com>
References: <20260713150544.20962-1-utsaveshan0206@gmail.com>
Date: Thu, 16 Jul 2026 16:23:43 -0600
Message-ID: <8733xi7evk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Utsav Shankar <utsaveshan0206@gmail.com> writes:

> The "Programming Guide for Linux USB Device Drivers" was last hosted
> at lmu.web.psi.ch and is no longer reachable. The original source
> (TUM, cs.tum.edu) is also defunct. Remove the dead reference rather
> than link to a third-party archive of a 20+ year old, outdated guide.
>
> Signed-off-by: Utsav Shankar <utsaveshan0206@gmail.com>
> ---
>  Documentation/driver-api/usb/writing_usb_driver.rst | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Documentation/driver-api/usb/writing_usb_driver.rst b/Documentation/driver-api/usb/writing_usb_driver.rst
> index 95c4f5d14..6f024e164 100644
> --- a/Documentation/driver-api/usb/writing_usb_driver.rst
> +++ b/Documentation/driver-api/usb/writing_usb_driver.rst
> @@ -322,7 +322,4 @@ http://linux-hotplug.sourceforge.net/
>  linux-usb Mailing List Archives:
>  https://lore.kernel.org/linux-usb/
>  
> -Programming Guide for Linux USB Device Drivers:
> -https://lmu.web.psi.ch/docu/manuals/software_manuals/linux_sl/usb_linux_programming_guide.pdf
> -

Applied, thanks.

jon
