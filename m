Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1B1F1932;
	Sun, 23 Aug 2026 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787504275; cv=none; b=NQFE4xzv/QJHPdVGikBzL/zKpAAGLIzGD66ZugnMXKCGPOcwellbSiTWbDq5rJO5p2WxsKyWKxIU8kpXnsero7xuHG+m4yd9BlhC28DbEMeKX91Slmh7UdzA271H1oK9x1Fi13qqhR/JTWBKseuHqdkxUlQm0+7Jt4a7sIBOToI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787504275; c=relaxed/simple;
	bh=Kc1KxyHxsuyjlFuedE10jBwJR7CCGhIac+gVtTUiA6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBy+ywwa1GYyhKgIk77cUtRuKV0t/CHbEU3WDDz/79z8pIaOcN1bh0DEDXUVbVmYxOlzWLpGUc61JWEqVmEjQqaDh0Lg8t88GXU8DRMwecc6HsR+NN9VNJ6VwDBjPXnHDjobb1aKGXHG+BCNPg2tnGFk+dq8mCa9FEhQCVrFZ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AbR1j0dV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AbR1j0dV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182771F000E9;
	Sun, 23 Aug 2026 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787504273;
	bh=8f+YNhiWWVYfVkOVWPOOhkHiE05bAmkBokpZEqY+D00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AbR1j0dVZkwXcnL3lOoOMvU71/7iW2WlWbq9RLFGlVehkxxaXfS3o8+VHzTXdIVUc
	 zYNTLJ4GBetJgSVAFj5XeCSpJ2Cf7JAVkNL5zGitt2vBakHTYVGwF9900TxD498aCV
	 tu6/x4tqB4BfIGAE35IPmPnHQoVS5aTWLL5u0ib8=
Date: Sun, 23 Aug 2026 18:56:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: naga chaithanya <nagachaithanya9911@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_loopback: fix descriptor leak on unbind
Message-ID: <2026082357-scouting-hyphen-62b8@gregkh>
References: <20260808181504.462492-1-nagachaithanya9911@gmail.com>
 <CALFZYQUzfbVnAhSqR6JmfDB-zvuiGSWx+9tCBc03xfBxJS9h0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALFZYQUzfbVnAhSqR6JmfDB-zvuiGSWx+9tCBc03xfBxJS9h0Q@mail.gmail.com>


A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Sun, Aug 23, 2026 at 09:52:55PM +0530, naga chaithanya wrote:
> Hi,
> 
> Gentle ping on this patch.

It is the middle of the merge window, we can't do new development.

> The syzbot report remains open and the fix is not present in current
> linux-next.

This syzbot report can only be hit by root, so it is very low priority,
right?

Also, if you wish to see patches reviewed quicker, please help out in
reviewing the existing patches on the list to make your patches move up
the stack.

thanks,

greg k-h
