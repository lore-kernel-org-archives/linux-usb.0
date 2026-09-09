Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE15505D1
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956378; cv=none; b=e496X+B6rG8Lwj3IfWJhpSGupyhAcYROvokbl1b7uLu4hsyjPcZITKAvU4tmuMJklwNgWtZGCvaOQuHLcDdb6UrXzw97dqABTf1/KGYKwGZpJLeczfxuxMxaRud35Bcbd0/FPTCoG6nRhygnMPSfLTkPwD0PeZi9ZMaBnRfXXmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956378; c=relaxed/simple;
	bh=o4O7yaqr5KmfrLUmglrztrFQ1Cn/stWxWFFpkeXGF6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJjC+M5ef/mwbEsFVy8emiFeSchNrwE9S1u2PB8vsFWtSl9tvqp8jc332STl78W6mXHrVavkHwRxkXTSk/5Bc7nhn8NvSEJso+e28SfJ2x5ILDpPcKz9oyEY7C0SIoY69tfWcCFJ1w+8823Mn06rp5u4YM3nbai43dHV6lT5ino=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AphoQ6Pf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AphoQ6Pf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2D41F00A3A;
	Wed,  9 Sep 2026 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788956377;
	bh=Qt/NQN0++/ON06UgM7vgNI6PCdOfp/OPKL274Mg/vHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AphoQ6PfRXSVfcaynrNBHF5oXDHFMednS+AlM/rxOnupfGI+38UWXN6vXBZqrH2uW
	 cWWdIO/j31+kcLh/pfxIkTpcu1bYyqQBX89O2hAJeItwkiT98nuXs+NAKfZioi52pI
	 8wei5SeU0OQgfVCpp/wv5b+pfXn0BgiXRS/ZAIQ4=
Date: Wed, 9 Sep 2026 14:14:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v7.3-rc3
Message-ID: <2026090938-poppy-registrar-cc4e@gregkh>
References: <20260909111208.GL106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909111208.GL106095@black.igk.intel.com>

On Wed, Sep 09, 2026 at 01:12:08PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc3
> 

Pulled and pushed out,t hanks.

greg k-h
