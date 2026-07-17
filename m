Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A913B27F4;
	Fri, 17 Jul 2026 10:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284542; cv=none; b=YDwLgLiVovFY4CFF1tw9cNiRjlY6v+dBOI6e4pHS105fHGVTggm8bbKTGtjBGQ/V2W1x2asijDPnTs6VS8bQBsxxnEhy9NyhrgsEv6kbkps2hqOmbi6XZITfozF7UeMltvLtO8pR/9gHbYM+EtVp3HmHt0eHysFDsOUcnRqoX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284542; c=relaxed/simple;
	bh=74DQWfYV5Ns5pkwq7/9wuvk/TAa30XZrjSkBOztRe8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcJnboXZ2Mk8TGiNqR/nYAgq8XkvOOXDkV9TmW4s/K6SXJt3sOYMTOyIXAkNau202hWYAxT4w438/F0Kc8R3/O6MuYNTaUAJyJTGYQVkld4X8SFsL/m7SxoTGoMDMJiZz4LxiaygLVkGcHA7mawbwwqFX5iPbiTsGp2f7x/pLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pRSjVzAd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pRSjVzAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF031F000E9;
	Fri, 17 Jul 2026 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784284541;
	bh=gKhrYSD1tsaF6lxyngUgTUHew+K2Cn2+NflfHrGWkqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pRSjVzAd1gZYWUon0svMmhus7+WEibJrD5jWfwcH9HaCV9cjxzOos1Rtm9jZLUQyx
	 FrHYHPDBfeGvHnrAeKtDecPmolVBnIO9+H7ye6Tt0ESnOWJMC9wbXIUCOHBJ6ZKwje
	 GYlA8Ky7k0c2HJXAAr8MHIBYFngq5VOsAJ1FX7bA=
Date: Fri, 17 Jul 2026 12:35:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	naveen.v@harman.com, oneukum@suse.com, stern@rowland.harvard.edu
Subject: Re: [PATCH v5 0/3] driver core: add enumeration failure uevent helper
Message-ID: <2026071745-share-paternity-df8c@gregkh>
References: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715114028.3627807-1-Akshay.Gujar@harman.com>

On Wed, Jul 15, 2026 at 11:40:25AM +0000, Akshay Gujar wrote:
> Hotpluggable buses can detect that a device is physically present, but
> enumeration may still fail early due to protocol-level errors. Today,
> such failures are only reported via kernel log messages, with no
> structured userspace notification.
>  
> This series introduces a small, generic helper in the driver core that
> emits a KOBJ_CHANGE uevent when enumeration fails, and wires it into the
> USB hub enumeration failure path as an initial user.
>  
> The USB change is intentionally minimal and serves as an initial user of
> the generic helper. Other subsystems may use the helper independently if
> needed.

There are some review comments on the documentation patch here:
	https://sashiko.dev/#/patchset/20260715114028.3627807-1-Akshay.Gujar@harman.com
that look correct.  This will not be an interface message, but a device
message, right?

And what about the dev_name() issue?

thanks,

greg k-h
