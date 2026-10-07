Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C70C480DD8
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378204; cv=none; b=XBSwQjBWAJ0JbgCerbxXVcocpr2thkmy4TlAiaXaz/mgNZKhLwsL4uWwbx0d11OsL86Z9fOvyfInT1lBrz8kTtQnPJSDFXvcwUTAv79v8XWngDfW4BeyEFFlchDU9ans0sMsaLdZj+4pXMOkj3ONqlFMW3dAQFHpQFmthvUtIJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378204; c=relaxed/simple;
	bh=Nrdnv9A0Es8L8oLKiRIBLIrAai7b0mbQBd4VNa8o+ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ns3eg5BUm4TXY3YFTu7tjzzH2bVs7U6kzQS+TlUFXQD8ZmuODNMNOScDH/fOksbJfQKq1FrE24+MSikd3KEVI0cjGGd0cEQ8F+uuqPCbivkcqKmXVSm8MlmYy+upUJGF/uNb3sqMLcyi7tq1xKhMwD4PsTr65BRgZS5LVgJMvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DRLeGU5O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DRLeGU5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF651F0089B;
	Wed,  7 Oct 2026 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791378192;
	bh=4z3+7tRoiqEy87+IZZ08tn3+pYZx5v3yh9+WW8eGPnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DRLeGU5OBAt8ILr/be9O2kMgbU+73F+UoWXdLl8cJIameuUmGb+Ddh8W1RoIWLBo8
	 iAd0xCnb9ACzcZauXunT1rAh85kbWa1spvUJ4r599putpXJYBzN+vfApLtcbvv9Qit
	 kOnLRMMTKDrRIYHOpq4yYQdETuzG3+ixKx7dYUCQ=
Date: Wed, 7 Oct 2026 14:58:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v7.3-rc7
Message-ID: <2026100738-duct-antitoxic-1605@gregkh>
References: <20261007115859.GR176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007115859.GR176164@black.igk.intel.com>

On Wed, Oct 07, 2026 at 01:58:59PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 395e9f2967a7ac6898026e8f136c369805dc2fd9:
> 
>   thunderbolt: Disable CL states for the Anker Prime TB5 dock (2026-09-28 11:34:48 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc7
> 
> for you to fetch changes up to 96a8479804e3f7af43e639e9df39f562f1a75fd5:
> 
>   thunderbolt: Do not RPM complete unrelated subtrees on unplug (2026-10-05 13:31:20 +0200)
> 
> ----------------------------------------------------------------
> thunderbolt: Fix for v7.3-rc7
> 
> This incluces a single fix to make the runtime PM completion complete
> devices that are actually part of the domain. Needed for firmware
> connection manager based systems.
> 
> This has been in linux-next for few days with no reported issues.

Is this a regression or a "new" bugfix?

thanks,

greg k-h
