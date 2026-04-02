Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185823C2785;
	Thu,  2 Apr 2026 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129339; cv=none; b=gsYevha84fjFh468rFYorXpCAJq+3MHW61dl7Dd/vJib4c9byczCxvE+dGVdCB80/aH2t48rrjfFpsHeRvpoTaOpIR4bTpDooCjRKbsYmbLZr8pTa0ACXn7nB11LYnhB9dLboPaucAhMd4c0UBgj/aoHThMFngazLXgf+BfV0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129339; c=relaxed/simple;
	bh=UZ8wNqCWrw/3BvA670pZ7pdM1/jB8nxpzuqluCNOAvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFjC2zrQ6tOBnkmwTwDan9V10TBTejuwJJRmvigmoaSLre80b4h5wCm2zad+Km/EXNqUfPpltxGCjE80BNkV6LNRjIXkEeC3wGFyG948rVHS6jf94Coj41ahTi/+mdSLbJCot166FepgJ3wsmJYzIoTRzAyK/7TsS+I10vB6MIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NQsihgeo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NQsihgeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F1EC116C6;
	Thu,  2 Apr 2026 11:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775129338;
	bh=UZ8wNqCWrw/3BvA670pZ7pdM1/jB8nxpzuqluCNOAvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQsihgeoW+Nq6KxgJSM+VLooZDGsTXAwIFEry5f5uHq9HHwXgqMEOcOa7+AmYXbDZ
	 0pZHZvIIEBphToCIaE2vF8d+6VBKOT914Nu70Uzx+oOSVuPTItK8HLob8m+8oswyPz
	 79lkPE8ynNjKWYHgkKR0xmJOpb+srL766zMAi0Vs=
Date: Thu, 2 Apr 2026 13:28:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial device ids for 7.0-rc7
Message-ID: <2026040239-declared-reoccupy-2740@gregkh>
References: <ac47qRXeYt92MbW_@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac47qRXeYt92MbW_@hovoldconsulting.com>

On Thu, Apr 02, 2026 at 11:49:29AM +0200, Johan Hovold wrote:
> The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:
> 
>   Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.0-rc7
 
Pulled and pushed out,t hanks.

greg k-h
