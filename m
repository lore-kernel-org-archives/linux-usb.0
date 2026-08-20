Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBD93A451E;
	Thu, 20 Aug 2026 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209709; cv=none; b=NeDl29XqqGJchebkmGjc6L9IW34w1daWo3zd1IkiHRAbEu+s6AjYEjmxyoTIZD2mxH6O391xcXuSmxcVlVzdAL/zr9fyNHg3CdVmyMork4PFh2QU2WuISPDwwfkT5ALU2CG/dt6CmWHEFnsFivAIl+oEvjEqpYUs4sPp2butCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209709; c=relaxed/simple;
	bh=Qys9Hm9tPNtFHHc5gNkjRbt/q+ov4qXFfGKJQJiPCAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtiNGxT/PZuzWdsKuOfxxchhcTGoUlqNT24MO98Bb4ikSdxy9mb0/Fd/0kOjTE4o6S9lRkAP+7DGp8ys/ax4asaBRTBzcvlu1PkQquL/7tk+35psp2nCqU2/clTYbQ5cYInXGgwFKuJNBp8mTB4mb59Og2U0tsVZdziJrHkS/aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g6Ueld98; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g6Ueld98"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B035D1F000E9;
	Thu, 20 Aug 2026 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787209708;
	bh=UJAuW+ir6qm1Uvu5zEDBJID4TawIcYPHl1qeP3tFw+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g6Ueld98c8yCI3RdUd7uqWri5mRFbgEA3PJ77Vlv/DnEx4c0v9HuyCFmf5hM1h7Zj
	 8aqU5dSm1DsFg7ujb14rtYDOf/4SN2rz2dF0tjCA1u7oCB3ILvnjbbhTwJeb/Qj1aB
	 r5Kjlv4KcP4T7NQUDXlFNXOyutKHhZ2MBCBAAmP4=
Date: Thu, 20 Aug 2026 09:06:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: syzbot <syzbot+85ede281798faf736677@syzkaller.appspotmail.com>
Cc: balbi@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, mcgrof@kernel.org,
	syzkaller-bugs@googlegroups.com, vvs@openvz.org
Subject: Re: [syzbot] [usb?] kernel BUG in register_netdevice
Message-ID: <2026082038-providing-huntress-55e6@gregkh>
References: <6a6a966c.86abc875.e5c3d.0053.GAE@google.com>
 <6a86a5b9.4d75e56a.c9a88.0036.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a86a5b9.4d75e56a.c9a88.0036.GAE@google.com>

On Wed, Aug 19, 2026 at 11:59:05PM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 425b9c7f51c98443db71ad679893725483b21196
> Author: Vasily Averin <vvs@openvz.org>
> Date:   Mon May 2 12:15:51 2022 +0000
> 
>     memcg: accounting for objects allocated for new netdevice
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1212ba25580000
> start commit:   e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' of ..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=1112ba25580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1612ba25580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=46f568dd8d795f6
> dashboard link: https://syzkaller.appspot.com/bug?extid=85ede281798faf736677
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=156b2549580000
> 
> Reported-by: syzbot+85ede281798faf736677@syzkaller.appspotmail.com
> Fixes: 425b9c7f51c9 ("memcg: accounting for objects allocated for new netdevice")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 

I strongly doubt this bisection.

Note, syzbot has gone on a tear lately with USB "issues", what happened
to suddenly cause this?  Did some new functionality get added to it such
that it is wanting to stress-test the bind/unbind racing with gadget
device setup suddenly?  What changed to start all of these reports?

thanks,

greg k-h
