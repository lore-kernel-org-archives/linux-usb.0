Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB0516DC28
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765695; cv=none; b=pHtTc4ybzx1I6pSnqXt6CDB5cG+YAeZW6bXxcAbvXA+Z+SO+5hjZZqouRs4O93IKhzCxnu7Viojr0xanzdDwuhMy0oQyZVFZX1yM7fnyTgeDPN/LQus7f56xew4nUSodwrAXDJ2tbY96ceHcXTZelBIJp/8LmDtZ2Bg7c8EWwwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765695; c=relaxed/simple;
	bh=z8RwYUSCvkkNtOGMEWx79P2jDHguSWyAWkQ4iCZXt3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdG0JHVpR1J59Q7yVWfnAWlbuKlX82JqriMO5RdEoqYLU9ZZXPRXaFS8M2USc3c4Act62569ZwwG0Zlineo5RhNRiGSR/www1jvvuXBO8VaHDvybDvy4FqW/JpvEHsAeCEeSKbXZ5QAUD8S5jLmztvCXtBhHoYEj8+x1ZCaB1/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gaI6tbNG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gaI6tbNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EF21F000E9;
	Mon,  3 Aug 2026 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785765693;
	bh=CS79sT4Luu1Jb683Lg0LtVH2Eou3r58hflS3lgtzAo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gaI6tbNGyVDElqMlB8a2DR46pzobTxyTrMdaj4yD4ofZnLvMhgKq5alopzdwJ2rda
	 4KHV3UKCldr0zO46jhdsPZ/1JGjxe/XbCQKXVf0BO6/y8LDZhZL6S0AiNey7K1jS3x
	 O/rd+5jCmk2/3W0l4dS834c8iBlPmufXI0ASwSGo=
Date: Mon, 3 Aug 2026 16:01:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v7.2-rc7
Message-ID: <2026080318-ivy-proofs-a8f3@gregkh>
References: <20260803104413.GQ20844@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803104413.GQ20844@black.igk.intel.com>

On Mon, Aug 03, 2026 at 12:44:13PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.2-rc7
> 

Pulled and pushed out, thanks!

greg k-h
