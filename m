Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096D279DAB
	for <linux-usb@vger.kernel.org>; Thu,  5 Feb 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307555; cv=none; b=oZFmH720La1UVyb5l3DxhGATvSDV6WfDZEfdmKOnZDOLYWf/h0G2H2lThOjV5avsunTJ8ZHgB7gvP5xZxU3F8mbTO4DaYhtC124L0lxHivSjbNvGFGTABekoQINf8kXIReu70JwEixCBDZ+63w+g6TuyKnrtkubPWMC8hp+yMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307555; c=relaxed/simple;
	bh=9t7ScICREyWvyQdLgi7DnagFz6gC2Pe4NGUNj5Jzipg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYYlBDONcLZVlTc0r5o+DwzXS5Qprnfa8vRbCcwJiz1bGsqvrjsKfpGZHtYHz4Sm0n0wJu87W5Ka3sjLEZvgO5HStxeCe0hloeHsF6bq5G65tzeD+JOO+CLQ2khvEjHuHQYnIcnvbBGLnPDO9Wtf/scpg09QjxgblDq+ZutUTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0SYYpdWT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0SYYpdWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3810C4CEF7;
	Thu,  5 Feb 2026 16:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770307555;
	bh=9t7ScICREyWvyQdLgi7DnagFz6gC2Pe4NGUNj5Jzipg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0SYYpdWTl+XsScAQlk8Okjv5YTL9JBbLRdDgClNsOSwt3pBDg2MpW8Tl5N2NsDFl0
	 4IRnchUrOmJcmPh46s8rLKP9xRKx7Kcsh3EupTZA+HtNRYMsku5onQQR6RQqYwGImT
	 lFcQeGG4XU4kNkSdwwsxD/oWqt3f3Qtrl2FktB8Y=
Date: Thu, 5 Feb 2026 17:05:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.20 merge window
Message-ID: <2026020545-trading-revivable-4924@gregkh>
References: <20260203063140.GC2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203063140.GC2275908@black.igk.intel.com>

On Tue, Feb 03, 2026 at 07:31:40AM +0100, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:
> 
>   Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.20-rc1

Pulled and pushed out, thanks.

greg k-h
