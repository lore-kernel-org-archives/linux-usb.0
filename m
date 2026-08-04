Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74803EBF23;
	Tue,  4 Aug 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854382; cv=none; b=IafT73dfTL0k7PkN1CfoIdcWr/4SVxcA8+ZGUTyBJMIyUFa1t7+YsTV20SZ6E02/pGrSd3xquyytCNLJkGQgGnmHdTB7V8iHrRO58B5I4POiTwp0MMFydG9jlG17N4ydzIgArQIwXwDcCN4/COshrZznHLx5AkXCoMjAkbQww/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854382; c=relaxed/simple;
	bh=UD3L0Zyr70GITDouRwp5Jhhv1RHn3BcHDQWy9vn8wzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKoG+d0NKtFb1SmpO8iyuWpLFnDDWrHzDs5lLXzNLt+72t5ulzBkcqh1bRw908zBCuQiXw8Io1jjSQOY1Ji0fTjFCXxSp8k4EVFi1Y9KHLGxyumJblynfCvWrySI2qwgh8+lpNEbCyrG1R11i6aYiZPzWw2BXNCWqlTQGqDfA68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bx7oZjmv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bx7oZjmv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E72D1F000E9;
	Tue,  4 Aug 2026 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785854381;
	bh=A3hxWVeUb+bnzcI7yo9wY4MZl5uyc0k0gBivgzxxluI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bx7oZjmvnpjKDbncoaL6SAwGamDL6J/Yr/YXz6oRA8EFY4RfVp+V7HkLawA1+IgGD
	 8jGAaX4bR6RjfbU7hqIGjtir9Amh1/PhgaRPmViWn2T6Uimn9AAgrm2EZr0JYK1tvo
	 Tyb7QEYbIdKB3vsXmI48vDKyZqCx132wIOtVmIuZ/pLfHcpq07Er878b0qvD6Z2zcb
	 nCP4zSAfwkWniC2JCDh2G/R6OOpRpgADrNZ34Ma3VwTlLjny1K3BOpUZx3XnR/Zp8a
	 i06zyEkOowI646W7HLII1hEvabEFxf4lm2FHBNwS9zuUKdnaaCcdFPkc00C4bsqyoM
	 Cxe5CrHuG4cSQ==
Received: from johan by theta with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1wrGIs-000000005X8-0aMc;
	Tue, 04 Aug 2026 16:39:38 +0200
Date: Tue, 4 Aug 2026 16:39:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: syzbot <syzbot+2051460e19471eeb42c3@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] possible deadlock in digi_set_modem_signals
Message-ID: <anH5qi4skYbh0iO0@hovoldconsulting.com>
References: <6a6cd832.1aa927e4.17d4bf.0007.GAE@google.com>
 <badd4d94-2e84-400f-bddc-c9ac8fd6e7c8@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <badd4d94-2e84-400f-bddc-c9ac8fd6e7c8@suse.com>

On Tue, Aug 04, 2026 at 03:41:59PM +0200, Oliver Neukum wrote:
> 
> 
> On 31.07.26 19:15, syzbot wrote:
> > If you want syzbot to run the reproducer, reply with:
> 
> #syz test: git://repo/address.git 11028ab62899
> 

> From ce3cda5cc4df748600c37b6b5cf5964d21478e1c Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 4 Aug 2026 11:38:30 +0200
> Subject: [PATCH 1/2] usb: serial: digi_accelport: annotate spinlocks
> 
> The driver holds two spinlocks at the same time.
> This is perfectly safe, but confuses the validator.
> Tell it manually that we know what we are doing.

I fixed this up a few days ago after I saw the report:

	https://lore.kernel.org/all/20260801125827.292983-1-johan@kernel.org/

I've merged that patch for 7.2 to avoid others spending time on it, but
perhaps I should have replied to the report as well. Sorry about that.

Johan
