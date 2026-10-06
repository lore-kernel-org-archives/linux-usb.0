Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8547749E5EF
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303428; cv=none; b=ANDKCN+S2yHkpfrTYehN6nGzszSKwdQ3ZwWfqK3wjKjDrrLQ4EwPNdPfLWtUdhpQx4F+iVMxY0kiW5bKM9kVhxFdcL/pnA0LBcHYV0gvPkqiq5tyXtoDZIX8qrgt2/VYx8eiRqtql6gwCAWoN+DUFB4+Eh/vs+moAM5ajPBxduU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303428; c=relaxed/simple;
	bh=t6azFbbQuHdQICcXtb3CMzNWyTDpliiIiThSqeeJsE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODYH4b9/RjyVqofiJa8eYORGWFDbtryElH4Pni3ccEvP4lNxavhS0J4RnUdnmYm0cE0Wk3FJ34M3SBnKKLCXqcGbHyhBky24g6NHK/zIUDU3K4oYdsTkitSlboPmv7bgBCBPl5Wb6OC8EKkoWjSfrmxoaVVtQEj6IIKAZR6RmyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kbLuMDgY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kbLuMDgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C291F0089B;
	Tue,  6 Oct 2026 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791303426;
	bh=lUj46Vh+ag1ZcHI3w5E+eJT1gWR7a6V9K7KsT5Tb0zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kbLuMDgY6mgSsUHHQxk3SLXZt0yi8Jg+MiGQe0w715edUTHM4QwFdluSrTWTs3WvK
	 WXfabdF/p+HDfOWBkivmVcrgq52j90oUb+d/Ql1zxaqsDwqKpkBLJWOBeptIs+r9ZP
	 9FtkCKTs+yaLMe4+evQGu3zLjYuq9wZ2U2VZvqac=
Date: Tue, 6 Oct 2026 18:15:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v7.4 merge window
Message-ID: <2026100608-strum-omit-68a2@gregkh>
References: <20261006122043.GQ176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006122043.GQ176164@black.igk.intel.com>

On Tue, Oct 06, 2026 at 02:20:43PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> [I'm sending this one early due to an upcoming vacation.]
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.4-rc1

Pulled and pushed out, thanks.

greg k-h
